import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/widgets/image_picker_sheet.dart';
import 'crop_image.dart';

Future<File?> changeImage(bool shouldCrop) async {
  final ImagePicker picker = ImagePicker();
  File? response;
  ImageSource? type = await OneContext().showModalBottomSheet<ImageSource?>(
      builder: (context) => const ModalImageSelector());
  if (type != null) {
    final XFile? picked = await picker.pickImage(
      source: type,
      imageQuality: 80,
    );
    if (picked != null) {
      if (shouldCrop) {
        response = await cropImage(picked);
      } else {
        response = File(picked.path);
      }
    }
  }
  return response;
}
