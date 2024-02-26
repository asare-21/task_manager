import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/config/globals.dart';
import 'package:task_manager/provider/authentication_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Gap(20),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              // height: 400,
              width: double.infinity,
              child: Card(
                elevation: 10,
                surfaceTintColor: grey1,
                child: Column(
                  children: [
                    const Gap(20),
                    Text(
                      "Welcome to Task Manager",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold, color: bgColor),
                    ),
                    const Gap(20),
                    ElevatedButton(
                        onPressed: () async {
                          bool response = await context
                              .read<AuthenticationProvider>()
                              .login();
                          if (response && mounted) {
                            context.go('/');
                          } else {
                            Fluttertoast.showToast(
                                msg: "Failed to login. Please try again",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.SNACKBAR,
                                timeInSecForIosWeb: 5,
                                webShowClose: true,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        },
                        child: const Text("Login")),
                    const Gap(10)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
