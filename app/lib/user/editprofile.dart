import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Edit_profile extends StatefulWidget {
  const Edit_profile({Key? key}) : super(key: key);

  @override
  State<Edit_profile> createState() => _Edit_profileState();
}

class _Edit_profileState extends State<Edit_profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.1,
                        child:IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_back)) ,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.2,
                      ),

                      Expanded(child: Container(
                        width: MediaQuery.of(context).size.width*0.3,
                        child: Center(
                          child: Text('Edit Profile',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                        ),
                      )),

                      SizedBox(width:MediaQuery.of(context).size.width*0.3 )
                    ],
                  ),
                  SizedBox(height: 10,),
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.height*0.1,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: MediaQuery.of(context).size.height*0.09,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('Anushka Bandara',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.lightBlue)),
                  SizedBox(height: 20,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8,),
                      const Text("EDIT USERNAME",style: TextStyle(color: Colors.grey,fontSize: 14),),
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
                      const Text("EDIT EMAIL",style: TextStyle(color: Colors.grey,fontSize: 14),),
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
                      const Text("EDIT MOBILE NUMBER",style: TextStyle(color: Colors.grey,fontSize: 14),),
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
                      const Text("EDIT YOUR ADDRESS",style: TextStyle(color: Colors.grey,fontSize: 14),),
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
                                  'Update Details',
                                  style:
                                  const TextStyle(fontSize: 16,color: Colors.white),
                                ),
                              ),
                            ),)

                      ),
                    ],
                  )


                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
