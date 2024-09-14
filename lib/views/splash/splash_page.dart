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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 6),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff067eba),
      body: Center(child: Lottie.asset('assets/animation/splash_anim.json',fit: BoxFit.cover)),
    );
  }
}
