import 'package:flutter/material.dart';
import 'package:flutter_app_moneyshare/views/moneyshare_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  bool checkTip = false;

  //สร้างตัวควบคุม TextField แล้วอย่าลืมเอาไปผูกกับ TextField
  TextEditingController txMoney = TextEditingController();
  TextEditingController txPerson = TextEditingController();
  TextEditingController txTip = TextEditingController();

  //สร้างMethod/function -> โค้ดแสดง Dialog เตือนโดยจะรับข้อความมาแสดงที่ Dialog
  showWarningDialog(context, msg) {
    //เรียกใช้งานฟังก์ชั่น showdialog
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Container(
              color: Colors.deepPurple,
              padding: EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "คำเตือน",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            content: Text(
              msg,
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          50.0,
                        ),
                      ),
                      elevation: 10.0,
                    ),
                    child: Text(
                      "ตกลง",
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: Text(
          "แชร์เงินกันเถอะ",
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 45.0,
              ),
              Image.asset(
                "assets/images/logo.png",
                width: 120.0,
              ),
              SizedBox(
                height: 45.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                child: TextField(
                  controller: txMoney,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.moneyBillWave,
                      color: Colors.deepPurpleAccent,
                    ),
                    hintText: "ป้อนจำนวนเงิน (บาท)",
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                child: TextField(
                  controller: txPerson,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.userFriends,
                      color: Colors.deepPurpleAccent,
                    ),
                    hintText: "ป้อนจำนวนคน (คน)",
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    onChanged: (data) {
                      setState(() {
                        if (data != null) {
                          checkTip = data;
                          if (data == false) {
                            txTip.text = "";
                          }
                        }
                      });
                    },
                    value: checkTip,
                    side: BorderSide(
                      color: Colors.deepPurple,
                    ),
                    activeColor: Colors.deepPurple,
                    checkColor: Colors.yellow,
                  ),
                  Text(
                    "ทิปให้พนักงานเสิร์ฟ",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                child: TextField(
                  controller: txTip,
                  enabled: checkTip,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.coins,
                      color: Colors.deepPurpleAccent,
                    ),
                    hintText: "ป้อนจำนวนเงินทิป (บาท)",
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              ElevatedButton(
                onPressed: () {
                  //ตรวจสอบ(validate)ว่าป้อนหรือยังในสิ่งที่ต้องป้อน ถ้ายังไม่ป้อนให้แสดง dialog เตือน
                  //กรณีป้อนครบเรียบร้อยก็คำนวณ
                  //เมื่อคำนวณเรียบร้อยให้ส่งข้อมูลต่างๆไปแสดงผลที่หน้า moneyshareUI
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return MoneyshareUI();
                  //     },
                  //   ),
                  // );
                  if (txMoney.text.length == 0) {
                    showWarningDialog(
                      context,
                      "ป้อนเงินด้วยจ้า...",
                    );
                  } else if (txPerson.text.length == 0) {
                    showWarningDialog(
                      context,
                      "ป้อนคนด้วยจ้า...",
                    );
                  } else {
                    if (checkTip == true) {
                      if (txTip.text.length == 0) {
                        showWarningDialog(
                          context,
                          "ป้อนทิปด้วยจ้า...",
                        );
                        return; //ออกจากการทำงาน
                      }
                    }
                    //คำนวณ
                    double money = 0;
                    int person = 0;
                    double tip = 0;
                    double moneyshare = 0;
                    //แปลงสิ่งที่ป้อนใน textfield ให้เป็นตัวเลขเพื่อคำนวณ
                    money = double.parse(txMoney.text);
                    person = int.parse(txPerson.text);
                    tip = checkTip == true ? double.parse(txTip.text) : 0;
                    // เงื่อนไข ? จริงทำตรงนี้ : เท็จทำตรงนี้
                    moneyshare = (money + tip) / person;
                    //ส่งค่าทั้งหมดไปแสดงผลที่หน้า MoneyShareUI
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MoneyshareUI(
                            money: money,
                            person: person,
                            tip: tip,
                            moneyshare: moneyshare,
                          );
                        },
                      ),
                    );
                  }
                },
                child: Text(
                  "คำนวณ",
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80.0,
                    50,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                  ),
                  shadowColor: Colors.deepPurple,
                  elevation: 5.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    txMoney.text = "";
                    txPerson.text = "";
                    txTip.text = "";
                    checkTip = false;
                  });
                },
                icon: Icon(
                  Icons.refresh,
                ),
                label: Text("ยกเลิก"),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80.0,
                    50.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                  ),
                  elevation: 5.0,
                  shadowColor: Colors.red,
                  primary: Colors.red,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Created by BC SAU 2021",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF454545),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
