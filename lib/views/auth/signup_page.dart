import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_plus/consts/const.dart';
import 'package:health_plus/controller/auth_controller.dart';
import 'package:health_plus/views/auth/login_page.dart';
import 'package:health_plus/widget_common/textfield_cart.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  var controller = Get.put(AuthController());

  String? selectedGender;
  bool isChecked = false;

  //text controller
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text('Sign Up', style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome to Fur Friends...',
                  style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const Text('create an account',style: TextStyle(color: Colors.black,fontSize: 16),),
                const SizedBox(height: 15,),

                //user detail
                //name
                const Text("Name", style: TextStyle(fontSize: 18.0,color: Colors.black),),
                textFieldCart(
                  controller: nameController,
                  obscureBool: false,
                  preFixIcon: CupertinoIcons.person,
                  hintText: "name",
                ),
                const SizedBox(height: 8,),

                //email
                const Text("Email Id", style: TextStyle(fontSize: 18.0,color: Colors.black),),
                textFieldCart(
                  controller: emailController,
                  obscureBool: false,
                  keyboardType: TextInputType.emailAddress,
                  preFixIcon: Icons.email_outlined,
                  hintText: "email",
                ),
                const SizedBox(height: 8,),

                //gender
                const Text("Gender", style: TextStyle(fontSize: 18.0,color: Colors.black),),
                DropdownButtonFormField(
                  value: selectedGender,
                  dropdownColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: "select gender",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 0.4,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        )
                    ),
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      selectedGender = newValue;
                    });
                  },
                  items: genderList.map<DropdownMenuItem>((value){
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()
                ),
                const SizedBox(height: 8,),

                //phone number
                const Text("Phone", style: TextStyle(fontSize: 18.0,color: Colors.black),),
                IntlPhoneField(
                  controller: phoneController,
                  initialCountryCode: 'IN',
                  focusNode: FocusNode(),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "phone number...",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 0.4, // Adjust border width as desired
                      ),
                    ),
                    focusedBorder: OutlineInputBorder( // Remove focusedBorder
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1.0, // Adjust border width as desired
                      ),
                    ),
                  ),
                ),

                //password
                const Text("Password", style: TextStyle(fontSize: 18.0,color: Colors.black),),
                textFieldCart(
                  controller: passController,
                  obscureBool: true,
                  preFixIcon: CupertinoIcons.lock,
                  hintText: "password",
                ),
                const SizedBox(height: 8,),

                //confirm password
                const Text("Confirm Password", style: TextStyle(fontSize: 18.0,color: Colors.black),),
                textFieldCart(
                  controller: confirmPassController,
                  obscureBool: true,
                  preFixIcon: CupertinoIcons.lock,
                  hintText: "confirm password",
                ),
                const SizedBox(height: 8,),

                //checkbox terms and condition
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                        activeColor: Colors.blue,
                        checkColor: Colors.white,
                        side: const BorderSide(
                          width: 1.2,
                        ),
                        value: isChecked,
                        onChanged: (value){
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("I've read and agree with "),
                            Text("Terms of Service",
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                          ],
                        ),
                        Row(
                          children: [
                            Text("and our "),
                            Text("Privacy Policy",
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 8,),

                //signup button
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 320,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: isChecked == true ? Colors.blue : Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                        ),
                        onPressed: () async{
                          if(isChecked != false){
                            if(nameController.text.toString().isNotEmpty
                                && emailController.text.toString().isNotEmpty
                                && phoneController.text.toString().isNotEmpty
                                && passController.text.toString().isNotEmpty
                                && confirmPassController.text.toString().isNotEmpty){
                              try{
                                await controller.signupMethod(
                                  name: nameController.text,
                                  email: emailController.text,
                                  gender: selectedGender,
                                  phone: phoneController.text,
                                  password: passController.text,
                                ).then((value){
                                  VxToast.show(context, msg: "Sign up completed");
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
                                });
                              }catch(e){
                                // controller.logoutMethod(context: context);
                                VxToast.show(context, msg: e.toString());
                              }
                            }else{
                              VxToast.show(context, msg: 'Please fill all details',bgColor: Colors.white,);
                            }
                          }

                        },
                        child: const Text("SignUp",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        TextButton(
                            onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
                            },
                            child: const Text('Log in',
                              style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
                        ),
                      ],
                    ),
                  ],
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
