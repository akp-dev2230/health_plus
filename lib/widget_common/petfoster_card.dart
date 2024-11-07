import 'package:health_plus/consts/const.dart';
import 'package:velocity_x/velocity_x.dart';

Widget petfosterCard({image,Width, Height, name, info}){
  return Container(
    child: Column(
      children: [
        Image.asset(image, width:Width, height: Height, fit: BoxFit.cover,),
        Text(name),
        Text(info),
      ],
    ),
  );
}