import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  bool obsecure =true;
  TextEditingController email =TextEditingController();
  TextEditingController password =TextEditingController();
  String Error ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
        color: Colors.white,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Welcome!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),

              Expanded(child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/login.png'))
                ),
              )),
              const SizedBox(height: 10,),
              const Text("EMAIL",style: TextStyle(color: Colors.grey,fontSize: 14),),
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
              SizedBox(height: 15,),
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
              SizedBox(height: 15,),

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
                        'Sign In',
                        style:
                        const TextStyle(fontSize: 16,color: Colors.white),
                      ),
                    ),
                  ),)

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t You Have an account ?' ),
                  TextButton(onPressed: (){}, child: Text('Sign Up'),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){}, child: Text('Forget Password ?'))
                ],
              )

            ],
          ),
        ),

      )
    );
  }
}
