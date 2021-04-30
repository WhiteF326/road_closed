import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

void main () => runApp(AppBody());

class AppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "通行止のお知らせ",
      home: RoadClosed(),
    );
  }
}

class RoadClosed extends StatelessWidget{
  static String _body = "通行止のお知らせ\n29日 午後4時18分より国道40号ばばばばばばえおうぃおい～べべべべべべべべべえべえええべえべべべえ(9.9km)で通行止を実施しています\n\n詳細は北海道地区道路情報Webサイトへ";
  static var _bodyurl = Uri.encodeFull(_body);
  static var _url = "https://twitter.com/intent/tweet?text=" + _bodyurl;

  void _shareRoadClosed() async {
    await Share.share(_body);
  }

  void _tweetRoadClosed() async {
    print(canLaunch(_url));
    launch(_url);
  }

  void _versionDialog(BuildContext context) {
    var _versionAlertDialog = AlertDialog(
      title: Text("通行止めのお知らせ"),
      content: Container(
        height: 100,
        child: Column(
          children: <Widget>[
            Text("制作：白羽"),
            Text("ver 1.0.1"),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text("OK"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context){
        return _versionAlertDialog;
      }
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("通行止めのお知らせ"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.info_outline,
                size: 32.0,
              ),
              onPressed: () => _versionDialog(context),
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              Spacer(),
              Center(
                child: Text(
                    _body,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0
                    )
                ),
              ),
              Row(
                  children: <Widget>[
                    Spacer(),
                    TextButton(
                      onPressed: () => _tweetRoadClosed(),
                      child: Text("ツイート(未実装)"),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.lightBlue,
                        onSurface: Colors.lightBlueAccent,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () => _shareRoadClosed(),
                      child: Text("その他SNSにシェア"),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.lightBlue,
                        onSurface: Colors.lightBlueAccent,
                      ),
                    ),
                    Spacer(),
                  ]
              ),
              TextButton(
                onPressed: () {
                  FlutterClipboard.copy(_body).then((value) => print("コピーしました。"));
                },
                child: Text("クリップボードにコピー"),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.lightBlue,
                  onSurface: Colors.lightBlueAccent,
                ),
              ),
              Spacer(),
            ],
          ),
        )
    );
  }
}