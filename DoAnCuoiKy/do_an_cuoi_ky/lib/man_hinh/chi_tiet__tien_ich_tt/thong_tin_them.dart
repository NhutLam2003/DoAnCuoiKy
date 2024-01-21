import 'package:flutter/material.dart';

TextStyle titleFon = const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);
TextStyle infoFon = const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0);

Widget thongtinthem(String wind, String humidity, String pressure , String feels_like){
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Gió',style: titleFon,),
                SizedBox(height: 18.0,),
                Text('Áp xuất',style: titleFon,)
              ],
              
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$wind',style: infoFon,),
                SizedBox(height: 18.0,),
                Text('$pressure',style: infoFon,)
              ],
              
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Độ ẩm',style: titleFon,),
                SizedBox(height: 18.0,),
                Text('Cảm giác như',style: titleFon,)
              ],
              
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$humidity',style: infoFon,),
                SizedBox(height: 18.0,),
                Text('$feels_like',style: infoFon,)
              ],
              
            )
          ],
        )
      ],
    ),
  );
}