import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicapp/core/theme/color_pallete.dart';
import 'package:musicapp/core/utils.dart';
import 'package:musicapp/core/widget/loader.dart';
import 'package:musicapp/core/widget/index.dart';
// import 'package:musicapp/feature/auth/repositories/auth_remote_repository.dart';
// import 'package:fpdart/fpdart.dart' as fp;
import 'package:musicapp/feature/auth/viewModel/auth_viewmodel.dart';
import 'package:musicapp/feature/home/view/pages/homepage.dart';
import 'package:musicapp/feature/home/view/pages/upload_song_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState!.validate();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final isLoading = ref.watch(authViewModelProvider)?.isLoading == true;
    final isLoading = ref.watch(
      authViewModelProvider.select((value) => value?.isLoading == true),
    );
    ref.listen(authViewModelProvider, (_, next) {
      next?.when(
        data: (data) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UploadSongPage()),
            // MaterialPageRoute(builder: (context) => Homepage()),
          );
        },
        error: (error, str) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(error.toString())));
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
                                .loginUser(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                          } else {
                            showSnackBar(context, 'Missing field');
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupPage(),
                            ),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.titleMedium,
                            text: "Don't have account?",
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
