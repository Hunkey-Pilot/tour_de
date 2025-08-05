import 'package:flutter/material.dart';
import 'package:tour_de/app/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tour_de/features/traveller/ui/screens/traveller_tab_bar_screen.dart';
import '../../../common/widget/show_snack_bar_message.dart';
import '../../../common/widget/social_icon_button.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Enter email or User Name',
                  ),
                  validator: (String ? value){
                    String emailValue = value ?? '';
                    if(EmailValidator.validate(emailValue) == false){
                      return "Enter Valid Email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordTEController,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                  validator: (String? value){
                    if(value!.length < 8){
                      return "Password must be 8 letters";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _onTapLoginButton,
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromWidth(320),
                    backgroundColor: AppColors.themeColor,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      fontSize: 24
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        endIndent: 8,
                        height: 1,
                      ),
                    ),
                    Text("or Continue With"),
                    Expanded(child: Divider(
                      indent: 8,
                    )),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildSocialIcon(
                        icon: FontAwesomeIcons.facebook,
                        color: Colors.blue,
                        onTap: (){}
                    ),
                    const SizedBox(width: 24,),
                    buildSocialIcon(
                        icon: FontAwesomeIcons.twitter,
                        color: Colors.blue,
                        onTap: (){}
                    ),
                    const SizedBox(width: 24,),
                    buildSocialIcon(
                        icon: FontAwesomeIcons.google,
                        color: Colors.blue,
                        onTap: (){}
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _onTapLoginButton(){
    if(_formKey.currentState!.validate()){
      Navigator.pushNamedAndRemoveUntil(context, TravellerTabBarScreen.name,(predicate)=>false);
      showSnackBarMessage(context, "Logged In Successfully");
    }

  }
}


