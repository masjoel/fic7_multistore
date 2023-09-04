import 'package:fic7_multistore/bloc/register/register_bloc.dart';
import 'package:fic7_multistore/ui/auth/auth_page.dart';
// import 'package:fic7_multistore/ui/splash/splash_page.dart';
import 'package:fic7_multistore/utils/light_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: light,
        home: const AuthPage(),
      ),
    );
  }
}
