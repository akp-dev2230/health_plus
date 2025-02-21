import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:health_plus/consts/const.dart';
import 'package:health_plus/services/notification_service.dart';
import 'package:health_plus/views/splash/splash_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try{
    await Firebase.initializeApp();
    await Supabase.initialize(
      url: 'https://btpifbhpcwlkdwodsehn.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ0cGlmYmhwY3dsa2R3b2RzZWhuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDAwODg1NzUsImV4cCI6MjA1NTY2NDU3NX0.OLJrFuzf-9QRtuQrDZSfLFgDSpoumc-vgywfrlQkfpE',
    );
    tz.initializeTimeZones();
    // Request Notification Permission (Android 13+)
    await requestNotificationPermission();
    await NotificationService.initialize();
  }catch(e){
    debugPrint("Error during initialization: $e");
  }
  runApp(const MyApp());
}

// Function to request notification permission
Future<void> requestNotificationPermission() async {
  if (await Permission.notification.isDenied) {
    await Permission.notification.request();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}
