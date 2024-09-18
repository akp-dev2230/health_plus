import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:health_plus/consts/const.dart';
import 'package:health_plus/views/foster.dart';
import 'package:health_plus/views/home_page.dart';
import 'package:health_plus/views/profile_page.dart';
import 'package:health_plus/views/vets.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {

    var currentNavIndex = 0.obs;

    var nav_body = [const HomePage(), const Vets(), const Foster(), const ProfilePage(),];


    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Obx(()=> Expanded(child: nav_body.elementAt(currentNavIndex.value))),
          // Text("${currentNavIndex}"),
        ],
      ),

      bottomNavigationBar: CurvedNavigationBar(
          buttonBackgroundColor: const Color(0xFF93B1FE),
          color: const Color(0xFF93B1FE),
          backgroundColor: Colors.white,
          items: const [
            Icon(Icons.home,size: 30,),
            Icon(Icons.bookmark_added_sharp,size: 30,),
            Icon(Icons.add,size: 30,),
            Icon(Icons.person,size: 30,),
          ],
          onTap: (value){
            currentNavIndex.value = value;
          },
        ),



    );
  }
}
