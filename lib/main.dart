import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dismiss_keyboard_on_tap/dismiss_keyboard_on_tap.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/routes/routes.dart';
import 'common/themes/theme_light.dart';
import 'common/widgets/info_app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInfo.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDateFormatting('id_ID');
  FirebaseFirestore.instance
      .collection('user')
      .get()
      .then((QuerySnapshot querySnapshot) {
    // ignore: unused_local_variable
    for (QueryDocumentSnapshot<Object?> doc in querySnapshot.docs) {
      // log(doc.data().toString());
    }
  });
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fromIntro = useState(false);

    useEffect(() {
      SharedPreferences.getInstance()
          .then((value) => value.getBool('fromIntro'))
          .then((value) => fromIntro.value = value!);
      return null;
    }, []);

    return DismissKeyboardOnTap(
      child: MaterialApp.router(
        title: 'BN Mobile',
        debugShowCheckedModeBanner: false,
        routerConfig: routers(ref: ref, fromIntro: fromIntro),
        theme: AppTheme.lightTheme(),
      ),
    );
  }
}
