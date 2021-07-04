import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'about.dart';
import 'dips.dart';
import 'feedback.dart';
import 'login.dart';
import 'mainscreen.dart';
import 'message.dart';
import 'mycart.dart';
import 'package:http/http.dart' as http;
import 'user.dart';
 
class MyProfile extends StatefulWidget 
  {final User user;
   const MyProfile({Key key, this.user}) : super(key: key);

   @override
   _MyProfileState createState() => _MyProfileState();
  }

class _MyProfileState extends State<MyProfile> 
  {List _userList = [];
   bool _obscureText = true;

   @override
   void initState() 
    {super.initState();
     _loadUser();
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
          ('MY PROFILE',
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
          (margin: const EdgeInsets.fromLTRB(5,50,5,10),
           child: Column
            (children: 
              [_userList == null
               ? Flexible(child: Center(child: Text("Empty")))
               :Flexible
                (child: Center
                  (child: ListView
                    (children:List.generate(_userList.length, (index) 
                      {return Padding
                        (padding: EdgeInsets.fromLTRB(10,30,10,5),
                         child: Column
                            (children: 
                              [Text 
                                ("EMAIL", 
                                 style: TextStyle
                                  (fontSize: 30, 
                                   fontWeight: FontWeight.bold),
                                ),
                               SizedBox(height: 10),

                               Text
                                (widget.user.email,
                                 style: TextStyle
                                  (fontSize: 25,
                                   fontFamily: 'Comfortaa',
                                   fontWeight: FontWeight.bold),
                                ),
                               SizedBox(height: 20),

                               Text 
                                ("NAME", 
                                 style: TextStyle
                                  (fontSize: 30, 
                                   fontWeight: FontWeight.bold),
                                  ),
                               SizedBox(height: 10),

                               Text
                                (_userList[index]['name'],
                                 style: TextStyle
                                  (fontSize: 25,
                                   fontFamily: 'Comfortaa',
                                   fontWeight: FontWeight.bold),
                                ),
                               SizedBox(height: 20),

                               Text 
                                ("PHONE NUMBER", 
                                 style: TextStyle
                                  (fontSize: 30, 
                                   fontWeight: FontWeight.bold),
                                  ),
                               SizedBox(height: 10),

                               Text
                                (_userList[index]['phone'],
                                 style: TextStyle
                                  (fontSize: 25,
                                   fontFamily: 'Comfortaa',
                                   fontWeight: FontWeight.bold),
                                ),
                               SizedBox(height: 60),

                               MaterialButton
                                (shape: RoundedRectangleBorder
                                  (borderRadius: BorderRadius.circular(5),),
                                 minWidth: 300,
                                 height: 80,
                                 child: Text('CHANGE PASSWORD', style: TextStyle
                                  (fontFamily: 'Fredoka_One', 
                                   fontSize:25,
                                   color: Colors.white)
                                  ),
                                 onPressed: _changePassword,
                                 color: Colors.green[900]
                                ),
                              ],
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
      ),
      );
    }

  void _loadUser()
    {http.post(Uri.parse("https://crimsonwebs.com/s270012/ArtisanalDips/php/loaduser.php"),
     body: {"email":widget.user.email}).then((response) 
      {print(response.body);
       if (response.body == "failed") 
        {Text('Press the button below to add review!',
            style: TextStyle(fontSize: 20),
            );
         return;
        } 
       else 
        {var jsondata = json.decode(response.body);
         _userList = jsondata["user"];
        }
      setState(() {});
      print(response.body);
      }
    );
    }

  void _changePassword() 
    {TextEditingController _passwordcontroller = TextEditingController();
     showDialog
      (context: context, 
       builder: (BuildContext context)
        {return AlertDialog
          (shape: RoundedRectangleBorder
            (borderRadius: BorderRadius.circular(50),
            ),
           title: Text("CHANGE PASSWORD", 
                  style: TextStyle(fontFamily: 'Fredoka_One', 
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                  fontSize:22)),
           content: new Container
            (height: 100,
             child: Column
              (children: 
                [Text('Enter new password',
                   style: TextStyle(fontSize:20)),
                 TextField
                  (controller: _passwordcontroller,
                   decoration: InputDecoration
                    (labelText: 'Password', 
                     labelStyle: TextStyle
                      (fontFamily: 'Zilla_Slab', 
                       fontSize:20
                      ),
                     icon: Icon(Icons.lock),
                     suffix: InkWell
                      (onTap: _toggle,
                       child: Icon(Icons.visibility),
                      ),
                    ),
                   style: TextStyle(fontSize:20),
                   obscureText: _obscureText,
                  ),
                ],
              )
            ),
           actions: 
            [TextButton
              (child: 
                Text("Submit", 
                     style: TextStyle(color: Colors.green[700],
                     fontFamily: 'Varela_Round',
                     fontSize: 18)
                    ), 
                onPressed: ()
                  {Navigator.of(context).pop();
                   _password(_passwordcontroller.text.toString());
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
                  {Navigator.of(context).pop();
                  },
              ),
            ],
          );
        }
      );
    }
  
  Future<void> _password(String password) async 
  {http.post(Uri.parse("https://crimsonwebs.com/s270012/ArtisanalDips/php/changepassword.php"),
    body: 
      {"email": widget.user.email,
       "password": password,
      }).then((response) 
        {print(response.body);
         if (response.body == "failed") 
          {Fluttertoast.showToast
            (msg: "Password change failed.",
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.TOP,
             timeInSecForIosWeb: 1,
             backgroundColor: Colors.red,
             textColor: Colors.white,
             fontSize: 18.0);
          } 
         else
          {Fluttertoast.showToast
            (msg: "Password changed successfully.",
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.TOP,
             timeInSecForIosWeb: 1,
             backgroundColor: Colors.green,
             textColor: Colors.white,
             fontSize: 18.0);
           setState(() {password = "";});
           Navigator.push(context,MaterialPageRoute(builder: (content) => Login
            (user: widget.user,
            )));
          }
        }
      );
    }

  void _toggle() 
    {setState(() 
      {_obscureText = !_obscureText;
      });
    }
}