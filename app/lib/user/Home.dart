import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:home_security/user/individual_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List Items =[{
    'name':'Bakery and Bread',
    "price":250,
    "currency":"LKR",
    "image":"assets/sample1.png"
  },{
    'name':'Pasta and Rice',
    "price":250,
    "currency":"LKR",
    "image":"assets/sample2.png"
  }];
  List sale =[{
    'name':'Diary Products',
    "price":250,
    "currency":"LKR",
    "image":"assets/sample3.png"
  },{
    'name':'Cola',
    "price":250,
    "currency":"LKR",
    "image":"assets/sample4.png"
  }];
  Widget card (data){
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.5,
                height: MediaQuery.of(context).size.height*0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                    color: Colors.grey,
                    image: DecorationImage(image: AssetImage(data['image']),fit: BoxFit.cover)
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.5,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                  color: Colors.white,

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(data['name'],style: TextStyle(fontWeight: FontWeight.bold),),
                        IconButton(padding: EdgeInsets.all(0),onPressed: (){}, icon: Image.asset('assets/add-to-cart.png'))
                      ],
                    ),
                    SizedBox(height: 4,),
                    Text("${data['currency']} ${data['price']}",style: TextStyle(color: Colors.blue,fontSize: 18),),
                    SizedBox(height: 4,),
                    Container(
                        child: ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>individual_item()));
                        },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0.0),
                          ),
                          child:Ink(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Colors.blueAccent, Colors.lightBlue.shade200]),

                            ),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                              alignment: Alignment.center,
                              child: const Text(
                                'Buy Now',
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
          SizedBox(width: 8,)
        ],
      ),

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Container(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
                          Text("Hey Anushka!",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                        ],
                      ),

                      SizedBox(height: 8,),
                      Text("Welcome to our shop search what you want",style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
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
                            hintText: "Search Your Items",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.search)
                        ),),

                    ],
                  ),
                ),
              ),
              Expanded(child: Container(
                child:  ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Popular Items",style: TextStyle(color: Colors.grey,fontSize: 13),),
                          TextButton(onPressed: (){}, child: Text("Show All",style: TextStyle(color: Colors.grey,fontSize: 13),))
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05),
                      height: MediaQuery.of(context).size.height*0.5,
                      child:ListView.builder(scrollDirection:Axis.horizontal,itemCount:Items.length,itemBuilder: (context, index) {
                        return card(Items[index]);


                      }) ,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sale Items",style: TextStyle(color: Colors.grey,fontSize: 13),),
                          TextButton(onPressed: (){}, child: Text("Show All",style: TextStyle(color: Colors.grey,fontSize: 13),))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05),
                      height: MediaQuery.of(context).size.height*0.5,
                      child:ListView.builder(scrollDirection:Axis.horizontal,itemCount:sale.length,itemBuilder: (context, index) {
                        return card(sale[index]);


                      }) ,
                    ),
                  ],
                ),
              ))
            ],

          ),
        ),
      ),
    );
  }
}
