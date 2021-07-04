import 'package:flutter/material.dart';
import 'about.dart';
import 'dips.dart';
import 'feedback.dart';
import 'login.dart';
import 'mainscreen.dart';
import 'message.dart';
import 'mycart.dart';
import 'myprofile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'user.dart';

 
class AddFeed extends StatefulWidget 
  {final User user;
   const AddFeed({Key key, this.user}) : super(key: key);

   @override
   _AddFeedState createState() => _AddFeedState();
  }

class _AddFeedState extends State<AddFeed> 
  {final _focus = FocusNode();
   TextEditingController _descCtrl = new TextEditingController();
   
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
       floatingActionButton: Visibility
        (child: FloatingActionButton.extended
          (label: Text('Post', style: TextStyle(fontSize: 20)),
           onPressed: () {_postfeedback();},
           icon: Icon(Icons.add),
           backgroundColor: Colors.green[900],
          )
        ),
       body: Center
        (child: Container
          (child: Padding
            (padding: EdgeInsets.fromLTRB(20,5,20,5),
             child: SingleChildScrollView
              (child: Column
                (children:
                  [Text("Post a review/feedback",
                    style: TextStyle(fontFamily: 'Varela_Round', 
                      fontSize:25,
                      fontWeight: FontWeight.bold)
                    ),
                   SizedBox(height:5),
                   TextFormField
                    (style: TextStyle (fontSize: 22),
                     focusNode: _focus,
                     controller: _descCtrl,
                     minLines: 5,
                     maxLines: 5,
                     keyboardType: TextInputType.multiline,
                    ),
                  ],
                )
              )
            ),
          ),
        ),
      ),
      );
    }

 void _postfeedback() 
  {if (_descCtrl.text.toString() == "") 
    {Fluttertoast.showToast
      (msg: "Review/Feedback is empty!",
       toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.CENTER,
       timeInSecForIosWeb: 1,
       backgroundColor: Colors.red,
       textColor: Colors.white,
       fontSize: 18.0);
     return;
    }
   showDialog
    (context: context,
     builder: (BuildContext context) 
      {return AlertDialog
        (shape: RoundedRectangleBorder
          (borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
         title: Text("POST REVIEW/FEEDBACK",
                  style: TextStyle(fontFamily: 'Fredoka_One', 
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                  fontSize:22)),
         content: Text("Confirm?",
           style: TextStyle(fontSize:20)),
         actions: 
          [TextButton
            (child: 
              Text("Yes",
                   style: TextStyle(color: Colors.green[700],
                   fontFamily: 'Varela_Round',
                   fontSize: 18)
                  ),
             onPressed: ()
              {Navigator.of(context).pop();
               _postconfirm();
              },
            ),
           TextButton
            (child: 
              Text("Cancel",
                   style: TextStyle(color: Colors.red[700],
                   fontFamily: 'Varela_Round',
                   fontSize: 18)
                  ),
             onPressed: () 
              {Navigator.of(context).pop();}
            ),
          ],
        );
      }
    );
  }

 Future<void> _postconfirm() async 
  {String desc = _descCtrl.text.toString();
   print(desc);
   http.post(Uri.parse("https://crimsonwebs.com/s270012/ArtisanalDips/php/addfeed.php"),
    body: 
      {"email": widget.user.email,
       "feedback": desc,
      }).then((response) 
        {print(response.body);
         if (response.body == "success") 
          {Fluttertoast.showToast
            (msg: "Review posted successfully.",
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.TOP,
             timeInSecForIosWeb: 1,
             backgroundColor: Colors.green,
             textColor: Colors.white,
             fontSize: 18.0);
           setState(() {_descCtrl.text = "";});
           Navigator.push(context,MaterialPageRoute(builder: (content) => FeedbackScreen
            (user: widget.user,
            )));
          } 
         else
          {Fluttertoast.showToast
            (msg: "Review post failed",
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.TOP,
             timeInSecForIosWeb: 1,
             backgroundColor: Colors.red,
             textColor: Colors.white,
             fontSize: 18.0);
          }
        }
      );
    }
}