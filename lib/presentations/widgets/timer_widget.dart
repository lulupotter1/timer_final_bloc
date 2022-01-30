import 'package:timer_final_bloc/utils/template.dart';

class TimerWidget extends StatefulWidget {
  int index;
  bool? paused;
  List<AnimationController> controllerList;

  TimerWidget({
    Key? key,
    this.paused = false,
    required this.index,
    required this.controllerList,
  }) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget>
    with TickerProviderStateMixin {
  Animation<int>? animation;
  AnimationController? _controller;

  int? _count;

  @override
  void initState() {
    _count = _getRandomNumber();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _count!),
    )..repeat();
    animation = IntTween(begin: _count, end: 0).animate(_controller!);
    if (widget.paused!) _controller!.stop();

    widget.controllerList.add(_controller!);
    BlocProvider.of<TimerBlocAddDeleteBloc>(context).add(AddControllerListEvent(
      controllerList: widget.controllerList,
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.index != -1
        ? Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: ThemeColors.black,
            ))),
            padding: EdgeInsets.only(
                right: 12.w, left: 1.w, bottom: 17.h, top: 22.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Timer ${widget.index + 1}',
                    style: ThemeTextRegular.size14,
                  ),
                  AnimatedBuilder(
                    animation: animation!,
                    builder: (BuildContext context, Widget? child) {
                      if (animation!.value == 0) {
                        _controller!.stop();

                        BlocProvider.of<TimerBlocAddDeleteBloc>(context)
                            .add(DeleteTimerEvent(
                          index: widget.index,
                        ));

                        return Container();
                      } else {
                        return Text(
                          _controller!.isAnimating
                              ? '${animation!.value.toString()} sec'
                              : 'paused',
                          style: ThemeTextRegular.size14,
                        );
                      }
                    },
                  )
                ]),
          )
        : Container();
  }

  int _getRandomNumber() {
    var ran = Random();
    return 10 + ran.nextInt(20 - 10);
  }
}
