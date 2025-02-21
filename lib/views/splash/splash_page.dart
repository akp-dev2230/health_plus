import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:health_plus/consts/const.dart';
import 'package:health_plus/views/auth/login_page.dart';
import 'package:health_plus/views/main_page.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  void changeScreen(){
    Future.delayed(const Duration(seconds: 6),(){
      User? user = FirebaseAuth.instance.currentUser;
      if(user != null){
        Get.off(const MainPage());
      }else{
        Get.off(const LoginPage());
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff067eba),
      body: Center(child: Lottie.asset('assets/animation/splash_anim.json',fit: BoxFit.cover)),
    );
  }
}
