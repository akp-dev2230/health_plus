import 'package:flutter/material.dart';
import 'package:health_plus/widget_common/textfield_cart.dart';

class AnimalDescription extends StatelessWidget {
  const AnimalDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF93B1FE),
      ),
      body: Padding(
        padding:const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Fill the info..... ", style: TextStyle(fontSize: 20, ),),
              const SizedBox(height: 30,),
              const Text("Species", style: TextStyle(fontSize: 20, ),),
              textFieldCart(obscureBool: false),
              const SizedBox(height: 15,),
              const Text("Breed", style: TextStyle(fontSize: 20, ),),
              textFieldCart(obscureBool: false),
              const SizedBox(height: 15,),
              const Text("Issue", style: TextStyle(fontSize: 20, ),),
              textFieldCart(obscureBool: false),
              const SizedBox(height: 15,),
              const Text("Symptoms", style: TextStyle(fontSize: 20, ),),
              textFieldCart(obscureBool: false),
              const SizedBox(height: 20,),
              Align(
                alignment: Alignment.center,
                  child: ElevatedButton(onPressed: (){}, child: const Text("Proceed"))
              )
            ],
          ),
        ),
      ),
    );
  }
}
