import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imapp/features/history/domain/entities/image_entity.dart';
import 'package:path_provider/path_provider.dart';

// There is no error handling or other edge cases. For now only the success scenario
class ImageUseCase {


  // Delete from the local storage, before deleting from the history
  Future deleteImage(String path) async {
    File image = File(path);

    try {
      if (await image.exists()) {
        await image.delete();
      }
    } catch (e) {
      // Error in getting access to the file.
    }
  }

  // Load image from the local store for the Preview
  Future loadImage(String path) async {
    XFile pickedFile;
    if (File(path).existsSync()) {
      pickedFile = XFile(path);
      return pickedFile;
    }
  }


  // Here we determine whether the uploaded image is a document, a face or unknown.
  Future<dynamic> processImage(XFile pickedImage) async {

    File image = File(pickedImage.path);
    String type = "";

    // Logic for recognizing the text. (I just copied it from the example and haven't really had time to go into the details.
    var inputImage = InputImage.fromFile(image);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

    String text = recognizedText.text;
    for (TextBlock block in recognizedText.blocks) {
      final Rect rect = block.boundingBox;
      final List<Point<int>> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        for (TextElement element in line.elements) {
          // Same getters as TextBlock
        }
      }
    }

    textRecognizer.close();


    if (text.isNotEmpty) {
      type = "Document Scan";
    } else {

      // if there is no text. It will try to look for the faces.

      // Logic for recognizing the face. (I just copied it from the example and haven't really had time to go into the details.
      final options = FaceDetectorOptions();
      final faceDetector = FaceDetector(options: options);

      final List<Face> faces = await faceDetector.processImage(inputImage);

      for (Face face in faces) {
        final Rect boundingBox = face.boundingBox;

        final double? rotX = face.headEulerAngleX; // Head is tilted up and down rotX degrees
        final double? rotY = face.headEulerAngleY; // Head is rotated to the right rotY degrees
        final double? rotZ = face.headEulerAngleZ; // Head is tilted sideways rotZ degrees

        // If landmark detection was enabled with FaceDetectorOptions (mouth, ears,
        // eyes, cheeks, and nose available):
        final FaceLandmark? leftEar = face.landmarks[FaceLandmarkType.leftEar];
        if (leftEar != null) {
          final Point<int> leftEarPos = leftEar.position;
        }

        // If classification was enabled with FaceDetectorOptions:
        if (face.smilingProbability != null) {
          final double? smileProb = face.smilingProbability;
        }

        // If face tracking was enabled with FaceDetectorOptions:
        if (face.trackingId != null) {
          final int? id = face.trackingId;
        }
      }

      if (faces.length <= 0) {
        // if it couldnt find the face or the text, it will give it type - "Unknown"
        type = "Unknown";
      } else {

        type = "Face Processed";
      }
    }

    // Save it on local storage
    Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    var path = await appDocumentsDir.path;
    int uuid = DateTime.now().microsecondsSinceEpoch;
    await image.copy("$path/$uuid.png");

    return ImageEntity(uuid.toString(), type, '$path/$uuid.png', DateTime.now().toString());

  }
}
