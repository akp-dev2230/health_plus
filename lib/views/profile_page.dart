import 'package:flutter/material.dart';
import 'package:health_plus/consts/const.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: const Color(0xFF93B1FE),
          title: const Text('Your Profile', style: TextStyle(color: Colors.white),),
        ),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              foregroundImage: AssetImage(doctor),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name : ',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                Text('Ajit'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Email : ',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                Text('roman45reign02@gmail.com'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Gender : ',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                Text('Male'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Phone : ',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                Text('9113198525'),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
