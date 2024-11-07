import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_plus/consts/const.dart';
import 'package:health_plus/controller/auth_controller.dart';
import 'package:health_plus/views/auth/login_page.dart';
import 'package:health_plus/widget_common/exit_dialog.dart';
import 'package:velocity_x/velocity_x.dart';

class SideMenuBar extends StatefulWidget {
  const SideMenuBar({super.key});

  @override
  State<SideMenuBar> createState() => _SideMenuBarState();
}

class _SideMenuBarState extends State<SideMenuBar> {

  var controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {

    var iconList = [Icons.person,Icons.person,Icons.person,CupertinoIcons.bag,];
    var textList = ["Profile","Profile","Profile","About us",];

    return SafeArea(
      child: Container(
        color: Colors.white,
        height: context.screenHeight,
        width: context.screenWidth*0.75,
        child: Column(
          children: [
            const ListTile(
              leading: CircleAvatar(backgroundColor: Colors.blue,child: Text("AK"),),
              title: Text("Ajit Kumar"),
              subtitle: Text("9113198525"),
            ),
            const Divider(),
            ListView.separated(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  leading: Icon(iconList[index]),
                  title: Text(textList[index]),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ),
            const Divider(),
            PopScope(
              canPop: false,
              onPopInvoked: (bool didPop) async{
                if(didPop){
                  return;
                }
              },
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Logout"),
                onTap: () async{
                  final bool shouldPop = await exitDialog(context: context, title: "Log out") ?? false;
                  if(context.mounted && shouldPop){
                    try{
                      await controller.logoutMethod(context: context);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
                    }catch(e){
                      VxToast.show(context, msg: e.toString());
                    }
                  }
                },
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
