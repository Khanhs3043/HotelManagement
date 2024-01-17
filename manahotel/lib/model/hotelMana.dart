import 'package:flutter/material.dart';

import '../objects/floor.dart';
import '../objects/room.dart';

class HotelMana with ChangeNotifier{
  List<Floor> listFloor = [
    Floor(floor: 1,listRoom: [
      Room(number: '101',status: RoomStatus.unavailable,cost: 100000,),
      Room(number: '102',cost: 100000,),
      Room(number: '103',cost: 100000,),
      Room(number: '104',cost: 100000,),
      Room(number: '105',cost: 100000,),

    ],),
    Floor(floor: 2,listRoom: [
      Room(number: '201',cost: 100000,),
      Room(number: '202',cost: 100000,),
    ],),
    Floor(floor: 3,listRoom: [

    ],),
    Floor(floor: 4,listRoom: [

    ],),
    Floor(floor: 5,listRoom: [

    ],),
  ];
  bool addRoom(Room room){
      for (var i in listFloor){
        if (i.floor == room.floor){
          i.listRoom.add(room);
          notifyListeners();
          return true;
        }
      }
      return false;
  }
  updateRoom(Room room,Room newRoom){
    Floor floor = listFloor[room.floor -1];
    int indexOfRoom = floor.listRoom.indexWhere((r) => r==room);
    floor.listRoom[indexOfRoom] = newRoom;
    notifyListeners();
  }
  bool deleteRoom(Room room){
    Floor floor = listFloor[room.floor -1];
    if(floor.listRoom.contains(room)){
      floor.listRoom.remove(room);
      notifyListeners();
      return true;
    }
    return false;
  }
  bool bookRoom(Room room){
    Floor floor = listFloor[room.floor -1];
    int indexOfRoom = floor.listRoom.indexWhere((r) => r==room);
    Room myroom = floor.listRoom[indexOfRoom];
    if(floor.listRoom.contains(room) && myroom.status!= RoomStatus.unavailable ){
      myroom.status = RoomStatus.unavailable;
      notifyListeners();
      return true;
    }
    return false;
  }
  bool checkOut(Room room){
    Floor floor = listFloor[room.floor -1];
    int indexOfRoom = floor.listRoom.indexWhere((r) => r==room);
    Room myroom = floor.listRoom[indexOfRoom];
    if(floor.listRoom.contains(room) && myroom.status== RoomStatus.unavailable ){
      myroom.status = RoomStatus.available;
      notifyListeners();
      return true;
    }
    return false;
  }
  change(){notifyListeners();}
}