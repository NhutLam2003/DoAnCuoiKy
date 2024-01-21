class ThoiTiet{
  String ? cityname;
  double ? temp;
  double? wind;
  int ? humidity;
  double ? feels_like;
  int ? pressure;

  ThoiTiet({
    this.cityname,
    this.feels_like,
    this.humidity,
    this.pressure,
    this.temp,
    this.wind
  });


  ThoiTiet.fromJson(Map<String,dynamic> json){
    cityname = json['name'];
    temp = json['main']['temp'];
    wind = json['wind']['speed'];
    pressure = json['main']['pressure'];
    humidity = json['main']['humidity'];
    feels_like = json['main']['feels_like'];
  }
}