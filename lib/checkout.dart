import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'details.dart';
import 'pay.dart';
import 'user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';

class Checkout extends StatefulWidget 
  {final User user;
   final double total;

   const Checkout({Key key, this.user, this.total}) : super(key: key);
  
   @override
   _CheckoutState createState() => _CheckoutState();
  }

class _CheckoutState extends State<Checkout> 
  {int _radioValue = 0;
   String _delivery = "Pickup";
   bool _statusdelivery = false;
   bool _statuspickup = true;
   String _selectedtime = "09:00 A.M";
   String _currentTime = "";
   String _name = "Enter receiver name";
   String _phone = "Enter receiver phone number";
   TextEditingController nameController = new TextEditingController();
   TextEditingController phoneController = new TextEditingController();
   TextEditingController _userlocctrl = new TextEditingController();
   String address = "";
   double screenHeight, screenWidth;
   SharedPreferences pref;

   @override
   void initState() 
    {super.initState();
     final now = new DateTime.now();
     _currentTime = DateFormat("Hm").format(now);
     int convertmin = _convMin(_currentTime);
     _selectedtime = _minToTime(convertmin);
     _loadPreferences();
    }
    
   @override
   Widget build(BuildContext context) 
    {screenHeight = MediaQuery.of(context).size.height;
     screenWidth = MediaQuery.of(context).size.width;

     return Container
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
          ('CHECKOUT',
           style:TextStyle(fontFamily: 'Fredoka_One',
           fontSize:30)),
         backgroundColor: Colors.green[900]
        ),
       body: Column
            (children: 
              [Expanded
                (flex: 7,
                 child: ListView
                  (padding: EdgeInsets.only(top: 0),
                   children:
                    [Container
                                (margin: EdgeInsets.all(10),
                                 child: Padding
                                  (padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                   child: Column
                                    (children: 
                                      [SizedBox(height: 10),
                                       Text("CUSTOMER DETAILS", style: TextStyle
                                        (fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                       SizedBox(height: 5),
                                      
                                       Row
                                        (children: 
                                          [Expanded
                                            (flex: 3, 
                                             child: Text("Email:", style: TextStyle
                                              (fontSize:18,
                                               fontFamily: 'Comfortaa',
                                              )),
                                            ),
                                           Container
                                            (height: 30,
                                             child: VerticalDivider(color: Colors.grey[700])),
                                           Expanded
                                            (flex: 7,
                                             child: Text(widget.user.email, style: TextStyle
                                              (fontSize:18,
                                               fontFamily: 'Comfortaa',
                                              )),
                                            ),
                                          ],
                                        ),
                         
                                       Row
                                        (children: 
                                          [Expanded
                                            (flex: 3, 
                                             child: Text("Name:", style: TextStyle
                                              (fontSize:18,
                                               fontFamily: 'Comfortaa',
                                              )),
                                            ),
                                           Container
                                            (height: 30,
                                             child: VerticalDivider(color: Colors.grey[700])),
                                           Expanded
                                            (flex: 7,
                                             child: GestureDetector
                                              (onTap: () => {insertName()},
                                               child: Text(_name, style: TextStyle
                                                (fontSize:16,
                                                 fontFamily: 'Comfortaa',
                                                 fontStyle: FontStyle.italic,
                                                ))
                                              ),
                                            ),
                                          ],
                                        ),
                        
                                       Row
                                        (children: 
                                          [Expanded
                                            (flex: 3, 
                                             child: Text("Phone:", style: TextStyle
                                              (fontSize:18,
                                               fontFamily: 'Comfortaa',
                                              )),
                                            ),
                                           Container
                                            (height: 35,
                                             child: VerticalDivider(color: Colors.grey[700])),
                                           Expanded
                                            (flex: 7,
                                             child: GestureDetector
                                              (onTap: () => {insertPhone()},
                                               child: Text(_phone, style: TextStyle
                                                (fontSize:16,
                                                 fontFamily: 'Comfortaa',
                                                 fontStyle: FontStyle.italic,
                                                ))
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                               Divider
                                (color: Colors.grey[700],
                                 height: 3,
                                ),
                               Container
                                (margin: EdgeInsets.all(10),
                                 child: Padding
                                  (padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                   child: Column
                                    (children: 
                                      [Text("DELIVERY METHOD", style: TextStyle
                                        (fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                        
                                       Row
                                        (mainAxisAlignment: MainAxisAlignment.center,
                                         children: 
                                          [Text("Pickup", style: TextStyle
                                            (fontSize:18,
                                             fontFamily: 'Comfortaa',
                                            )),
                                           new Radio
                                            (value: 0,
                                             groupValue: _radioValue,
                                             onChanged: (int value) {_radiobutton(value);},
                                            ),

                                           Text("Delivery", style: TextStyle
                                            (fontSize:18,
                                             fontFamily: 'Comfortaa',
                                            )),
                                           new Radio
                                            (value: 1,
                                             groupValue: _radioValue,
                                             onChanged: (int value) {_radiobutton(value);},
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                               Divider
                                (color: Colors.grey[800],
                                 height: 3,
                                ),
                               Visibility
                                (visible: _statuspickup,
                                 child: Container
                                  (margin: EdgeInsets.all(10),
                                   child: Padding
                                    (padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                     child: Column
                                      (children: 
                                        [Text("PICKUP TIME", style: TextStyle
                                          (fontSize: 20, fontWeight: FontWeight.bold),
                                          ),

                                         Container
                                          (margin: EdgeInsets.all(10),
                                           width: 300,
                                           child: Text("Pickup time daily from 9.00 AM to 9.00 PM from our location.",
                                            textAlign: TextAlign.center,
                                            style: TextStyle
                                              (fontSize:18,
                                               fontFamily: 'Comfortaa',
                                              ),
                                            ),
                                          ),
                          
                                         Row
                                          (mainAxisAlignment: MainAxisAlignment.center,
                                           children: 
                                            [Expanded
                                              (flex: 5,
                                               child: Text("Set Pickup Time:", style: TextStyle
                                                (fontSize:18,
                                                 fontFamily: 'Comfortaa',
                                                )),
                                              ),
                                             Container
                                              (height: 40,
                                               child: VerticalDivider(color: Colors.grey[800])),
                                             Expanded
                                              (flex: 4,
                                               child: Container
                                                (child: Row
                                                  (children: 
                                                    [Text(_selectedtime, style: TextStyle
                                                      (fontSize:18,
                                                       fontFamily: 'Comfortaa',
                                                      )),
                                                     Container
                                                      (child: IconButton
                                                        (iconSize: 32,
                                                         icon: Icon(Icons.timer),
                                                         onPressed: () => {_selectTime(context)}
                                                        )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                               Visibility
                                (visible: _statusdelivery,
                                 child: Container
                                  (padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                   child: Padding
                                    (padding: const EdgeInsets.all(5.0),
                                     child: Column
                                      (children: 
                                        [Text("DELIVERY ADDRESS", style: TextStyle
                                          (fontSize: 20, fontWeight: FontWeight.bold),
                                          ),
                                         SizedBox(height: 10),
                          
                                         Row
                                          (children: 
                                            [Expanded
                                              (flex: 6,
                                               child: Column
                                                (children: 
                                                  [TextField
                                                    (controller: _userlocctrl,
                                                     style: TextStyle(fontSize: 18),
                                                     decoration: InputDecoration
                                                      (border: OutlineInputBorder(),
                                                       hintText: 'Enter address'),
                                                     keyboardType: TextInputType.multiline,
                                                     minLines: 4, 
                                                     maxLines: 4, 
                                                    ),
                                                  ],
                                                )
                                              ),
                                             Container
                                              (height: 120,
                                               child: VerticalDivider(color: Colors.grey)
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                               Divider
                                (color: Colors.grey[800],
                                 height: 4,
                                ),
                               SizedBox(height: 10),
                               Container
                                (child: Column
                                  (children: 
                                    [Text 
                                      ("TOTAL: RM " + widget.total.toStringAsFixed(2),
                                         style: TextStyle
                                          (fontSize: 22,
                                           fontFamily: 'Fredoka_One'), 
                                      ),
                                    
                                     Container
                                      (width: screenWidth / 2.5,
                                       child: ElevatedButton
                                        (onPressed: () {_paynow();},
                                         child: Text("PAY NOW"),
                                         style: ElevatedButton.styleFrom(primary: Colors.red,),
                                        ),
                                      )
                                    ],
                                  )
                                )
                    ]
                  ),      
                ),
              ]
            ),
      ),
      );
    }



void _radiobutton(int value) 
  {setState(() 
    {_radioValue = value;
     switch (_radioValue) 
      {case 0:
          _delivery = "Pickup";
          _statusdelivery = false;
          _statuspickup = true;
          pickupTime();
          break;
       case 1:
          _delivery = "Delivery";
          _statusdelivery = true;
          _statuspickup = false;
          break;
      }
     print(_delivery);
    });
  }

void pickupTime() 
  {final now = new DateTime.now();
   _currentTime = DateFormat("Hm").format(now);
   int convertmin = _convMin(_currentTime);
   _selectedtime = _minToTime(convertmin);
   setState(() {});
  }

Future<Null> _selectTime(BuildContext context) async 
  {TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
   final now = new DateTime.now();
   print("NOW: " + now.toString());
   String year = DateFormat('y').format(now);
   String month = DateFormat('M').format(now);
   String day = DateFormat('d').format(now);
   String _hour, _minute, _time = "";
   final TimeOfDay picked = await showTimePicker
    (context: context,
     initialTime: selectedTime,
    );

   if (picked != null)
    setState(() 
      {selectedTime = picked;
       _hour = selectedTime.hour.toString();
       _minute = selectedTime.minute.toString();
       _time = _hour + ':' + _minute;
       _selectedtime = _time;
       _currentTime = DateFormat("Hm").format(now);

       _selectedtime = formatDate
        (DateTime(int.parse(year), int.parse(month), int.parse(day),
         selectedTime.hour, selectedTime.minute
        ),
       [hh, ':', nn, " ", am]).toString();
        int ct = _convMin(_currentTime);
        int st = _convMin(_time);
        int diff = st - ct;
        if (diff < 30) 
          {Fluttertoast.showToast
            (msg: "Invalid time selection",
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.CENTER,
             timeInSecForIosWeb: 1,
             backgroundColor: Colors.red,
             textColor: Colors.white,
             fontSize: 18.0);
           _selectedtime = _minToTime(ct);
           setState(() {});
           return;
         }
      });
  }

int _convMin(String c) 
  {var val = c.split(":");
   int h = int.parse(val[0]);
   int m = int.parse(val[1]);
   int tmin = (h * 60) + m;
   return tmin;
  }

String _minToTime(int min) 
  {var m = min + 30;
   var d = Duration(minutes: m);
   List<String> parts = d.toString().split(':');
   String tm = '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
   return DateFormat.jm().format(DateFormat("hh:mm").parse(tm));
  }

void insertName() 
  {showDialog
    (builder: (context) => new AlertDialog
      (shape: RoundedRectangleBorder
        (borderRadius: BorderRadius.all(Radius.circular(10.0))),
       title: new Text
        ("Please enter receiver's name",
         style: TextStyle
          (color: Colors.black,
           fontSize: 20,
          ),
        ),
       content: new Container
        (height: 80,
         child: Column
          (children: 
            [TextField
              (controller: nameController,
               style: TextStyle(fontSize: 20),
               decoration: InputDecoration
                (border: OutlineInputBorder(), 
                 labelText: 'Name', 
                 labelStyle: TextStyle
                  (fontFamily: 'Zilla_Slab', 
                   fontSize:20
                  ),
                ),
               keyboardType: TextInputType.name,
              ),
            ],
          )
        ),
       actions: <Widget>
        [TextButton
          (child: 
            Text("Save",
                 style: TextStyle(color: Colors.green[700],
                 fontFamily: 'Varela_Round',
                 fontSize: 18)
                ),
           onPressed: () async 
            {Navigator.of(context).pop();
             _name = nameController.text;
             pref = await SharedPreferences.getInstance();
             await pref.setString("name", _name);
             setState(() {});
            },
          ),
        ]
      ),
     context: context
    );
  }

void insertPhone() 
  {showDialog
    (builder: (context) => new AlertDialog
      (shape: RoundedRectangleBorder
        (borderRadius: BorderRadius.all(Radius.circular(10.0))),
       title: new Text
        ("Please enter receiver's phone number",
         style: TextStyle
          (color: Colors.black,
           fontSize: 20,
          ),
        ),
       content: new Container
        (height: 80,
         child: Column
          (children: 
            [TextField
              (controller: phoneController,
               style: TextStyle(fontSize: 20),
               decoration: InputDecoration
                (border: OutlineInputBorder(), 
                 labelText: 'Phone Number', 
                 labelStyle: TextStyle
                  (fontFamily: 'Zilla_Slab', 
                   fontSize:20
                  ),
                ),
               keyboardType: TextInputType.phone,
              ),
            ],
          )
        ),
       actions: <Widget>
        [TextButton
          (child:  
            Text("Save",
                 style: TextStyle(color: Colors.green[700],
                 fontFamily: 'Varela_Round',
                 fontSize: 18)
                ),
           onPressed: () async 
            {Navigator.of(context).pop();
             _phone = phoneController.text;
             pref = await SharedPreferences.getInstance();
             await pref.setString("phone", _phone);
             setState(() {});
            },
          ),
        ],
      ),
     context: context
    );
  }

Future<void> _loadPreferences() async 
  {pref = await SharedPreferences.getInstance();
   _name = pref.getString("name") ?? 'Enter receiver name';
   _phone = pref.getString("phone") ?? 'Enter receiver phone number';
   setState(() {});
  }

void _paynow() 
  {showDialog
    (builder: (context) => new AlertDialog
      (shape: RoundedRectangleBorder
        (borderRadius: BorderRadius.all(Radius.circular(10.0))),
       title: Text("CONFIRM PAYMENT", 
                  style: TextStyle(fontFamily: 'Fredoka_One', 
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                  fontSize:22)),
       content: Text("Pay RM " + widget.total.toStringAsFixed(2) + " to Artisanal Dips",
            style: TextStyle(fontSize:20)),
       actions: <Widget>
        [TextButton
          (child: Text("Confirm", 
                     style: TextStyle(color: Colors.green[700],
                     fontFamily: 'Varela_Round',
                     fontSize: 18)),
           onPressed: () async 
            {Navigator.of(context).pop();
             Details _details = new Details(widget.user.email, _name, _phone, widget.total.toString());
             await Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pay(details: _details, user: widget.user),),);
            },
          ),
         TextButton
          (child: Text("Cancel",
                     style: TextStyle(color: Colors.red[700],
                     fontFamily: 'Varela_Round',
                     fontSize: 18)),
           onPressed: () 
            {Navigator.of(context).pop();}
          ),
        ]
      ),
     context: context
    );
  }
}