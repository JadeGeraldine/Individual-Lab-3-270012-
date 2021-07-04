import 'package:flutter/material.dart';
import 'details.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'mycart.dart';
import 'user.dart';

class Pay extends StatefulWidget 
  {final Details details;
   final User user;
   const Pay({Key key, this.details, this.user}) : super(key: key);
  
   @override
   _PayState createState() => _PayState();
  }

class _PayState extends State<Pay> 
  {Completer<WebViewController> _controller = Completer<WebViewController>();

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
        (leading: IconButton
          (icon: Icon(Icons.arrow_back, color: Colors.white),
           onPressed: () => Navigator.push
            (context, MaterialPageRoute(builder:(content)=>Mycart(user: widget.user))),
          ),
         centerTitle: true,
         title: Text
          ('CHECKOUT',
           style:TextStyle(fontFamily: 'Fredoka_One',
           fontSize:30)),
         backgroundColor: Colors.green[900]
        ),
       body: Center
        (child: Container
          (child: Column
            (children: 
              [Expanded
                (child: WebView
                  (initialUrl: 'https://crimsonwebs.com/s270012/ArtisanalDips/php/bill.php?email='
                    + widget.details.email
                    + '&mobile='
                    + widget.details.phone
                    + '&name='
                    + widget.details.name   
                    + '&amount='
                    + widget.details.amount,
                                   
                   javascriptMode: JavascriptMode.unrestricted,
                   onWebViewCreated: (WebViewController webViewController)
                    {_controller.complete(webViewController);}
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
      );
    }
  }