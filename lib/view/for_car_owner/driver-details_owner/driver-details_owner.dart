import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myride/constant/app_color.dart';
import 'package:myride/constant/app_screen_size.dart';
import 'package:myride/constant/app_text_style.dart';
import 'package:myride/view/for_car_owner/vehicle_info_owner/vehicle_info_owner.dart';

class DriverDetailsOwner extends StatefulWidget {
  const DriverDetailsOwner({super.key});

  @override
  State<DriverDetailsOwner> createState() => _DriverDetailsOwnerState();
}

class _DriverDetailsOwnerState extends State<DriverDetailsOwner> {
  final TextEditingController _controller = TextEditingController();
  String _uploadedFileName = '';

  void handleFileUpload() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        setState(() {
          _uploadedFileName = result.files.single.name;
        });
      }
    } on PlatformException catch (e) {
      print('Error while picking a file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFAFAFA),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: const Color(0xFF333333),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: const Text(
            "Driver Details",
            style: TextStyle(color: Color(0xFF333333)),
          ),
        ),
        body: ListView(
          children: [
            Container(
              height: AppSceenSize.getHeight(context) * 0.10,
              color: const Color(0xFFFAFAFA),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: const Center(
                  child: Text(
                "Enter your info exactly as it appears on your license so Kanan can verify your eligibility to route.",
                style: AppTextStyle.drhsubheading,
                textAlign: TextAlign.center,
              )),
            ),
            Column(
              children: [
                ListTile(
                  title: const Text("First Name"),
                  trailing: const SizedBox(
                    width: 100,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "  First Name",
                      ),
                    ),
                  )

                  // Text("sandip")

                  ,
                  onTap: () {},
                ),
                customDivider(),
                const ListTile(
                    title: Text("Last Name"),
                    trailing: SizedBox(
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "  Last Name",
                        ),
                      ),
                    )),
                customDivider(),
                const ListTile(
                    title: Text("Full Adress"),
                    trailing: SizedBox(
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "   Address",
                        ),
                      ),
                    )),
                customDivider(),
                const ListTile(
                    title: Text("Alternate  Phone Number"),
                    trailing: SizedBox(
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: " 264728372",
                        ),
                      ),
                    )),
                customDivider(),
                const ListTile(
                    title: Text("Adhaar No. *"),
                    trailing: SizedBox(
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: " 348728372",
                        ),
                      ),
                    )),
                selectbox(),
              ],
            )
          ],
        ));
  }

  customDivider() {
    return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: const Divider(
          color: Color.fromARGB(255, 206, 204, 204),
        ));
  }

  selectbox() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: DottedBorder(
            color: const Color(0xFFdddddd),
            strokeWidth: 1,
            dashPattern: const [5, 6],
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      readOnly: true,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.check_box,
                            color: Colors.grey,
                          ),
                          hintText: 'Adhar Upload Front...',
                          hintStyle:
                              TextStyle(color: Color(0xFF999999), fontSize: 12),
                          border: InputBorder.none),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00B74C),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 12)),
                    onPressed: handleFileUpload,
                    icon: const Icon(
                      Icons.upload,
                      size: 15,
                    ),
                    label: const Text("Upload"),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: DottedBorder(
            color: const Color(0xFFdddddd),
            strokeWidth: 1,
            dashPattern: const [5, 6],
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      readOnly: true,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.check_box,
                            color: Colors.grey,
                          ),
                          hintText: 'Adhar Upload Back...',
                          hintStyle:
                              TextStyle(color: Color(0xFF999999), fontSize: 12),
                          border: InputBorder.none),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00B74C),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 12)),
                    onPressed: handleFileUpload,
                    icon: const Icon(
                      Icons.upload,
                      size: 15,
                    ),
                    label: const Text("Upload"),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Pan No *"), Text("83jue83-")],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: DottedBorder(
            color: const Color(0xFFdddddd),
            strokeWidth: 1,
            dashPattern: const [5, 6],
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      readOnly: true,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.check_box,
                            color: Colors.grey,
                          ),
                          hintText: 'Pan Upload...',
                          hintStyle:
                              TextStyle(color: Color(0xFF999999), fontSize: 12),
                          border: InputBorder.none),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00B74C),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 12)),
                    onPressed: handleFileUpload,
                    icon: const Icon(
                      Icons.upload,
                      size: 15,
                    ),
                    label: const Text("Upload"),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("License No *"), Text("9876567887654")],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: DottedBorder(
            color: const Color(0xFFdddddd),
            strokeWidth: 1,
            dashPattern: const [5, 6],
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      readOnly: true,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.check_box,
                            color: Colors.grey,
                          ),
                          hintText: 'License Front',
                          hintStyle:
                              TextStyle(color: Color(0xFF999999), fontSize: 12),
                          border: InputBorder.none),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00B74C),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 12)),
                    onPressed: handleFileUpload,
                    icon: const Icon(
                      Icons.upload,
                      size: 15,
                    ),
                    label: const Text("Upload"),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: DottedBorder(
            color: const Color(0xFFdddddd),
            strokeWidth: 1,
            dashPattern: const [5, 6],
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      readOnly: true,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.check_box,
                            color: Colors.grey,
                          ),
                          hintText: 'License Back',
                          hintStyle:
                              TextStyle(color: Color(0xFF999999), fontSize: 12),
                          border: InputBorder.none),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00B74C),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 12)),
                    onPressed: handleFileUpload,
                    icon: const Icon(
                      Icons.upload,
                      size: 15,
                    ),
                    label: const Text("Upload"),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Photo Upload"), Text("")],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: DottedBorder(
            color: const Color(0xFFdddddd),
            strokeWidth: 1,
            dashPattern: const [5, 6],
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      readOnly: true,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.check_box,
                            color: Colors.grey,
                          ),
                          hintText: 'Driver Photo',
                          hintStyle:
                              TextStyle(color: Color(0xFF999999), fontSize: 12),
                          border: InputBorder.none),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00B74C),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 12)),
                    onPressed: handleFileUpload,
                    icon: const Icon(
                      Icons.upload,
                      size: 15,
                    ),
                    label: const Text("Upload"),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            width: AppSceenSize.getWidth(context),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Appcolors.appgreen, // Text color
                  padding: const EdgeInsets.all(16), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Button border radius
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VehicleInfoOwner(),
                      ));
                  print("ccvbvb");
                },
                child: const Text("SUBMIT ")))
      ],
    );
  }
}
