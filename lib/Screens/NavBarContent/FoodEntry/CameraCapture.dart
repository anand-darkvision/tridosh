import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraCapture extends StatefulWidget {
  const CameraCapture({Key? key}) : super(key: key);

  @override
  State<CameraCapture> createState() => _CameraCaptureState();
}

class _CameraCaptureState extends State<CameraCapture> {
  late File _image;
  late List _results = [];
  bool imageSelect = false;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final source = ImageSource.camera;
    final XFile? pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 50,
      preferredCameraDevice: CameraDevice.rear,
    );

    // File image = File(pickedFile!.path);
    // imageClassification(image);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(height: height * 0.05 + width * 0.01),
        Container(
          height: height * 0.25 + width * 0.01,
          width: width * 0.6 + height * 0.01,
          decoration: BoxDecoration(
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("Assets/image/Icecream.png"),
            ),
          ),
        ),
        SizedBox(height: width * 0.1 + height * 0.01),
        Text(
          "Capture Food Through",
          style: TextStyle(
            fontFamily: "signikaregular",
            fontSize: height * 0.04 + width * 0.01,
            color: Colors.grey[600],
          ),
        ),
        Text(
          "Camera",
          style: TextStyle(
            fontFamily: "signikaregular",
            fontSize: height * 0.04 + width * 0.01,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: width * 0.1 + height * 0.01),
        SizedBox(
          height: height * 0.03 + width * 0.1,
          width: height * 0.1 + width * 0.3,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 10,
              backgroundColor: const Color.fromARGB(255, 145, 199, 136),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            onPressed: () {
              pickImage();
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: height * 0.01 + width * 0.002),
                  Text(
                    'Capture',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height * 0.02 + width * 0.01,
                    ),
                  ),
                  Icon(
                    Icons.arrow_right_rounded,
                    color: Colors.white,
                    size: height * 0.04 + width * 0.01,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
