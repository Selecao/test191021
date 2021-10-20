part of 'navigation_bloc.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState.initial() = _InitialNavigationState;

  const factory NavigationState.birthPage() = _BirthPageNavigationState;

  const factory NavigationState.resultPage({
    required final String data,
  }) = _ResultPageNavigationState;
}
