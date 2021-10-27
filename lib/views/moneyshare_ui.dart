import 'package:flutter/material.dart';

class MoneyshareUI extends StatefulWidget {
  //รับค่าจากหน้า HomeUI
  double money = 0;
  int person = 0;
  double tip = 0;
  double moneyshare = 0;

  //ที่คอนสตรัคเตอร์ นำตัวแปรที่สร้างไว้มากำหนดเพื่อที่จะรับค่าจาก HomeUI
  MoneyshareUI({
    Key? key,
    required this.money,
    required this.person,
    required this.tip,
    required this.moneyshare,
  }) : super(key: key);

  @override
  _MoneyshareUIState createState() => _MoneyshareUIState();
}

class _MoneyshareUIState extends State<MoneyshareUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: Text(
          "ผลการแชร์เงิน",
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40.0,
              ),
              Image.asset(
                "assets/images/logo.png",
                width: 120.0,
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "จำนวนเงินที่จะหาร",
              ),
              Text(
                widget.money.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.deepPurple,
                ),
              ),
              Text(
                "บาท",
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "จำนวนคนที่จะหาร",
              ),
              Text(
                widget.person.toString(),
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.deepPurple,
                ),
              ),
              Text(
                "คน",
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "จำนวนเงินทิป",
              ),
              Text(
                widget.tip.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.deepPurple,
                ),
              ),
              Text(
                "บาท",
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "สรุปว่าหารกันคนละ",
              ),
              Container(
                color: Colors.yellow,
                width: MediaQuery.of(context).size.width - 80,
                padding: EdgeInsets.only(
                  top: 15.0,
                  bottom: 15.0,
                  //ระยะห่างจากสิ้งที่อยู่ข้างใน
                ),
                margin: EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                  //ระยะห่างจากสิ่งที่อยู่ข้างนอก
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.moneyshare.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Text(
                "บาท",
              ),
              SizedBox(
                height: 20.0,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
