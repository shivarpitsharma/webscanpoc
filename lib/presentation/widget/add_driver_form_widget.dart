import 'package:flutter/material.dart';
import 'package:webscanpoc/presentation/api_service.dart';
import 'package:webscanpoc/presentation/datasource/driver_model.dart';

class AddDriverFormWidget extends StatefulWidget {
  const AddDriverFormWidget({super.key});

  @override
  State<AddDriverFormWidget> createState() => AddDriverFormWidgetState();
}

class AddDriverFormWidgetState extends State<AddDriverFormWidget> {
  var driverNameTextController = TextEditingController();
  var driverPhoneTextController = TextEditingController();
  var licenceTextController = TextEditingController();

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
                const Text("Add Driver"),
              ],
            )),
      ),
      body: Stack(children: [
        // Image.asset('assets/heavy_image.png'),
        Column(
          children: [
            const Text("Driver Name"),
            Container(
              margin: EdgeInsets.only(left: 24),
              width: 400,
              child: TextFormField(
                controller: driverNameTextController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter driver name';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 8),
            const Text("Driver phone number"),
            Container(
              margin: EdgeInsets.only(left: 24),
              width: 400,
              child: TextFormField(
                controller: driverPhoneTextController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 8),
            const Text("Licence Number"),
            Container(
              margin: EdgeInsets.only(left: 24),
              width: 400,
              child: TextFormField(
                controller: licenceTextController,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                ElevatedButton(
                    onPressed: () async {
                      DriverModel driver = await ApiService().addDriver(
                          driverNameTextController.text,
                          driverPhoneTextController.text,
                          licenceTextController.text);
                      if (driver.isSuccess == true) {
                        Navigator.pop(context, true);
                      }
                      // save details of driver
                    },
                    child: Text("Save"))
              ],
            )
          ],
        ),
      ]),
    );
  }
}
