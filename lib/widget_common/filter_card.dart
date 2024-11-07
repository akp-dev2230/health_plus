import 'package:health_plus/consts/const.dart';

Widget filterCard({icon,text}){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: const Color(0xFF93B1FE),
          borderRadius: BorderRadius.circular(18)
      ),
      child: Row(
        children: [
          Icon(icon),
          Text(text, style: const TextStyle(
              fontSize: 20
          ),),
        ],
      ),
    ),
  );
}