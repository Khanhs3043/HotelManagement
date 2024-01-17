import 'package:flutter/material.dart';
import 'package:manahotel/model/hotelMana.dart';
import 'package:manahotel/ui/myTheme.dart';
import 'package:provider/provider.dart';

import '../objects/room.dart';
class AddRoomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> items = ['Phòng đơn', 'Phòng đôi'];
    String selectedValue = 'Phòng đơn';
    RoomType roomType = RoomType.single;
    TextEditingController roomNumber = TextEditingController();
    TextEditingController roomFloor = TextEditingController();
    TextEditingController roomCost = TextEditingController();

    return Consumer2<MyTheme,HotelMana>(builder: (BuildContext context, theme, mana, child){
      return Scaffold(
        backgroundColor: theme.color1,
        appBar: AppBar(
          foregroundColor: theme.color8,
          backgroundColor: theme.color1,
          title: const Text("Thêm phòng",),
        ),
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              TextField(
                style: TextStyle(color: theme.color9),
                controller: roomNumber,
                decoration:InputDecoration(
                hintText: "Số phòng",
                  hintStyle: TextStyle(color: theme.color9)
              ),),
              TextField(
                style: TextStyle(color: theme.color9),
                controller: roomFloor,
                decoration:InputDecoration(
                  hintStyle: TextStyle(color: theme.color9),
                  hintText: "Tầng",

              ),),

              TextField(
                style: TextStyle(color: theme.color9),
                controller: roomCost,
                decoration:  InputDecoration(
                    hintText: "Giá/ngày",
                    hintStyle: TextStyle(color: theme.color9)
              ),),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("Loại phòng",style: TextStyle(color: theme.color9,fontSize: 16,fontWeight: FontWeight.w500),),
                DropdownButton<String>(
                  value: selectedValue,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      selectedValue = newValue;
                      mana.change();
                      roomType = (newValue == items[1]) ? RoomType.double : RoomType.single;
                    }
                  },
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                ),
              ],),
              const SizedBox(height: 50,),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 15,horizontal: 100)),
                  backgroundColor: MaterialStatePropertyAll(theme.color7)
                ),
                  onPressed: (){
                    Room room = Room(number: roomNumber.text,floor: int.parse(roomFloor.text),cost: int.parse(roomCost.text),type: roomType,);
                    if(mana.addRoom(room)){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.transparent,
                          content: Text("Thêm thành công!")));
                      print('Thêm thành công');
                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.transparent,
                          content: Text("Thêm không thành công!")));
                    }
                  },
                  child: Text("Thêm",style: TextStyle(color: theme.color8,fontWeight: FontWeight.bold,fontSize: 18),),)
            ],
          ),
        ),
      );
    });
  }
}
