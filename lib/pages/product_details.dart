import 'package:flutter/material.dart';
import 'package:gosellgh/shopapp/shoppages/components/crart_page.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_picture;
  final product_detail_oldprice;
  final product_detail_price;

  const ProductDetails({
    Key? key,
    this.product_detail_name,
    this.product_detail_picture,
    this.product_detail_oldprice,
    this.product_detail_price,
  }) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product details',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPageView()));

              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              )),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 300.0,
            color: Colors.white,
            child: GridTile(
              child: Container(
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Text(widget.product_detail_name),
                  title: Row(
                    children: [
                      Expanded(child: Text("GH₵${widget.product_detail_oldprice}",style:
                      TextStyle(color: Colors.grey,decoration:TextDecoration.lineThrough,
                      fontSize: 15.0
                      )
                ,)),
                      Expanded(child: Text("GH₵${widget.product_detail_price}",
                          style:
                          TextStyle(color: Colors.red,decoration:TextDecoration.underline,
                              fontSize: 18.0,fontWeight: FontWeight.bold
                          ))),

                    ],
                  ),

                ),
              ),
            ),
          ),
          //========first button==============
          Row(
            children: [

              Expanded(child:
              MaterialButton(onPressed: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                      title: Text('Size'),
                        content: Text('choose your color'),
                      );
                    });



              },
                  child: Row(
                    children: [
                      Expanded(child: Text('Size')),
                      Expanded(child:Icon(Icons.arrow_drop_down)),
                    ],

                  )
              ),

              ),
              Expanded(child:
              MaterialButton(onPressed: null,
                  child: Row(
                    children: [
                      Expanded(child: Text('Color')),
                      Expanded(child:Icon(Icons.arrow_drop_down)),
                    ],

                  )
              ),

              ),
              Expanded(child:
              MaterialButton(onPressed: null,
                  child: Row(
                    children: [
                      Expanded(child: Text('Qty')),
                      Expanded(child:Icon(Icons.arrow_drop_down)),
                    ],

                  )
              ),

              ),
            ],
          ),
          //==========second bbutton=============
          Row(
            children: [
              Expanded(
                flex: 2,
                child: ElevatedButton(onPressed: null,
                style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all<Color>(Colors.orange)
                ),
                child: Text('Buy Now',style: TextStyle(
                  color: Colors.white
                ),),

                ),
              ),
              Expanded(child: InkWell(
                onTap: (){},
                  child: Icon(Icons.shopping_cart,color: Colors.red,))),
              Expanded(child: Icon(Icons.favorite_border,color: Colors.red,)),


            ],
          ) ,
            Divider(),

          const ListTile(
            title: Text('Product Detail',style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text('whiteMan fashion Center is a company which is  into products of shirt,dresses'
                'both in small and large quantity on affordable prices. We also create avenue for the youths ',
              style: TextStyle(fontSize: 18.0,),

            ) ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Text('PRoduct Name:'),
            Text(widget.product_detail_name,style: TextStyle(color: Colors.grey),)
          ],),
        ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Text('Brand:'),
              Text("Media",style: TextStyle(color: Colors.grey),)
            ],),
          )



        ],

      ),
    );
  }
}
