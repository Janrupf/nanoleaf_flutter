import 'package:flutter/material.dart';
import 'package:nanoleaf_flutter/main_view.dart';
import 'package:nanoleaf_flutter/models/application_theme.dart';
import 'package:nanoleaf_flutter/nanoleaf/device/paired_device.dart';
import 'package:nanoleaf_flutter/nanoleaf/device_manager.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/api_controller.dart';
import 'package:nanoleaf_flutter/util/config.dart';
import 'package:nanoleaf_flutter/util/list_change_notifier.dart';
import 'package:nanoleaf_flutter/views/add.dart';
import 'package:nanoleaf_flutter/views/discovered_devices.dart';
import 'package:nanoleaf_flutter/views/edit_device.dart';
import 'package:provider/provider.dart';

/// Application entry point, sets up the environment and launches the application.
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ApplicationTheme(),
      ),
      Provider<ApplicationConfig>(create: (_) => ApplicationConfig()),
      ProxyProvider<ApplicationConfig, DeviceManager>(
          update: (context, config, _) => DeviceManager(config),
          dispose: (context, manager) => manager.dispose()),
      ChangeNotifierProvider<ListChangeNotifier<PairedDevice>>(
          create: (context) =>
              Provider.of<DeviceManager>(context, listen: false)
                  .pairedDevices()),
      Provider<ApiController>(create: (_) => ApiController())
    ],
    child: NanoleafApp(),
  ));
}

/// Main app widget, wrapping the theme consumer.
class NanoleafApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Consumer<ApplicationTheme>(
      builder: (context, theme, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: {
            "/": (context) => MainView(),
            "/discovered-devices": (context) => DiscoveredDevicesView(),
            "/add-device": (context) => AddDeviceView(),
            "/edit-device": (context) => EditDeviceView()
          },
          title: "Nanoleaf control",
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: theme.currentTheme()));
}
