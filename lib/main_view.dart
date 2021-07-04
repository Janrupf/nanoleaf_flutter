import 'package:flutter/material.dart';
import 'package:nanoleaf_flutter/components/sidebar.dart';
import 'package:nanoleaf_flutter/pages/devices.dart';
import 'package:nanoleaf_flutter/pages/page.dart';

/// Main display for the application.
class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainViewState();
}

/// Representation of the state of the main view.
///
/// This for example holds the currently displayed page and such.
class _MainViewState extends State<MainView> {
  ApplicationPage _currentPage = DevicesPage();

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    if(_currentPage.enableSidebar()) {
      children.addAll([
        Sidebar(pageChanged: (newPage) {
          setState(() {
            _currentPage = newPage;
          });
        }),
        VerticalDivider(thickness: 1, width: 1),
      ]);
    }

    children.add(Expanded(child: _currentPage));

    return Scaffold(
        body: Row(
          children: children,
        ),
        floatingActionButton: _currentPage.buildActionButton(context),
      );
  }
}
