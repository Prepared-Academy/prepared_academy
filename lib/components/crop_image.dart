import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> cropImage(XFile file) async {
  File? response;
  try {
    CroppedFile? croppedFile =
        await ImageCropper().cropImage(sourcePath: file.path, uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Cropper',
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      IOSUiSettings(
        title: 'Cropper',
      )
    ]);
    if (croppedFile != null) {
      response = File(croppedFile.path);
    }
  } catch (e) {
    response = File(file.path);
  }

  return response;
}
