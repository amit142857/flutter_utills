import 'package:cross_file/cross_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mime/mime.dart';

/// File types to used with [IOService]
enum FilePickerType {
  /// any of the supported type
  any,

  /// media file (image, video)
  media,

  /// image file
  image,

  /// video file
  video,

  /// audio file
  audio,

  /// specified extension type
  custom,
}

/// For handling IO Services
class IOService {
  IOService._();

  /// Shows native image selector and returns selected image files
  static Future<XFile?> pickImage([bool withData = false]) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: withData,
    );

    if (result != null) {
      return XFile(
        result.files.single.path!,
        bytes: result.files.single.bytes,
        mimeType: lookupMimeType(result.files.single.path!) ?? '',
      );
    }

    return null;
  }

  /// Shows native file selector and returns selected files
  static Future<List<XFile>> pickFiles({
    bool withData = true,
    bool multiple = false,
    FilePickerType filePickerType = FilePickerType.any,
  }) async {
    final files = <XFile>[];
    late FileType fileType;

    fileType = FileType.values[filePickerType.index];

    final result = await FilePicker.platform.pickFiles(
      type: fileType,
      withData: withData,
      allowMultiple: multiple,
    );

    if (result != null) {
      for (final file in result.files) {
        files.add(
          XFile(
            file.path!,
            bytes: withData ? file.bytes : null,
            mimeType: lookupMimeType(file.path!) ?? '',
          ),
        );
      }
    }

    return files;
  }
}
