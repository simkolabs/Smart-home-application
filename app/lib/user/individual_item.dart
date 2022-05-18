import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class individual_item extends StatefulWidget {
  const individual_item({Key? key}) : super(key: key);

  @override
  State<individual_item> createState() => _individual_itemState();
}

class _individual_itemState extends State<individual_item> {
  Widget card (data) {
    return Container(

      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.5,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    color: Colors.grey,
                    image: DecorationImage(
                        image: AssetImage(data['image']), fit: BoxFit.cover)
                ),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.5,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  color: Colors.white,

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(data['name'],
                          style: TextStyle(fontWeight: FontWeight.bold),),
                        IconButton(padding: EdgeInsets.all(0),
                            onPressed: () {},
                            icon: Image.asset('assets/add-to-cart.png'))
                      ],
                    ),
                    SizedBox(height: 4,),
                    Text("${data['currency']} ${data['price']}",
                      style: TextStyle(color: Colors.blue, fontSize: 18),),
                    SizedBox(height: 4,),
                   

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
  List related =[{
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
  Map item ={
    'name':'Bakery and bread',
    'price':250,
    'Currency':'LKR',
    'Description':'Qaulity dough used yummy, piece of sandwich Qaulity dough used yummy, piece of sandwich Qaulity dough used yummy, piece of sandwich Qaulity dough used yummy, piece of sandwich'
  };
  int quantity =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[200],
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height*0.4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/sample1.png'),
                          fit: BoxFit.cover
                      )
                  ),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: Colors.white,))
                      ],
                    ),
                  )
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height*0.7,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
                  ),
                  child: Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.4,
                                  child: Text(item['name'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.4,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(onPressed: (){
                                        if(quantity>0){
                                          setState(() {
                                            quantity--;
                                          });
                                        }
                                      }, child: Icon(Icons.remove,color: Colors.grey,),style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
                                            ),
                                          ),
                                          backgroundColor: MaterialStateProperty.all(Colors.grey[300])
                                      ),),
                                      Container(
                                        child: Text('$quantity',style: TextStyle(color: Colors.grey),),
                                        padding: EdgeInsets.all(5),
                                      ),
                                      TextButton(onPressed: (){
                                        setState(() {
                                          quantity++;
                                        });

                                      }, child: Icon(Icons.add,color: Colors.grey,),style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
                                            ),
                                          ),
                                          backgroundColor: MaterialStateProperty.all(Colors.grey[300])
                                      ),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text("${item['Currency']} ${item['price']}",style: TextStyle(color: Colors.blue,fontSize: 18),),
                            SizedBox(height: 10,),
                            Container(
                              height: MediaQuery.of(context).size.height*0.1,
                              child: Text("${item['Description']}",style: TextStyle(color: Colors.grey,fontSize: 14),),
                            ),
                            SizedBox(height: 10,),
                            Container(
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
                                        'Buy Now',
                                        style:
                                        const TextStyle(fontSize: 13,color: Colors.white),
                                      ),
                                    ),
                                  ),)

                            ),
                            SizedBox(height: 15,),
                            Text('Related Products'),
                            SizedBox(height: 10,),
                            Container(
                              height: MediaQuery.of(context).size.height*0.3,
                              child:ListView.builder(scrollDirection:Axis.horizontal,itemCount:related.length,itemBuilder: (context, index) {
                                return card(related[index]);


                              }) ,
                            ),


                          ],
                        ),
                      ],
                    )
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
