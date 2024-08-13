import 'dart:convert';
import 'package:code_charm/components/custom_text_field.dart';
import 'package:code_charm/components/heading.dart';
import 'package:code_charm/screens/contactScreen/contact_screen_mobile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:code_charm/constants/colors.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.isMobile) {
        return const ServiceScreenMobile();
      } else {
        return const ServiceScreenDesktop();
      }
    });
  }
}

class ServiceScreenDesktop extends StatefulWidget {
  const ServiceScreenDesktop({super.key});

  @override
  State<ServiceScreenDesktop> createState() => _ServiceScreenDesktopState();
}

class _ServiceScreenDesktopState extends State<ServiceScreenDesktop> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(28.710647582043627, 77.15469456190029);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _submitContactForm() async {
    String email = _emailController.text;
    String name = _nameController.text;
    String phone = _phoneController.text;
    String message = _messageController.text;

    if (email.isEmpty || name.isEmpty || phone.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please fill out all fields',
                style: TextStyle(fontFamily: "ProductSans"))),
      );
      return;
    }

    const serviceId = 'service_cpydv1i';
    const templateId = 'template_79xk3nx';
    const userId = 'GIFY9KlKGJ1fLxdeB';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_email': email,
          'user_name': name,
          'user_phone': phone,
          'user_message': message,
        },
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Contact information submitted successfully',
                style: TextStyle(fontFamily: "ProductSans"))),
      );

      _emailController.clear();
      _nameController.clear();
      _phoneController.clear();
      _messageController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Failed to submit contact information',
                style: TextStyle(fontFamily: "ProductSans"))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Column(
        children: [
          const Heading(title: "Contact Us"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: GoogleMap(
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                          target: _center,
                          zoom: 15,
                        ),
                        markers: {
                          Marker(
                            markerId: const MarkerId('1'),
                            position: _center,
                          ),
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 35),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextField(
                            controller: _emailController,
                            labelText: 'Email',
                            hintText: 'Enter your email',
                            col: Colors.black,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: _nameController,
                            labelText: 'Name',
                            hintText: 'Enter your name',
                            col: Colors.black,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: _phoneController,
                            labelText: 'Phone',
                            hintText: 'Enter your phone',
                            col: Colors.black,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: _messageController,
                            labelText: 'Message',
                            hintText: 'Enter your message',
                            col: Colors.black,
                            height: 80,
                          ),
                          const SizedBox(height: 50),
                          Padding(
                            padding: const EdgeInsets.only(left: 375.0),
                            child: ElevatedButton(
                              onPressed: _submitContactForm,
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(100, 60),
                                foregroundColor: Colors.white,
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 5,
                              ),
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                  fontFamily: "ProductSans",
                                  fontSize: 22,
                                ),
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
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

// class ServiceScreenMobile extends StatefulWidget {
//   const ServiceScreenMobile({super.key});

//   @override
//   State<ServiceScreenMobile> createState() => _ServiceScreenMobileState();
// }

// class _ServiceScreenMobileState extends State<ServiceScreenMobile> {
//   late GoogleMapController mapController;

//   final LatLng _center = const LatLng(28.710647582043627, 77.15469456190029);

//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _messageController = TextEditingController();

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   Future<void> _submitContactForm() async {
//     String email = _emailController.text;
//     String name = _nameController.text;
//     String phone = _phoneController.text;
//     String message = _messageController.text;

//     if (email.isEmpty || name.isEmpty || phone.isEmpty || message.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text('Please fill out all fields',
//                 style: TextStyle(fontFamily: "ProductSans"))),
//       );
//       return;
//     }

//     const serviceId = 'service_cpydv1i';
//     const templateId = 'template_79xk3nx';
//     const userId = 'GIFY9KlKGJ1fLxdeB';
//     final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

//     final response = await http.post(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: json.encode({
//         'service_id': serviceId,
//         'template_id': templateId,
//         'user_id': userId,
//         'template_params': {
//           'user_email': email,
//           'user_name': name,
//           'user_phone': phone,
//           'user_message': message,
//         },
//       }),
//     );

//     if (response.statusCode == 200) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text('Contact information submitted successfully',
//                 style: TextStyle(fontFamily: "ProductSans"))),
//       );

//       _emailController.clear();
//       _nameController.clear();
//       _phoneController.clear();
//       _messageController.clear();
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text('Failed to submit contact information',
//                 style: TextStyle(fontFamily: "ProductSans"))),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 600,
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         children: [
//           const Heading(title: "Contact Us"),
//           Expanded(
//             child: PageView(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(15.0),
//                   child: GoogleMap(
//                     onMapCreated: _onMapCreated,
//                     initialCameraPosition: CameraPosition(
//                       target: _center,
//                       zoom: 15,
//                     ),
//                     markers: {
//                       Marker(
//                         markerId: const MarkerId('1'),
//                         position: _center,
//                       ),
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       CustomTextField(
//                         controller: _emailController,
//                         labelText: 'Email',
//                         hintText: 'Enter your email',
//                         col: Colors.black,
//                       ),
//                       const SizedBox(height: 16),
//                       CustomTextField(
//                         controller: _nameController,
//                         labelText: 'Name',
//                         hintText: 'Enter your name',
//                         col: Colors.black,
//                       ),
//                       const SizedBox(height: 16),
//                       CustomTextField(
//                         controller: _phoneController,
//                         labelText: 'Phone',
//                         hintText: 'Enter your phone',
//                         col: Colors.black,
//                       ),
//                       const SizedBox(height: 16),
//                       CustomTextField(
//                         controller: _messageController,
//                         labelText: 'Message',
//                         hintText: 'Enter your message',
//                         col: Colors.black,
//                         height: 80,
//                       ),
//                       const SizedBox(height: 50),
//                       ElevatedButton(
//                         onPressed: _submitContactForm,
//                         style: ElevatedButton.styleFrom(
//                           fixedSize: const Size(100, 60),
//                           foregroundColor: Colors.white,
//                           backgroundColor: primaryColor,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           elevation: 5,
//                         ),
//                         child: const Text(
//                           'Submit',
//                           style: TextStyle(
//                             fontFamily: "ProductSans",
//                             fontSize: 22,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 30),
//         ],
//       ),
//     );
//   }
// }
