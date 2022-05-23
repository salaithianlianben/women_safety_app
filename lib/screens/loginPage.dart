// import 'package:flutter/material.dart';
// import 'package:save_me_applicationn/constants/constants.dart';
// import 'package:auth_buttons/auth_buttons.dart';
// // ignore: use_key_in_widget_constructors
// class LoginPage extends StatefulWidget {
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   //we need global key very rarely to interact with the widget inside our code
//   //and here we need it inside form  widget to get the input from it
//   final _form = GlobalKey<FormState>();
//   final _passwordFocus=FocusNode();
//
//
//   void _saveForm(){
//     //check the validator of the textField
//     final _valid=_form.currentState!.validate();
//     if(_valid){
//       //this will trigger onSave function in each of the textFormField and save the values
//       // which we entered
//       _form.currentState?.save();
//     }else{
//       return;
//     }
//
//   }
//
//   @override
//   void dispose() {
//     //we have to dispose the focus node  because it takes memory
//     _passwordFocus.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size=MediaQuery.of(context).size;
//     // TODO: implement build
//     return GestureDetector(
//       onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle:true,
//           title: const Text('Login Page'),
//         ),
//         body: SingleChildScrollView(
//           //the benefit of the form that you don't need to add controllers to get access to
//           //the inputs
//           child: Form(
//             key: _form,
//             child: Column(
//               children: <Widget>[
//                 SizedBox(height:size.height*.15,),
//                 Image.asset('assets/logo.JPG'),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                   child: TextFormField(
//                     //this property will show you the next button on the soft keyboard
//                     textInputAction: TextInputAction.next,
//                     keyboardType: TextInputType.emailAddress,
//                     decoration:  InputDecoration(
//                         hintText: 'Enter Your Email ',
//                         suffixIcon:const Icon(Icons.person),
//                         border:OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide:const BorderSide(color: Colors.grey,width: 2)
//
//                       ),
//                       focusedBorder:OutlineInputBorder(
//                         borderSide: const BorderSide(color: mainColor, width: 2.0),
//                         borderRadius: BorderRadius.circular(15.0),
//
//                       ),
//                     ),
//                     //this function will be triggered whenever the user
//                     //pressed the next button on the soft keyboard
//                     onFieldSubmitted: (_) {
//                       //For moving to the next element
//                       FocusScope.of(context).requestFocus(_passwordFocus);
//                     },
//                     //this property will be activated whenever I pressed on save
//                     //or if I activate auto validator attribute
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'please provide an Email';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       //saving the values that we entered
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                   child: TextFormField(
//                     decoration:  InputDecoration(
//                         hintText: 'Enter Your Password',
//                         suffixIcon:const Icon(Icons.lock),
//                         border:OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15),
//                         borderSide:const BorderSide(color: Colors.grey,width: 2)
//                         ),
//                       focusedBorder:OutlineInputBorder(
//                         borderSide: const BorderSide(color:mainColor, width: 2.0),
//                         borderRadius: BorderRadius.circular(15.0),
//                       ),
//                     ),
//                     focusNode: _passwordFocus,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'please provide a value';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       //saving the values that we entered
//                     },
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: <Widget>[
//                     TextButton(
//                     onPressed: (){
//                     print('forgot password ?');
//                     },
//                       child: const Text(
//                         'Forgot password ?',style: TextStyle(color: Colors.grey),),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: size.height*.02,),
//                 GestureDetector(
//                   child: Container(
//                     width: size.width*.5,
//                     height:size.height*.05 ,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15), color:mainColor),
//                     child: const Center(
//                       child: Text(
//                         'Login',
//                         style: TextStyle(color: Colors.white,fontSize: 15),
//                       ),
//                     ),
//                   ),
//                   onTap: (){
//                       print('save form');
//                      _saveForm();
//                   },
//                 ),
//                 const SizedBox(height: 10,),
//                 _divider(),
//                  FacebookAuthButton(
//                    style: AuthButtonStyle(
//                      width: size.width*.8,
//                      height: size.height*.05,
//                      buttonColor:const Color(0xff3b5998)
//                    ),
//                    onPressed: () {
//                      // your implementation
//                    },
//                  ),
//                 const SizedBox(height: 20,),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: GoogleAuthButton(
//                     style:
//                       AuthButtonStyle(
//                           width: size.width*.8,
//                           height: size.height*.05,
//                           buttonColor: Colors.white70
//                     ),
//                     onPressed: () {
//                       // your implementation
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _divider() {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         children:const <Widget>[
//           SizedBox(
//             width: 20,
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Divider(
//                 thickness: 1,
//               ),
//             ),
//           ),
//           Text('or'),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Divider(
//                 thickness: 1,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 20,
//           ),
//         ],
//       ),
//     );
//   }
// }
