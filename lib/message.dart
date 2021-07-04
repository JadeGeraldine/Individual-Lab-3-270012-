import 'package:flutter/material.dart';
import 'about.dart';
import 'dips.dart';
import 'login.dart';
import 'mainscreen.dart';
import 'mycart.dart';
import 'myprofile.dart';
import 'feedback.dart';
import 'user.dart';
import 'package:flutter/cupertino.dart';
 
class Messages extends StatefulWidget 
  {final User user;
   const Messages({Key key, this.user}) : super(key: key);
   
   @override
   _MessagesState createState() => _MessagesState();
  }

class ChatMessage{
  String messageContent;
  String messageType;
  ChatMessage({@required this.messageContent, @required this.messageType});
}

class _MessagesState extends State<Messages> 
  {List<ChatMessage> messages = 
    [ChatMessage(messageContent: "Hello! Can I ask questions regarding your dips?", messageType: "sender"),
     ChatMessage(messageContent: "Hi, there! Ask away. We love to help our customers.", messageType: "receiver"),
     ChatMessage(messageContent: "Are the dips homemade?", messageType: "sender"),
     ChatMessage(messageContent: "Yes, they are.", messageType: "receiver"),
     ChatMessage(messageContent: "The dips are homemade from scratch using only fresh organic ingredients.", messageType: "receiver"),
    ];

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
          ('MESSAGE TO ARTISANAL DIPS',
           style:TextStyle(fontFamily: 'Fredoka_One',
           fontSize:20)),
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
       body: Stack
        (children: <Widget>
          [Align
            (alignment: Alignment.bottomLeft,
             child: Container
              (padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
               height: 60,
               width: double.infinity,
               color: Colors.white70,
               child: Row
                (children: <Widget>
                  [SizedBox(width: 15),
                   Expanded
                    (child: TextField
                      (decoration: InputDecoration
                        (hintText: "Write message...",
                         hintStyle: TextStyle(color: Colors.black87),
                         border: InputBorder.none
                        ),
                      ),
                    ),
                   SizedBox(width: 15),
                   FloatingActionButton
                    (onPressed: (){},
                     child: Icon(Icons.send,color: Colors.white,size: 18,),
                     backgroundColor: Colors.green,
                     elevation: 0,
                    ),
                  ],
                ),
              ),
            ),

           ListView.builder
            (itemCount: messages.length,
             shrinkWrap: true,
             padding: EdgeInsets.only(top: 10,bottom: 10),
             physics: NeverScrollableScrollPhysics(),
             itemBuilder: (context, index)
              {return Container
                (padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                 child: Align
                  (alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                   child: Container
                    (decoration: BoxDecoration
                      (borderRadius: BorderRadius.circular(20),
                        color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.green[400]),
                      ),
                     padding: EdgeInsets.all(16),
                     child: Text(messages[index].messageContent, style: TextStyle(fontSize: 16),),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      );
    }
}