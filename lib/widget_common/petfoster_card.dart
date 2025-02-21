import 'package:health_plus/consts/const.dart';

Widget petfosterCard({image, width, height, name, info}){
  return Column(
    children: [
      Image.asset(image, width: width, height: height, fit: BoxFit.cover,),
      Text(name),
      Text(info),
    ],
  );
}