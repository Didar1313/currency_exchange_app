import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_picker_dropdown.dart';
import 'package:country_currency_pickers/utils/utils.dart';
import 'package:currency/api_service/apiService.dart';
import 'package:currency/model_api/ModelApi.dart';
import 'package:currency/ui/home_views_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  String _selectedCurrency = 'USD';

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
    ApiService apiService = ApiService();
    return Scaffold(
      body: Column(
        children: [
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
            padding: const EdgeInsets.all(9),
            height: 50,
            margin: EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0x7B6C96FF)),
            child: CountryPickerDropdown(
                initialValue: "bd",
                itemBuilder: _buildDropDownItem,
                onValuePicked: (Country? country) {
                  setState(() {
                    _selectedCurrency = country?.currencyCode ?? "";
                  });
                }),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "All Currency",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ModelApi> dataList = snapshot.data ?? [];
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return HomeViewsList(modelApi: dataList[index]);
                    },
                    itemCount: dataList.length,
                  ),
                );
              }
              if(snapshot.hasError){
                return Center(child: Text("Error occurd"));
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
            future: apiService.getLatest(_selectedCurrency),
          ),
        ],
      ),
    );
  }
}
