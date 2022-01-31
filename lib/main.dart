import 'package:timer_final_bloc/utils/template.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TimerBlocAddDeleteBloc(),
        ),
        BlocProvider(
          create: (context) => ChangeThemeBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => BlocBuilder<ChangeThemeBloc, ChangedThemeState>(
            builder: (context, state) => MaterialApp(
                  builder: (context, widget) {
                    ScreenUtil.setContext(context);
                    return MediaQuery(
                      data: MediaQuery.of(context),
                      child: widget!,
                    );
                  },
                  theme: state.darkMode ? darkThemeData : lightThemeData,
                  initialRoute: 'TIMER_LIST_PAGE',
                  title: 'Flutter Demo',
                  debugShowCheckedModeBanner: false,
                  routes: {
                    'TIMER_LIST_PAGE': (context) => const TimerListPage(),
                    'AddTimerPage': (context) => const AddTimerPage(),
                  },
                )),
      ),
    );
  }
}
