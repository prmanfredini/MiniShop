
import 'package:flutter/material.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';


class Home extends StatefulWidget {
  String? dropdownValue;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  var label = 'Home';
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      extendBody: true,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBarBuilder(label, _key),
      drawer: DrawerBuilder(context),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: const [
            Card(child: Padding(
              padding: EdgeInsets.all(50.0),
              child: Text('Dados'),
            ),),
            Card(child: Padding(
              padding: EdgeInsets.all(50.0),
              child: Text('Gráficos'),
            ),),
            Card(child: Padding(
              padding: EdgeInsets.all(50.0),
              child: Text('Mapas'),
            ),),
            Card(child: Padding(
              padding: EdgeInsets.all(50.0),
              child: Text('Mais Dados'),
            ),),
          ],
        ),
      ),
    );
  }



}
