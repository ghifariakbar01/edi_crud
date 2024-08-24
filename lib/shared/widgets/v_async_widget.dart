import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'error_message_widget.dart';
import 'v_scaffold_widget.dart';

class VAsyncWidgetScaffold<T> extends StatelessWidget {
  const VAsyncWidgetScaffold({required this.value, required this.data});
  final AsyncValue<T> value;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (e, st) => Center(
        child: ErrorMessageWidget(
            errorMessage: 'Error ' + ' Type : $e \n' + 'StackTrace : $st \n'),
      ),
      loading: () => VScaffoldWidget(
        isLoading: true,
        scaffoldTitle: 'Loading ...',
        scaffoldBody: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class VAsyncWidgetScaffoldWrappedMaterial<T> extends HookWidget {
  const VAsyncWidgetScaffoldWrappedMaterial({
    required this.value,
    required this.data,
  });
  final AsyncValue<T> value;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (e, st) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: Center(child: ErrorMessageWidget(errorMessage: e.toString())),
        ),
      ),
      loading: () => Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

class VAsyncValueWidget<T> extends StatelessWidget {
  const VAsyncValueWidget({required this.value, required this.data});
  final AsyncValue<T> value;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (e, st) =>
          Center(child: ErrorMessageWidget(errorMessage: e.toString())),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
