import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/controller/controller.auth.dart';
import 'package:flutter_application_1/auth/dao/auth.dao.dart';
import 'package:flutter_application_1/auth/dto/login.dto.dart';
import 'package:flutter_application_1/auth/dto/register.dto.dart';
import 'package:flutter_application_1/common/all_strings.dart';
import 'package:flutter_application_1/common/widgets/widgets.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => RegisterState();

  static RegisterState? of(BuildContext context) =>
      context.findAncestorStateOfType<RegisterState>();
}

class RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String _phoneNumberCode = '';
  String _phoneNumber = '';
  String _password = '';
  String _business = '';
  String _fullName = '';
  String _email = '';
  String _howHear = AllStrings.hearFromUs;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
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
                iconSize: 35.0,
                onPressed: () => Get.back(),
              ),
              const VerticalSpacing(height: 30.0),
              Text(AllStrings.register,
                  style: Theme.of(context).textTheme.headline3),
              const VerticalSpacing(height: 10.0),
              Text(AllStrings.registerSubtitle,
                  style: Theme.of(context).textTheme.bodyText1),
              const VerticalSpacing(height: 30.0),
              Form(
                autovalidateMode: AutovalidateMode.disabled,
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (newValue) => _business = newValue!,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "please enter some text";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: AllStrings.businessName,
                      ),
                    ),
                    const VerticalSpacing(height: 24),
                    TextFormField(
                      onSaved: (newValue) => _fullName = newValue!,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "please enter some text";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: AllStrings.fullName,
                      ),
                    ),
                    const VerticalSpacing(height: 24),
                    TextFormField(
                      onSaved: (newValue) => _email = newValue!,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "please enter some text";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: AllStrings.emailAddress,
                      ),
                    ),
                    const VerticalSpacing(height: 24),
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
                        hintText: AllStrings.createPassword,
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      ),
                    ),
                    const VerticalSpacing(height: 24),
                    DropdownButtonFormField<String>(
                      value: _howHear,
                      onSaved: (newValue) => _howHear = newValue!,
                      onChanged: (String? newValue) {
                        setState(() {
                          _howHear = newValue!;
                        });
                      },
                      items: <String>[
                        AllStrings.hearFromUs,
                        'Facebook',
                        'Linkdin',
                        'Indeed'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    const VerticalSpacing(height: 24),
                  Obx(() =>  authController.loading.value 
                        ? const CircularProgressIndicator.adaptive()
                        : ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                authController.setLoading(true);
                                AuthDto().registerUser(
                                  registerAuth: RegisterAuth(
                                      businessName: _business,
                                      fullName: _fullName,
                                      emailAddress: _email,
                                      phoneNumber: _phoneNumber,
                                      password: _password,
                                      hearFromUs: _howHear),
                                );
                              }
                            },
                            child: Text(
                              AllStrings.createPassword,
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),)
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
