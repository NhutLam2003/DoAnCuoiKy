// thêm thư viện http: ^1.1.2
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:do_an_cuoi_ky/man_hinh/chi_tiet__tien_ich_tt/tt_model.dart';
class ThoiTietAPI{
  Future <ThoiTiet>? getThoiTiet(String? location) async{
    var endpoint = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$location&appid=eeaca9a0fbb6cf44b9873d75f6945c68&units=metric');

    var resposne = await http.get(endpoint);
    var body = jsonDecode(resposne.body);
    print(ThoiTiet.fromJson(body).cityname);
    return ThoiTiet.fromJson(body);

  }
}