import 'package:health_plus/consts/const.dart';
import 'package:health_plus/widget_common/filter_card.dart';
import 'package:health_plus/widget_common/petfoster_card.dart';

class Foster extends StatelessWidget {
  const Foster({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User"),
        backgroundColor: const Color(0xFF93B1FE),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(height: 15,),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection:Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                    filterCard(icon: Icons.ac_unit_sharp,text: "Dogs"),
                    filterCard(icon: Icons.ac_unit_sharp,text: "Cats"),
                    filterCard(icon: Icons.ac_unit_sharp,text: "Cows"),
                    filterCard(icon: Icons.ac_unit_sharp,text: "Birds"),
                  ],
                ),
              ),
              GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.0,
                ),
                itemBuilder:(context,index){
                  return petfosterCard(
                    image: fosterImgList[index] ,
                    height: 250,
                    width: 400,
                    name: fosterNameList[index],
                    info: fosterInfoList[index],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

