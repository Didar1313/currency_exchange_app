import 'package:currency/ui/exchange_page.dart';
import 'package:currency/ui/home_page.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedItemIndex = 0;

  Widget getView(){
    if(_selectedItemIndex==0){
      return Home();
    }
    return Exchange();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0x251916DD),
        title: Center(
          child: const Text(
            "Currency Exchange App",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: getView(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.currency_exchange), label: "Exchange")
        ],
        currentIndex: _selectedItemIndex,
        onTap: (index) {
          setState(() {
            _selectedItemIndex = index;
          });
        },
      ),
    );
  }
}
