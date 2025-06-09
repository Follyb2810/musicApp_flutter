import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicapp/core/providers/current_user_notiifier.dart';
import 'package:musicapp/core/theme/theme.dart';
import 'package:musicapp/feature/auth/view/pages/login_page.dart';
import 'package:musicapp/feature/auth/view/pages/signup_page.dart';
import 'package:musicapp/feature/auth/viewModel/auth_viewmodel.dart';
import 'package:musicapp/feature/home/view/pages/homepage.dart';

void main() async {
  //? to initializae riverpod stateççç
  WidgetsFlutterBinding.ensureInitialized();
  //? all read
  final container = ProviderContainer();
  await container.read(authViewModelProvider.notifier).initSharedPreference();
  await container.read(authViewModelProvider.notifier).getData();
  // secod 
  // final container = ProviderContainer();
  // final notifier = container.read(authViewModelProvider.notifier);
  // await notifier.initSharedPreference();
  // final userModel = notifier.getData();
  // print(userModel);
  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
  //   runApp(ProviderScope(child: MyApp(),container: container,));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserNotiifierProvider);
    return MaterialApp(
      title: 'Follyb',
      theme: AppTheme.darkThemeMode,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // ),
      // home: LoginPage(),
      home:currentUser == null ? const SignupPage() :const Homepage (),
    );
  }
}
