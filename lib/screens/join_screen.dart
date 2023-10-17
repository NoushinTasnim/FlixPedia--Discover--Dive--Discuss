import 'package:flix_pedia/screens/home_screen.dart';
import 'package:flix_pedia/screens/sign_in_screen.dart';
import 'package:flix_pedia/utils/constants.dart';
import 'package:flix_pedia/widgets/auth_screens/alternate_auth_question.dart';
import 'package:flix_pedia/widgets/auth_screens/auth_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../user_auth/authentication_factory.dart';
import '../user_auth/authentication_strategy.dart';
import '../user_auth/error_observer.dart';
import '../user_auth/auth_result.dart';
import '../widgets/Commons/purple_bg_button_large.dart';
import '../widgets/auth_screens/error_text_widget.dart';
import '../widgets/auth_screens/text_input_fields_widgets.dart';

class JoinScreen extends StatefulWidget {

  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final AuthenticationStrategyFactory strategyFactory = AuthenticationStrategyFactory();
  late AuthenticationStrategy authStrategy;
  late ErrorObserver errorObserver;

  String errorMsg = '';

  @override
  void initState() {
    super.initState();
    errorObserver = ErrorObserver();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).canvasColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(kPadding*2),
        decoration:kBoxBackgroundDecoration,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Let\'s Get\nStarted!',
                    style: Theme.of(context).textTheme.titleMedium
                ),
                TextInputFiledsWidget(emailController: emailController, passwordController: passwordController),
                ErrorTextWidget(errorMsg: errorObserver.getError()),
                SizedBox(
                  height: kPadding,
                ),
                PurpleBackgroundButtonLarge(
                  text: 'Create Account',
                  onTap: () async {
                      String email = emailController.text.trim();
                      String password = passwordController.text.trim();

                      authStrategy = strategyFactory.createEmailPasswordAuthenticationStrategy(email,password);

                      errorObserver.setError('');

                      AuthResult result = await authStrategy.signUp(email, password);

                      if (result.user != null) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return MainScreen();
                        }));
                      } else {
                        setState(() {
                          errorObserver.setError(result.errorMessage!);
                        });
                      }
                  },
                ),
                SizedBox(
                  height: kPadding*2,
                ),
                AuthDividerWidget(),
                SizedBox(
                  height: kPadding,
                ),
                Center(
                  child: InkWell(
                    onTap: () async {
                      errorObserver.setError('');

                      authStrategy = strategyFactory.createGoogleSignInAuthenticationStrategy();

                      AuthResult result = await authStrategy.signIn();

                      if (result.user != null) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return MainScreen();
                        }));
                      } else {
                        setState(() {
                          errorObserver.setError(result.errorMessage!);
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(kPadding),
                      decoration: kBoxDecorationWhiteBackground,
                      child: SvgPicture.asset(
                        'assets/icons/google.svg',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: kPadding,
                ),
                AlternateAuthWidget(
                  text1: 'Already A Member?',
                  text2: 'Login',
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}