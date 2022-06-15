import 'package:flutter/material.dart';
import 'package:gosellgh/shopapp/shoppages/components/cart_page_for_list.dart';

class CartPageView extends StatefulWidget {
  const CartPageView({Key? key}) : super(key: key);

  @override
  State<CartPageView> createState() => _CartPageViewState();
}

class _CartPageViewState extends State<CartPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       bottomNavigationBar: Container(
         color: Colors.orangeAccent,
         height: 70,
         child: Row(
           children: [

             Expanded(
               child: ListTile(
                 title:Text('Total'),
                 subtitle:  Text('GHS145',style: TextStyle(color: Colors.white),),

               ),
             ),
             Expanded(child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
                    ),
                 onPressed: null, child: Text('Check out',style: TextStyle(color: Colors.black),)))
             
           ],
         ),
       ),
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_sharp,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                print('AAAAAAAAAAa');

              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              )),
        ],

      ),
      body:CartList()
    );
  }
}
