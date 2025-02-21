import 'package:get/get.dart';
import 'package:health_plus/consts/const.dart';
import 'package:health_plus/services/notification_service.dart';
import 'package:health_plus/views/other/animal_description.dart';
import 'package:health_plus/widget_common/doctor_card.dart';

class Vets extends StatelessWidget {
  const Vets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:  const Color(0xFF93B1FE),
        actions: [
          IconButton(
            onPressed: () async{
              await NotificationService.scheduleNotification().then((value){
                Get.snackbar("","",
                  titleText: const Text("Notification Scheduled!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
                  backgroundColor: Colors.white,
                );
              });
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Consultants", style: TextStyle(fontSize: 30),),
              doctorCard(
                docType: "Sergon",
                docName: "Dr. KV",
                rating: "4.6",
                onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const AnimalDescription()));
                }
              ),
              const SizedBox(height: 15,),
              doctorCard(
                  docType: "Dermatologist",
                  docName: "Dr. AKG",
                  rating: "4.9",
                  onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const AnimalDescription()));
                  }
              ),
              const SizedBox(height: 15,),
              doctorCard(
                  docType: "Cardiologist",
                  docName: "Dr. Bugu",
                  rating: "4.3",
                  onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const AnimalDescription()));
                  }
              ),
              const SizedBox(height: 15,),
              doctorCard(
                  docType: "Psychologist",
                  docName: "Dr. TUTU",
                  rating: "0.1",
                  onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const AnimalDescription()));
                  }
              ),
              const SizedBox(height: 15,),
              doctorCard(
                  docType: "cardiologist",
                  docName: "Dr. Bhoma",
                  rating: "0.2",
                  onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const AnimalDescription()));
                  }
              ),
              const SizedBox(height: 15,),
              doctorCard(
                  docType: "Gynocologist",
                  docName: "Dr.Deepankar ",
                  rating: "4.69",
                  onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const AnimalDescription()));
                  }
              ),
              const SizedBox(height: 15,),
              doctorCard(
                  docType: "Sergon",
                  docName: "Dr. Shaktiman",
                  rating: "4.1",
                  onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const AnimalDescription()));
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}