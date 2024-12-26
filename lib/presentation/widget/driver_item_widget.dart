import 'package:flutter/material.dart';
import 'package:webscanpoc/presentation/datasource/driver_model.dart';

class DriverItemWidget extends StatefulWidget {
  const DriverItemWidget({super.key,  this.driverItemData});

  final DriverItem? driverItemData;

  @override
  State<DriverItemWidget> createState() => DriverItemWidgetState();
}

class DriverItemWidgetState extends State<DriverItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(4), child:Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero,),
      elevation: 0,
      color: Colors.white,
      child: Padding(padding: const EdgeInsets.all(24),child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Driver Phone Number -> ${widget.driverItemData?.driverPhoneNumber}'),
          const SizedBox(height: 4),
          Text('Driver Name -> ${widget.driverItemData?.driverName}'),
        ],
      )),
    ));
  }
}
