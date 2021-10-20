import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:test191021/resources/app_color.dart';
import 'package:test191021/resources/app_text_theme.dart';

class ResultScreen extends StatelessWidget {
  final String resultData;
  const ResultScreen(this.resultData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: _SearchTextField(
          text: resultData,
          onSubmitted: (value) {},
        ),
      ),
    );
  }
}

/// Use hook widget instead of stateless with memory leak on controllers
class _SearchTextField extends HookWidget {
  final String text;
  final void Function(String value)? onSubmitted;

  const _SearchTextField({
    this.text = '',
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final controller = useTextEditingController(text: text);

    return TextField(
      controller: controller,
      focusNode: focusNode,
      style: AppTextTheme.headline5.copyWith(color: AppColors.violet500),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 8.0,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.violet500),
          borderRadius: BorderRadius.all(
            Radius.circular(100.0),
          ),
        ),
      ),
      onSubmitted: onSubmitted,
    );
  }
}
