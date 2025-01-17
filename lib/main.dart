import 'package:bilytica/presentation/homepage/blocs/user_bloc/user_bloc.dart';
import 'package:bilytica/presentation/homepage/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'data/repositories/user_repositoriey_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(UserRepository()),
        )
      ],
      child: ScreenUtilInit(
          designSize: const Size(430, 932),
          minTextAdapt: true,
          responsiveWidgets: [MaterialApp.router.toString()],
          splitScreenMode: true,
          builder: (context, child) {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ]);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Bilytice',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: UserListScreen(),
            );
          }),
    );
  }
}
