import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/bloc/login_bloc.dart';

import 'login_screen.dart';

void main() {
  runApp(_prepareLoginScreen());
}

Widget _prepareLoginScreen() {
  return BlocProvider(
    create: (BuildContext context) {
      return LoginBloc();
    },
    child: const LoginScreen(),
  );
}
