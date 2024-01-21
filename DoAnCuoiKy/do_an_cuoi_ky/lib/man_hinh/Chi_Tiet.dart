import 'package:flutter/material.dart';
import 'package:do_an_cuoi_ky/chuc_nang/Binh_Luan.dart';
import 'package:do_an_cuoi_ky/chuc_nang/CT_binh_luan.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ChiTiet extends StatelessWidget {
  ChiTiet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bảng tin chi tiết'),
        centerTitle: true,
        backgroundColor:Colors.grey,
        leading:  IconButton(
            icon: Icon(Icons.arrow_back_ios_new,), 
             onPressed: () {
              // Hàm được gọi khi nút back được nhấn
              Navigator.pop(context);
            },
          ),
      ),
      body:Padding (padding:  EdgeInsets.all(16.0),       
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // tiêu đề bảng tin
            Text('Cảnh sát dẫ ông Nguyễn Thành Long và 37 bị cáo trong đại án Việt Á đến tòa ',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),),
            ///
            

            // chi tiết ngày giờ đăng 
            SizedBox(height:  8.0,),
            Row(children: [
              Text(
                  'Ngày đăng: 01/01/2024 | 07:59',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),textAlign: TextAlign.left,
                ),
            ],
            ),
              ///
              ///
              ///
              
            // ảnh bảng tin 
            Center(
              child: Image.asset("assets/img/anh.png", width: 500.0, height: 500.0,fit: BoxFit.contain,),
            ),

            //  Image.asset("assets/img/anh.png", width: 2000, height: 200.0,fit: BoxFit.contain,),
            



            

              
               SizedBox(height: 16.0),



               /// thông tin chi tiết bảng tin 
              Text(
                'Khoảng 7h, gần 10 xe đặc chủng và xe chuyên dụng, chia thành 3 đoàn dẫn giải 30 bị cáo tới tòa. Trong số này có hai cựu Bộ trưởng Nguyễn Thanh Long và Chu Ngọc Anh. Ông Nguyễn Thanh Long bước xuống xe với đôi tay bị còng, mái tóc bạc trắng, đôi mắt thâm quầng và gầy hơn so với thời điểm bị bắt tạm giam. Trong giai đoạn điều tra, ông Long đã nộp khắc phục 2,25 triệu USD, được đánh giá thành khẩn khai báo, ăn năn hối cải và tích cực hợp tác với cơ quan điều tra. An ninh phiên toà được thắt chặt, tất cả những người tham gia tố tụng đều phải để thiết bị điện tử phía ngoài và kiểm tra nghiêm ngặt khi trước khi vào phòng xét xử...',
                style: TextStyle(fontSize: 18.0),
              ),

            SizedBox(height:  19,),
            CommentList(), // Hiển thị danh sách bình luận
            BinhLuan(), // Hiển thị khung nhập liệu bình luận

            SizedBox(height: 16.0),

              // Đánh giá sao
              Text(
                'Đánh giá bài viết:',
                style: TextStyle(fontSize: 18.0),
              ),
              RatingBar(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 40,
                itemPadding:  EdgeInsets.symmetric(horizontal: 4.0),
                
                onRatingUpdate: (rating) {
                  // Xử lý khi người dùng thay đổi đánh giá
                  print(rating);
                },
                ratingWidget: RatingWidget(
                  full: Icon(Icons.star, color: Colors.amber),
                  half: Icon(Icons.star_half, color: Colors.amber),
                  empty: Icon(Icons.star_border, color: Colors.amber),
                ),
              ),
          ]
          ),
          
        ),
      ),
    );
  }
}