import 'package:flutter/material.dart';


class Tienich  extends StatelessWidget {
  const Tienich ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tiện ích'),
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
        
        body: 
        Column(
          children: [
            Expanded(
              child: SingleChildScrollView(   
              child:  Wrap(
                children: [
            
                  Row(
                    children: [
                      SizedBox(height: 20,),
                      Text('Danh mục tiện ích',style: TextStyle( fontSize: 23.0,fontWeight: FontWeight.bold,color: Colors.red,)),
                    ],
                  ),    
            
            
            
                  Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    alignment: Alignment.center,
                   
                    child: 
                        Container(
                            decoration: BoxDecoration(
                            color: Colors.white, // Màu nền của Container
                            border: Border.all(
                              color: Colors.black, // Màu sắc của viền
                              width: 2.0, // Độ dày của viền
                            ),
                  ),
                          child: Image.asset("assets/img/thoitiet.png",height: 200,width: 240,fit: BoxFit.contain,)),
                  ),
            
            
            
            
                  Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    alignment: Alignment.center,
                   
                    child: 
                        Container(
                            decoration: BoxDecoration(
                            color: Colors.white, // Màu nền của Container
                            border: Border.all(
                              color: Colors.black, // Màu sắc của viền
                              width: 2.0, // Độ dày của viền
                            ),
                  ),
                          child: Image.asset("assets/img/lich.png",height: 200,width: 240,fit: BoxFit.contain,)),
                    
                    
                  ),
              
            
            
            
                  Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    alignment: Alignment.center,
                   
                    child: 
                        Container(
                            decoration: BoxDecoration(
                            color: Colors.white, // Màu nền của Container
                            border: Border.all(
                              color: Colors.black, // Màu sắc của viền
                              width: 2.0, // Độ dày của viền
                            ),
                  ),
                          child: Image.asset("assets/img/tien.png",height: 200,width: 240,fit: BoxFit.contain,)),
                      
                    
                  ),
              
            
            
            
                  Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    alignment: Alignment.center,
                   
                    child: 
                        Container(
                            decoration: BoxDecoration(
                            color: Colors.white, // Màu nền của Container
                            border: Border.all(
                              color: Colors.black, // Màu sắc của viền
                              width: 2.0, // Độ dày của viền
                            ),
                  ),
                          child: Image.asset("assets/img/vang.png",height: 200,width: 240,fit: BoxFit.contain,)),
                          
                      
                  ),
            
            
            
            
            
            
                  Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    alignment: Alignment.center,
                   
                    child: 
                        Container(
                            decoration: BoxDecoration(
                            color: Colors.white, // Màu nền của Container
                            border: Border.all(
                              color: Colors.black, // Màu sắc của viền
                              width: 2.0, // Độ dày của viền
                            ),
                  ),
                          child: Image.asset("assets/img/xoso.png",height: 200,width: 240,fit: BoxFit.contain,)),
                      
                    ),
                  
                ],
              ),
              ),
            ),
          ],
        )
      );
    
  }
}