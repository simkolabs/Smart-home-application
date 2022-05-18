import 'package:flutter/material.dart';

class Myexpenses extends StatefulWidget {
  const Myexpenses({Key? key}) : super(key: key);

  @override
  State<Myexpenses> createState() => _MyexpensesState();
}

class _MyexpensesState extends State<Myexpenses> {
  List expenses =[{
    'name':'House rent',
    'expense':4000,
    'date':'05 MAR 2022'
  },{
    'name':'Water bill',
    'expense':40000,
    'date':'03 MAR 2022'
  }];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    mainAxisAlignment: MainAxisAlignment.start,
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

                        child: Text('My Expenses',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("ENTER YOUR EXPERIENCE",style: TextStyle(color: Colors.grey,fontSize: 14),),
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
                      const Text("COST",style: TextStyle(color: Colors.grey,fontSize: 14),),
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
                            prefixText: 'LKR',
                            prefixStyle: TextStyle(color: Colors.grey)
                        ),),
                    ],
                  ),
                  SizedBox(height: 20,),
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
                              'Save Expense',
                              style:
                              const TextStyle(fontSize: 16,color: Colors.white),
                            ),
                          ),
                        ),)

                  ),
                  SizedBox(height: 20,),
                  Text('This Month Expenses',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  SizedBox(height: 8,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.4,
                    child: ListView.builder(itemCount: expenses.length,itemBuilder: (context, index) {
                      return Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            Container(
                              padding:EdgeInsets.only(top: 8,bottom: 8),
                              width: MediaQuery.of(context).size.width*0.3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(expenses[index]['name'],style: TextStyle(fontSize: 18),),
                                  Text('${expenses[index]['date']}',style: TextStyle(fontSize: 12),),
                                ],
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Container(
                              child: Text('${expenses[index]['expense']}',style: TextStyle(fontSize: 18),),
                            ),
                            IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.blue,)),
                            IconButton(onPressed: (){}, icon: Icon(Icons.delete))
                          ],
                        ),
                      );

                    })),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
