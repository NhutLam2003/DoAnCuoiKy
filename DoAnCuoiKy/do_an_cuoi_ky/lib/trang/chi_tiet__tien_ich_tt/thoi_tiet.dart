import 'thong_tin_them.dart';
import 'tt_API.dart';
import 'tt_hien_tai.dart';
import 'tt_model.dart';
import 'package:flutter/material.dart';
class CT_ThoiTiet extends StatefulWidget {
  const CT_ThoiTiet({super.key});

  @override
  State<CT_ThoiTiet> createState() => _CT_ThoiTietState();
}

class _CT_ThoiTietState extends State<CT_ThoiTiet> {
  ThoiTietAPI client = ThoiTietAPI();
  ThoiTiet? data;
  Future<void> getData() async{
    data = await client.getThoiTiet('Ho Chi Minh');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9f9f9),
      appBar: AppBar(
      backgroundColor: Color(0xFFFf9f9f9),
      elevation: 0.0,
      title: Text('Thời tiết',style: TextStyle(color: Colors.black),),centerTitle: true,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          thoitiethientai(Icons.wb_sunny_rounded, '${data!.temp}°C', '${data!.cityname}')
          ,SizedBox(height: 60.0,)

          ,Text('Thông tin thêm',style: TextStyle(fontSize: 24.0,
          color: Color(0xdd212121),
          fontWeight: FontWeight.bold),)
          ,Divider(),
          SizedBox(height: 20.0,),
           thongtinthem('${data!.wind}', '${data!.humidity}', '${data!.pressure}', '${data!.feels_like}°C')
        ],
      );
          }else if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
          }
          return Container(
          );
        }
      )
    );
  }
}