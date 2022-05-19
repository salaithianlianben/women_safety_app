import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreen();
  }

}
class _LoginScreen extends State<LoginScreen>{
  late String _dialCodeNumber = "+91";
  TextEditingController _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
               SizedBox(height: MediaQuery.of(context).size.height*.2),
              const Text('Enter Phone number for Verification',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),),
              const SizedBox(height: 40,),
             Center(
               child: const Text('This number will be used for all app related \n communicatioin.'
                    ' You will receive an SMS \n  with a code for verification',textAlign: TextAlign.center,
               style: TextStyle(
                 fontSize: 16,
               )),
             ),
              const SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CountryCodePicker(
                    // padding: EdgeInsets.all(10),
                    onChanged: (country){
                      setState(() {
                        _dialCodeNumber=country.dialCode!;
                      });
                    },
                    initialSelection: "IN",
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    showFlagDialog: false,
                    // favorite: ["+1","US","+92","PAK"],
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        fontSize: 15
                      ),
                      controller: _controller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                          border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:const BorderSide(color: Colors.grey,width: 2)),
                          hintText: 'Phone Number',
                          prefix: Text(_dialCodeNumber),

                      ),
                      maxLength: 12,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(15),
                child:ElevatedButton(
                  onPressed: (){

                  },
                  child: Text("send Code"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}