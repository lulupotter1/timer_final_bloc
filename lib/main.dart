import 'package:timer_final_bloc/utils/template.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TimerBlocAddDeleteBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          initialRoute: 'TIMER_LIST_PAGE',
          debugShowCheckedModeBanner: false,
          routes: {
            'TIMER_LIST_PAGE': (context) => const TimerListPage(),
            'AddTimerPage': (context) => const AddTimerPage(),
          },
        ),
      ),
    );
  }
}
