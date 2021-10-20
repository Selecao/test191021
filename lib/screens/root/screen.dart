import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test191021/screens/choice/screen.dart';
import 'package:test191021/screens/date_of_birth/screen.dart';
import 'package:test191021/screens/result_screen/screen.dart';

import 'bloc/navigation_bloc.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
      return state.maybeMap(
        initial: (_) => const ChoiceScreen(),
        birthPage: (_) => const DateOfBirthScreen(),
        resultPage: (_data) => ResultScreen(_data.data),
        orElse: () => const SizedBox.shrink(),
      );
    });
  }
}
