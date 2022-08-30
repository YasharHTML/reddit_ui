import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit_ui/api/auth/login/login.dart';
import 'package:reddit_ui/providers/login_provider.dart';
import 'package:reddit_ui/responses/login_response.dart';
import 'package:reddit_ui/validators/login_validator.dart';
import 'package:reddit_ui/widgets/custom_hotass_button.dart';
import 'package:reddit_ui/widgets/custom_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: _usernameController,
              validator: (String value) =>
                  LoginValidators.emailValidator(value),
            ),
            CustomTextFormField(
              controller: _passwordController,
              validator: (String value) =>
                  LoginValidators.passwordValidator(value),
            ),
            CustomButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  Login login = Login();
                  LoginResponse loginResponse = await login.login(
                    _usernameController.text,
                    _passwordController.text,
                  );

                  if (loginResponse.status == "success") {
                    SharedPreferences pf =
                        await SharedPreferences.getInstance();
                    pf.setBool("hasLoggedIn", true).then((value) => Provider.of<LoginProvider>(context, listen: false).setLoginStatus(true));
                  }
                }
              },
              text: "Spank me daddy",
            ),
          ],
        ),
      ),
    );
  }
}
