import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Liams Cars',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidthPercentage = 1;

   return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 0, 0, 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0),
              const Text(
                'Liams Cars',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 252, 252, 252),
                  fontStyle: FontStyle.italic, // Set to FontStyle.italic for italic style
                 fontFamily: 'Sans-serif', // Replace 'YourFontFamily' with the desired font family
                ),
              ),
              const Text(
                'Driving Dreams, Delivering Value!',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 252, 252, 252),
                   fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 20.0),
              
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                
                child: Image.asset(
                  'assets/car4.jpg',
                  width: screenWidth * imageWidthPercentage,
                  fit: BoxFit.cover,
                  
                ),
              ),
              const SizedBox(height: 20.0),

              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.4,
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.white, // White border at the bottom
                                width: 2.0,
                              ),
                            ),
                          ),
                    child: const Text(
                      'SALES',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center, // Center-align the text
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.4,
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.white, // White border at the bottom
                                width: 2.0,
                              ),
                            ),
                          ),
                    child: const Text(
                      'SERVICE',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center, // Center-align the text
                    ),
                  ),
                  
                ],
              ),


 Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.8,
                    padding: const EdgeInsets.all(22.0),
                    decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.white, // White border at the bottom
                                width: 2.0,
                              ),
                            ),
                          ),
                    child: const Text(
                      'PH: 0871234567',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center, // Center-align the text
                    ),
                  ),
                 
                  
                ],
              ),


 Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.8,
                    padding: const EdgeInsets.all(22.0),
                    decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(255, 251, 3, 3), // White border at the bottom
                                width: 2.0,
                              ),
                            ),
                          ),
                    child: const Text(
                      'Dunboyne, Co. Meath',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center, // Center-align the text
                    ),
                  ),
                 
                  
                ],
              ),


            ],
          ),
        ),
      ),
    
    
    
     bottomNavigationBar: Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0), // Add top and bottom margins
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 0, 0), 
        // Dark grey background for the row
        boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 0.0, // Adjust the blur radius as needed
              spreadRadius: 0.7, // Adjust the spread radius as needed
              offset: Offset(0, -2), // Offset for shadow, negative y to place it at the top
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle home button tap
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CarsPage()),
                  );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 38, 38, 38), // White text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                   // Rounded corners
                ),
              ),
              
              child: const Text('Finance'),
            ),
            ElevatedButton(
              onPressed: () {
            Navigator.push(
  context,
  PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const CarsPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      var offsetAnimation = animation.drive(tween);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  ),
);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 38, 38, 38),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: const Text('Cars'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle contact button tap
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 38, 38, 38),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: const Text('Contact'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle admin button tap
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 38, 38, 38),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: const Text('Admin'),
              
            ),
          ],
        ),
      ),
    );
  }
}


// **********************  The second page 
class CarsPage extends StatelessWidget {
  const CarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cars Page'),
      ),
      body: const Center(
        child: Text('This is the Cars Page'),
      ),
    );
  }
}