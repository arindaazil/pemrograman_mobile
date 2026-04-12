import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  Widget box(Color color, String text, {double height = 100, IconData? icon}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon, color: Colors.white, size: 30),
          SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 30, color: Colors.green),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "arinda",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text("NIM: 240103184", style: TextStyle(color: Colors.white)),
                  Text("TI24A6", style: TextStyle(color: Colors.white)),

                  SizedBox(height: 20),

                  // DIGANTI JADI LEBIH BAGUS
                  Row(
                    children: [
                      Expanded(
                        child: box(
                          Colors.black87,
                          "Projects",
                          height: 140,
                          icon: Icons.code,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: box(
                          Colors.black87,
                          "Contact",
                          height: 140,
                          icon: Icons.phone,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // GRID MENU
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: box(
                              Colors.blue,
                              "Profile",
                              icon: Icons.person,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: box(
                              Colors.blue,
                              "Schedule",
                              icon: Icons.schedule,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: box(
                              Colors.blue,
                              "Gallery",
                              icon: Icons.image,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: box(
                              Colors.blue,
                              "Settings",
                              icon: Icons.settings,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
