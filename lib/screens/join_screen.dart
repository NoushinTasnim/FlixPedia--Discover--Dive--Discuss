import 'package:flix_pedia/constants.dart';
import 'package:flutter/material.dart';

class JoinScreen extends StatelessWidget {
  const JoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(kPadding),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/join_screen_bg.png'),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Image(
                image: AssetImage('assets/images/movie.png'),
              ),
            ),
            SizedBox(
              height: kPadding,
            ),
            Text(
              'Discover',
              style: Theme.of(context).textTheme.titleMedium
            ),
            Text(
                'New Movies',
                style: Theme.of(context).textTheme.titleMedium
            ),
            SizedBox(
              height: kPadding,
            ),
            Text(
                'Explore all the most exciting movies \nbased on your interests and talk about them',
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
            ),
            SizedBox(
              height: kPadding*4,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: kPadding/2,
                horizontal: kPadding*2,
              ),
              decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(kPadding),
                border: Border.all(
                    color: kSecondaryColor,
                    strokeAlign: BorderSide.strokeAlignInside
                ),
              ),
              child: Text(
                'Let\'s Go',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
