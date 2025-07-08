import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicapp/core/providers/current_user_notiifier.dart';
import 'package:musicapp/core/theme/theme.dart';
import 'package:musicapp/feature/auth/view/pages/login_page.dart';
import 'package:musicapp/feature/auth/view/pages/signup_page.dart';
import 'package:musicapp/feature/auth/viewModel/auth_viewmodel.dart';
import 'package:musicapp/feature/home/view/pages/homepage.dart';
import 'package:musicapp/feature/home/view/pages/upload_song_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔥 Clear SharedPreferences first! kDebugMode
  // final prefs = await SharedPreferences.getInstance();
  // await prefs.clear();
  // print("All SharedPreferences cleared on app start");

  //? crea
  final container = ProviderContainer();

  //? Init and try fetch data (will be empty after clear)
  await container.read(authViewModelProvider.notifier).initSharedPreference();
  await container.read(authViewModelProvider.notifier).getData();

  // secod
  // final container = ProviderContainer();
  // final notifier = container.read(authViewModelProvider.notifier);
  // await notifier.initSharedPreference();
  // final userModel = notifier.getData();
  // print(userModel);
  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
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
      // home: currentUser == null ? const SignupPage() : const LoginPage(),
      home: currentUser == null ? const SignupPage() : const UploadSongPage(),
    );
  }
}
