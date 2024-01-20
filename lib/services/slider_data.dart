import '../models/model_slider.dart';




List<SliderModel> getSlider(){
  ////////
  List<SliderModel> slider = [];
  /////// Nóng
  SliderModel sliderModel = new SliderModel();
  sliderModel.name = "Nóng";
  sliderModel.img = "assets/img/anh3.png";
  slider.add(sliderModel);
  ////// Mới
  sliderModel = new SliderModel();
  sliderModel.name = "Mới";
  sliderModel.img = "assets/img/anh3.png";
  slider.add(sliderModel);
  ////// Bóng đá VN
  sliderModel = new SliderModel();
  sliderModel.name = "Bóng đá VN";
  sliderModel.img = "assets/img/anh3.png";
  slider.add(sliderModel);
  // ////// Bóng đá TQ
  // categoryModel = new CategoryModel();
  // categoryModel.name = "Bóng đá QT";
  // category.add(categoryModel);
  // ////// Độc & lạ
  // categoryModel = new CategoryModel();
  // categoryModel.name = "Độc & lạ";
  // category.add(categoryModel);
  // ////// Tình yêu
  // categoryModel = new CategoryModel();
  // categoryModel.name = "Tình yêu";
  // category.add(categoryModel);
  // ////// Giải trí
  // categoryModel = new CategoryModel();
  // categoryModel.name = "Giải trí";
  // category.add(categoryModel);
  // ////// Thế giới 
  // categoryModel = new CategoryModel();
  // categoryModel.name = "Thế giới";
  // category.add(categoryModel);
  // ////// Pháp luật
  // categoryModel = new CategoryModel();
  // categoryModel.name = "Pháp luật";
  // category.add(categoryModel);
  return slider;
}