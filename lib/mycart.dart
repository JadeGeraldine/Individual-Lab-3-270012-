import 'package:flutter/material.dart';
import 'about.dart';
import 'dips.dart';
import 'feedback.dart';
import 'login.dart';
import 'mainscreen.dart';
import 'message.dart';
import 'myprofile.dart';
import 'checkout.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'user.dart';

 
class Mycart extends StatefulWidget 
  {final User user;
   const Mycart ({Key key, this.user}) : super(key:key);
    
   @override
   _MycartState createState() => _MycartState();
  }

class _MycartState extends State<Mycart> 
  {List _itemList = [];
   double _total = 0.0;
    
   @override
   void initState() 
    {super.initState();
     _loadCart();
    }

   @override
   Widget build(BuildContext context) 
    {return Container
      (decoration: new BoxDecoration
        (gradient: new LinearGradient
          (begin: Alignment.topLeft,
           end: Alignment.bottomRight,
           stops: [0.3,1],
           colors: [Colors.green[200],
                    Colors.red[200]
                   ],
          ),
        ),
     child: Scaffold
      (backgroundColor: Colors.transparent,
       appBar: AppBar
        (centerTitle: true,
         title: Text
          ('MY CART',
           style:TextStyle(fontFamily: 'Fredoka_One',
           fontSize:30)),
         backgroundColor: Colors.green[900]
        ),
       drawer: Theme
        (data: Theme.of(context).copyWith(
          canvasColor: Colors.red[100],),
         child: Drawer
        (child: ListView
          (children: 
            [DrawerHeader
              (child: Align
                (alignment: Alignment.center,
                 child: Text
                  ("MENU",
                   textAlign: TextAlign.center,  
                   style: TextStyle(fontFamily: 'Fredoka_One',
                   fontSize:60)),
                ),
               decoration: BoxDecoration
                (color: Colors.green[100])
              ),
             SizedBox(height:5),
             ListTile
              (title: Text("Home",
                  style: TextStyle(fontFamily: 'Varela_Round',
                  fontSize:25)
                  ),
               onTap: ()
                {Navigator.push
                  (context, MaterialPageRoute(builder:(content)=>Mainscreen(user: widget.user)));
                }
              ),
             SizedBox(height:5),
             ListTile
              (title: Text("Dips",
                  style: TextStyle(fontFamily: 'Varela_Round',
                  fontSize:25)
                  ),
               onTap: ()
                {Navigator.push
                  (context, MaterialPageRoute(builder:(content)=>Dips(user: widget.user)));
                }
              ),
             SizedBox(height:5),
             ListTile
              (title: Text("My Cart",
                  style: TextStyle(fontFamily: 'Varela_Round',
                  fontSize:25)
                  ),
               onTap: ()
                {Navigator.push
                  (context, MaterialPageRoute(builder:(content)=>Mycart(user: widget.user)));
                }
              ),
             SizedBox(height:5),
             ListTile
              (title: Text("Feedback",
                  style: TextStyle(fontFamily: 'Varela_Round',
                  fontSize:25)
                  ),
               onTap: ()
                {Navigator.push
                  (context, MaterialPageRoute(builder:(content)=>FeedbackScreen(user: widget.user)));
                }
              ),
             SizedBox(height:5),
             ListTile
              (title: Text("Messages",
                  style: TextStyle(fontFamily: 'Varela_Round',
                  fontSize:25)
                  ),
               onTap: ()
                {Navigator.push
                  (context, MaterialPageRoute(builder:(content)=>Messages(user: widget.user)));
                }
              ),
             SizedBox(height:5),
             ListTile
              (title: Text("About",
                  style: TextStyle(fontFamily: 'Varela_Round',
                  fontSize:25)
                  ),
               onTap: ()
                {Navigator.push
                  (context, MaterialPageRoute(builder:(content)=>About(user: widget.user)));
                }
              ),
             SizedBox(height:5),
             ListTile
              (title: Text("My Profile",
                  style: TextStyle(fontFamily: 'Varela_Round',
                  fontSize:25)
                  ),
               onTap: ()
                {Navigator.push
                  (context, MaterialPageRoute(builder:(content)=>MyProfile(user: widget.user)));
                }
              ),
             SizedBox(height:5),
             ListTile
              (title: Text("Log Out",
                  style: TextStyle(fontFamily: 'Varela_Round',
                  fontSize:25)
                  ),
               onTap: ()
                {Navigator.push
                  (context, MaterialPageRoute(builder:(content)=>Login()));
                }
              )
            ],
          )
        ),
        ),
       body: Center
        (child: Container
          (margin: const EdgeInsets.fromLTRB(30,20,30,10),
           child: Column
            (children: 
              [_itemList == null
               ? Flexible(child: Center(child: Text("Empty")))
               :Flexible
                (child: Center
                  (child: ListView
                    (children:List.generate(_itemList.length, (index) 
                      {return Padding
                        (padding: EdgeInsets.all(5),
                         child: Card
                          (shape: RoundedRectangleBorder
                            (borderRadius: BorderRadius.circular(50),
                            ),
                           color: Colors.white70,
                           child: Column
                            (children: 
                              [Container
                                (child: ClipRRect
                                  (borderRadius: BorderRadius.circular(50),
                                   child: Image.network(_itemList[index]['image'])
                                  ),
                                ),
                               SizedBox(height: 10),
                               Text
                                (_itemList[index]['name'],
                                 style: TextStyle
                                  (fontSize: 16,
                                   fontFamily: 'Comfortaa',
                                   fontWeight: FontWeight.bold),
                                ),
                               Row
                                (mainAxisAlignment: MainAxisAlignment.center,
                                 children: 
                                  [IconButton(icon: Icon(Icons.remove),
                                    onPressed: () {_qty(index, "remove");},
                                    ),
                                   Text(_itemList[index]['quantity'],
                                    style: TextStyle(fontSize: 18,),
                                    ),
                                   IconButton(icon: Icon(Icons.add),
                                    onPressed: () {_qty(index, "add");},
                                    ),

                                   Text
                                    ("Price: RM " + (int.parse(_itemList[index]['quantity'])*double.parse(_itemList[index]['price'])).toStringAsFixed(2),
                                     style: TextStyle
                                      (fontSize: 20,
                                       fontFamily: 'Comfortaa'),
                                    ),

                                   Expanded
                                    (child: Column
                                      (children: 
                                        [IconButton
                                          (icon: Icon(Icons.delete),
                                           onPressed: () {_delete(index);},
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                               SizedBox(height: 10),
                              ],
                            ),
                          ),
                        );
                      }
                    ),
                    ),
                  ),
                ),
               Container
                (padding: EdgeInsets.fromLTRB(20,5,20,5),
                 child: Row
                  (mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children:
                    [SizedBox(height:5),
                     Divider
                      (color: Colors.red,
                       height: 1,
                       thickness: 10.0,
                      ),
                     Text 
                      ("TOTAL: RM " + _total.toStringAsFixed(2),
                       style: TextStyle
                        (fontSize: 22,
                         fontFamily: 'Fredoka_One'), 
                      ),
                     ElevatedButton
                      (onPressed: () {_checkOut();},
                       child: Text ("CHECKOUT"),
                       style: ElevatedButton.styleFrom(primary: Colors.red,),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ),
        ),
        ),
      );
    }


  _loadCart() 
    {http.post(Uri.parse("https://crimsonwebs.com/s270012/ArtisanalDips/php/loadcart.php"),
     body: {"email": widget.user.email}).then((response) 
      {print(response.body);
       if (response.body == "failed") 
        {Text("No item added.",
             textAlign: TextAlign.center,
             style: TextStyle(fontSize: 20)
            );
         _itemList = [];
         return;
        } 
       else 
        {var jsondata = json.decode(response.body);
         print(jsondata);
         _itemList = jsondata["cart"];
         _total = 0.0;
         for (int i = 0; i < _itemList.length; i++) 
          {_total = _total + double.parse(_itemList[i]['price']) * int.parse(_itemList[i]['quantity']);
          }
        }
       setState(() {});
      }
     );
    }

  void _qty(int index, String s) 
    {http.post(Uri.parse("https://crimsonwebs.com/s270012/ArtisanalDips/php/updatecart.php"),
     body: 
      {"email": widget.user.email,
       "op": s,
       "id": _itemList[index]['id'],
       "quantity": _itemList[index]['quantity']
      }).then((response) 
        {print(response.body);
         if (response.body == "success") 
          {Fluttertoast.showToast
            (msg: "Item Updated",
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.CENTER,
             timeInSecForIosWeb: 1,
             backgroundColor: Colors.green,
             textColor: Colors.white,
             fontSize: 18.0);
           _loadCart();
          } 
         else 
          {Fluttertoast.showToast
            (msg: "Item Update Failed",
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.CENTER,
             timeInSecForIosWeb: 1,
             backgroundColor: Colors.red,
             textColor: Colors.white,
             fontSize: 18.0);
          }
        }
      );
    }

  void _deleteCart(int index) 
    {http.post(Uri.parse("https://crimsonwebs.com/s270012/ArtisanalDips/php/removecart.php"),
     body: 
      {"email": widget.user.email,
       "id": _itemList[index]['id']
      }).then((response) 
        {print(response.body);
         if (response.body == "success") 
          {Fluttertoast.showToast
            (msg: "Item Removed",
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.CENTER,
             timeInSecForIosWeb: 1,
             backgroundColor: Colors.green,
             textColor: Colors.white,
             fontSize: 18.0);
           _loadCart();
           return;
          } 
         else 
          {Fluttertoast.showToast
            (msg: "Item Remove Failed",
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.CENTER,
             timeInSecForIosWeb: 1,
             backgroundColor: Colors.red,
             textColor: Colors.white,
             fontSize: 18.0);
          }
        }
      );
    }

  void _delete(int index) 
    {showDialog
      (builder: (context) => new AlertDialog
        (shape: RoundedRectangleBorder
          (borderRadius: BorderRadius.all(Radius.circular(10.0))),
         title: Text('ITEM REMOVAL',
                style: TextStyle(fontFamily: 'Fredoka_One', 
                fontStyle: FontStyle.italic,
                color: Colors.blue,
                fontSize:22)),
         content: Text("Remove item from cart?",
           style: TextStyle(fontSize:20)),
         actions: <Widget>
          [TextButton
            (child: Text("Yes",
                    style: TextStyle(color: Colors.green[700],
                    fontFamily: 'Varela_Round',
                    fontSize: 18)),
             onPressed: () {Navigator.of(context).pop();
              _deleteCart(index);},
            ),
           TextButton
            (child: Text("No",
                    style: TextStyle(color: Colors.red[700],
                    fontFamily: 'Varela_Round',
                    fontSize: 18)),
             onPressed: () {Navigator.of(context).pop();}
            ),
          ]
        ),
       context: context
      );
    }
   
  void _checkOut() 
    {if (_total == 0.0) 
      {Fluttertoast.showToast
        (msg: "Cart is empty. Please add item(s).",
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.CENTER,
         timeInSecForIosWeb: 1,
         backgroundColor: Colors.red,
         textColor: Colors.white,
         fontSize: 18.0);
         return;
      } 
     else 
      {showDialog
        (builder: (context) => new AlertDialog
          (shape: RoundedRectangleBorder
            (borderRadius: BorderRadius.all(Radius.circular(10.0))),
           title: Text('CHECKOUT',
                  style: TextStyle(fontFamily: 'Fredoka_One', 
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                  fontSize:22)),
           content: Text("Confirm checkout?",
            style: TextStyle(fontSize:20)),
           actions: <Widget>
            [TextButton
              (child: Text("Yes",
                      style: TextStyle(color: Colors.green[700],
                      fontFamily: 'Varela_Round',
                      fontSize: 18)),
               onPressed: () async 
                {Navigator.of(context).pop();
                 await Navigator.of(context).push(MaterialPageRoute(builder: (context) => Checkout(user:widget.user, total: _total),),);
                },
              ),
             TextButton
              (child: Text("No",
                      style: TextStyle(color: Colors.red[700],
                      fontFamily: 'Varela_Round',
                      fontSize: 18)),
               onPressed: () {Navigator.of(context).pop();}
              ),
            ]
          ),
         context: context
        );
      }
    }
  }