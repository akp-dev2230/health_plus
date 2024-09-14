import 'package:health_plus/consts/const.dart';

Widget categoryCard({color, img}){
  return Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color,
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Image(image: AssetImage(img),fit: BoxFit.fill,),
    ),
  );
}