import 'package:health_plus/consts/const.dart';

Widget otherServicesCard({img,text}){
  return Column(
    children: [
      Material(
        elevation: 2.0,
        shadowColor: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(50.0),
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            image: DecorationImage(image: AssetImage(img),fit: BoxFit.cover),
          ),
        ),
      ),
      const SizedBox(height: 5,),
      Text(text,style: const TextStyle(color: Colors.black),),
    ],
  );
}

