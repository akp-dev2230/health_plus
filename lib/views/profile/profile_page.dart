import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:health_plus/consts/image.dart';
import 'package:health_plus/controller/profile_controller.dart';
import 'package:health_plus/services/firestoreservices.dart';
import 'package:health_plus/views/auth/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    final GoogleSignIn googleSignIn = GoogleSignIn();
    var controller = Get.put(ProfileController());

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final profileIcons = [Icons.person, Icons.settings, Icons.policy, Icons.help_outline];
    final profileIconsTitle = ["Profile", "Setting", "Privacy policy", "Help and support",];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF93B1FE),
        automaticallyImplyLeading: false,
        title: const Text("Profile", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black),),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getUser(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.greenAccent),),
            );
          }else if(snapshot.data!.docs.isEmpty){
            return Center(
              child: Text("No User Found", style: Theme.of(context).textTheme.bodyLarge,),
            );
          }else{
            var data = snapshot.data!.docs[0];
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile Information
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 70,
                            backgroundImage: (data['profileImageUrl'] != null && data['profileImageUrl'].toString().isNotEmpty)
                                ? NetworkImage(data['profileImageUrl'])
                                : const AssetImage(doctor) as ImageProvider,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: CupertinoColors.systemGrey5,
                              child: IconButton(
                                icon: const Icon(CupertinoIcons.add, color: Colors.orangeAccent,),
                                onPressed: (){
                                  controller.pickAndUploadPhoto();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight*0.02),
                      Text("${data['name']}", style: const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Text("${data['email']}", style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight*0.03),
                  // Settings Options
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth*0.05),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: profileIconsTitle.length,
                            itemBuilder: (context, index){
                              return ListTile(
                                leading: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.teal.shade50,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(profileIcons[index], color: Colors.teal,),
                                ),
                                title: Text(profileIconsTitle[index], style: const TextStyle(fontSize: 18, color: Colors.black),),
                                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black,),
                                onTap: (){

                                },
                              );
                            },
                          ),
                          const Divider(),
                          ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.redAccent.withAlpha(25),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(Icons.logout, color: Colors.red,),
                            ),
                            title: const Text(
                              "Log out",
                              style: TextStyle(color: Colors.red),
                            ),
                            onTap: () async {
                              try {
                                if (googleSignIn.currentUser != null) {
                                  await googleSignIn.disconnect();
                                }
                              } catch (e) {
                                Get.snackbar("","",
                                  titleText: const Text("Log out failed", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
                                  messageText: Text("$e", style: const TextStyle(fontSize: 16, color: Colors.black),),
                                  backgroundColor: Colors.white,
                                );
                              }
                              await FirebaseAuth.instance.signOut();
                              Get.off(const LoginPage());
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}