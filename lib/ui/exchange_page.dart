import 'dart:ffi';

import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_picker_dropdown.dart';
import 'package:country_currency_pickers/utils/utils.dart';
import 'package:currency/api_service/apiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Exchange extends StatefulWidget {
  const Exchange({super.key});

  @override
  State<Exchange> createState() => _ExchangeState();
}

class _ExchangeState extends State<Exchange> {
  final _textController = TextEditingController();
  String _selectedBaseCurrency = 'BDT';
  String _selectedTaregetCurrency='USD';
  String _finalOutput="";

  Widget _buildDropDownItem(Country country) => Container(
        child: Row(
          children: [
            CountryPickerUtils.getDefaultFlagImage(country),
            SizedBox(
              width: 5,
            ),
            Text('${country.currencyName}')
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    ApiService apiService=ApiService();
    return Column(children: [
      SizedBox(
        height: 6,
      ),
      Center(
          child: Text(
        "Base Currency",
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
      )),
      SizedBox(
        height: 6,
      ),
      Container(
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Color(0x7B6C96FF)),
        child: CountryPickerDropdown(
            initialValue: "bd",
            itemBuilder: _buildDropDownItem,
            onValuePicked: (Country? country) {
              setState(() {
                _selectedBaseCurrency = country?.currencyCode ?? "";
              });
            }),
      ),
      const SizedBox(
        height: 6,
      ),
      SizedBox(
        width: 300,
        child: TextField(
          controller: _textController,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          decoration: InputDecoration(
              fillColor: Color(0x7B6C96FF),
              filled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
      ),
      SizedBox(
        height: 6,
      ),
      Center(
          child: Text(
        "Target Exchage",
        style: TextStyle(fontSize: 20),
      )),
      SizedBox(
        height: 6,
      ),
      Container(
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Color(0x7B6C96FF)),
        child: CountryPickerDropdown(
            initialValue: "us",
            itemBuilder: _buildDropDownItem,
            onValuePicked: (Country? country) {
              setState(() {
                _selectedTaregetCurrency = country?.currencyCode ?? "";
              });
            }),
      ),
      const SizedBox(
        height: 6,
      ),
      ElevatedButton(onPressed: ()async{
        if(_textController.text.isNotEmpty){
          await apiService.getExchange(_selectedBaseCurrency, _selectedTaregetCurrency).then((value){
            double result=double.parse(_textController.text);
            double exchangeRate=double.parse(value[0].value.toString());
            double maxResult= exchangeRate * result;

            setState(() {
              _finalOutput=maxResult.toStringAsFixed(2).toString();
            });
          });
        }


      }, child: Text("Exchange")),
      SizedBox(height: 6,),
      Text(_finalOutput,style: TextStyle(fontSize: 30),),
    ]);
  }
}
