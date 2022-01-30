import 'package:timer_final_bloc/utils/template.dart';

class TimerListPage extends StatefulWidget {
  const TimerListPage({Key? key}) : super(key: key);

  @override
  State<TimerListPage> createState() => _TimerListPageState();
}

class _TimerListPageState extends State<TimerListPage> {
  List<TimerWidget> timerList = [];
  List<AnimationController> controllersList = [];
  int textCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomSheet: _bottomSheetWidget(),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: const Text(
        'TIMERS LIST',
      ),
    );
  }

  Widget _body() {
    return Padding(
        padding: EdgeInsets.only(left: 17.w, right: 16.w, top: 4.h),
        child: SingleChildScrollView(
          child: BlocBuilder<TimerBlocAddDeleteBloc, TimerBlocState>(
            builder: (context, state) {
              int countOfBool = 0;
              List<TimerWidget> widgetList = [];
              countOfBool = _addedStateBloc(state, countOfBool);
              _deletedStateBloc(state, countOfBool);
              _pauseStartStateBloc(state, widgetList, context);
              if (state is AddControllerListState) {
                controllersList = state.controllerList;
              }

              return Column(
                children: [
                  for (int index = 0; index < timerList.length; index++)
                    GestureDetector(
                        onTap: () {
                          BlocProvider.of<TimerBlocAddDeleteBloc>(context)
                              .add(PauseStartTimerEvent(
                            index: index,
                          ));
                        },
                        child: timerList[index])
                ],
              );
            },
          ),
        ));
  }

  void _pauseStartStateBloc(TimerBlocState state, List<TimerWidget> widgetList,
      BuildContext context) {
    if (state is PauseStartTimerState) {
      if (controllersList[state.index].isAnimating) {
        timerList[state.index].paused = true;
        controllersList[state.index].stop();

        if (timerList.length > 4) {
          widgetList = timerList
              .where((element) => element.paused == true && element.index != -1)
              .toList();
          controllersList[widgetList[0].index].forward();
          timerList[widgetList[0].index].paused = false;
        }
      } else {
        controllersList[state.index].forward();
        timerList[state.index].paused = false;

        if (timerList.length > 4) {
          widgetList = timerList
              .where(
                  (element) => element.paused == false && element.index != -1)
              .toList();
          controllersList[widgetList[0].index].stop();
          timerList[widgetList[0].index].paused = true;
        }
      }
      BlocProvider.of<TimerBlocAddDeleteBloc>(context)
          .add(AddControllerListEvent(
        controllerList: controllersList,
      ));
    }
  }

  void _deletedStateBloc(TimerBlocState state, int countOfBool) {
    if (state is TimerBlocDeletedState) {
      controllersList[state.index].stop();
      timerList[state.index] = TimerWidget(
        controllerList: controllersList,
        index: -1,
        paused: true,
      );

      if (timerList.length > 4) {
        countOfBool = controllersList
            .where((element) => element.isAnimating)
            .toList()
            .length;
        if (countOfBool < 4) {
          for (int index = 0; index < timerList.length; index++) {
            if (timerList[index].index != -1 &&
                !controllersList[index].isAnimating) {
              if (countOfBool < 4) {
                controllersList[index].forward();
                countOfBool++;
              }
            }
          }
        }
      }
    }
  }

  int _addedStateBloc(TimerBlocState state, int countOfBool) {
    if (state is TimerBlocAddedState) {
      if (timerList.length >= 4) {
        countOfBool = controllersList
            .where((element) => element.isAnimating)
            .toList()
            .length;
        timerList.add(TimerWidget(
          paused: countOfBool >= 4 ? true : false,
          index: timerList.length,
          controllerList: controllersList,
        ));
      } else {
        timerList.add(TimerWidget(
          index: timerList.length,
          controllerList: controllersList,
        ));
      }
    }
    return countOfBool;
  }

  Widget _bottomSheetWidget() {
    return Container(
        margin: EdgeInsets.only(bottom: 49.h, left: 28.w),
        child: BlocBuilder<TimerBlocAddDeleteBloc, TimerBlocState>(
          builder: (context, state) {
            if (state is TimerBlocAddedState) {
              textCount = textCount + 1;
            } else if (state is TimerBlocDeletedState) {
              textCount = textCount - 1;
            }

            return Text(
              'TOTAL: $textCount',
              style: ThemeTextRegular.size14,
            );
          },
        ));
  }

  Widget _floatingActionButton(BuildContext context) {
    return SizedBox(
      height: 58.h,
      width: 58.w,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'AddTimerPage');
        },
        child: const Icon(
          Icons.add,
          size: 24,
          color: ThemeColors.white,
        ),
      ),
    );
  }
}
