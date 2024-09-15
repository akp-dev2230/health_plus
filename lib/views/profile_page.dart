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
      body:Column(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.all(context.screenWidth*0.03),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF93B1FE),
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      foregroundImage: AssetImage(doctor),
                    ),
                    SizedBox(width: 5,),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ajit",
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                          Text("ajit007@gmail.com",
                            style: TextStyle(fontSize: 15),),
                          Text("7020826685",
                            style: TextStyle(fontSize: 15),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(

                padding: EdgeInsets.all(context.screenWidth*0.03),
                child: Container(
                  width: 165,
                  height: 110,
                  decoration: BoxDecoration(
                    color: const Color(0xFF93B1FE),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(35),
                    child: Column(
                      children: [
                        Text("Pending"),
                        Text("Appointments")
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 165,
                height: 110,
                decoration: BoxDecoration(
                    color: const Color(0xFF93B1FE),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Text("help")
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}
