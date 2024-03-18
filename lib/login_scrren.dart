
import 'package:dreambiztech/Components/image_builder.dart';
import 'package:dreambiztech/Components/loader.dart';
import 'package:dreambiztech/Components/spacers.dart';
import 'package:dreambiztech/Declarations/Constants/constants.dart';
import 'package:dreambiztech/Declarations/Images/images.dart';
import 'package:dreambiztech/Widgets/login_btn.dart';
import 'package:dreambiztech/Widgets/social_signin.dart';
import 'package:dreambiztech/Widgets/text_data_widget.dart';

import 'package:dreambiztech/Widgets/text_form_field.dart';
import 'package:dreambiztech/bloc/LoginAuth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FocusNode usernameFocus;
  late FocusNode passwordFocus;
  late FocusNode loginBtnFocus;
  late TextEditingController userName;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();
    usernameFocus = FocusNode();
    passwordFocus = FocusNode();
    loginBtnFocus = FocusNode();
    userName = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    usernameFocus.dispose();
    passwordFocus.dispose();
    loginBtnFocus.dispose();
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            buildErrorLayout();
          } else if (state is AuthLoaded) {
            clearTextData();
            Navigator.of(context)
                .pushNamed('/dashboard', arguments: state.username);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return LoadingWidget(child: buildInitialInput());
          } else {
            return buildInitialInput();
          }
        },
      ),
    );
  }

  Widget buildInitialInput() => ClipOval(


    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /*   ImageBuilder(imagePath: loginImages[1]),
            const TextData(message: "User"),
            HeightSpacer(myHeight: kSpacing),*/
          ImageBuilder(imagePath: loginImages[1]),
          const TextData(message: "User"),
          HeightSpacer(myHeight: kSpacing),
          InputField(
            focusNode: usernameFocus,
            textController: userName,
            label: "Username",
            icons: const Icon(Icons.person, color: Colors.blue),
          ),
          HeightSpacer(myHeight: kSpacing),
          InputField(
            focusNode: passwordFocus,
            textController: password,
            label: "Password",
            icons: const Icon(Icons.lock, color: Colors.blue),
          ),
          HeightSpacer(myHeight: kSpacing),
          LoginBtn(
            focusNode: loginBtnFocus,
            userName: userName,
            password: password,
          ),
          HeightSpacer(myHeight: kSpacing),
          const SocialSignIn(),
        ],
      ),
    ),
  );
  ScaffoldFeatureController buildErrorLayout() =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter username/password!'),
        ),
      );

  clearTextData() {
    userName.clear();
    password.clear();
  }
}