import 'package:flutter/material.dart';
import 'login.dart';
import 'mainscreen.dart';
import 'mycart.dart';
 
class About extends StatefulWidget 
  {@override
   _AboutState createState() => _AboutState();
  }

class _AboutState extends State<About> 
  {@override
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
          ('ABOUT',
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
             SizedBox(height:40),
             ListTile
              (title: Text("Dips",
                  style: TextStyle(fontFamily: 'Varela_Round',
                  fontSize:35)
                  ),
               onTap: ()
                {Navigator.push
                  (context, MaterialPageRoute(builder:(content)=>Mainscreen()));
                }
              ),
             SizedBox(height:40),
             ListTile
              (title: Text("My Cart",
                  style: TextStyle(fontFamily: 'Varela_Round',
                  fontSize:35)
                  ),
               onTap: ()
                {Navigator.push
                  (context, MaterialPageRoute(builder:(content)=>Mycart()));
                }
              ),
             SizedBox(height:40),
             ListTile
              (title: Text("About",
                  style: TextStyle(fontFamily: 'Varela_Round',
                  fontSize:35)
                  ),
               onTap: ()
                {Navigator.push
                  (context, MaterialPageRoute(builder:(content)=>About()));
                }
              ),
             SizedBox(height:40),
             ListTile
              (title: Text("Log Out",
                  style: TextStyle(fontFamily: 'Varela_Round',
                  fontSize:35)
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
          (child: SingleChildScrollView 
            (child: Column
              (children: 
                [Card
                  (elevation: 10,
                   shape: RoundedRectangleBorder
                    (borderRadius: BorderRadius.circular(50),
                    ),
                   color: Colors.white60,
                   child: 
                   Padding 
                    (padding: const EdgeInsets.fromLTRB(25, 5, 25, 15),
                     child: Column
                      (children:
                        [Text("Brand name :",
                              textAlign: TextAlign.center,  
                              style: TextStyle(fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                              color: Colors.green[900],
                              fontSize:20)),
                         Text("Artisanal Dips by Shari",
                              textAlign: TextAlign.center,  
                              style: TextStyle(fontFamily: 'Rajdhani',
                              fontWeight: FontWeight.bold,
                              fontSize:20)),
                         SizedBox(height:10),
                         Text("Product :",
                              textAlign: TextAlign.center,  
                              style: TextStyle(fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                              color: Colors.green[900],
                              fontSize:20)),
                         Text("Guacamole",
                              textAlign: TextAlign.center,  
                              style: TextStyle(fontFamily: 'Rajdhani',
                              fontWeight: FontWeight.bold,
                              fontSize:20)),
                         SizedBox(height:10),
                         Text("Ingredients :",
                              textAlign: TextAlign.center,  
                              style: TextStyle(fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                              color: Colors.green[900],
                              fontSize:20)),
                         Text("Fresh Avocado\nFresh Jalapeños\nFresh Roma Tomatoes\nFreshly squeezed key lime\nChopped coriander\nDiced red onion\nMinced Garlic\nFreshly grounded black and white pepper\nSmoked sea salt flakes",
                              textAlign: TextAlign.center,  
                              style: TextStyle(fontFamily: 'Rajdhani',
                              fontWeight: FontWeight.bold,
                              fontSize:20)),
                         SizedBox(height:10),
                         Text("Spices :",
                              textAlign: TextAlign.center,  
                              style: TextStyle(fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                              color: Colors.green[900],
                              fontSize:20)),
                         Text("Freshly grounded mixed spices\nDried mixed herbs",
                              textAlign: TextAlign.center,  
                              style: TextStyle(fontFamily: 'Rajdhani',
                              fontWeight: FontWeight.bold,
                              fontSize:20)),
                         SizedBox(height:10),
                         Text("Produced By: :",
                              textAlign: TextAlign.center,  
                              style: TextStyle(fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                              color: Colors.green[900],
                              fontSize:20)),
                         Text("Dawson’s Kitchen Co,\n11600, Penang Island\nMalaysia.",
                              textAlign: TextAlign.center,  
                              style: TextStyle(fontFamily: 'Rajdhani',
                              fontWeight: FontWeight.bold,
                              fontSize:20)),
                        ]
                      ),
                    ),
                  ),
                ],
              ),
            )
          ), 
      ),
      );
    }
  }