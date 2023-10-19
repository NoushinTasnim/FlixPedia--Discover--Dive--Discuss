import 'package:flix_pedia/view/screens/home_screen.dart';
import 'package:flix_pedia/view/screens/login_screen.dart';
import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flix_pedia/utils/resizer/fetch_pixels.dart';
import 'package:flix_pedia/view/widgets/auth_screens/alternate_auth_question.dart';
import 'package:flix_pedia/view/widgets/auth_screens/auth_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../model/auth_user.dart';
import '../../routes/app_routes.dart';
import '../../user_auth/authentication_factory.dart';
import '../../user_auth/authentication_strategy.dart';
import '../../observers/error_observer.dart';
import '../../user_auth/auth_result.dart';
import '../../utils/constants/spacing_constants.dart';
import '../../utils/widget_utils.dart';
import '../widgets/commons/purple_bg_button_large.dart';
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
  TextEditingController userController = TextEditingController();

  final AuthenticationStrategyFactory strategyFactory = AuthenticationStrategyFactory();
  late AuthenticationStrategy authStrategy;
  late ErrorObserver errorObserver;

  String errorMsg = '';

  @override
  void initState() {
    super.initState();
    errorObserver = ErrorObserver();
  }

  Future<void> checkAuth() async {
    AuthResult result = await authStrategy.signUp();
    if (result.user != null) {
      var user = result.user;
      // Access the AuthUser instance using Provider.of
      AuthUser authUser = Provider.of<AuthUser>(context, listen: false);

      // Set the values in AuthUser
      authUser.setUsername(user?.displayName ?? 'User');
      authUser.setEmail(user?.email ?? 'Email');
      authUser.setPhotoUrl(user?.photoURL ?? '');
      authUser.setAuthenticationStrategy(authStrategy);
      print('email : ${authUser.username} ${authUser.email} ${authUser.photoUrl} ');
      Constant.replaceScreen(Routes.homeScreenRoute, context);
    } else {
      setState(() {
        errorObserver.setError(result.errorMessage!);
      });
    }
  }

  Future<void> googleAuth()async {
    errorObserver.setError('');

    authStrategy = strategyFactory.createGoogleSignInAuthenticationStrategy();

    checkAuth();
  }

  Future<void> joinUser()async{
    String username = userController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    authStrategy = strategyFactory.createEmailPasswordAuthenticationStrategy(username, email,password);

    checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).canvasColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: FetchPixels.getPixelWidth(kPadding*2),
          vertical: FetchPixels.getPixelHeight(kPadding*2),
        ),
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
                TextInputFiledsWidget(emailController: emailController, passwordController: passwordController, userController: userController,),
                ErrorTextWidget(errorMsg: errorObserver.getError()),
                SizedBox(
                  height: kPadding,
                ),
                PurpleBackgroundButtonLarge(
                  text: 'Create Account',
                  onTap: () async {
                      joinUser();
                  },
                ),
                SizedBox(
                  height: FetchPixels.getPixelHeight(kPadding*2),
                ),
                AuthDividerWidget(),
                SizedBox(
                  height: FetchPixels.getPixelHeight(kPadding),
                ),
                Center(
                  child: InkWell(
                    onTap: () async {
                      googleAuth();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: FetchPixels.getPixelWidth(kPadding),
                        vertical: FetchPixels.getPixelHeight(kPadding),
                      ),
                      decoration: kBoxDecorationWhiteBackground,
                      child: SvgPicture.asset(
                        'assets/icons/google.svg',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: FetchPixels.getPixelHeight(kPadding),
                ),
                AlternateAuthWidget(
                  text1: 'Already A Member?',
                  text2: 'Login',
                  onTap: (){
                    Constant.sendToNext(context, Routes.loginRoute);
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