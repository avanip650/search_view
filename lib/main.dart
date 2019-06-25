import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search App'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){showSearch(context: context, delegate: DataSearch());}
          )
        ],
      ),
      drawer: Drawer(),
    );
  }
}

class DataSearch extends SearchDelegate<String>{

  final cities = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Orissa",
    "Punjab",
    "Pondicherry",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal"
  ];

  final recentCities = [
    "Gujarat",
    "Punjab",
    "Madhya Pradesh",
    "Maharashtra"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
  //actions for app bar
    return [IconButton(icon: Icon(Icons.clear), onPressed: (){
      query = "";
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of appbar
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: transitionAnimation),
        onPressed: (){close(context,null);});
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some reslutes based on the selection
    return Center(
      child: Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone serachess for something
    final sugessionList = query.isEmpty?recentCities:cities.where((p)=>p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context,index) => ListTile(
        onTap: (){
          showResults(context);
        },
      leading: Icon(Icons.location_city),
      title: RichText(text: TextSpan(
        text: sugessionList[index].substring(0,query.length),
        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        children: [
          TextSpan(text: sugessionList[index].substring(query.length),
            style: TextStyle(color: Colors.grey))
        ]),
      ),
    ),itemCount: sugessionList.length,);
  }

}
