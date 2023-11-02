// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_world_time_app/classes/class.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getDataloding() async {
    // تخزين الكلاس داخل متغير 
    AallCountris oneCountry = AallCountris(countryName:"Egept", flag:"egept",link: "Africa/Cairo");
    //  كتابة المتغير المخزن بداخلة الكلاس ثم الفونكشون
    await oneCountry.getdata();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "timenow": oneCountry.timenow,
      "timezone": oneCountry.timezone,
      "isdaytime": oneCountry.isdaytime,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataloding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  لعمل شكل تحميل
            SpinKitDualRing(
              color: Colors.red,
              size: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
