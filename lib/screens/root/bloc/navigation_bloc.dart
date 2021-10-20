import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(StatePageA());

  String? _messageA;
  String? _messageB;

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState(event);
    } else if (event is PressedOnPageA) {
      yield* _mapPressedOnPageAToState(event);
    } else if (event is PressedOnPageB) {
      yield* _mapPressedOnPageBToState(event);
    }
  }

  Stream<NavigationState> _mapAppStartedToState(AppStarted event) async* {
    yield StatePageA();
  }

  Stream<NavigationState> _mapPressedOnPageAToState(
      PressedOnPageA event) async* {
    _messageA = event.text;
    print('## Pressed on PageA, text is: ${event.text}');
    yield StatePageB();
  }

  Stream<NavigationState> _mapPressedOnPageBToState(
      PressedOnPageB event) async* {
    _messageB = event.number.toString();
    print('## Pressed on PageB, text is: ${event.number}');

    yield StatePageC(pageABData: '$_messageA $_messageB');
  }
}
