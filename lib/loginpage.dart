import 'package:encuestas/blocs/login/login_bloc.dart';
import 'package:encuestas/blocs/login/login_events.dart';
import 'package:encuestas/blocs/login/login_states.dart';
import 'package:encuestas/model/users_model.dart';
import 'package:encuestas/view_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController(text: 'josuejftz@gmail.com');
  
  var passwordController = TextEditingController(text: '123456');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Email Screen"),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          print('imprimiendo stato');
          print(state);
          const Text('hola');
          if (state is LoginLoadedState) {

            
            print('imprimiendo desde view loginpage.dart LoginLoadedState');
            
            UserModel usuario = state.user;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ViewData(userdata: usuario)));
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          if (state is LoginInitial) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'correo',
                  labelText: 'Email *',
                ),
                ),
                
                 TextFormField(
                  controller: passwordController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'insgresa la contraseña',
                  labelText: 'password *',
                ),
                ),
                

                
                ElevatedButton(
                  onPressed: () async {
                    BlocProvider.of<LoginBloc>(context)
                        .add(LoadLoginEvent(emailController.text,passwordController.text));
                    emailController.clear();
                    await Future.delayed(const Duration(seconds: 6));
                  },
                  child: const Text("login"),
                ),
              ],
            );
          }
          if (state is LoginLoadingState) {
            return const Center(child: const CircularProgressIndicator());
          }
      
          if (state is LoginErrorState) {
            
            return Column(
              children: [
                Text(
                "Error",
                style: TextStyle(color: Colors.black, fontSize: 50),
              ),
              
               

  GestureDetector(
                        onTap: () => {
                        },
                           
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                          ),
                          child: Center(child: Text('atras')),
                        ),
                      ),
            


                

              ]
            );
          }
           
          return Container();
        }),
      ),
    );
  }
}
