import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:home_security/user/MyExpenses.dart';
import 'package:home_security/user/editprofile.dart';
 class profile_main extends StatefulWidget {
   const profile_main({Key? key}) : super(key: key);

   @override
   State<profile_main> createState() => _profile_mainState();
 }

 class _profile_mainState extends State<profile_main> {
   List Buttons =[{
     'title':'Edit Profile',
     'icon':Icon(Icons.edit),
     'page':const Edit_profile()
   },{
     'title':'My Expenses',
     'icon':Icon(Icons.monetization_on_sharp),
     'page':const Myexpenses()
   },{
     'title':'My Schedules',
     'icon':Icon(Icons.schedule),
     'page':const Edit_profile()
   },{
     'title':'Help',
     'icon':Icon(Icons.help),
     'page':const Edit_profile()
   }];

   Widget buttons(data){
     return Card(
       child: Container(
         padding: EdgeInsets.all(8),
         child:Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             data['icon'],
             Text(data['title'],style: TextStyle(fontSize: 20),),
             IconButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>data['page']));
             }, icon: Icon(Icons.arrow_forward_ios,size: 25,))
           ],
         ) ,
       ),
     );
   }
   @override
   Widget build(BuildContext context) {
     return Container(
       height: MediaQuery.of(context).size.height,
       width:MediaQuery.of(context).size.width,
       color: Colors.white,
       child: SafeArea(
         child: SingleChildScrollView(
           child: Container(
             padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Text('My Profile',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
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
                     children :Buttons.map((e) => buttons(e)).toList()
                 )

               ],
             ),
           ),
         )
       ),
     );
   }
 }
