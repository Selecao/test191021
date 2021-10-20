part of 'navigation_bloc.dart';

@freezed
class NavigationEvent with _$NavigationEvent {
  const factory NavigationEvent.initial() = _InitialNavigationEvent;

  const factory NavigationEvent.pressedChoiceButton({
    required String text,
  }) = _PressedChoiceButtonNavigationEvent;

  const factory NavigationEvent.pressedDateButton({
    required int number,
  }) = _PressedDateButtonNavigationEvent;
}
