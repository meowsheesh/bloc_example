import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Login")),
        body: _buildScaffoldBody(),
      ),
    );
  }

  Widget _buildScaffoldBody() {
    return BlocConsumer<LoginBloc, LoginState>(
      builder: (context, state) {
        return _buildParentWidget(context, state);
      },
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('This is a snack bar!!!!'),
        ));
      },
      buildWhen: (previous, current) => _shouldBuildFor(current),
      listenWhen: (previous, current) => _shouldListenFor(current),
    );
  }

  bool _shouldListenFor(LoginState currentState) {
    return currentState is ShowSnackbarState;
  }

  bool _shouldBuildFor(LoginState currentState) {
    return currentState is LoginInitial || currentState is UpdateTextState;
  }

  Widget _buildParentWidget(BuildContext context, LoginState state) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTextWidget(state),
          const SizedBox(
            height: 16,
          ),
          TextButton(
            onPressed: () {
              context.read<LoginBloc>().add(LoginButtonTappedEvent());
            },
            child: const Text("Tap me!!!"),
          ),
          const SizedBox(
            height: 16,
          ),
          TextButton(
              onPressed: () {
                context.read<LoginBloc>().add(ShowSnackBarButtonTappedEvent());
              },
              child: const Text("Show Snackbar"))
        ],
      ),
    );
  }

  Widget _buildTextWidget(LoginState state) {
    if (state is UpdateTextState) {
      return Text(state.text);
    } else {
      return const Text("This will change on button tap");
    }
  }
}
