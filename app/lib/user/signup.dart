import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool obsecure=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(height: 20,),
                const Text("ENTER USERNAME",style: TextStyle(color: Colors.grey,fontSize: 14),),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                    ),
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.all(15),
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),),
                SizedBox(height: 8,),
                const Text("ENTER YOUR EMAIL",style: TextStyle(color: Colors.grey,fontSize: 14),),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                    ),
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.all(15),
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),),
                SizedBox(height: 8,),
                const Text("ENTER YOUR MOBILE NUMBER",style: TextStyle(color: Colors.grey,fontSize: 14),),
                SizedBox(height: 8,),
                IntlPhoneField(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'LK',

                ),
                SizedBox(height: 8,),
                const Text("ENTER YOUR ADDRESS",style: TextStyle(color: Colors.grey,fontSize: 14),),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                    ),
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.all(15),
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),),
                SizedBox(height: 8,),
                const Text("PASSWORD",style: TextStyle(color: Colors.grey,fontSize: 14),),
                TextField(
                  obscureText: obsecure,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 0.0),
                      ),
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding: EdgeInsets.all(15),
                      fillColor: Colors.grey[200],
                      filled: true,

                      suffix: InkWell(
                        onTap: (){
                          setState(() {
                            obsecure=!obsecure;
                          });
                        },
                        child: !obsecure?Icon(Icons.visibility_off):Icon(Icons.visibility),
                      )
                  ),),
                SizedBox(height: 25,),

                Container(
                    width:MediaQuery.of(context).size.width,
                    child: ElevatedButton(onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0.0),
                      ),
                      child:Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Colors.blueAccent, Colors.lightBlue.shade200]),

                        ),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'Sign Up',
                            style:
                            const TextStyle(fontSize: 16,color: Colors.white),
                          ),
                        ),
                      ),)

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account ?' ),
                    TextButton(onPressed: (){}, child: Text('Sign In'),)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
