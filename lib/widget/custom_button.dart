import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final double width;
  final double height;
  final Widget? icon;
  final String title;
  final Color color;
  final Function() ontap;
  final Border? border;
  const MyButton({
    Key? key,
    required this.width,
    required this.height,
    this.icon,
    this.border,
    required this.title,
    required this.color,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ontap,
        child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                border: border,
                color: color,
                borderRadius: BorderRadius.circular(15)),
            child: icon == null
                ? Center(
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white,fontSize: 18),
                    ),
                  )
                : Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/google.png',width: 30,height: 30,),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(title),
                        )
                      ],
                    ),
                  ),
                  ));
  }
}
