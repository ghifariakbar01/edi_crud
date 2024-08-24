import 'package:edi_crud/features/signup/application/sign_up_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/auth/application/auth_notifier.dart';
import '../../../shared/utils/dialog_helper.dart';
import '../../../shared/widgets/app_logo.dart';
import '../../../shared/widgets/v_button.dart';
import '../../../style/style.dart';
import '../../signup/application/states/sign_up_state.dart';
import '../application/sign_in_notifier.dart';
import '../application/states/sign_in_state.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<SignUpState>>(signUpNotifierProvider,
        (_, state) async {
      if (!state.isLoading &&
          state.hasValue &&
          state.value != null &&
          state.value != '' &&
          state.hasError == false) {
        final value = state.requireValue;

        value.when(
          failure: (failure) => failure.maybeWhen(
            alreadyExist: () => ref
                .read(authNotifierProvider.notifier)
                .checkAndUpdateAuthStatus(),
            orElse: () => null,
          ),
          // DialogHelper.showCustomDialog(
          //   context,
          //   failure.maybeWhen(
          //     alreadyExist: () => 'User Sudah Ada',
          //     orElse: () => 'Storage',
          //   ),
          // ),
          success: () => null,
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
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final isAdmin = useState(false);
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
                      style:
                          Themes.customColor(14, fontWeight: FontWeight.normal),
                      cursorColor: Palette.primaryColor,
                      keyboardType: TextInputType.name,
                      validator: (value) =>
                          value == null ? 'Mohon Isi Form' : null,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: Themes.formStyle('Masukkan email'),
                      style:
                          Themes.customColor(14, fontWeight: FontWeight.normal),
                      cursorColor: Palette.primaryColor,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          value == null ? 'Mohon Isi Email' : null,
                    ),
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
                      style:
                          Themes.customColor(14, fontWeight: FontWeight.normal),
                      cursorColor: Palette.primaryColor,
                      validator: (value) =>
                          value == null ? 'Mohon Isi Email' : null,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Checkbox(
                            key: UniqueKey(),
                            checkColor: Theme.of(context).primaryColorLight,
                            value: isAdmin.value,
                            onChanged: (value) {
                              if (value != null) {
                                isAdmin.value = value;
                              }
                            }),
                        Text(
                          'Admin',
                          style: Themes.customColor(14),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 4,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              VButton(
                  label: 'Sign Up',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      return ref.read(signUpNotifierProvider.notifier).signUp(
                          nama: namaController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          isAdmin: isAdmin.value);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
