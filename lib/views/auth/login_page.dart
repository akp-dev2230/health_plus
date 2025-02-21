import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_plus/consts/const.dart';
import 'package:health_plus/controller/auth_controller.dart';
import 'package:health_plus/views/auth/forgetPassword_page.dart';
import 'package:health_plus/views/auth/signup_page.dart';
import 'package:health_plus/views/main_page.dart';
import 'package:health_plus/widget_common/textfield_cart.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  var controller = Get.put(AuthController());
  
  bool isChecked = false;
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //image banner
          const Expanded(
            child: Image(image: AssetImage(loginWall),fit: BoxFit.cover,),
          ),
          Padding(
           padding: const EdgeInsets.only(left: 15.0,right: 15.0,bottom: 15.0),
           child: Material(
             elevation: 5.0,
             shadowColor: Colors.grey,
             borderRadius: BorderRadius.circular(10.0),
             child: Container(
               padding: const EdgeInsets.only(left: 15.0,right: 15.0,bottom: 15.0),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(10.0)
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const Text("Username", style: TextStyle(fontSize: 18.0,color: Colors.black),),
                   textFieldCart(
                     controller: controller.emailController,
                     obscureBool: false,
                     keyboardType: TextInputType.emailAddress,
                     preFixIcon: Icons.email_outlined,
                     hintText: "email",
                   ),
                   const SizedBox(height: 10.0,),
                   const Text("Password", style: TextStyle(fontSize: 18.0,color: Colors.black),),
                   textFieldCart(
                     controller: controller.passController,
                     obscureBool: true,
                     preFixIcon: CupertinoIcons.lock,
                     hintText: "password",
                   ),
                   Row(
                     children: [
                       Checkbox(
                         activeColor: Colors.blue,
                         checkColor: Colors.white,
                         value: isChecked,
                         onChanged: (bool? value){
                           setState(() {
                             isChecked = value!;
                           });
                         },
                       ),
                       const Text("Remember me?"),
                     ],
                   ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.end,
                     children: [
                       SizedBox(
                         width: double.infinity,
                         child: ElevatedButton(
                           style: ElevatedButton.styleFrom(
                             backgroundColor: Colors.blue,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(10.0),
                             )
                           ),
                           onPressed: () async{
                             if(controller.emailController.text.toString().isNotEmpty && controller.passController.text.toString().isNotEmpty){
                               try{
                                 await controller.loginMethod(context: context).then((value){
                                   if (value != null){
                                     Get.snackbar("","",
                                       titleText: const Text("Successfully Logged in", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
                                       backgroundColor: Colors.white,
                                     );
                                     Get.off(const MainPage());
                                   }
                                 });
                               }catch (e){
                                 Get.snackbar("","",
                                   titleText: const Text("Error", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
                                   messageText: Text("$e", style: const TextStyle(fontSize: 16, color: Colors.black),),
                                   backgroundColor: Colors.white,
                                 );
                               }
                             }
                             else{
                               Get.snackbar("","",
                                 titleText: const Text("Please fill email and password", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
                                 backgroundColor: Colors.white,
                               );
                             }
                           },
                           child: const Text("Login",style: TextStyle(color: Colors.white),),
                         ),
                       ),
                       InkWell(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgetPasswordPage()));
                         },
                         child: const Text("Forgot password?",style: TextStyle(color: Colors.black),),
                       ),
                     ],
                   ),
                   const SizedBox(height: 5.0,),
                   const Divider(color: Colors.black,),
                   const SizedBox(height: 5.0,),

                   ListTile(
                     leading: const CircleAvatar(
                       backgroundColor: Colors.white,
                       child: Image(image: AssetImage(google),fit: BoxFit.cover,),
                     ),
                     title: const Text('Continue with Google',style: TextStyle(color: Colors.black),),
                     onTap: ()async{
                       try{
                         await controller.signInWithGoogle().then((value){
                           if(value!=null){
                             Get.off(const MainPage());
                           }
                         });
                       }catch(e){
                         Get.snackbar("","",
                           titleText: const Text("Error", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
                           messageText: Text("$e", style: const TextStyle(fontSize: 16, color: Colors.black),),
                           backgroundColor: Colors.white,
                         );
                       }
                     },
                   ),
                   const SizedBox(height: 10,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       const Text('Need an account?',style: TextStyle(color: Colors.black),),
                       TextButton(
                         onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignupPage()));
                         },
                         child: const Text('SIGN UP',style: TextStyle(color: Colors.blue),),
                       ),
                     ],
                   ),

                 ],
               ),
             ),
           ),
         ),

        ],
      ),
    );
  }
}
