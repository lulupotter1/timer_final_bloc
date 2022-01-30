import 'package:timer_final_bloc/utils/template.dart';

part 'timer_bloc_event.dart';
part 'timer_bloc_state.dart';

class TimerBlocAddDeleteBloc extends Bloc<TimerBlocEvent, TimerBlocState> {
  TimerBlocAddDeleteBloc() : super(TimerBlocInitialState());

  @override
  // ignore: override_on_non_overriding_member
  TimerBlocState get initialState => TimerBlocInitialState();

  @override
  Stream<TimerBlocState> mapEventToState(TimerBlocEvent event) async* {
    if (event is AddTimerEvent) {
      yield TimerBlocAddedState();
    }

    if (event is DeleteTimerEvent) {
      yield TimerBlocDeletedState(
        index: event.index,
      );
    }

    if (event is PauseStartTimerEvent) {
      yield PauseStartTimerState(
        index: event.index,
      );
    }

    if (event is AddControllerListEvent) {
      yield AddControllerListState(
        controllerList: event.controllerList,
      );
    }
  }
}
