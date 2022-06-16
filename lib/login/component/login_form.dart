import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teleheal_apps/component/button_login.dart';
import 'package:teleheal_apps/component/error_form.dart';
import 'package:teleheal_apps/main_page/main_page.dart';
import 'package:teleheal_apps/theme/constants.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  bool passwordVisible = true;
  late SharedPreferences loginData;
  bool isLoading = false;
  bool? remember = false;
  bool emailError = false;
  bool passwordError = false;
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget> [
          TextFormField(
            controller: _emailTextController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              fontSize: 14
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  emailError = false;
                });
              }
              return;
            },
            validator: (value) {
              String pattern =
                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                r"{0,253}[a-zA-Z0-9])?)*$";
              RegExp regex = RegExp(pattern);
              if (value == null || value.isEmpty || !regex.hasMatch(value)) {
                setState(() {
                  emailError = true;
                });
              }
            },
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: const TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(217, 217, 217, 1)
              ),
              filled: true,
              fillColor: colorCardItem,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.transparent),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.transparent),
                gapPadding: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.transparent),
                gapPadding: 10,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(
                  10,
                  20,
                  0,
                  20
                ),
                child: SvgPicture.asset("assets/icons/briefcase.svg",
                  height: 20,
                ),
              ),
            ),
          ),
          Visibility(
            visible: emailError,
            child: Column(
              children: const <Widget>[
                SizedBox(height: 5),
                FormErrors(errors: kEmailError),
              ],
            )
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _passwordTextController,
            keyboardType: TextInputType.text,
            style: const TextStyle(
              fontSize: 14
            ),
            obscureText: passwordVisible,
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  passwordError = false;
                });
              }
              return; 
            },
            validator: (value) {
              if (value!.isEmpty) {
                setState(() {
                  passwordError = true;
                });
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: const TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(217, 217, 217, 1)
              ),
              filled: true,
              fillColor: colorCardItem,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.transparent),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.transparent),
                gapPadding: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.transparent),
                gapPadding: 10,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(
                  10,
                  20,
                  0,
                  20
                ),
                child: SvgPicture.asset("assets/icons/locked.svg",
                  height: 20,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      passwordVisible =! passwordVisible;
                    });
                  },
                  icon: SvgPicture.asset(
                    (passwordVisible) ? "assets/icons/eye.svg" : "assets/icons/eye_hide.svg",
                    height: 20,
                    color: (passwordVisible) ? const Color.fromRGBO(217, 217, 217, 1) : Colors.green,
                  ),
                ),
              )
            ),
          ),
          Visibility(
            visible: passwordError,
            child: Column(
              children: const <Widget>[
                SizedBox(height: 5),
                FormErrors(errors: kPassNullError),
                SizedBox(height: 8),
              ],
            )
          ),
          Row(
            children: <Widget> [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              const Text("Remember Me"),
            ],
          ),
          ButtonLogin(
            onClicked: () async {
              if (_formKey.currentState!.validate()) {
                if (_emailTextController.text != "" && _passwordTextController.text != "") {
                  setState(() {
                    isLoading = true;
                  });
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (_) {
                      return Dialog(
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 15,
                              ),
                              Text('Loading...')
                            ],
                          ),
                        ),
                      );
                    }
                  );
                  await Future.delayed(const Duration(seconds: 2));
                  if (_emailTextController.text == "user@gmail.com" && _passwordTextController.text == "123456") {
                    await Future.delayed(const Duration(milliseconds: 1000));
                    Navigator.of(context).pop();
                    Get.offAll(const MainPage());
                  } else {
                    Navigator.of(context).pop();
                    Get.snackbar(
                      "Login Gagal",
                      "email atau Password Salah",
                      snackPosition: SnackPosition.BOTTOM,
                      animationDuration: const Duration(milliseconds: 400),
                      duration: const Duration(milliseconds: 1500),
                      padding: const EdgeInsets.all(20)
                    );
                    setState(() {
                      isLoading = false;
                    });
                  }
                }
              }
            },
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }
}