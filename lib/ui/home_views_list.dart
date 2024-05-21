import 'package:currency/model_api/ModelApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewsList extends StatelessWidget {
  final ModelApi modelApi;
   HomeViewsList({super.key, required this.modelApi});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9),
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Color(0x7B6C96FF),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Text(modelApi.code.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          Spacer(),
          Text(modelApi.value!.toStringAsFixed(3).toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
        ],
      )
    );
  }
}
