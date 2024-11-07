import 'package:health_plus/consts/const.dart';

Future<bool?> exitDialog({context, title}){
  return showDialog<bool>(context: context, builder: (context){
    return AlertDialog(
      title: const Text("Confirm"),
      content: Text("Are you sure want to $title"),
      actions: [
        TextButton(
          onPressed:(){
            Navigator.pop(context, true);
          },
          child: const Text("Yes"),
        ),
        TextButton(
          onPressed:(){
            Navigator.pop(context, false);
          },
          child: const Text("No"),
        )
      ],
    );
  });
}