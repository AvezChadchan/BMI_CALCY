import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dehimo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var FTController = TextEditingController();
  var InchController = TextEditingController();
  var weightController = TextEditingController();
  var result = "";
  var bgColor = Color(0xFFE3EAFD);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF007AFF),
        title: Text(
          "BMI CALCY",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: bgColor,
        child: Center(
          child: Container(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Color(0xFF333333)),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: FTController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide:
                              BorderSide(color: Colors.black, width: 3)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide:
                              BorderSide(color: Colors.black, width: 3)),
                      hintText: "Enter your Height (In Feet)",
                      prefixIcon: Icon(Icons.height)),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: InchController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide:
                              BorderSide(color: Colors.black, width: 3)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide:
                              BorderSide(color: Colors.black, width: 3)),
                      hintText: "Enter your Height (In Inch)",
                      prefixIcon: Icon(Icons.height)),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.black, width: 3)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.black, width: 3)),
                    hintText: "Enter your Weight",
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    var FT = FTController.text.toString();
                    var Inch = InchController.text.toString();
                    var WT = weightController.text.toString();
                    if (FT != "" && Inch != "" && WT != "") {
                      var iFT = int.parse(FT);
                      var iInch = int.parse(Inch);
                      var iWT = int.parse(WT);
                      var tInch = (iFT * 12) + iInch;
                      var tCM = (tInch * 2.54);
                      var tM = tCM / 100;
                      var BMI = iWT / (tM * tM);
                      var msg = "";
                      if (BMI > 25) {
                        msg = "You are OverWeight!!";
                        bgColor = Colors.redAccent;
                      } else if (BMI < 18) {
                        msg = "You are UnderWeight!!";
                        bgColor = Colors.orangeAccent;
                      } else {
                        msg = "You are Healthy!!";
                        bgColor = Colors.greenAccent;
                      }
                      setState(() {
                        result =
                            "$msg \n You BMI: \n ${BMI.toStringAsFixed(3)}";
                      });
                    } else {
                      setState(() {
                        result = "Please!! Fill all the Details.";
                      });
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Color(0xFF0056D2),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.lightBlue,
                              blurRadius: 5,
                              spreadRadius: 7)
                        ]),
                    child: Center(
                        child: Text(
                      "Calculate",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Colors.white),
                    )),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  result,
                  style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold,color: Color(0xFF333333)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
