import 'package:flutter/material.dart';
import 'package:manahotel/ui/myTheme.dart';
import 'package:provider/provider.dart';

import '../objects/room.dart';
class EditRoomInfoScreen extends StatelessWidget {
  Room room;
  EditRoomInfoScreen({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyTheme>(builder: (BuildContext context,theme,child){
      return Scaffold(
        backgroundColor: theme.color1,
        appBar: AppBar(
          backgroundColor: theme.color1,
          foregroundColor: theme.color8,
          title: Text('Chỉnh sửa'),
        ),
      );
    });
  }
}
