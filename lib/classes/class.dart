import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class AallCountris {
  String flag;
  String countryName;
  String link;
  AallCountris({required this.flag, required this.countryName,required this.link});

  late bool isdaytime;
  late String timenow;
  late String timezone;
  getdata() async {
    //  عمل متغير ووضع قيمته في وقت لاحق
    Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/$link'));
    // تخزين الجيسون بداخل متغير عام عبارة عن ماب
    Map receivedData = jsonDecode(response.body);
    //  تحويل الداتا من استرينج لوقت
    DateTime datetime = DateTime.parse(receivedData["utc_datetime"]);
    //  تحويل الداتا من استرينج الي رقم وتحديد الكراكتر من الي واول كاركتر من 1 واخر كاركتر 3
    int offset = int.parse(receivedData["utc_offset"].substring(0, 3));
    //  اضافة الرقم المحول علي الوقت المحول
    DateTime realimee = datetime.add(Duration(hours: offset));
    //  لتحقيق شرطين لتغير الخلفية
    if (realimee.hour > 5 && realimee.hour < 18) {
      isdaytime = true;
    } else {
      isdaytime = false;
    }

    // تحديد شكل ظهور الوقت عن طريق بكاكيدج الوقت انتل وتخزينها داخل استرينج
    timenow = DateFormat('hh :mm a').format(realimee);
    // تخزين التايم زون داخل متغير استرينج
    timezone = receivedData["timezone"];
    // فتح الصفحة التاليه مع ارسال الداتا للصفحة التاليه
  }
}
