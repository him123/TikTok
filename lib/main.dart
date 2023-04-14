import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok/cubit/home_tab/cubit/tabs_cubit.dart';
import 'package:tiktok/screens/dashboard.dart';
import 'package:tiktok/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TabsCubit>(create: (_) => TabsCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: Theme.of(context).textTheme.apply(
                bodyColor: ColorUtils.white, displayColor: ColorUtils.white)),
        home: const Dashboard(),
      ),
    );
  }
}
