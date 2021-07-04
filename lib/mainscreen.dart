import 'package:flutter/material.dart';
import 'about.dart';
import 'dips.dart';
import 'feedback.dart';
import 'message.dart';
import 'mycart.dart';
import 'myprofile.dart';
import 'user.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
class Mainscreen extends StatefulWidget 
  {final User user;
   const Mainscreen({Key key, this.user}) : super(key: key);
    
   @override
   _MainscreenState createState() => _MainscreenState();
  }

class _MainscreenState extends State<Mainscreen> 
  {String email = "";
   SharedPreferences prefs;
   
   @override
   void initState() 
    {super.initState();
     _loadPref();
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
          ('HOME',
           style:TextStyle(fontFamily: 'Fredoka_One',
           fontSize:30)),
         backgroundColor: Colors.green[900]
        ),
       body: Center
        (child: SingleChildScrollView
          (child: Column
            (children: 
              [SizedBox(height:10),
               MaterialButton
                (shape: RoundedRectangleBorder
                  (borderRadius: BorderRadius.circular(5),),
                 minWidth: 300,
                 height: 100,
                 child: Text('Dips', 
                    style: TextStyle (fontFamily: 'Varela_Round', 
                    fontSize:35,
                    color: Colors.black)
                    ),
                 onPressed: () 
                  {Navigator.push
                    (context, MaterialPageRoute(builder:(content)=>Dips(user: widget.user)));
                  },
                 color: Colors.orange[100]
                ),
               SizedBox(height:10),
               MaterialButton
                (shape: RoundedRectangleBorder
                  (borderRadius: BorderRadius.circular(5),),
                 minWidth: 300,
                 height: 100,
                 child: Text('My Cart', 
                    style: TextStyle (fontFamily: 'Varela_Round', 
                    fontSize:35,
                    color: Colors.black)
                    ),
                 onPressed: () 
                  {Navigator.push
                    (context, MaterialPageRoute(builder:(content)=>Mycart(user: widget.user)));
                  },
                 color: Colors.yellow[100]
                ),
               SizedBox(height:10),
               MaterialButton
                (shape: RoundedRectangleBorder
                  (borderRadius: BorderRadius.circular(5),),
                 minWidth: 300,
                 height: 100,
                 child: Text('Feedback', 
                    style: TextStyle (fontFamily: 'Varela_Round', 
                    fontSize:35,
                    color: Colors.black)
                    ),
                 onPressed: () 
                  {Navigator.push
                    (context, MaterialPageRoute(builder:(content)=>FeedbackScreen(user: widget.user)));
                  },
                 color: Colors.green[100]
                ),
               SizedBox(height:10),
               MaterialButton
                (shape: RoundedRectangleBorder
                  (borderRadius: BorderRadius.circular(5),),
                 minWidth: 300,
                 height: 100,
                 child: Text('Messages', 
                    style: TextStyle (fontFamily: 'Varela_Round', 
                    fontSize:35,
                    color: Colors.black)
                    ),
                 onPressed: () 
                  {Navigator.push
                    (context, MaterialPageRoute(builder:(content)=>Messages(user: widget.user)));
                  },
                 color: Colors.blue[100]
                ),
               SizedBox(height:10),
               MaterialButton
                (shape: RoundedRectangleBorder
                  (borderRadius: BorderRadius.circular(5),),
                 minWidth: 300,
                 height: 100,
                 child: Text('About', 
                    style: TextStyle (fontFamily: 'Varela_Round', 
                    fontSize:35,
                    color: Colors.black)
                    ),
                 onPressed: () 
                  {Navigator.push
                    (context, MaterialPageRoute(builder:(content)=>About(user: widget.user)));
                  },
                 color: Colors.purple[100]
                ),
               SizedBox(height:10),
               MaterialButton
                (shape: RoundedRectangleBorder
                  (borderRadius: BorderRadius.circular(5),),
                 minWidth: 300,
                 height: 100,
                 child: Text('My Profile', 
                    style: TextStyle (fontFamily: 'Varela_Round', 
                    fontSize:35,
                    color: Colors.black)
                    ),
                 onPressed: () 
                  {Navigator.push
                    (context, MaterialPageRoute(builder:(content)=>MyProfile(user: widget.user)));
                  },
                 color: Colors.pink[100]
                ),
               SizedBox(height:10),
              ],
            ),
          ),
        ),
      ),
      );
    }
 
 Future<void> _loadPref() async 
  {prefs = await SharedPreferences.getInstance();
   email = prefs.getString("email") ?? '';
   print(email);
  }
}