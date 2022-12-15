import 'dart:math';

import 'package:bloc_payload/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Bloc Payload',
            theme: state.appTheme == AppTheme.dark
                ? ThemeData(
                    primarySwatch: Colors.blue,
                  )
                : ThemeData.dark(),
            home: const Homepage(),
          );
        },
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Payload"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              final int randInt = Random().nextInt(10);
              print(context.read<ThemeCubit>().changeTeme(randInt));
            },
            child: const Text("Click me")),
      ),
    );
  }
}
