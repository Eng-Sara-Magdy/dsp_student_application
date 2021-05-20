import 'package:dsp_student_application/Logic/answered_questions/answeredquestions_cubit.dart';
import 'package:dsp_student_application/Logic/internet_connection/internetconnection_cubit.dart';
import 'package:dsp_student_application/Logic/nav_bar/navbar_cubit.dart';
import 'package:dsp_student_application/Logic/waiting_questions/cubit/waitingquestions_cubit.dart';
import 'package:dsp_student_application/Presentation/Pages/questions/waiting_questions.dart';
import 'package:dsp_student_application/Presentation/router.dart';
import 'package:flutter/material.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavbarCubit>(
          create: (context) => NavbarCubit(),
        ),
        BlocProvider<InternetconnectionCubit>(
            create: (context) => InternetconnectionCubit()),
        BlocProvider<WaitingQuestionsCubit>(
          create: (context) => WaitingQuestionsCubit(),
        ),
        BlocProvider<AnsweredQuestionsCubit>(
          create: (context) => AnsweredQuestionsCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Student Demo',
        theme: ThemeData(
          primarySwatch: AppColors.cPurple,
          accentColor: AppColors.cGreen,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'lato',
          buttonTheme: ButtonThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0))),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: RouterGenerator.generateRoute,
        initialRoute: '/',
      ),
    );
  }
}
