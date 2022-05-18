import 'package:flutter/material.dart';

import 'Home.dart';

class shops extends StatefulWidget {
  final change;
  const shops({Key? key,this.change}) : super(key: key);

  @override
  State<shops> createState() => _shopsState();
}

class _shopsState extends State<shops> {
  List Shops =[{
    'name':'Rathnasri grocery shop',
    'address':'No 900, Kadawatha RD, Kadwatha',
    'image':'assets/sample5.png'
  },{
    'name':'Rathnasri grocery shop',
    'address':'No 900, Kadawatha RD, Kadwatha',
    'image':'assets/sample6.png'
  }];
  Widget card (data){
    return Column(
      children: [
        Container(
          child:
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                    color: Colors.grey,
                    image: DecorationImage(image: AssetImage(data['image']),fit: BoxFit.cover)
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                  color: Colors.white,

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis,),
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Icon(Icons.location_on,color: Colors.blue,),
                        SizedBox(width: 4,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          child:Text(data['address'],),
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                        child: ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                        },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0.0),
                          ),
                          child:Ink(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Colors.blueAccent, Colors.lightBlue.shade200]),

                            ),
                            child: Container(
                              padding: EdgeInsets.all(16),
                              constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                              alignment: Alignment.center,
                              child: const Text(
                                'View Shop',
                                style:
                                const TextStyle(fontSize: 13,color: Colors.white),
                              ),
                            ),
                          ),)

                    ),

                  ],
                ),
              ),
            ],
          ),

        ),
        SizedBox(height: 20,)

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double padding =MediaQuery.of(context).size.width*0.05;
    return Container(

      padding: EdgeInsets.all(padding),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.1,
                  child:IconButton(onPressed: (){
                    widget.change();
                  }, icon: Icon(Icons.arrow_back)) ,
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.2,
                ),

                Expanded(child: Container(
                  width: MediaQuery.of(context).size.width*0.3,
                  child: Center(
                    child: Text('All Shops',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  ),
                )),

                SizedBox(width:MediaQuery.of(context).size.width*0.3 )
              ],
            ),
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
                  hintText: "Search Shops",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search)
              ),),
            SizedBox(height: 8,),
            Expanded(child: Container(
              child: ListView.builder(itemCount: Shops.length,itemBuilder: (context, index) {
                return card(Shops[index]);

              }))
            )
          ],
        ),
      ),
    );
  }
}
