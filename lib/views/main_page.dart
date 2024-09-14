import 'package:get/get.dart';
import 'package:health_plus/consts/const.dart';
import 'package:health_plus/views/home_page.dart';
import 'package:health_plus/views/appointment_page.dart';
import 'package:health_plus/views/profile_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {

    var currentNavIndex = 0.obs;

    var nav_item = [
      const BottomNavigationBarItem(icon: Icon(Icons.home),label: home),
      const BottomNavigationBarItem(icon: Icon(Icons.bookmark_added_sharp),label: msg),
      const BottomNavigationBarItem(icon: Icon(Icons.person),label: profile),
    ];

    var nav_body = [const HomePage(), const AppointmentPage(), const ProfilePage()];


    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Obx(()=> Expanded(child: nav_body.elementAt(currentNavIndex.value))),
          // Text("${currentNavIndex}"),
        ],
      ),

      bottomNavigationBar: Obx(
        ()=> BottomNavigationBar(
          currentIndex: currentNavIndex.value,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: nav_item,
          onTap: (value){
            currentNavIndex.value = value;
          },
        ),
      ),


    );
  }
}
