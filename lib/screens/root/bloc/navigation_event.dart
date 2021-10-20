part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}

class AppStarted extends NavigationEvent {}

class PressedOnPageA extends NavigationEvent {
  final String text;
  PressedOnPageA({required this.text});
}

class PressedOnPageB extends NavigationEvent {
  final int number;
  PressedOnPageB({required this.number});
}
