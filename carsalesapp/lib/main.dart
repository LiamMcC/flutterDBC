
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:carsalesapp/carmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:camera/camera.dart';
import 'camera_utils.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
              


      GestureDetector(
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity! > 0) {
                    // Swiped from left to right
                    _showSwipeAlert(context, 'Opening Hours Week Days 8:00 - 17:00');
                  } else if (details.primaryVelocity! < 0) {
                    // Swiped from right to left
                    _showSwipeAlert(context, 'Opening Hours Weekends 8:00 - 14:00 Saturday. Closed Sunday');
                  }
                },

              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                
                child: Image.asset(
                  'assets/car4.jpg',
                  width: screenWidth * imageWidthPercentage,
                  fit: BoxFit.cover,
                  
                ),
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
                // Handle admin button tap
                  Navigator.push(
                   context,
    MaterialPageRoute(builder: (context) => const FavoritesPage(favoriteCars: [])), // Pass your favorite cars list here
                  );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 38, 38, 38),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: const Text('Favourites'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle admin button tap
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FinancePage()),
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
  void _showSwipeAlert(BuildContext context, String alertText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(alertText),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
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
  final response = await http.get(Uri.parse('http://www.bloxlox.net/cars2.json'));

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

// ignore: unused_element
void _shareCarData(Car car) {
    Share.share(
      'Check out this car:\n\n'
      'Brand: ${car.brand}\n'
      'Model: ${car.model}\n'
      'Price: €${car.price}\n'
      'Mileage: ${car.milage} miles\n'
      'Description: ${car.description}\n',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liams Cars Stock'),
        backgroundColor: const Color.fromARGB(255, 96, 94, 94),
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          return Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            onDismissed: (direction) {
              // Handle dismiss (e.g., remove item from list)
              setState(() {
                cars.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Car dismissed')),
              );
            },
            secondaryBackground: Container(
              color: Colors.green,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: const Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {
                // Show confirmation dialog for deletion
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Delete Confirmation'),
                      content: const Text('Are you sure you want to delete this car?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
              } else if (direction == DismissDirection.startToEnd) {
                // Share car data
                _shareCarData(car);
                return false; // Prevent dismiss after sharing
              }
              return false;
            },
            child: Card(
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
                            textAlign: TextAlign.justify,
                          ),
                                                    const Text(
                            'Swipe Right To Share Or Left To Delete',
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 8),
         ElevatedButton(
                          onPressed: () async {
                            await addToFavorites(car);
                          },
                            child: const Text('Add to Favorites'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
 Future<void> addToFavorites(Car car) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteCarIds = prefs.getStringList('favoriteCars') ?? [];
    if (!favoriteCarIds.contains(car.id)) {
      favoriteCarIds.add(car.id);
      await prefs.setStringList('favoriteCars', favoriteCarIds);
    }
  }
}

// camera page 

// fave page
class FavoritesPage extends StatelessWidget {
  final List<Car> favoriteCars;

  const FavoritesPage({Key? key, required this.favoriteCars}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: const Color.fromARGB(255, 96, 94, 94),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Favorite Cars:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            for (var car in favoriteCars)
              Column(
                children: [
                  Text(
                    '${car.id} ${car.model}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
          ],
        ),
      ),
    );
  }
}



// end fave page
// camera_screen.dart
//  _controller = CameraController(CameraUtils.cameras[0], ResolutionPreset.medium);

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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



// **********************  The second page 
class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override

  _FinancePageState createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
  List<Car> cars = [];
  
  

  @override
  void initState() {
    super.initState();
    loadCars();
  }

 Future<void> loadCars() async {
  final response = await http.get(Uri.parse('http://www.bloxlox.net/cars2.json'));

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
