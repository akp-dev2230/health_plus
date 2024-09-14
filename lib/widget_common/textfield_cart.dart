import 'package:health_plus/consts/const.dart';

Widget textFieldCart({controller,required bool obscureBool,keyboardType,preFixText,preFixIcon,hintText}){
  return TextField(
    controller: controller,
    obscureText: obscureBool,
    obscuringCharacter: '*',
    keyboardType: keyboardType,
    decoration: InputDecoration(
      prefixText: preFixText,
      prefixStyle: const TextStyle(color: Colors.black,fontSize: 17),
      prefixIcon: Icon(preFixIcon,color: Colors.black,),
      hintText: hintText,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 0.4,
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1.0,
          )
      ),
    ),
  );
}