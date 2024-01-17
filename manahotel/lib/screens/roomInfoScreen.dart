import 'package:flutter/material.dart';
import 'package:manahotel/screens/editRoomInfoScreen.dart';
import 'package:manahotel/ui/myTheme.dart';
import 'package:provider/provider.dart';

import '../objects/room.dart';
class RoomInfoScreen extends StatelessWidget {
  Room room;
  RoomInfoScreen({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    String type = 'Phòng đơn';
    String status;
    Widget customerInfor = Container();

    Icon roomIcon = const Icon(Icons.bedroom_child_outlined,size: 30,color: Color(0xFF4D9DE6),);
    if(room.type == RoomType.single) {
      type = "Phòng đơn";
      roomIcon = const Icon(Icons.bedroom_child_outlined,size: 30,color: Color(0xFF4D9DE6));
    } else {
      type = "Phòng đôi";
      roomIcon =const Icon(Icons.bedroom_parent_outlined,size: 30,color: Color(0xFF4D9DE6));
    }
    if(room.status==RoomStatus.available){
      status = "Trống";
      customerInfor = Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Provider.of<MyTheme>(context).color2,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            Text('chưa có thông tin',style: TextStyle(
                fontSize: 18,
                color: Provider.of<MyTheme>(context).color9,
            ),),
          ],
        ),
      );
    }else {
      customerInfor = Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Provider.of<MyTheme>(context).color2,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tên',style: TextStyle(
                  fontSize: 18,
                  color: Provider.of<MyTheme>(context).color8,
                ),),
                Text('ABC',style: TextStyle(
                  fontSize: 18,
                  color: Provider.of<MyTheme>(context).color9,
                ),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('SĐT',style: TextStyle(
                  fontSize: 18,
                  color: Provider.of<MyTheme>(context).color8,
                ),),
                Text('0987654321',style: TextStyle(
                  fontSize: 18,
                  color: Provider.of<MyTheme>(context).color9,
                ),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('CCCD',style: TextStyle(
                  fontSize: 18,
                  color: Provider.of<MyTheme>(context).color8,
                ),),
                Text('098876544333',style: TextStyle(
                  fontSize: 18,
                  color: Provider.of<MyTheme>(context).color9,
                ),),
              ],
            ),
          ],
        ),
      );
      status = "Đang sử dụng";
    }
    return Consumer<MyTheme>(builder: (BuildContext context,theme,child){
      return Scaffold(
        backgroundColor: theme.color1,
        appBar: AppBar(
          backgroundColor: theme.color1,
          foregroundColor: theme.color8,
          title: Text('Thông tin phòng'),
          actions:[
            IconButton(
              icon:const Icon(Icons.edit),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> EditRoomInfoScreen( room: room,)));
              },),
          ],
        ),
        body: Stack(
          children: [SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      roomIcon,
                      Text(room.number,style: const TextStyle(
                        color: Color(0xFF4D9DE6),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Container(
                    decoration: BoxDecoration(
                        color: theme.color2,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Phòng',style: TextStyle(
                              color: theme.color8,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),),
                            Text(room.number,style: TextStyle(
                                color: theme.color9,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                        Container(margin: EdgeInsets.symmetric(vertical: 10),
                          color: theme.color3,height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tầng',style: TextStyle(
                                color: theme.color8,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                            Text(room.floor.toString(),style: TextStyle(
                                color: theme.color9,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                        Container(margin: EdgeInsets.symmetric(vertical: 10),
                          color: theme.color3,height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Loại',style: TextStyle(
                                color: theme.color8,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                            Text(type,style: TextStyle(
                                color: theme.color9,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                        Container(margin: EdgeInsets.symmetric(vertical: 10),
                          color: theme.color3,height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Giá',style: TextStyle(
                                color: theme.color8,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                            Text("${room.cost}vnd/ngày",style: TextStyle(
                                color: theme.color9,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                        Container(margin: EdgeInsets.symmetric(vertical: 10),
                          color: theme.color3,height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Trạng thái',style: TextStyle(
                                color: theme.color8,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                            Text(status,style: TextStyle(
                                color: theme.color9,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Text('Thông tin khách hàng',style: TextStyle(
                    color: theme.color8,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),
                  const SizedBox(height: 10,),
                  customerInfor,
                ],
              ),
            ),
          ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30,left: 20,right: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: ElevatedButton(
                          onPressed: (){},
                          child: Text("Đặt phòng",style:TextStyle(
                            color: theme.color8,
                          )),
                          style: ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 15)),
                            backgroundColor: MaterialStatePropertyAll(theme.color5)
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      flex: 3,
                      child: ElevatedButton(
                          onPressed: (){},
                          style: ButtonStyle(
                              padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 15)),
                              backgroundColor: MaterialStatePropertyAll(theme.color7)
                          ),
                          child: Text("Xóa",style: TextStyle(
                            color: theme.color8,

                          ),)),
                    )
                  ],
                ),
              ),
            )
          ]
        ),
      );
    });
  }
}
