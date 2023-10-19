import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flix_pedia/view/widgets/auth_screens/alternate_auth_question.dart';
import 'package:flix_pedia/view/widgets/auth_screens/auth_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../model/auth_user.dart';
import '../../routes/app_routes.dart';
import '../../user_auth/authentication_factory.dart';
import '../../user_auth/strategy/authentication_strategy.dart';
import '../../observers/error_observer.dart';
import '../../model/auth_result.dart';
import '../../utils/constants/spacing_constants.dart';
import '../../utils/resizer/fetch_pixels.dart';
import '../../utils/widget_utils.dart';
import '../widgets/commons/purple_bg_button_large.dart';
import '../widgets/auth_screens/error_text_widget.dart';
import '../widgets/auth_screens/text_input_fields_widgets.dart';

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

  Future<void> loginUser() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    errorObserver.setError('');

    authStrategy = strategyFactory.createEmailPasswordAuthenticationStrategy('x', email,password);

    checkAuth();
  }

  Future<void> googleAuth()async {
    errorObserver.setError('');

    authStrategy = strategyFactory.createGoogleSignInAuthenticationStrategy();

    checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
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
        padding:EdgeInsets.symmetric(
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
                    'Welcome Back!',
                    style: Theme.of(context).textTheme.titleMedium
                ),
                TextInputFiledsWidget(emailController: emailController, passwordController: passwordController),
                ErrorTextWidget(errorMsg: errorObserver.getError()),
                SizedBox(
                  height: FetchPixels.getPixelHeight(kPadding),
                ),
                PurpleBackgroundButtonLarge(
                  text: 'Login',
                  onTap: () async {
                    loginUser();
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
                  text1: 'Not A Member Yet?',
                  text2: 'Register',
                  onTap: (){
                    Constant.backToFinish(context);
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