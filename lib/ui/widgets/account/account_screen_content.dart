import 'package:flutter/material.dart';
import 'package:mooncake/ui/ui.dart';

/// Represents the widget inside which all the users' account data
/// are displayed.
class AccountScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            PostsLocalizations.of(context).accountPageTitle,
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          Image.asset("assets/images/wink.png", width: 150),
          Text(
            PostsLocalizations.of(context)
                .accountPageText
                .replaceAll("\n", " "),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}