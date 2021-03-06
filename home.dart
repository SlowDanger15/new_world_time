import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;
    print(data);

    String bgImage = data['isDayTime']?'day.png':'night.png';
    return Scaffold(
      body: Container(
        decoration:BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0,120.0,0.0,0.0),
          child: SafeArea(
              child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/Location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location' : result['location'],
                        'flag' : result['flag'],
                        'isDayTime' : result['isDayTime'],
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Edit Location'),
                  color: Colors.yellowAccent,
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black
                      ),
                  )
                ],
              ),
              SizedBox(height: 20.0,),
              Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 60.0,
                  ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
