// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:carsalesapp/carmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:camera/camera.dart';
import 'camera_utils.dart';
import 'package:gallery_saver/gallery_saver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CameraUtils.initializeCameras();
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
                    Text(
                    'Liams Cars',
                    style: GoogleFonts.permanentMarker(
                      textStyle: const TextStyle(color: Color.fromARGB(255, 253, 254, 255), letterSpacing: .5, fontSize: 44,),
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
                    MaterialPageRoute(builder: (context) => const CameraScreen()),
                  );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 38, 38, 38), // White text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                   // Rounded corners
                ),
              ),
              
              child: const Text('Trade In'),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CarsPage()),
                  );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 38, 38, 38),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: const Text('Finance'),
              
            ),
          ],
        ),
      ),
    );
  }
}


// **********************  The second page 
class CarsPage extends StatefulWidget {
  const CarsPage({super.key});

  @override

  _CarsPageState createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
  List<Car> cars = [];
  
  

  @override
  void initState() {
    super.initState();
    loadCars();
  }

 Future<void> loadCars() async {
  final response = await http.get(Uri.parse('http://www.bloxlox.net/cars.json'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonList = json.decode(response.body);
    final List<Car> loadedCars = jsonList.map((json) => Car.fromJson(json)).toList();

    

    setState(() {
      cars = loadedCars;
    });
  } else {
    // Handle errors, e.g., show an error message or fallback to local data
   
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liams Cars Stock'),
        backgroundColor: const Color.fromARGB(255, 96, 94, 94),
      ),backgroundColor: Colors.black,
      body: ListView.builder(
  itemCount: cars.length,
  itemBuilder: (context, index) {
    final car = cars[index];
    return Card(
  elevation: 5,
  margin: const EdgeInsets.all(10.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Image.asset(
        'assets/${car.image}',
        height: 200,
        fit: BoxFit.cover,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            '${car.brand} ${car.model}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price: €${car.price}'),
              Text('Mileage: ${car.milage} miles'),
              Text(
                'Description: ${car.description}',
                textAlign: TextAlign.justify, // Justify the text
              ), const SizedBox(height: 8), // Add some space between the description and the button
              ElevatedButton(
                onPressed: () {
                  // Handle add to favorites button tap
                  // You can add your logic here
                },
                child: const Text('Add to Favorites'),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);
  },
      ),
    );
  }
}


// camera page 


// camera_screen.dart
//  _controller = CameraController(CameraUtils.cameras[0], ResolutionPreset.medium);

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(CameraUtils.cameras[0], ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

Future<void> _takePicture() async {
  try {
    await _initializeControllerFuture;

    final XFile file = await _controller.takePicture();

    // Save the captured image to the gallery
    await GallerySaver.saveImage(file.path);

    // Show a Thank-You dialog after taking the picture
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thank You!'),
          content: const Text('Thank you for taking the picture! It has been sent to us for a trade in value. Its Been saved in the gallery too for you to look back. We will be in touch soon'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  } catch (e) {
    print("Error taking or saving picture: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Us Your Car'),
        backgroundColor: Colors.black,
      ),backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
