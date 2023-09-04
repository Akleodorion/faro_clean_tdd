import 'package:faro_clean_tdd/features/user_authentification/presentation/providers/state/user_state.dart';
import 'package:faro_clean_tdd/features/user_authentification/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/user_authentification/presentation/pages/auth_screen_page.dart';
import 'home_page.dart';
import 'injection_container.dart' as di;

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromRGBO(243, 255, 198, 1),
      onPrimary: Color.fromRGBO(42, 43, 42, 1),
      secondary: Color.fromRGBO(235, 240, 217, 1),
      onSecondary: Color.fromRGBO(42, 43, 42, 1),
      error: Colors.red,
      onError: Color.fromRGBO(42, 43, 42, 1),
      background: Color.fromRGBO(42, 43, 42, 1),
      onBackground: Color.fromRGBO(235, 240, 217, 1),
      surface: Color.fromRGBO(243, 255, 198, 0.15),
      onSurface: Color.fromRGBO(235, 240, 217, 1)),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAuth = ref.watch(userAuthProvider);

    return MaterialApp(
        title: 'Faro App',
        theme: theme,
        home: userAuth is Loaded ? const HomePage() : const AuthScreen());
  }
}
