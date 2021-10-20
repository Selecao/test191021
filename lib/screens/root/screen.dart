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
      if (state is StatePageA) return const ChoiceScreen();
      if (state is StatePageB) return const DateOfBirthScreen();
      if (state is StatePageC) return ResultScreen(state.pageABData);
      return const SizedBox.shrink();
    });
  }
}
