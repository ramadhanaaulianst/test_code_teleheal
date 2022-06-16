import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teleheal_apps/component/button_register.dart';
import 'package:teleheal_apps/component/error_form.dart';
import 'package:teleheal_apps/login/login.dart';
import 'package:teleheal_apps/theme/constants.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _emailTextController = TextEditingController();
  final _phoneTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  bool passwordVisible = true;
  late SharedPreferences loginData;
  bool isLoading = false;
  bool? remember = false;
  bool emailError = false;
  bool passwordError = false;
  bool phoneError = false;
  
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
            controller: _phoneTextController,
            keyboardType: TextInputType.phone,
            style: const TextStyle(
              fontSize: 14
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  phoneError = false;
                });
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty || value.length < 10 || value.length > 10) {
                setState(() {
                  phoneError = true;
                });
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Phone",
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
                child: SvgPicture.asset("assets/icons/Phone.svg",
                  height: 20,
                  color: Colors.black12,
                ),
              ),
            ),
          ),
          Visibility(
            visible: phoneError,
            child: Column(
              children: const <Widget>[
                SizedBox(height: 5),
                FormErrors(errors: kPhoneError),
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
          const SizedBox(height: 25),
          ButtonRegister(
            onClicked: () async {
              if (_formKey.currentState!.validate()) {
                if (_emailTextController.text != "" && _passwordTextController.text != "" && _phoneTextController.text != "") {
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
                  if (emailError == false && phoneError == false && passwordError == false) {
                    await Future.delayed(const Duration(milliseconds: 1000));
                    Navigator.of(context).pop();
                    Get.to(const LoginView());
                  } else {
                    Navigator.of(context).pop();
                    Get.snackbar(
                      "Register Anda Gagal",
                      "Isi Data Anda dengan Benar",
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