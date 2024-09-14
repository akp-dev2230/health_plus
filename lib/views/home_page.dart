import 'package:health_plus/consts/const.dart';
import 'package:health_plus/views/appointment_page.dart';
import 'package:health_plus/widget_common/category_card.dart';
import 'package:health_plus/widget_common/doctor_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello Ajit',style: TextStyle(color: Color(0xFF037ED7), fontSize: 18.0),),
            Text('Find your specialist',style: TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //search bar
                Material(
                  elevation: 5.0,
                  shadowColor: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 0.4,
                        )
                      ),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.menu),
                      hintText: 'Search....',
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                      suffixIcon: const Icon(Icons.search)
                    ),
                  ),
                ),
                const SizedBox(height: 30,),


                // Categories
                const Text('Categories',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),),
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    categoryCard(color: const Color(0xFF84CCEA), img: heart),
                    categoryCard(color: const Color(0xFF4CDFCD), img: kidney),
                    categoryCard(color: const Color(0xFFF8BF7D), img: teeth),
                    categoryCard(color: const Color(0xFF4DFED3), img: brain),
                    categoryCard(color: const Color(0xFFFF567F), img: eye),
                  ],
                ),
                const SizedBox(height: 20,),


                //Upcoming Appointment
                const Text('Upcoming Appointment',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),),
                const SizedBox(height: 8,),
                Material(
                  elevation: 3.0,
                  shadowColor: const Color(0xFF93B1FE),
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    height: 105,
                    decoration: BoxDecoration(
                      color: const Color(0xFF93B1FE),
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 35,
                            foregroundImage: AssetImage(doctor),
                          ),
                          const SizedBox(width: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.access_time_outlined,color: Colors.black,),
                                        Text('12:30 PM',
                                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),)
                                      ],
                                    ),
                                  ),
                                ),
                                const Text("Dr. Kavyansh Shukla",
                                  style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
                                const Text("Kidney Specialist",
                                  style: TextStyle(color: Color(0xFF444444),),)
                              ],
                            ),
                          ),
                          const SizedBox(width: 10,),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.more_horiz,color: Colors.black,),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),



                //Top Doctor's for you
                const Text("Top Doctor's For You",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),),
                const SizedBox(height: 8,),
                doctorCard(
                  onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const AppointmentPage()));
                  },
                  docType: "Gynaecologist",
                  docName: "Dr. Deepankar Singh",
                  rating: "4.5  178 Reviews",
                ),
                const SizedBox(height: 15,),
                doctorCard(
                  onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const AppointmentPage()));
                  },
                  docType: "Eye Specialist",
                  docName: "Dr. Mridul Garg",
                  rating: "4.6  208 Reviews",
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
