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
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
                    'Welcome Back!',
                    style: Theme.of(context).textTheme.titleMedium
                ),
                TextInputFiledsWidget(emailController: emailController, passwordController: passwordController),
                ErrorTextWidget(errorMsg: errorObserver.getError()),
                SizedBox(
                  height: kPadding,
                ),
                PurpleBackgroundButtonLarge(
                  text: 'Login',
                  onTap: () async {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();

                    authStrategy = strategyFactory.createEmailPasswordAuthenticationStrategy(email,password);

                    errorObserver.setError('');

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
                ),
                SizedBox(
                  height: kPadding*2,
                ),
                AuthDividerWidget(),
                SizedBox(
                  height: kPadding,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(kPadding),
                    decoration: kBoxDecorationWhiteBackground,
                    child: SvgPicture.asset(
                      'assets/icons/google.svg',
                    ),
                  ),
                ),
                SizedBox(
                  height: kPadding,
                ),
                AlternateAuthWidget(
                  text1: 'Not A Member Yet?',
                  text2: 'Register',
                  onTap: (){
                    Navigator.pop(context);
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