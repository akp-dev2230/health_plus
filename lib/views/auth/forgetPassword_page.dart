import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:health_plus/consts/const.dart';
import 'package:health_plus/controller/auth_controller.dart';
import 'package:health_plus/widget_common/textfield_cart.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(AuthController());

    TextEditingController resetPassController = TextEditingController();
    
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
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
                      await controller.sendPasswordResetLink(email: resetPassController.text.toString()).then((value){
                        Get.snackbar("","",
                          titleText: const Text("Password reset link has been sent", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
                          backgroundColor: Colors.white,
                        );
                        Get.back();
                      });
                    }else{
                      Get.snackbar("","",
                        titleText: const Text("Error", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
                        messageText: const Text("user not registered", style: TextStyle(fontSize: 16, color: Colors.black),),
                        backgroundColor: Colors.white,
                      );
                    }
                  }on FirebaseAuthException catch (e){
                    Get.snackbar("","",
                      titleText: const Text("Error", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
                      messageText: Text("$e", style: const TextStyle(fontSize: 16, color: Colors.black),),
                      backgroundColor: Colors.white,
                    );
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
