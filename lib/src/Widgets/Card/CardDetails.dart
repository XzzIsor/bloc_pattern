import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({Key? key, required this.borderRadius, required this.width, required this.height, required this.name, required this.id}) : super(key: key);
  final double borderRadius;
  final String name;
  final double width;
  final double height;
  final String id;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(borderRadius),
          bottomLeft: Radius.circular(borderRadius)),
      child: Container(
        width: width,
        height: height,
        color: Colors.deepPurpleAccent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: _content(),
        ),
      ),
    );
  }

  Column _content() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  overflow: TextOverflow.ellipsis,
              ),
              Text(id,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                  ),
                  overflow: TextOverflow.ellipsis
              )
            ],
          );

}
