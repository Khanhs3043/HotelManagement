import 'package:flutter/material.dart';
import 'package:manahotel/screens/roomManagementScreen.dart';
import 'package:manahotel/screens/settingScreen.dart';
import 'package:provider/provider.dart';

import '../ui/myTheme.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyTheme>(
      builder: (BuildContext context,theme,child){
        double size = 18;
      return Scaffold(
        backgroundColor: Provider.of<MyTheme>(context, listen: false).color1,
        body: Column(
          children: [
            SizedBox(height: 50,),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>SettingScreen()));
                },
                icon: Icon(Icons.settings,color: theme.color8,),
                iconSize: 35,
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 25),
                    decoration: BoxDecoration(
                      color: theme.color2,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0,4)
                        )
                      ]
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Phòng trống',
                              style: TextStyle(
                                  fontSize: size,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF00DFD2)),),
                            Text('10',
                              style: TextStyle(
                                  fontSize:size ,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF00DFD2)),)
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Phòng sử dụng',
                              style: TextStyle(
                                  fontSize: size,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFE57879),
                              ),
                            ),
                            Text('10',style: TextStyle(
                                fontSize: size,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFE57879),
                            )
                            )
                          ],
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(height: 60,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context)=>RoomManagementScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(0,4)
                          )
                        ],
                        borderRadius: BorderRadius.circular(50),
                        color: theme.color4
                      ),
                      child: Stack(
                        children: [
                          Icon(Icons.menu,size: 30,color: theme.color8,),
                          Center(
                            child: Text("Quản lý phòng",
                              style: TextStyle(
                                fontSize: size,
                                fontWeight: FontWeight.bold,
                                color: theme.color8
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(0,4)
                            )
                          ],
                          borderRadius: BorderRadius.circular(50),
                          color: theme.color5
                      ),
                      child: Stack(
                        children: [
                          Icon(Icons.assignment_outlined,size: 30,color: theme.color8,),
                          Center(
                            child: Text("Đặt phòng",
                              style: TextStyle(
                                  fontSize: size,
                                  fontWeight: FontWeight.bold,
                                  color: theme.color8
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(0,4)
                            )
                          ],
                          borderRadius: BorderRadius.circular(50),
                          color: theme.color6
                      ),
                      child: Stack(
                        children: [
                          Icon(Icons.assignment_return_outlined,size: 30,color: theme.color8,),
                          Center(
                            child: Text("Trả phòng",
                              style: TextStyle(
                                  fontSize: size,
                                  fontWeight: FontWeight.bold,
                                  color: theme.color8
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
      }
    );
  }
}
