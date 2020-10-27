import 'package:estados_cidades_flutter/list_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: ListPage()),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MaterialApp(
//     home: App(),
//   ));
// }

// class App extends StatefulWidget {
//   @override
//   _AppState createState() => _AppState();
// }

// class _AppState extends State<App> {
//   //country
//   List country_data = List();

//   String countryid; //default id for the dropdown
//   //its null for me you can copy an id from api and place here it will be seen....
//   Future<String> country() async {
//     var res = await http.get(
//         Uri.encodeFull(
//             "https://horadedoar.back4app.io/classes/Estadoscidadesbrasil_StateProvince/"),
//         headers: {
//           "Accept": "application/json",
//           'X-Parse-Application-Id': 'V9Mm0H33vvKLM5kpE7UpHKYmMRsdbvgRF1n8dwOh',
//           'X-Parse-REST-API-Key': 'KbkBxE4oPe67jbLw1wHl9yCEtYJqF8AP1RMOD59q'
//         }); //if you have any auth key place here...properly..
//     var resBody = json.decode(res.body);

//     setState(() {
//       country_data = resBody['results'];
//     });

//     return "Sucess";
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     this.country();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Dropdown #API"),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//       ),
//       body: Container(
//         padding: EdgeInsets.all(15.0), //some padding
//         child: Column(
//           children: <Widget>[
//             DecoratedBox(
//               decoration: BoxDecoration(
//                   border: new Border.all(color: Colors.black),
//                   borderRadius: BorderRadius.circular(5.0)),
//               child: Padding(
//                 padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
//                 child: Stack(
//                   children: <Widget>[
//                     Container(
//                       child: DropdownButtonFormField(
//                         items: country_data.map((item) {
//                           return new DropdownMenuItem(
//                             child: new Text(
//                               item[
//                                   'name'], //Names that the api dropdown contains
//                               style: TextStyle(
//                                 fontSize: 13.0,
//                               ),
//                             ),
//                             value: item['objectId'].toString(),
//                           );
//                         }).toList(),
//                         onChanged: (String newVal) {
//                           setState(() {
//                             print(newVal);
//                             countryid = newVal;
//                           });
//                         },
//                         value: countryid,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
