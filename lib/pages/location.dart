// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_world_time_app/classes/class.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<AallCountris> allCountris = [
    AallCountris(link: 'Africa/Cairo', flag: "egypt.png", countryName: "egypt"),
    AallCountris(link: 'Asia/Riyadh', flag: "sa.png", countryName: "sa"),
    AallCountris(
        link: 'Africa/Algiers', flag: "algeria.png", countryName: "algeria"),
    AallCountris(
        link: 'Australia/Sydney',
        flag: "australia.png",
        countryName: "australia"),
    AallCountris(
        link: 'Africa/Tunis', flag: "tunisia.png", countryName: "tunisia"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 191, 191, 199),
        appBar: AppBar(
          title: Text("Choose Location"),
          backgroundColor: Colors.grey,
        ),
        body: SizedBox(
            child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: allCountris.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      onTap: () async {
                        AallCountris clickedcountry = allCountris[index];

                        //  كتابة المتغير المخزن بداخلة الكلاس ثم الفونكشون
                        await clickedcountry.getdata();

                        Navigator.pop(context, {
                          "time": clickedcountry.timenow ,
                          "location":clickedcountry.timezone,
                          "isdaytime": clickedcountry.isdaytime
                        });
                      },
                      title: Text(
                        allCountris[index].countryName,
                        style: TextStyle(fontSize: 35, color: Colors.black),
                      ),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/${allCountris[index].flag}"),
                      ),
                    ),
                  );
                })));
  }
}
