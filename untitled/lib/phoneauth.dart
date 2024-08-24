import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Phonepage extends StatefulWidget {
  const Phonepage({super.key});

  @override
  State<Phonepage> createState() => _PhonepageState();
}

class _PhonepageState extends State<Phonepage> {
  late TextEditingController _controller;
  late TextEditingController _controller1;
  var phone='';

  get value => null;
  @override
  void initState() {

    super.initState();
    _controller = TextEditingController(text: '+92');

  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return  Scaffold(

        body: Container(
          margin: EdgeInsets.only(left: 20,right: 20),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/add.png',
                  width: MediaQuery.of(context).size.width, // Full width of the screen
                  height: MediaQuery.of(context).size.height*0.5, // 50% of the screen height
                  fit: BoxFit.cover,
                ),
                Text("Phone Verification",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 10,
                ),
                Text("We need to register your phone to get things started",style: TextStyle(fontSize: 18,)),
                Container(
                    padding: EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 16.0),
                    decoration: BoxDecoration(
                        border: Border.all(width:1,color:Colors.grey)),

                    child: Row(
                        children: [


                          SizedBox(

                            width: 40,
                            child: TextField(
                              controller: _controller,
                                keyboardType: TextInputType.number
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),

                          Expanded(
                            child: SizedBox(
                              width: 40,
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                onChanged: (value)
                                {
                                  phone=value;
                                }
                              ),
                            ),
                          ),

                        ]

                    )
                ),
                SizedBox(
                  height:10,
                ),
                SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () async

                  {

                    Navigator.pushNamed(context, 'otp');
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${_controller.text+phone}',
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {},
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
                    child: Text("Send Code",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(
                      alignment: Alignment.center,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                )


              ],

            ),


          ),



        )


    );
  }
}
