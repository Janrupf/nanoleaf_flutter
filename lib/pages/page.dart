import 'package:flutter/material.dart';

/// Base class for all pages displayed in the main view.
abstract class ApplicationPage extends StatelessWidget {
  /// The name of the page displayed in the sidebar.
  String get title;

  /// The icon of the page displayed in the sidebar.
  Icon get icon;

  /// Builds the floating action button for the page, or null, if none.
  FloatingActionButton? buildActionButton(BuildContext context) => null;

  /// Determines whether the sidebar of the application should be displayed
  /// while the page is active.
  bool enableSidebar() => true;
}
