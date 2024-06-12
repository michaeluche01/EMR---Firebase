import 'package:emr_m_app/Pages/admin_page.dart';
import 'package:emr_m_app/Pages/onboarding/login_patient_page.dart';
import 'package:emr_m_app/components/my_button.dart';
import 'package:emr_m_app/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import '../home/dashboard.dart';

class LoginAdminPage extends StatefulWidget {
  const LoginAdminPage({super.key});
  // final Function()? onTap;

  @override
  State<LoginAdminPage> createState() => _LoginAdminPageState();
}

class _LoginAdminPageState extends State<LoginAdminPage> {
  //text editing Controllers
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  void routeSignUpUser() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const LoginPatientPage()));
  }

  void signUserIn() async {
    // showloadingcircle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(color: Color(0xFF928490)),
        );
      },
    );

    //Sign in

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // Handle error
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message ?? 'Unknown error')));
      }
    }
    //pop the loading circle
    Navigator.pop(context);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const AdminPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF3E8EB),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.lock,
                    size: 70,
                    color: Colors.black54,
                  ),
                  // Image.asset(
                  //   'images/mini-lock.png',
                  //   height: 70,
                  //   width: 70,
                  // ),
                  const SizedBox(height: 20),
                  const Text(
                    "Enter Admin credentials to Login",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: _emailController,
                    hintText: 'Admin Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 15),
                  MyTextField(
                    controller: _passwordController,
                    hintText: 'Admin Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),
                  MyButton(
                    buttonName: 'Login as ADMIN',
                    onTap: () {
                      signUserIn();
                    },
                  ),

                  GestureDetector(
                    onTap: routeSignUpUser,
                    child: const Text(
                      'Login as PATIENT',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}


// import 'package:emr_m_app/Pages/onboarding/login_page.dart';
// import 'package:emr_m_app/components/my_button.dart';
// import 'package:emr_m_app/components/my_textfield.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   // final Function()? onTap;

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final emailController = TextEditingController();
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmpasswordController = TextEditingController();

//   void routeSignInUser() {
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => const LoginPage()));
//   }

//   //sign user up
//   void signUserUp() async {
//     // showloadingcircle
//     showDialog(
//       context: context,
//       builder: (context) {
//         return const Center(
//           child: CircularProgressIndicator(color: Color(0xFF928490)),
//         );
//       },
//     );

//     //Create new user
//     try {
//       //vheck if confirm password == password
//       if (passwordController.text == confirmpasswordController.text) {
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text.trim(),
//         );
//       } else {
//         //show error message, passwords don't match
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("passwords don't match!")));
//       }
//       // you need to create an email verification

//       await FirebaseAuth.instance.signOut();
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => const LoginPage()));
//       Navigator.pop(context);
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text("User Registered Successfully. You can now Login")));
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//             content: Text("The password provided is too weak!")));
//       } //else if (e.code == 'email-already-in-use') {
//       //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//       //       content: Text("the account already exists for that e-mail!")));
//       // }
//       // Handle error
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(e.message ?? 'Unknown error')));
//       }
//     }
//     //pop the loading circle
//     if (mounted) {
//       Navigator.pop(context);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color(0xFFF3E8EB),
//         body: SafeArea(
//           child: Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(
//                     Icons.lock,
//                     size: 50,
//                     color: Colors.black54,
//                   ),
//                   // Image.asset(
//                   //   'images/mini-lock.png',
//                   //   height: 70,
//                   //   width: 70,
//                   // ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     "Let's create an account for you!",
//                     style: TextStyle(
//                       color: Colors.black54,
//                       fontSize: 16,
//                     ),
//                   ),

//                   const SizedBox(height: 15),
//                   MyTextField(
//                     controller: usernameController,
//                     hintText: 'Admin ID',
//                     obscureText: false,
//                   ),
//                   const SizedBox(height: 15),
//                   MyTextField(
//                     controller: passwordController,
//                     hintText: 'Password',
//                     obscureText: true,
//                   ),
//                   const SizedBox(height: 15),
//                   MyButton(
//                     buttonName: 'Login as ADMIN',
//                     onTap: () {
//                       // signUserUp();
//                     },
//                   ),

//                   const SizedBox(height: 15),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Not an ADMIN?',
//                         style: TextStyle(
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                       const SizedBox(width: 5),
//                       GestureDetector(
//                         onTap: routeSignInUser,
//                         child: const Text(
//                           'Login as Patient',
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
