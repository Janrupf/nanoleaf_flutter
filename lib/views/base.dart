import 'package:flutter/material.dart';

/// Base class for all views (except the main view).
@immutable
class ViewBase extends StatelessWidget {
  final Widget child;

  /// Constructs the view base with the given child.
  ViewBase({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(20.0),
        child: child,
      );
}

/// Base class for all full screen views.
@immutable
class FullScreenView extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget>? actions;

  FullScreenView(
      {Key? key, required this.title, required this.child, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(title),
          actions: actions,
        ),
        body: ViewBase(
          child: child,
        ),
      );
}
