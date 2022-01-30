import 'package:timer_final_bloc/utils/template.dart';

class AddTimerPage extends StatelessWidget {
  const AddTimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 70.h, left: 36.w, right: 40.w),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 20.h)),
              textStyle: MaterialStateProperty.resolveWith<TextStyle>(
                  (Set<MaterialState> states) {
                return ThemeTextRegular.size14;
              }),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return ThemeColors.red;
                },
              ),
              minimumSize:
                  MaterialStateProperty.all(Size(double.infinity, 56.h)),
            ),
            child: const Text(
              'START RANDOM TIMER',
              style: ThemeTextRegular.size14,
            ),
            onPressed: () {
              BlocProvider.of<TimerBlocAddDeleteBloc>(context)
                  .add(AddTimerEvent());
              Navigator.pop(context);
            },
          ),
        )
      ]),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: const Text(
        'NEW TIMER',
      ),
    );
  }
}
