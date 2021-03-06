// ignore_for_file: camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


// ignore: camel_case_types
// ignore: must_be_immutable
// ignore: camel_case_types
// ignore: must_be_immutable
class sowerContent extends StatefulWidget {
  String name;
  String path;

  sowerContent(this.name,this.path);
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _sowerContent(this.name,this.path);
  }
}

// ignore: camel_case_types
class _sowerContent extends State<sowerContent> {
  String name;
  String path;
  String data = "";
  _sowerContent(this.name, this.path);

  fetchFileData() async{
    String resp;
    resp = await rootBundle.loadString(path);
    List<String> items = resp.split('\n');
    resp = "";
    for (int i = 0; i < items.length; i++ ){
      if(items[i] != "") {
        resp += items[i];
        resp += "(";
        resp += (i + 1).toString();
        resp += ")";
      }
    }
    setState(() {
      data = resp;
    });
  }
  @override
  Widget build(BuildContext context) {


    // ignore: todo
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            children:[
              Container(
                margin: EdgeInsets.only(right: 10,top:25),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        goBack();
                      },
                    ),
                    Expanded(
                      child: Center(
                        child:Text("اسلامي",style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10,top: 30),
                child:
                Text("سورة " + name, style: TextStyle(fontSize: 30,decoration: TextDecoration.underline) ,textAlign: TextAlign.center,),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 15, left: 15, bottom: 50,top: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/bg2.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SingleChildScrollView(
                      child: Container(margin:EdgeInsets.only(right: 10),
                          child: Text(data , style: TextStyle(fontSize: 20 ,),textDirection: TextDirection.rtl,))
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }

  @override
  void initState() {
    fetchFileData();
    super.initState();
  }
  void goBack() {
    Navigator.pop(context);
  }
}
