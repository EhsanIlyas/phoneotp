import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';


class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  late TextEditingController _controller;
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
                Text("Enter OTP",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 10,
                ),
                Text("We need to register your phone to get things started",style: TextStyle(fontSize: 18,)),

                SizedBox(
                  height: 10,
                ),
                Pinput(
                  length: 6,
                  onChanged: (value) {
                    // Handle the value entered by the user
                  },
                ),
                SizedBox(
                  height:10,
                ),
                SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {}, child: Text("Verify Phone Number",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    backgroundColor: Colors.blue,
                  ),
                  ),
                ),
                Container( alignment: Alignment.bottomLeft,
                    child: Text("Edit Phone Number?", style: TextStyle(fontSize:16, fontWeight: FontWeight.bold),))


              ],

            ),


          ),



        )


    );
  }
}
