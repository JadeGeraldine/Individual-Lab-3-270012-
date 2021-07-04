import 'dart:convert';
import 'package:flutter/material.dart';
import 'about.dart';
import 'addfeed.dart';
import 'dips.dart';
import 'login.dart';
import 'mainscreen.dart';
import 'message.dart';
import 'mycart.dart';
import 'myprofile.dart';
import 'package:http/http.dart' as http;
import 'user.dart';

 
class FeedbackScreen extends StatefulWidget 
  {final User user;
   const FeedbackScreen({Key key, this.user}) : super(key: key);

   @override
   _FeedbackScreenState createState() => _FeedbackScreenState();
  }

class _FeedbackScreenState extends State<FeedbackScreen> 
  {List _feedList = [];
   String text = "";
   TextEditingController _searchController = new TextEditingController();
   
   @override
   void initState() 
    {super.initState();
     _loadFeed(_searchController.text);
     _searchFeed(_searchController.text);
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
          ('FEEDBACK',
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
          (margin: const EdgeInsets.fromLTRB(5,20,5,10),
           child: Column
            (children: 
              [TextFormField
                (controller: _searchController,
                 decoration: InputDecoration
                  (filled: true,
                   fillColor: Colors.white60,
                   hintText: "Search Email",
                   suffixIcon: IconButton
                    (onPressed: () => _searchFeed(_searchController.text),
                     icon: Icon(Icons.search),
                    ),
                   border: OutlineInputBorder
                    (borderRadius: BorderRadius.all(Radius.circular(50.0))
                    ),
                  ),
                ),
               _feedList == null
               ? Flexible(child: Center(child: Text("Empty")))
               :Flexible
                (child: Center
                  (child: ListView
                    (children:List.generate(_feedList.length, (index) 
                      {return Padding
                        (padding: EdgeInsets.fromLTRB(10,5,10,5),
                         child: Card
                          (shape: RoundedRectangleBorder
                            (borderRadius: BorderRadius.circular(20),
                            ),
                           color: Colors.white70,
                           child: Column
                            (children: 
                              [SizedBox(height: 10),
                               Text
                                (_feedList[index]['email'],
                                 style: TextStyle
                                  (fontSize: 16,
                                   fontFamily: 'Comfortaa',
                                   fontWeight: FontWeight.bold),
                                ),
                               SizedBox(height: 10),
                               Text
                                (_feedList[index]['datecomment'],
                                 style: TextStyle
                                  (fontSize: 16,
                                   fontFamily: 'Comfortaa',
                                   fontWeight: FontWeight.bold),
                                ),
                               SizedBox(height: 10),
                               Text
                                (_feedList[index]['feedback'],
                                 style: TextStyle
                                  (fontSize: 18,
                                   fontFamily: 'Comfortaa'),
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
              ]
            ),
          ),
        ),
       floatingActionButton: Container
        (height: 80.0,
         width: 80.0,
         child: FittedBox
          (child: FloatingActionButton
            (onPressed: () 
              {Navigator.push(context, MaterialPageRoute(builder: (content) => AddFeed(user: widget.user)));
              },
             child: const Icon(Icons.add, size:30.0),
             backgroundColor: Colors.green[900],
            ),
          ),
        ),
      ),
      );
    }

 void _loadFeed(String text)
  {http.post(Uri.parse("https://crimsonwebs.com/s270012/ArtisanalDips/php/loadfeed.php"),
   body: {"text":text}).then((response) 
    {print(response.body);
      if (response.body == "failed") 
        {Text('Press the button below to add review!',
            style: TextStyle(fontSize: 20),
            );
         return;
        } 
      else 
        {var jsondata = json.decode(response.body);
         _feedList = jsondata["feed"];

        }
     setState(() {});
     print(response.body);
    }
   );
  }

 void _searchFeed(String text) 
  {http.post(Uri.parse("https://crimsonwebs.com/s270012/ArtisanalDips/php/searchfeed.php"),
    body: {"email":text}).then((response) 
      {if (response.body == "failed") 
        {Text("No email review with that name.");
         _feedList = [];
         return;
        }
       else 
        {var jsondata = json.decode(response.body);
         print(jsondata);
         _feedList = jsondata["feed"];
        }
     setState(() {});
    });
  }
}