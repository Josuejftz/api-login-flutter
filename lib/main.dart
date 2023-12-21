//import 'package:encuestas/homepage.dart';
import 'package:encuestas/blocs/login/login_bloc.dart';
import 'package:encuestas/blocs/users/users_bloc.dart';
import 'package:encuestas/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:encuestas/repository/repositories.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => UserBloc(UserRepository()),
          ),
          BlocProvider(
          create: (BuildContext context) => LoginBloc(UserRepository()),
          ),
        ],
        child: const LoginPage(),
      ),
    );
  }
}

