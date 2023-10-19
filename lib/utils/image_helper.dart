import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../core/res/colors.dart';
import 'utils.dart';

class ImageHelper {
  static final ImagePicker _picker = ImagePicker();

  static Future<XFile?> selectImage(BuildContext context) async {
    bool? flag = await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return const ChooseImageDialog();
      },
    );
    if (flag == true) {
      return _picker.pickImage(source: ImageSource.gallery);
    } else if (flag == false) {
      return _picker.pickImage(source: ImageSource.camera);
    } else {
      return null;
    }
  }

  static Future<File?> croppedImage(XFile tempFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      cropStyle: CropStyle.circle,
      sourcePath: tempFile.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
    );
    if (croppedFile != null) {
      return File(croppedFile.path);
    } else {
      return null;
    }
  }

  static Future<File?> pickImageFile(BuildContext context) async {
    var pickedFile = await ImageHelper.selectImage(context);
    if (pickedFile != null) {
      File? file = await ImageHelper.croppedImage(pickedFile);
      return file;
    }
    return null;
  }

  static Future<MultipartFile> getMultipartFile(File? file) async {
    MultipartFile mFile = await MultipartFile.fromFile(
      file?.path ?? "",
      filename: file?.path.split("/").last,
      contentType: MediaType.parse("image/jpg"),
    );
    return mFile;
  }
}

class ChooseImageDialog extends StatelessWidget {
  final textStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    letterSpacing: 3,
  );

  const ChooseImageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: SizedBox(
        height: 100.h,
        child: Material(
          borderRadius: BorderRadius.circular(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.image,
                        size: 40,
                        color: KAppColors.primaryColor,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      FittedBox(
                        child: Text(
                          'المعرض',
                          style: KAppTextStyle.boldTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: KAppColors.primaryColor,
                width: 1,
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.camera,
                        size: 40,
                        color: KAppColors.primaryColor,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      FittedBox(
                        child: Text(
                          'الكاميرا',
                          style: KAppTextStyle.boldTextStyle,
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
