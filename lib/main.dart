import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Portfolio(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: Center(
        child: myProfile(),
      ),
    );
  }

  Widget myProfile() {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Header(),
          NameText(),
          ProfessionalTitle(),
          Line(Colors.black),
          Line(Colors.teal.shade100),
          Line(Colors.teal.shade100),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                CardEmail(),
                CardSocial('assets/icons/linkedin.png', 15.0,
                    'https://www.linkedin.com/in/cengizakarsu/'),
                CardSocial('assets/icons/github.png', 16.0,
                    'https://github.com/cngzkrs'),
                CardSocial('assets/icons/hackerRank.png', 16.0,
                    'https://hackerrank.com/ycakarsu'),
                CardSocial('assets/icons/leetcode.png', 16.0,
                    'https://leetcode.com/cngzkrs/'),
                CardSocial('assets/icons/twitter.png', 16.0,
                    'https://twitter.com/home'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Text NameText() {
    return new Text(
      'Yılmaz Cengiz Akarsu',
      style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: 'Pacifico'),
    );
  }

  Text ProfessionalTitle() {
    return new Text(
      'SR. SOFTWARE DEVELOPMENT ENGINEER',
      style: TextStyle(
          color: Colors.teal.shade100,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          wordSpacing: 2.5,
          fontFamily: 'Source Sans Pro'),
    );
  }

  SizedBox Line(Color color)
  {
    return SizedBox(
      height: 20.0,
      width: 160.0,
      child: Divider(
        color: color,
      ),
    );
  }

  Widget Header() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
        width: 170.0,
        height: 90.0,
        decoration: new BoxDecoration(
          color: const Color(0xff7c94b6),
          image: new DecorationImage(
            image: new AssetImage('assets/images/yca.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
          border: new Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  Widget CardEmail() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: ListTile(
        leading: Icon(
          Icons.mail,
          color: Colors.black,
        ),
        onTap: () => _contact('ycakarsu@gmail.com'),
        title: Text(
          'ycakarsu@gmail.com',
          style: TextStyle(
              fontFamily: 'Source Sans Pro',
              fontSize: 16.0,
              color: Colors.black),
        ),
      ),
    );
  }

  Widget CardSocial(String imagePath, double fs, String socialUrl) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Image(image: AssetImage(imagePath)),
            title: Text(
              socialUrl,
              style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: fs,
                  color: Colors.black),
            ),
            onTap: () => _launchURL(socialUrl),
          ),
//        ButtonBar(
//          children: <Widget>[
//            FlatButton(
//              child: const Text('Go to Web Page'),
//              onPressed: () { _launchURL('https://www.linkedin.com/in/cengizakarsu/'); },
//            ),
//          ],
//        ),
        ],
      ),
    );
  }

  _launchURL(linkUrl) async {
    String url = linkUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _contact(String mail) async {
    final url = 'mailto:${mail}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
