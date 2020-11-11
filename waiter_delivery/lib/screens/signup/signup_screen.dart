import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:waiter_delivery/components/custom_text_widget.dart';
import 'package:waiter_delivery/components/errorbox_component.dart';
import 'package:waiter_delivery/components/signup/field_title_component.dart';
import 'package:waiter_delivery/screens/home_screen.dart';
import 'package:waiter_delivery/screens/login/login_screen.dart';
import 'package:waiter_delivery/stores/signup_store.dart';
import 'package:waiter_delivery/stores/user_manage_store.dart';
import 'package:waiter_delivery/util/custom_text.dart';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signupStore = SignupStore();


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reaction(
      (_) => GetIt.I<UserManageStore>().isLoggedIn,
      (user) {
        if(user){
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen())
          );
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.amber[50]
        ),
        title: CustomTextWidget(
          CustomText.signUp,
          fontSize: 25,
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Observer(
                      builder: (_) => ErrorBox(
                        message: signupStore.error
                      )
                    ),
                    FieldTitleComponent(
                      title: CustomText.username,
                      subtitle: CustomText
                          .subtitle("Your username"),
                    ),
                    Observer(
                      builder: (_) => TextField(
                        enabled: !signupStore.loading,
                        onChanged: signupStore.setName,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Example: Ronaldo N.',
                            errorText: signupStore.nameError,
                            isDense: true
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitleComponent(
                      title: CustomText.email,
                      subtitle: CustomText
                          .subtitle('A confirmation e-mail will be send'),
                    ),
                    Observer(builder: (_) => TextField(
                        enabled: !signupStore.loading,
                        onChanged: signupStore.setEmail,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Example: email@gmail.com',
                            isDense: true,
                          errorText: signupStore.emailError
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitleComponent(
                      title: CustomText.cellphone,
                      subtitle: CustomText
                          .subtitle("Protect your account"),
                    ),
                    Observer(builder: (_) => TextField(
                      enabled: !signupStore.loading,
                      onChanged: signupStore.setPhone,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '(99) 99999-9999',
                            isDense: true,
                          errorText: signupStore.phoneError
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitleComponent(
                      title: CustomText.password,
                      subtitle: CustomText
                      .subtitle(
                        'Just letters, numbers and special characters are permitted'
                      ),
                    ),
                    Observer(builder: (_) => TextField(
                        enabled: !signupStore.loading,
                        onChanged: signupStore.setFirstPassword,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                          errorText: signupStore.firstPassError
                        ),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitleComponent(
                      title: CustomText.confirmPassword,
                      subtitle: CustomText.subtitle('Write your password again'),
                    ),
                    Observer(builder: (_) => TextField(
                        enabled: !signupStore.loading,
                        onChanged: signupStore.setSecondPassword,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            errorText: signupStore.secondPassError
                        ),
                        obscureText: true,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 12),
                      height: 40,
                      child: Observer(builder: (_) => RaisedButton(
                          onPressed: signupStore.signUpPressed,
                          color: Colors.orange,
                          child: signupStore.buttonLabel,
                          textColor: Colors.white,
                          disabledColor: Colors.orange.withAlpha(120),
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                      )
                    ),
                    Divider(color: Colors.black38,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                           CustomTextWidget(
                            CustomText.accountQuestionTwo,
                            fontSize: 16,
                            color: Colors.brown
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => LoginScreen()
                                  )
                              );
                            },
                            child: CustomTextWidget(
                              CustomText.signIn,
                              fontSize: 16,
                              color: Colors.orange,
                            )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
