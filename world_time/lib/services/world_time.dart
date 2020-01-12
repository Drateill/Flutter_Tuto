import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
//print(data);

// get prop
      String dateTime = data['datetime'];
      String offSet = data['utc_offset'].substring(1, 3);

// print(dateTime);
// print(offSet);

//create dateTime obj

      DateTime now = DateTime.parse(dateTime);
      now.add(Duration(hours: int.parse(offSet)));
      isDayTime = now.hour>6 && now.hour<17 ? true : false;

      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Error : $e');
      time = 'Error $e';
    }
  }
}
