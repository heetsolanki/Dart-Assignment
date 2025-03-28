import 'package:flutter/material.dart'; 

void main() { 
runApp(RunMyApp()); 
} 

class RunMyApp extends StatefulWidget { 
const RunMyApp({super.key}); 

@override 
State<RunMyApp> createState() => _RunMyAppState(); 
} 

class _RunMyAppState extends State<RunMyApp> { 
ThemeMode _themeMode = ThemeMode.system; 
void changeTheme(ThemeMode themeMode) { 
  setState(() { 
  _themeMode = themeMode; 
  }); 
} 

@override 
Widget build(BuildContext context) { 
  return MaterialApp( 
  theme: ThemeData(primarySwatch: Colors.green), 
    
  // standard dark theme 
  darkTheme: ThemeData.dark(), 
  themeMode: _themeMode, 
  debugShowCheckedModeBanner: false, 
  home: Scaffold( 
    body: Center( 
    child: Column( 
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [ 
      Text( 
        'Choose your theme:', ), 
      SizedBox(
        height: 20,
      ),
      Row( 
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
        children: [ 
        ElevatedButton( 
          onPressed: () { 
            changeTheme(ThemeMode.light); 
          }, 
          child: Text('Light theme')), 
        ElevatedButton( 
          onPressed: () { 
            changeTheme(ThemeMode.dark); 
          }, 
          child: Text('Dark theme')), 
        ], 
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        'Name: Heet Solanki \nSeat No,: 31011223068',
        style: TextStyle(fontSize: 20),
      )
      ],
    ), 
    ), 
  ), 
  ); 
} 
} 
