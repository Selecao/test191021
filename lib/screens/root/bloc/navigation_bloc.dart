import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';
part 'navigation_bloc.freezed.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState.initial());

  String? _messageA;
  String? _messageB;

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    yield* event.map(
      initial: _initialEventToState,
      pressedChoiceButton: _pressedChoiceButtonToState,
      pressedDateButton: _pressedDateButtonToState,
    );
  }

  Stream<NavigationState> _initialEventToState(
      _InitialNavigationEvent event) async* {
    yield const NavigationState.initial();
  }

  Stream<NavigationState> _pressedChoiceButtonToState(
      _PressedChoiceButtonNavigationEvent event) async* {
    _messageA = event.text;
    print('## Pressed on PageA, text is: ${event.text}');
    yield const NavigationState.birthPage();
  }

  Stream<NavigationState> _pressedDateButtonToState(
      _PressedDateButtonNavigationEvent event) async* {
    _messageB = event.number.toString();
    print('## Pressed on PageB, text is: ${event.number}');

    yield NavigationState.resultPage(data: '$_messageA $_messageB');
  }
}
