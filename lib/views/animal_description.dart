import 'package:flutter/material.dart';
import 'package:health_plus/widget_common/textfield_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class AnimalDescription extends StatelessWidget {
  const AnimalDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF93B1FE),
      ),
      body: Padding(
        padding:EdgeInsets.all(context.screenWidth*0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Fill the info..... ", style: TextStyle(fontSize: 20, ),),
              SizedBox(height: 30,),
              Text("Species", style: TextStyle(fontSize: 20, ),),
              textFieldCart(obscureBool: false),
              SizedBox(height: 15,),
              Text("Breed", style: TextStyle(fontSize: 20, ),),
              textFieldCart(obscureBool: false),
              SizedBox(height: 15,),
              Text("Issue", style: TextStyle(fontSize: 20, ),),
              textFieldCart(obscureBool: false),
              SizedBox(height: 15,),
              Text("Symptoms", style: TextStyle(fontSize: 20, ),),
              textFieldCart(obscureBool: false),
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.center,
                  child: ElevatedButton(onPressed: (){}, child: Text("Proceed"))
              )
            ],
          ),
        ),
      ),
    );
  }
}
