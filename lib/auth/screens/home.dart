import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/controller/controller.auth.dart';
import 'package:flutter_application_1/auth/screens/auth/login.auth.screen.dart';
import 'package:flutter_application_1/auth/screens/auth/register.auth.screen.dart';
import 'package:flutter_application_1/common/all_strings.dart';
import 'package:flutter_application_1/common/colors.dart';
import 'package:flutter_application_1/common/theme.dart';
import 'package:flutter_application_1/common/widgets/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:get/instance_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalSpacing(
              height: 40,
            ),
            Text(
              AllStrings.homePageTitle,
              style:
                  Theme.of(context).textTheme.headline3?.copyWith(fontSize: 24),
            ),
            const VerticalSpacing(height: 40),
            Image.asset("assets/images/Rectangle12.png"),
            const VerticalSpacing(height: 11.0),
            Center(
              child: Text(
                AllStrings.homePageSubTitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: ColorsDefault.blue, fontSize: 11.0),
              ),
            ),
            const VerticalSpacing(height: 70.0),
            ElevatedButton(
              onPressed: () => Get.to(() => const Login()),
              child: const Text(AllStrings.existingUser),
            ),
            const VerticalSpacing(height: 25.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  side:
                      const BorderSide(color: ColorsDefault.blue, width: 2.0)),
              onPressed: () => Get.to(() => const Register()),
              child: Text(
                AllStrings.newUser,
                style: theme.textTheme.button?.copyWith(color: Colors.black),
              ),
            ),
            const VerticalSpacing(height: 20.0),
            Row(
              children: const [
                Expanded(
                  child: Divider(thickness: 2.0),
                ),
                HorizontalSpace(
                  width: 8,
                ),
                Text(AllStrings.signUpWith),
                HorizontalSpace(
                  width: 8,
                ),
                Expanded(
                  child: Divider(thickness: 2.0),
                ),
              ],
            ),
            const VerticalSpacing(height: 19.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/image1.png", width: 30.0),
                const HorizontalSpace(width: 30.0),
                Image.asset("assets/images/image2.png", width: 30.0),
                const HorizontalSpace(width: 30.0),
                Image.asset("assets/images/image3.png", width: 30.0),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
