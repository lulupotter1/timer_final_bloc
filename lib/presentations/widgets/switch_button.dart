import 'package:timer_final_bloc/utils/template.dart';

class CustomSwitchButton extends StatefulWidget {
  CustomSwitchButton({Key? key}) : super(key: key);

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Dark mode'),
        SizedBox(
          width: 15.w,
        ),
        Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
              BlocProvider.of<ChangeThemeBloc>(context)
                  .add(ChangeThemeEvent(darkMode: isSwitched));
            })
      ],
    );
  }
}
