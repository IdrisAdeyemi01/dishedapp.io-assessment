import 'package:dished_assessment/src/features/view/entry_view.dart';
import 'package:dished_assessment/src/services/navigation_service/i_navigation_service.dart';
import 'package:dished_assessment/src/services/snackbar_service/snackbar_service.dart';
import 'package:dished_assessment/src/shared/routing/routes.dart';
import 'package:dished_assessment/src/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dished App Assessment',
      navigatorKey: ref.watch(navigationService).navigatorKey,
      scaffoldMessengerKey: ref.watch(snackbarService).scaffoldMessengerKey,
      theme: AppTheme.themeData,
      onGenerateRoute: Routes.generateRoute,
      home: const EntryView(),
    );
  }
}
