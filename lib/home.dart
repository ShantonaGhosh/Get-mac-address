import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';


import 'package:platform_device_id/platform_device_id.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  
  @override
  State<Home> createState() => _HomeState();
}
  
class _HomeState extends State<Home> {
 // String _deviceMAC = 'Click the button.';
 
  // Future<void> initMacAddress() async {
  //   String macAddress;
  
  //   try {
  //     macAddress = await GetMac.macAddress;
  //   } on PlatformException {
  //     macAddress = 'Error getting the MAC address.';
  //   }
  
  //   setState(() {
  //     _deviceMAC = macAddress;
  //   });
  // }


  String mac = 'none';
  Future deviceId() async {
    setState(() async {
      mac = await PlatformDeviceId.getDeviceId ?? 'None';
    });
  }

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      deviceId();
    });
    super.initState();
  }
  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MAC address of a device'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
             mac,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
              deviceId();
                //print(deviceId.toString());
              },
              child: const Text("Get MAC Address"),
            ),
          ],
        ),
      ),
    );
  }
}