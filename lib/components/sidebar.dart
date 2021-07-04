import 'package:flutter/material.dart';
import 'package:nanoleaf_flutter/pages/devices.dart';
import 'package:nanoleaf_flutter/pages/page.dart';
import 'package:nanoleaf_flutter/pages/settings.dart';

/// Sidebar navigation implementation
class Sidebar extends StatefulWidget {
  final ValueChanged<ApplicationPage> pageChanged;

  /// Constructs the sidebar with [pageChanged] for listening
  /// to page changes.
  Sidebar({Key? key, required this.pageChanged}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SidebarState(pageChanged);
}

/// State of the sidebar, used for changing the index.
class _SidebarState extends State<Sidebar> {
  final List<ApplicationPage> pages = [DevicesPage(), SettingsPage()];
  final ValueChanged<ApplicationPage> pageChanged;

  /// Constructs the sidebar state with [pageChanged] for listening
  /// to page changes.
  _SidebarState(this.pageChanged);

  int _currentDestinationIndex = 0;

  @override
  Widget build(BuildContext context) => NavigationRail(
      selectedIndex: _currentDestinationIndex,
      onDestinationSelected: (newIndex) {
        setState(() {
          _currentDestinationIndex = newIndex;
        });

        pageChanged(pages[_currentDestinationIndex]);
      },
      labelType: NavigationRailLabelType.all,
      destinations: pages
          .map((page) =>
              // Convert page objects to navigation rail targets
              NavigationRailDestination(
                  icon: page.icon, label: Text(page.title)))
          .toList(growable: false));
}
