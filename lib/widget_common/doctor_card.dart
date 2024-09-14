import 'package:health_plus/consts/const.dart';

Widget doctorCard({docType, docName, rating, onPress}){
  return Material(
    elevation: 3.0,
    shadowColor: Colors.grey.shade400,
    borderRadius: BorderRadius.circular(10.0),
    child: Container(
      height: 105,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Color(0xFF93B1FE),
              radius: 35,
              foregroundImage: AssetImage(doctor),
            ),
            const SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(docType,
                  style: const TextStyle(
                    color: Color(0xFF444444),
                  ),
                ),
                Text(docName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    const Icon(Icons.star,color: Colors.yellow,),
                    Text(rating, style: const TextStyle(color: Color(0xFF444444)),)
                  ],
                )
              ],
            ),
            const SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onPress,
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF93B1FE),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),),
                  child: const Text("Book Now",style: TextStyle(color: Colors.white),),)
              ],
            )
          ],
        ),
      ),
    ),
  );
}