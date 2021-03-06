import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vdesk/page/auth_page.dart';
import 'package:vdesk/provider/email_sign_in.dart';
import 'package:vdesk/provider/google_sign_in.dart';
import 'package:vdesk/widget/background_painter.dart';
import 'package:vdesk/widget/logged_in_widget.dart';
import 'package:vdesk/widget/sign_up_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final provider = Provider.of<GoogleSignInProvider>(context);

        if (provider.isSigningIn) {
          return buildLoading();
        } else if (snapshot.hasData) { 
          return LoggedInWidget();
        } else {
          return SignUpWidget();
        }
      },
    ),
  );

  Widget buildLoading() => Stack(
   // fit: StackFit.expand,
    children: [
      //CustomPaint(painter: BackgroundPainter()),
      Center(child: CircularProgressIndicator()),
    ],
  );
}
