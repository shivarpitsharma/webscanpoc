import 'package:flutter/material.dart';
import 'package:webscanpoc/presentation/api_service.dart';
import 'package:webscanpoc/presentation/datasource/driver_model.dart';
import 'package:webscanpoc/presentation/widget/add_driver_form_widget.dart';
import 'package:webscanpoc/presentation/widget/driver_item_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Driver List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Drivers'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  var apiService = ApiService();
  String? query;
  var searchController = SearchController();

  void _onSearchSubmitted(String? value) {
    setState(() {
      query = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                SizedBox(
                    height: 28,
                    width: 28,
                    child: Image.asset('assets/wheelseye_logo.png')),
                const SizedBox(width: 8),
                Text(widget.title),
              ],
            )),
      ),
      body: Container(
        color: Colors.grey,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 40,
              color: Colors.white,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddDriverFormWidget()),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 24),
                      color: Colors.deepPurple,
                      height: 32,
                      width: 120,
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                              style: TextStyle(color: Colors.white),
                              "Add Driver")),
                    ),
                  ),
                  const SizedBox(
                    width: 400,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        width: 300,
                        child: SearchBar(
                          controller: searchController,
                          hintText: "Search By Name/Number",
                          leading: Icon(Icons.search),
                          onSubmitted: _onSearchSubmitted,
                        ),
                      ),
                      if(query?.isNotEmpty == true)...[
                      ElevatedButton(
                          onPressed: (){
                            searchController.clear();
                        setState(() {
                          query = null;
                        });
                      }, child: Row(
                          children:[
                            Icon(Icons.cancel),
                            Text("Clear")
                          ]))]
                    ],
                  )
                ],
              ),
            ),
            FutureBuilder<DriverModel>(
              future: apiService.fetchDriverData(query),
              builder: (context, snapshot) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data?.driverData?.driverItem?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return DriverItemWidget(
                            driverItemData:
                                snapshot.data?.driverData?.driverItem![index]);
                      }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
