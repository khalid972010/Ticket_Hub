import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ticket_hub/screens/home_navigation/home_navigation.dart';

import '../../themes/app_theme.dart';

class SignInFour extends StatefulWidget {
  const SignInFour({Key? key}) : super(key: key);

  @override
  State<SignInFour> createState() => _SignInFourState();
}

class _SignInFourState extends State<SignInFour> {
  //variables
  String? email;
  String? password;
  bool? isLoading = false;
  bool? obsecureText = true;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //mediaquer->dimensions
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: Center(),
            ),

            //page content
            Expanded(
              flex: 6,
              child: buildCard(size),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(Size size) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //build minimize icon

              SizedBox(
                height: size.height * 0.02,
              ),

              //welcome text
              Text(
                'Welcome Back!',
                style: GoogleFonts.inter(
                  fontSize: 22.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                'Let’s login for explore continues',
                style: GoogleFonts.inter(
                  fontSize: 14.0,
                  color: const Color(0xFF969AA8),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),

              //logo section
              logo(size.height / 8, size.height / 8),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),

              //email textField
              Container(
                margin: const EdgeInsets.only(left: 3),
                child: Text(
                  'Email Address',
                  style: GoogleFonts.inter(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    emailTextField(size),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    //password textField
                    Container(
                      margin: const EdgeInsets.only(left: 3),
                      child: Text(
                        'Password',
                        style: GoogleFonts.inter(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: size.height * 0.01,
              ),
              passwordTextField(size),
              SizedBox(
                height: size.height * 0.04,
              ),

              //sign in button
              signInButton(size),
              SizedBox(
                height: size.height * 0.02,
              ),

              //we can connect text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(child: Divider()),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    'We can Connect with',
                    style: GoogleFonts.inter(
                      fontSize: 12.0,
                      color: const Color(0xFF969AA8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Expanded(child: Divider()),
                ],
              ),

              //footer section
              buildFooter(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget logo(double height_, double width_) {
    return Image.asset(
      'assets/images/animation.gif',
      height: height_,
      width: width_,
    );
  }

  Widget emailTextField(Size size) {
    return SizedBox(
      height: size.height / 13,
      child: TextField(
        controller: emailController,
        style: GoogleFonts.inter(
          fontSize: 18.0,
          color: const Color(0xFF151624),
        ),
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        cursorColor: const Color(0xFF151624),
        decoration: InputDecoration(
          hintText: 'Enter your email',
          hintStyle: GoogleFonts.inter(
            fontSize: 16.0,
            color: const Color(0xFF151624).withOpacity(0.5),
          ),
          filled: true,
          fillColor: emailController.text.isEmpty
              ? const Color.fromRGBO(248, 247, 251, 1)
              : Colors.transparent,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: emailController.text.isEmpty
                    ? Colors.transparent
                    : const Color.fromRGBO(44, 185, 176, 1),
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color.fromRGBO(44, 185, 176, 1),
              )),
          prefixIcon: Icon(
            Icons.mail_outline_rounded,
            color: emailController.text.isEmpty
                ? const Color(0xFF151624).withOpacity(1)
                : const Color.fromRGBO(44, 185, 176, 1),
            size: 16,
          ),
          suffix: Container(
            alignment: Alignment.center,
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: const Color.fromRGBO(44, 185, 176, 1),
            ),
            child: emailController.text.isEmpty
                ? const Center()
                : const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 13,
                  ),
          ),
        ),
        onChanged: (value) {
          setState(() {
            email = value; // Update email variable
          });
        },
      ),
    );
  }

  Widget passwordTextField(Size size) {
    return Container(
      height: size.height / 13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromRGBO(248, 247, 251, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            const Icon(
              Icons.lock_outline_rounded,
              size: 16,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: TextField(
                controller: passController,
                style: GoogleFonts.inter(
                  fontSize: 16.0,
                  color: const Color(0xFF151624),
                ),
                cursorColor: const Color(0xFF151624),
                obscureText: obsecureText!,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 16.0,
                    color: const Color(0xFF151624).withOpacity(0.5),
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
            ),
            passController.text.isEmpty
                ? const Center()
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        obsecureText = !obsecureText!;
                      });
                    },
                    child: Icon(obsecureText!
                        ? Icons.hide_source
                        : Icons.remove_red_eye),
                  ),
          ],
        ),
      ),
    );
  }

  Widget signInButton(Size size) {
    return GestureDetector(
      onTap: () async {
        isLoading = true;

        setState(() {});

        if (email != null && password != null) {
          if (formKey.currentState!.validate()) {
            await loginUser(context, email!, password!);
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please fill in all fields")),
          );
        }
        setState(() {
          isLoading = false;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: size.height / 13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.deepPurple,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF4C2E84).withOpacity(0.2),
              offset: const Offset(0, 15.0),
              blurRadius: 60.0,
            ),
          ],
        ),
        child: Text(
          'Sign in',
          style: GoogleFonts.inter(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget buildFooter(Size size) {
    return Center(
      child: Column(
        children: <Widget>[
          //social logo: facebook, google & apple here
          SizedBox(
            height: size.height * 0.01,
          ),
          SizedBox(
            width: size.width * 0.6,
            height: 44.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //facebook logo here

                //google logo here
                GestureDetector(
                  onTap: () async {
                    try {
                      await GoogleSignIn().signOut();

                      UserCredential userCredential = await signInWithGoogle();
                      // userCredential.additionalUserInfo.;

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text("Signed in with Google successfully!")),
                      );
                    } catch (e) {
                      print("Failed to sign in with Google: $e");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Failed to sign in with Google")),
                      );
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 44.0,
                    height: 44.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: const Color.fromRGBO(246, 246, 246, 1),
                    ),
                    child: SvgPicture.string(
                      '<svg viewBox="11.0 11.0 22.92 22.92" ><path transform="translate(11.0, 11.0)" d="M 22.6936149597168 9.214142799377441 L 21.77065277099609 9.214142799377441 L 21.77065277099609 9.166590690612793 L 11.45823860168457 9.166590690612793 L 11.45823860168457 13.74988651275635 L 17.93386268615723 13.74988651275635 C 16.98913192749023 16.41793632507324 14.45055770874023 18.33318138122559 11.45823860168457 18.33318138122559 C 7.661551475524902 18.33318138122559 4.583295345306396 15.25492572784424 4.583295345306396 11.45823860168457 C 4.583295345306396 7.661551475524902 7.661551475524902 4.583295345306396 11.45823860168457 4.583295345306396 C 13.21077632904053 4.583295345306396 14.80519008636475 5.244435787200928 16.01918983459473 6.324374675750732 L 19.26015281677246 3.083411931991577 C 17.21371269226074 1.176188230514526 14.47633838653564 0 11.45823860168457 0 C 5.130426406860352 0 0 5.130426406860352 0 11.45823860168457 C 0 17.78605079650879 5.130426406860352 22.91647720336914 11.45823860168457 22.91647720336914 C 17.78605079650879 22.91647720336914 22.91647720336914 17.78605079650879 22.91647720336914 11.45823860168457 C 22.91647720336914 10.68996334075928 22.83741569519043 9.940022468566895 22.6936149597168 9.214142799377441 Z" fill="#ffc107" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(12.32, 11.0)" d="M 0 6.125000953674316 L 3.764603137969971 8.885863304138184 C 4.78324031829834 6.363905429840088 7.250198841094971 4.583294868469238 10.13710117340088 4.583294868469238 C 11.88963890075684 4.583294868469238 13.48405265808105 5.244434833526611 14.69805240631104 6.324373722076416 L 17.93901443481445 3.083411693572998 C 15.89257335662842 1.176188111305237 13.15520095825195 0 10.13710117340088 0 C 5.735992908477783 0 1.919254422187805 2.484718799591064 0 6.125000953674316 Z" fill="#ff3d00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(12.26, 24.78)" d="M 10.20069408416748 9.135653495788574 C 13.16035556793213 9.135653495788574 15.8496036529541 8.003005981445312 17.88286781311035 6.161093711853027 L 14.33654403686523 3.160181760787964 C 13.14749050140381 4.064460277557373 11.69453620910645 4.553541660308838 10.20069408416748 4.55235767364502 C 7.220407009124756 4.55235767364502 4.689855575561523 2.6520094871521 3.736530303955078 0 L 0 2.878881216049194 C 1.896337866783142 6.589632034301758 5.747450828552246 9.135653495788574 10.20069408416748 9.135653495788574 Z" fill="#4caf50" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(22.46, 20.17)" d="M 11.23537635803223 0.04755179211497307 L 10.31241607666016 0.04755179211497307 L 10.31241607666016 0 L 0 0 L 0 4.583295345306396 L 6.475625038146973 4.583295345306396 C 6.023715496063232 5.853105068206787 5.209692478179932 6.962699413299561 4.134132385253906 7.774986743927002 L 4.135851383209229 7.773841857910156 L 7.682177066802979 10.77475357055664 C 7.431241512298584 11.00277233123779 11.45823955535889 8.020766258239746 11.45823955535889 2.291647672653198 C 11.45823955535889 1.523372769355774 11.37917804718018 0.773431122303009 11.23537635803223 0.04755179211497307 Z" fill="#1976d2" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                      width: 22.92,
                      height: 22.92,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),

          //footer text 'sign up' text here
          SizedBox(
            height: size.height * 0.01,
          ),
          Text.rich(
            TextSpan(
              style: GoogleFonts.inter(
                fontSize: 12.0,
                color: Colors.black,
              ),
              children: const [
                TextSpan(
                  text: 'Don’t have an account? ',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Poppins-M',
                  ),
                ),
                TextSpan(
                  text: 'Sign Up here',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins-M'),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

Future<void> loginUser(
    BuildContext context, String email, String password) async {
  try {
    final auth = FirebaseAuth.instance;
    final credential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("User logged in successfully")),
    );

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const HomeNavigation()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No user found for that email.")),
      );
    } else if (e.code == 'wrong-password') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Wrong password provided for that user.")),
      );
    } else if (e.code == 'invalid-credential') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Wrong password provided for that user.")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to sign in: ${e.message}")),
      );
    }
  } catch (e) {
    print('Failed to sign in: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("An error occurred while signing in")),
    );
  }
}

Future<UserCredential> signInWithGoogle() async {
  //user chooses his account
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //after he sign in get the token of the user
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
  //user credit from the prev step

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
