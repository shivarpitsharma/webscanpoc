class DriverModel {
  final bool? isSuccess;
  final DriverData? driverData;

  // final String? message;
  // final String? serverTime;

  DriverModel({
    this.isSuccess,
    this.driverData,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) => DriverModel(
      isSuccess: json['success'],
      driverData:
          json['data'] != null ? DriverData.fromJson(json['data']) : null);

  Map<String, dynamic> toJson() => {'success': isSuccess, 'data': driverData};
}

class DriverData {
  final List<DriverItem?>? driverItem;

  DriverData({this.driverItem});

  factory DriverData.fromJson(Map<String, dynamic> json) => DriverData(
      driverItem: json['list'] == null
          ? []
          : List<DriverItem>.from(
              json['list']!.map((x) => DriverItem.fromJson(x))));

  Map<String, dynamic> toJson() => {
        'list': driverItem == null
            ? []
            : List<dynamic>.from(driverItem!.map((x) => x?.toJson())),
      };
}

class DriverItem {
  final String? driverName;
  final String? driverPhoneNumber;
  final String? licenseNumber;

  DriverItem({this.driverName, this.driverPhoneNumber, this.licenseNumber});

  factory DriverItem.fromJson(Map<String, dynamic> json) => DriverItem(
        driverPhoneNumber: json['phoneNumber'],
        driverName: json['driverName'],
        licenseNumber: json['license'],
      );

  Map<String, dynamic> toJson() => {
        'phoneNumber': driverPhoneNumber,
        'driverName': driverName,
        'license': licenseNumber
      };
}
