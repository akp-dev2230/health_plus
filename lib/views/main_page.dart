import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:health_plus/consts/const.dart';
import 'package:health_plus/views/auth/login_page.dart';
import 'package:health_plus/views/home_page/home_page.dart';
import 'package:health_plus/views/profile/profile_page.dart';
import 'package:health_plus/views/vets/vets.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user){
      if(user == null && mounted){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    var currentNavIndex = 0.obs;
    var navBody = [ const HomePage(), const Vets(), const ProfilePage()];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Obx(()=> Expanded(child: navBody.elementAt(currentNavIndex.value))),
        ],
      ),

      bottomNavigationBar: Obx(()=>
        BottomNavigationBar(
          currentIndex: currentNavIndex.value,
          backgroundColor: const Color(0xFF93B1FE),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          onTap: (index){
            currentNavIndex.value = index;
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notification"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),



    );
  }
}


// CurvedNavigationBar(
// buttonBackgroundColor: const Color(0xFF93B1FE),
// color: const Color(0xFF93B1FE),
// backgroundColor: Colors.white,
// items: const [
// Icon(Icons.home,size: 30,),
// Icon(Icons.bookmark_added_sharp,size: 30,),
// Icon(Icons.person,size: 30,),
// ],
// onTap: (value){
// currentNavIndex.value = value;
// },
// ),
