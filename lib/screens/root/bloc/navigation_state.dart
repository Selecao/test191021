part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState {}

class StatePageA extends NavigationState {}

class StatePageB extends NavigationState {}

class StatePageC extends NavigationState {
  final String pageABData;
  StatePageC({required this.pageABData});
}
