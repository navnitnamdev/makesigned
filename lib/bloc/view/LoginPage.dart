import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signed/bloc/LoginButtonPressed.dart';

import '../../PreferenceUtils/CustomElevationButton.dart';
import '../LoginState.dart';
import '../bloc/LoginBloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    String username = '';
    String password = '';

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            // Navigate to the next screen upon successful login
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      onChanged: (value) => username = value,
                      decoration: InputDecoration(labelText: 'Username'),
                    ),
                    TextField(
                      onChanged: (value) => password = value,
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        loginBloc.add(LoginButtonPressed(
                          username: username,
                          password: password,
                        ));
                      },
                      child: Text('Login'),
                    ),



                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}