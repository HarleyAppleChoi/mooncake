import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mooncake/ui/ui.dart';

/// Screen that is shown to the user when he needs to log into the application.
/// From this screen, he can perform two actions in order to log in:
/// 1. Recover an existing account using a mnemonic phrase.
/// 2. Crete a new random mnemonic.
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.loginBackgroundColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icons/background_login.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: BlocBuilder<AccountBloc, AccountState>(
            builder: (BuildContext contest, AccountState state) {
              return Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              image: AssetImage('assets/images/login_logo.png'),
                              width: 75,
                            ),
                          ],
                        ),
                        if (!(state is AccountCreated)) LoginMainContent(),
                      ],
                    ),
                  ),
                  if (state is CreatingAccount)
                    LoginPopup(content: CreatingAccountPopupContent()),
                  if (state is AccountCreated)
                    LoginPopup(content: AccountCreatedPopupContent()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
