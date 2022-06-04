import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/controller/controller.auth.dart';
import 'package:flutter_application_1/auth/dao/auth.dao.dart';
import 'package:flutter_application_1/auth/dto/login.dto.dart';
import 'package:flutter_application_1/common/all_strings.dart';
import 'package:flutter_application_1/common/widgets/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();

  static LoginState? of(BuildContext context) =>
      context.findAncestorStateOfType<LoginState>();
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String _phoneNumberCode = '';
  String _phoneNumber = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const VerticalSpacing(
                height: 45.0,
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Get.back(),
                iconSize: 35.0,
              ),
              const VerticalSpacing(height: 50.0),
              Text(AllStrings.enterPhoneNumber,
                  style: Theme.of(context).textTheme.headline3),
              const VerticalSpacing(height: 10.0),
              Text(AllStrings.loginScreenDetail,
                  style: Theme.of(context).textTheme.bodyText1),
              const VerticalSpacing(height: 30.0),
              Form(
                autovalidateMode: AutovalidateMode.disabled,
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        CountryPicker(
                          callback: (val) =>
                              setState(() => _phoneNumberCode = val),
                        ),
                        const HorizontalSpace(),
                        Expanded(
                          child: TextFormField(
                            onSaved: (newValue) =>
                                _phoneNumber = "$_phoneNumberCode$newValue",
                            validator: (value) {
                              if (value != null && value.length < 5) {
                                return "phone number too short";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: AllStrings.phoneNumber),
                          ),
                        ),
                      ],
                    ),
                    const VerticalSpacing(height: 24),
                    TextFormField(
                      onSaved: (newValue) => _password = newValue!,
                      validator: (value) {
                        if (value != null && value.length < 5) {
                          return "Password is too small";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: AllStrings.enterPassWord,
                      ),
                    ),
                    const VerticalSpacing(height: 50),
                    Obx(
                      () => authController.loading.value
                          ? const CircularProgressIndicator.adaptive()
                          : ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  authController.setLoading(true);
                                  _formKey.currentState!.save();
                                  AuthDto().loginUser(
                                      loginAuth:
                                          LoginAuth(_phoneNumber, _password));
                                }
                              },
                              child: Text(
                                AllStrings.login,
                                style: Theme.of(context).textTheme.button,
                              )),
                    ),
                  ],
                ),
              ),
              const VerticalSpacing(height: 40),
              Center(
                child: Text(
                  AllStrings.forgotPassword,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const VerticalSpacing(height: 45.0),
              Center(child: Image.asset("assets/images/image6.png"))
            ]),
          ),
        ),
      ),
    );
  }
}
