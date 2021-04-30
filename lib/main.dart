import "package:flutter/material.dart";

void main () => runApp(RoadClosed());

class RoadClosed extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "通行止めのお知らせ",
      home: Scaffold(
        appBar: AppBar(
          title: Text("通行止めのお知らせ"),
        ),
        body: Container(
          margin: EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  "通行止のお知らせ\n29日 午後4時18分より国道40号ばばばばばばえおうぃおい～べべべべべべべべべえべえええべえべべべえ(9.9km)で通行止を実施しています",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0
                  )
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}