import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/auth/application/auth_notifier.dart';
import '../../../shared/routes/route_names.dart';
import '../../../shared/utils/alert_helper.dart';
import '../../../shared/utils/dialog_helper.dart';
import '../../../shared/widgets/app_logo.dart';
import '../../../shared/widgets/v_button.dart';
import '../../../style/style.dart';
import '../application/sign_in_notifier.dart';
import '../application/states/sign_in_state.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<SignInState>>(signInNotifierProvider,
        (_, state) async {
      if (!state.isLoading &&
          state.hasValue &&
          state.value != null &&
          state.value != '' &&
          state.hasError == false) {
        final value = state.requireValue;

        value.when(
          failure: (failure) => DialogHelper.showCustomDialog(
            context,
            failure.when(
              notFound: () => 'User Tidak Ditemukan Ada',
              storage: (err) => 'Storage Error ${err}',
            ),
          ),
          success: () {
            return AlertHelper.showSnackBar(context,
                message: 'Sign In Berhasil',
                color: Palette.green,
                onDone: ref
                    .read(authNotifierProvider.notifier)
                    .checkAndUpdateAuthStatus);
          },
          initial: () => null,
        );
      } else {
        if (state.hasError) {
          return DialogHelper.showCustomDialog(
            context,
            state.error.toString(),
          );
        }
      }
    });

    final passwordVisible = useState(false);

    final namaController = useTextEditingController();

    final passwordController = useTextEditingController();

    final isShowError = useState(false);

    final _formKey = useMemoized(GlobalKey<FormState>.new, const []);

    return KeyboardDismissOnTap(
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const AppLogo(),
              const SizedBox(height: 8),
              Form(
                key: _formKey,
                autovalidateMode: isShowError.value
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                        controller: namaController,
                        decoration: Themes.formStyle('Masukkan nama'),
                        style: Themes.customColor(14,
                            fontWeight: FontWeight.normal),
                        cursorColor: Palette.primaryColor,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null) {
                            return 'Mohon Isi Nama';
                          } else {
                            if (value.isEmpty) {
                              return 'Mohon Isi Nama';
                            }
                            return null;
                          }
                        }),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                        controller: passwordController,
                        obscureText: passwordVisible.value == false,
                        decoration: Themes.formStyle('Masukkan password',
                            icon: IconButton(
                                onPressed: () => passwordVisible.value == true
                                    ? passwordVisible.value = false
                                    : passwordVisible.value = true,
                                icon: Icon(
                                  passwordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Palette.primaryColor,
                                ))),
                        style: Themes.customColor(14,
                            fontWeight: FontWeight.normal),
                        cursorColor: Palette.primaryColor,
                        validator: (value) {
                          if (value == null) {
                            return 'Mohon Isi Password';
                          } else {
                            if (value.isEmpty) {
                              return 'Mohon Isi Password';
                            }
                            return null;
                          }
                        }),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              VButton(
                  label: 'Sign In',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      return ref.read(signInNotifierProvider.notifier).signIn(
                            nama: namaController.text,
                            password: passwordController.text,
                          );
                    } else {
                      isShowError.value = true;
                    }
                  }),
              TextButton(
                onPressed: () => context.pushNamed(
                  RouteNames.signUpRoute,
                ),
                child: Text(
                  'Sign Up',
                  style: Themes.customColor(11),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
