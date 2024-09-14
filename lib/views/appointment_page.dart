import 'package:health_plus/consts/const.dart';
import 'package:health_plus/widget_common/calendar_card.dart';
import 'package:health_plus/widget_common/otherservices_card.dart';
import 'package:velocity_x/velocity_x.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {

  String monthName = month[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF93B1FE),
        title: const Text('Book Appointment', style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //calendar part
              Row(
                children: [
                  Icon(Icons.calendar_today_rounded,color: Colors.black,size: context.screenHeight*0.10,),
                  const SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Select Month',style: TextStyle(color: Colors.black),),
                      SizedBox(
                        width: context.screenWidth*0.4,
                        child: DropdownButtonFormField(
                          value: monthName,
                          items: month.map<DropdownMenuItem>((value){
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue){
                            setState(() {
                              monthName = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              //date part
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(31, (index)=>calendarCard(date: monthDate[index])),
                ),
              ),
              const SizedBox(height: 20,),

              //describe symptoms
              const Text('Describe Symptoms',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w400),),
              const SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'in details....',
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 20,),

              //specialist
              const Text('Specialist',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w400),),
              const SizedBox(height: 10,),
              Material(
                elevation: 3.0,
                shadowColor: const Color(0xFF93B1FE),
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: const Color(0xFF93B1FE),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 60,
                          foregroundImage: AssetImage(doctor),
                        ),
                        SizedBox(width: 5,),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Dr. Kartheek Valigonda",
                                style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600),),
                              Text("Neurosurgeon, MD, MBBS",
                                style: TextStyle(color: Color(0xFF444444),),),
                              Text("11 years experience",
                                style: TextStyle(color: Color(0xFF444444),),),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Icon(Icons.star,color: Colors.yellow,),
                                  Text('4.8  507 Reviews', style: TextStyle(color: Color(0xFF444444)),),
                                  SizedBox(width: 20,),
                                  Icon(Icons.more_horiz,color: Colors.black,),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),

              //Other Services
              const Text('Other Services',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w400),),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  otherServicesCard(img: lab, text: 'Lab Text'),
                  otherServicesCard(img: medicine, text: 'Buy Medicine'),
                  otherServicesCard(img: healthInsurance, text: 'Insurance'),
                ],
              ),



            ],
          ),
        ),
      ),
    );
  }
}

Widget Check(){
  return Row(
    children: [
      Text('March',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Icon(Icons.arrow_back_ios_new,color: Colors.black,size: 15,),
        ),
      ),
      const SizedBox(width: 5,),
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 15,),
        ),
      ),
    ],
  );
}
