import 'package:health_plus/consts/const.dart';
import 'package:velocity_x/velocity_x.dart';

Widget calendarCard({date}){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      elevation: 1.0,
      shadowColor: Colors.grey.shade400,
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(child: Text(date ,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold))),
        ),
      ),
    ),
  );
}