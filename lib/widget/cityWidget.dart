import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class CityWidget extends StatelessWidget {
  final String cityImage,cityName,cityDescription;
  const CityWidget({
    super.key, required this.cityImage, required this.cityName, required this.cityDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 53.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(cityImage),
          Text(cityName,style: TextStyle( fontSize: cityName == 'Nepal' ? 25 : 20 ),),
          SizedBox(height: 5,),
          Text(cityDescription)
        ],
      ),
    );
  }
}
