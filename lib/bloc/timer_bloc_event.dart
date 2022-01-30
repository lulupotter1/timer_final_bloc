part of 'timer_bloc_bloc.dart';

@immutable
abstract class TimerBlocEvent {}

class AddTimerEvent extends TimerBlocEvent {}

class DeleteTimerEvent extends TimerBlocEvent {
  final int index;

  DeleteTimerEvent({
    required this.index,
  });
}

class PauseStartTimerEvent extends TimerBlocEvent {
  final int index;
  PauseStartTimerEvent({
    required this.index,
  });
}

class AddControllerListEvent extends TimerBlocEvent {
  final List<AnimationController> controllerList;
  AddControllerListEvent({required this.controllerList});
}
