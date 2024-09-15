import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:health_plus/consts/const.dart';
import 'package:health_plus/controller/auth_controller.dart';
import 'package:health_plus/widget_common/textfield_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(AuthController());

    TextEditingController resetPassController = TextEditingController();
    
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(context.screenWidth*0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Email", style: TextStyle(fontSize: 18.0,color: Colors.black),),
            textFieldCart(
              controller: resetPassController,
              obscureBool: false,
              keyboardType: TextInputType.emailAddress,
              preFixIcon: Icons.email_outlined,
              hintText: "email",
            ),
            const SizedBox(height: 10.0,),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () async{
                  try{
                    final response = await controller.checkUserExistence(email: resetPassController.text.toString());
                    if(response){
                      await controller.sendPasswordResetLink(email: resetPassController.text.toString());
                      VxToast.show(context, msg: "link has been sent");
                      Navigator.pop(context);
                    }else{
                      VxToast.show(context, msg: "user not registered");
                    }
                  }on FirebaseAuthException catch (e){
                    if (e.code == 'user-not-found') {
                      VxToast.show(context, msg: "No user found with this email.");
                    } else {
                      VxToast.show(context, msg: e.message ?? "An error occurred");
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text("Send Email",style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
