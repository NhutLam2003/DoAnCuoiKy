import 'package:flutter_application_1/models/model_category.dart';

List<CategoryModel> getCategories(){
  ////////
  List<CategoryModel> category = [];
  /////// Nóng
  CategoryModel categoryModel = new CategoryModel();
  categoryModel.name = "Nóng";
  category.add(categoryModel);
  ////// Mới
  categoryModel = new CategoryModel();
  categoryModel.name = "Thể Thao";
  category.add(categoryModel);
  ////// Bóng đá VN
  categoryModel = new CategoryModel();
  categoryModel.name = "Giải Trí";
  category.add(categoryModel);
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
  ////// Kinh Doanh
  categoryModel = new CategoryModel();
  categoryModel.name = "Kinh Doanh";
  category.add(categoryModel);
  return category;
}