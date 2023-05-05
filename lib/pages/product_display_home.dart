import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gosellgh/widget/simple_component.dart';
import 'package:badges/badges.dart' as badges;

import 'comment_page.dart';
import 'detailed_page.dart';

class CategoryHome extends StatefulWidget {
  final Catego_Name;

  const CategoryHome

  (

  {

  Key

  ?

  key

  ,

  required

  ,

  this

      .

  Catego_Name
}) :
super
(
key: key);

@override
State<CategoryHome> createState() => _CategoryHomeState();}

class _CategoryHomeState extends State<CategoryHome>
    with SingleTickerProviderStateMixin {


  bool isText = false;
  bool iscomment = false;
  String Search_Name = '';
  TextEditingController commentingPage = TextEditingController();
  CollectionReference catReff =
  FirebaseFirestore.instance.collection('MarketItems');
  TextEditingController searchText = TextEditingController();

  Future<void> addComment(docid) async {
    catReff.doc(docid).collection("comment").add({
      "comment": commentingPage.text,
    });
    myToast('done');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: SizedBox(
            height: 40,
            width: 400.0,
            child: TextField(
              textAlign: TextAlign.center,
              controller: searchText,
              onChanged: (value) {},
              maxLines: 1,
              decoration: InputDecoration(
                  filled: true,
                  hintText: 'Search here!',
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        Search_Name = searchText.text;
                      });
                    },
                    icon: const Icon(
                      Icons.search_sharp,
                      color: Colors.black,
                    ),
                  ),
                  border: const OutlineInputBorder(
                      borderSide:
                      const BorderSide(width: 23.0, color: Colors.black))),
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: catReff.snapshots(),
          builder:
          //take Note of this!!!
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.data!.docs
                  .where((QueryDocumentSnapshot<Object?> element) =>
                  element['product_Name']
                      .toString()
                      .toLowerCase()
                      .contains(Search_Name.toString()))
                  .isEmpty) {
                return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            'Product not found!',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            (Icons.search_off),
                            size: 50.0,
                          ),
                        )
                      ],
                    ));
              } else {
                return ListView(
                  children: [
                    //to this where the search funtion is places
                    ...snapshot.data!.docs
                        .where((QueryDocumentSnapshot<Object?> element) =>
                        element['product_Name']
                            .toString()
                            .toLowerCase()
                            .contains(Search_Name.toString()))
                        .map((QueryDocumentSnapshot<Object?> data) {
                      return Card(
                        shadowColor: Colors.red,
                        elevation: 20,
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                              Border.all(width: 1.0, color: Colors.white)),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 340.0,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, PageRouteBuilder(

                                      pageBuilder: (_, animation, __) {
                                        return ScaleTransition(
                                          scale: animation,
                                          child: DetailedPageCart(data: data,),
                                        );
                                      }));
                                },
                                child: Row(
                                  children: [
                                                               Container(
                                      color: Colors.grey,
                                      height: 150.0,
                                      width: 150.0,
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.fill,
                                          alignment: Alignment.topLeft,
                                          imageUrl: data['ImageUrl'].toString(),
                                          placeholder: (context, url) =>
                                          const CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Row(
                                                children: const [
                                                  Icon(Icons.error,
                                                      color: Colors.red),
                                                  Text(
                                                      'Check your internet connection')
                                                ],
                                              ),
                                        ),
                                      ),
                                    ),
                                    Wrap(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Column(
                                              children: [
                                                badges.Badge(

                                                  badgeContent: Text(
                                                    'New', style:
                                                  TextStyle(color: Colors.white,
                                                      fontSize: 7),),
                                                  // badgeColor: Colors.blueAccent,
                                                  // padding: EdgeInsetsDirectional
                                                     // .all(5.0),
                                                  position: BadgePosition
                                                      .topEnd(),
                                                  child: const Image(
                                                      height: 50,
                                                      width: 50,
                                                      image: AssetImage(
                                                          'assets/images/tag.png')),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .only(
                                                      bottom: 20.0),
                                                  child: Text(
                                                    data['product_Name'],
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontStyle:
                                                        FontStyle.italic,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    const Text(
                                                      'Region:',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                    Text(data['Region']),
                                                  ],
                                                ),

                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      color: Colors.red
                                                          .shade500,
                                                    ),
                                                    Text(
                                                      data['Seller_Loc'],
                                                      style: const TextStyle(
                                                          fontSize: 18.0),
                                                    ),
                                                  ],
                                                ),
                                                //for the price
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .only(
                                                      top: 20),
                                                  child: Row(
                                                    children: [
                                                      const Text(
                                                        'GH₵',
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),
                                                      Text(
                                                        data['Product_Price'],
                                                        style: const TextStyle(
                                                            fontSize: 18.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    const Text(
                                                      'Condition:',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.all(
                                                          15.0),
                                                      child:
                                                      Text(data['Condition']),
                                                    ),
                                                  ],
                                                ),

                                                Text(data['Negotiate']),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(

                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    border: Border.all(
                                        color: Colors.black
                                    )
                                ),
                                height: 50.0,
                                child: Row(


                                  children: [
                                    //Comment button ===================================
                                    ElevatedButton(onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Column(
                                              children: [
                                                SimpleDialog(
                                                  backgroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .all(
                                                        Radius.elliptical(
                                                            6, 7)),
                                                  ),
                                                  title: Center(
                                                      child: Text(
                                                          'COMMENT PAGE')),
                                                  children: [
                                                    TextFormField(
                                                      maxLines: 7,
                                                      controller: commentingPage,
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Please Enter your comment';
                                                        }
                                                        return null;
                                                      },
                                                      decoration: const InputDecoration(
                                                          labelText: 'Enter Your comment',
                                                          hintText: 'Enter your comment',

                                                          border: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 23.0,
                                                                  color: Colors
                                                                      .black))),
                                                    ),
                                                    IconButton(onPressed: () {
                                                      addComment(data.id);
                                                      Navigator.pop(context);
                                                      commentingPage.clear();
                                                    }, icon: Icon(Icons.send))
                                                  ],
                                                ),

                                              ],
                                            );
                                          });
                                    }, child: Icon(
                                        Icons.comment
                                    )),


                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.thumb_up_alt_outlined,
                                            color: Colors.blue, size: 30)),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 50),
                                      child: badges.Badge(
                                        badgeContent: const Text(
                                          '4', style: TextStyle(
                                            color: Colors.white
                                        ),),
                                        child: const Icon(
                                          Icons.remove_red_eye_outlined,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 50),
                                      child: IconButton(
                                          onPressed: null,
                                          icon: Icon(
                                            Icons.add_ic_call_sharp,
                                            color: Colors.green,
                                            size: 30,
                                          )),
                                    ),

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })
                  ],
                );
              }
            }
          },
        ));
  }
}
