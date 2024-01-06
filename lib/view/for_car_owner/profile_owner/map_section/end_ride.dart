import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myride/constant/app_screen_size.dart';
import 'package:myride/constant/app_text_style.dart';
import 'package:myride/view/for_driver/map_section/ride_sharing.dart';

class EndRideScreen extends StatefulWidget {
  const EndRideScreen({super.key});

  @override
  State<EndRideScreen> createState() => _EndRideScreenState();
}

class _EndRideScreenState extends State<EndRideScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(22.5726, 88.3639),
    zoom: 14.4746,
  );

  // @override
  // void initState() {
  //   super.initState();
  //   // Add a delay to give time for the widget tree to render before showing the bottom sheet.
  //   Future.delayed(const Duration(milliseconds: 2), () {
  //     _showBottomSheet(context);
  //   });
  // }

  // Create a GlobalKey to access the Scaffold for the drawer.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          body: Stack(
            children: [
              SizedBox(
                height: AppSceenSize.getHeight(context),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: AppSceenSize.getWidth(context),
                          height: AppSceenSize.getHeight(context) * 0.54,
                          child: GoogleMap(
                              initialCameraPosition: _kGooglePlex,
                              onMapCreated: (GoogleMapController controller) {
                                _controller.complete(controller);
                              }),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back)),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.38,
                          right: 10,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 90,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF0D94CE),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Image.asset("assets/icon/call.png"),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            "Call",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    )),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 90,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFF0C414),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: const Center(
                                        child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.chat_outlined),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Chat",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // GestureDetector(
                    //   onVerticalDragEnd: (details) {
                    //     // Detect the swipe up gesture and show the bottom sheet.
                    //     if (details.primaryVelocity! < 0) {
                    //       _showBottomSheet(context);
                    //     }
                    //   },
                    //   child: const Center(
                    //     child: Text(
                    //       'swipe up!',
                    //       style: TextStyle(fontSize: 24.0),
                    //     ),
                    //   ),
                    // ),
                    _buildBottomSection()
                  ],
                ),
              ),
            ],
          )),
    );
  }

  _buildBottomSection() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.37,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
            color: Colors.grey,
            width: 80,
          ),
          const SizedBox(
            width: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Pick-up",
                        style: TextStyle(color: Color(0xFFC8C7CC)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: const Text(
                          "PALLADIUM MALL, 462, a-nuch ate muf, alar a2a, yad, retay 400013, India",
                          style: AppTextStyle.addressText,
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
              Image.asset('assets/icon/ic_Location.png')
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Drop-off",
                        style: TextStyle(color: Color(0xFFC8C7CC)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: const Text(
                          "Star MALL, 462, a-nuch ate muf, alar a2a, yad, retay 400013, India",
                          style: AppTextStyle.addressText,
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
              Image.asset('assets/icon/ic_Location.png')
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const RideSharingScreen();
                }));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.44,
                height: 40,
                decoration: BoxDecoration(
                    color: const Color(0xFFF0C414),
                    borderRadius: BorderRadius.circular(30)),
                child: const Center(
                    child: Text(
                  "End Ride",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                )),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Click Here For Ride Support",
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
    );
  }

  // void _showBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     isDismissible: false,
  //     context: context,
  //     shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
  //     builder: (BuildContext context) {
  //       return

  //       Container(
  //         height: MediaQuery.of(context).size.height * 0.37,
  //         padding: const EdgeInsets.all(16.0),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Container(
  //               height: 4,
  //               color: Colors.grey,
  //               width: 80,
  //             ),
  //             const SizedBox(
  //               width: 12,
  //             ),
  //             Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Icon(Icons.location_on),
  //                     SizedBox(
  //                       width: 10,
  //                     ),
  //                     Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         const Text(
  //                           "Pick-up",
  //                           style: TextStyle(color: Color(0xFFC8C7CC)),
  //                         ),
  //                         SizedBox(
  //                           height: 5,
  //                         ),
  //                         SizedBox(
  //                           width: MediaQuery.of(context).size.width * 0.5,
  //                           child: const Text(
  //                             "PALLADIUM MALL, 462, a-nuch ate muf, alar a2a, yad, retay 400013, India",
  //                             style: AppTextStyle.addressText,
  //                           ),
  //                         ),
  //                         const SizedBox(
  //                           width: 40,
  //                         ),
  //                         const SizedBox(
  //                           height: 30,
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //                 Image.asset('assets/icon/ic_Location.png')
  //               ],
  //             ),
  //             Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Icon(Icons.location_on),
  //                     SizedBox(
  //                       width: 10,
  //                     ),
  //                     Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         const Text(
  //                           "Drop-off",
  //                           style: TextStyle(color: Color(0xFFC8C7CC)),
  //                         ),
  //                         SizedBox(
  //                           height: 5,
  //                         ),
  //                         SizedBox(
  //                           width: MediaQuery.of(context).size.width * 0.5,
  //                           child: const Text(
  //                             "Star MALL, 462, a-nuch ate muf, alar a2a, yad, retay 400013, India",
  //                             style: AppTextStyle.addressText,
  //                           ),
  //                         ),
  //                         const SizedBox(
  //                           width: 40,
  //                         ),
  //                         const SizedBox(
  //                           height: 30,
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //                 Image.asset('assets/icon/ic_Location.png')
  //               ],
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: GestureDetector(
  //                 onTap: () {
  //                   Navigator.push(context, MaterialPageRoute(builder: (context){
  //                     return RideSharingScreen();
  //                   }));
  //                 },
  //                 child: Container(
  //                   width: MediaQuery.of(context).size.width * 0.44,
  //                   height: 40,
  //                   decoration: BoxDecoration(
  //                       color: Color(0xFFF0C414),
  //                       borderRadius: BorderRadius.circular(30)),
  //                   child: Center(
  //                       child: Text(
  //                     "End Ride",
  //                     style: TextStyle(fontSize: 14, color: Colors.black),
  //                   )),
  //                 ),
  //               ),
  //             ),
  //             SizedBox(height: 10,),

  //              Text(
  //               "Click Here For Ride Support",
  //               style: TextStyle(
  //                 decoration: TextDecoration.underline,
  //               ),
  //             )
  //           ],
  //         ),
  //       );

  //     },
  //   );
  // }
}
