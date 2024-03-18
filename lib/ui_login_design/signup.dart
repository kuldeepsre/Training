import 'package:dreambiztech/bloc/form_bloc/signup/contractor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ContractorBloc(ContractorInitial()),
      child: const ContractorForm(),
    );
  }
}

class ContractorForm extends StatefulWidget {
  const ContractorForm({super.key});

  @override
  State<ContractorForm> createState() => _ContractorFormState();
}

class _ContractorFormState extends State<ContractorForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<ContractorBloc>(context);
    return Scaffold(
        body: BlocListener<ContractorBloc, ContractorState>(
            listener: (context, state) {
              if (state is TokenExpired) {}

              if (state is DataSaved) {

              }
              if (state is DataDelete) {}
            },
            child: Stack(
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    color: Colors.blue,
                    height: 300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                      const SizedBox(height: 20),

                       ElevatedButton(
                      onPressed: () {
                     loginBloc.add(SubmitData(email: emailController.text.toString(), password: passwordController.text.toString()));
                    },
                    child: const Text('Login'),
                  ),

                    ],
                  ),
                ),
              ],
            )));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height - 50, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
