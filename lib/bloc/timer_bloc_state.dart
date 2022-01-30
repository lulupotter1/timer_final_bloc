part of 'timer_bloc_bloc.dart';

@immutable
abstract class TimerBlocState {}

class TimerBlocInitialState extends TimerBlocState {}

class TimerBlocAddedState extends TimerBlocState {}

class TimerBlocDeletedState extends TimerBlocState {
  final int index;
  TimerBlocDeletedState({
    this.index = 0,
  });
}

class PauseStartTimerState extends TimerBlocState {
  final int index;

  PauseStartTimerState({
    required this.index,
  });
}

class AddControllerListState extends TimerBlocState {
  final List<AnimationController> controllerList;
  AddControllerListState({required this.controllerList});
}

class ChangedThemeState extends TimerBlocState {
  final bool darkMode;

  ChangedThemeState({required this.darkMode});
}
