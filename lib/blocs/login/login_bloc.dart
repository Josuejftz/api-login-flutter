import 'package:encuestas/blocs/login/login_events.dart';
import 'package:encuestas/blocs/login/login_states.dart';


import 'package:encuestas/repository/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _loginRepository;

  LoginBloc(this._loginRepository) : super(LoginInitial()) {//para iniciar
    on<LoadLoginEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        final user = await _loginRepository.getData(event.email, event.password);
        print('emitiento loginLoadedState user:');
        print(user);
        emit(LoginLoadedState(user));
      } catch (e) {
        print('error_repository');
        emit(LoginErrorState(('errorr en  bloc ')));
      }
    });
  }
}
