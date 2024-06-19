
// Define the BLoC
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../LoginButtonPressed.dart';
import '../LoginEvent.dart';
import '../LoginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final http.Client httpClient;

  LoginBloc({required this.httpClient}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        final response = await httpClient.post(
          Uri.parse('https://dummyjson.com/auth/login'),
          body: json.encode({
            'username': event.username,
            'password': event.password,
          }),
          headers: {'Content-Type': 'application/json'},
        );
        if (response.statusCode == 200) {
          yield LoginSuccess();
        } else {
          final error = json.decode(response.body)['error'];
          yield LoginFailure(error: error ?? 'Unknown error occurred');
        }
      } catch (_) {
        yield LoginFailure(error: 'Failed to authenticate');
      }
    }
  }
}