import 'package:code_charm/components/custom_appbar.dart';
import 'package:code_charm/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(28.63065507199661, 77.37213879843372);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        appBar: customAppBar(
          title: 'Contact Us',
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: GoogleMap(
                            onMapCreated: _onMapCreated,
                            initialCameraPosition: CameraPosition(
                              target: _center,
                              zoom: 15,
                            ),
                            markers: {
                              const Marker(
                                markerId: MarkerId('marker_1'),
                                position: LatLng(28.63065507199661,
                                    77.37213879843372), // Coordinates from the provided URL
                              ),
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(45.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                "Form",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "ProductSans",
                                  fontSize: 24,
                                ),
                              ),
                              const SizedBox(height: 26),
                              const TextField(
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                ),
                              ),
                              const SizedBox(height: 20),
                              const TextField(
                                decoration: InputDecoration(
                                  labelText: 'Name',
                                ),
                              ),
                              const SizedBox(height: 20),
                              const TextField(
                                decoration: InputDecoration(
                                  labelText: 'Phone',
                                ),
                              ),
                              const SizedBox(height: 60),
                              Padding(
                                padding: const EdgeInsets.only(left: 350.0,),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Submit contact form
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(200, 60),
                                    foregroundColor: Colors.white, backgroundColor: primaryColor, // Text color
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 20),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    elevation: 5, // Elevation
                                  ),
                                  child: const Text('Submit',style: TextStyle(fontFamily: "ProductSans",fontSize: 22),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
