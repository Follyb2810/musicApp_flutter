import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicapp/core/theme/color_pallete.dart';
import 'package:musicapp/core/utils.dart';
import 'package:musicapp/core/widget/loader.dart';
import 'package:musicapp/feature/auth/view/pages/login_page.dart';
import 'package:musicapp/feature/auth/view/widget/index.dart';
import 'package:musicapp/feature/auth/viewModel/auth_viewmodel.dart';
// import 'package:musicapp/feature/auth/repositories/auth_remote_repository.dart';
// import 'package:fpdart/fpdart.dart' as fp;

// class SignupPage extends StatefulWidget {
class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    // formKey.currentState!.validate();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authViewModelProvider.select((value)=>value?.isLoading == true));
    // final isLoading = ref.watch(authViewModelProvider)?.isLoading == true;

    ref.listen(authViewModelProvider, (_, next) {
      next?.when(
        data: (data) {
          showSnackBar(context, 'Account created successfull');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        error: (error, str) {
          showSnackBar(context, error.toString());
        },
        loading: () {},
      );
    });
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? Loader()
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Up.",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Spacer(flex: 1,),
                      SizedBox(height: 20),
                      InputField(
                        hintText: 'Enter your name',
                        labelText: 'Name',
                        textEditingController: nameController,
                      ),
                      SizedBox(height: 20),
                      InputField(
                        hintText: 'Enter your email',
                        labelText: 'Email',
                        textEditingController: emailController,
                      ),
                      SizedBox(height: 20),
                      InputField(
                        hintText: 'Enter your password',
                        labelText: 'Pssword',
                        textEditingController: passwordController,
                        isObscureText: true,
                      ),
                      SizedBox(height: 20),
                      AuthButton(
                        label: 'Login',
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            ref
                                .read(authViewModelProvider.notifier)
                                .signUpUser(
                                  email: emailController.text,
                                  name: nameController.text,
                                  password: passwordController.text,
                                );
                          }else {
                            showSnackBar(context, 'Missing filed');
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.titleMedium,
                            text: 'Already have account?',
                            children: <InlineSpan>[
                              TextSpan(
                                text: ' Sign In',
                                style: TextStyle(
                                  color: ColorPallete.gradinet2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
