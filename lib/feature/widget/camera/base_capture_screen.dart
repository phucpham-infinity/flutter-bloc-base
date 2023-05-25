import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/feature/app.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/column/title_with_sub.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/overlay_with_rectangle_clipping/overlay_with_rectangle_clipping.dart';
import '../../../main.dart';

class BaseCaptureScreen extends StatefulWidget {
  final String title;
  final String subTitle;
  final Function(dynamic data) onCapture;
  const BaseCaptureScreen({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onCapture,
  });

  @override
  State<BaseCaptureScreen> createState() => _BaseCaptureScreenState();
}

class _BaseCaptureScreenState extends State<BaseCaptureScreen> {
  final isLoading = ValueNotifier<bool>(false);
  

  late CameraController _cameraController;
  double positionY = 0;
  XFile? imageFile;
  final GlobalKey _widgetKey = GlobalKey();

  void _getWidgetInfo(_) {
    final RenderBox renderBox =
        _widgetKey.currentContext?.findRenderObject() as RenderBox;
    _widgetKey.currentContext?.size;
    final Size size = renderBox.size;
    positionY = size.height;
  }

  void onChanged() {
    setState(() {});
  }

  void onTakePictureButtonPressed() async {
    // data detect
    dynamic data = {"idCard": "123", "nameCard": "name 123"};
    widget.onCapture(data);
    isLoading.value = true;
    final result = await takePicture();
    imageFile = result;

    if (result != null) {
      showInSnackBar('Picture saved to ${result.path}');
    } else {
      print('error');
    }

    isLoading.value = false;
  }

  void showInSnackBar(String message) {
    if (kDebugMode) {
      print(message);
    }
  }

  Future<XFile?> takePicture() async {
    final CameraController cameraController = _cameraController;
    if (!cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }
    if (cameraController.value.isTakingPicture) {
      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    _logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }

  void _logError(String code, String? message) {
    debugPrint(
      'Error: $code${message == null ? '' : '\nError Message: $message'}',
    );
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController cameraController = _cameraController;
    if (!cameraController.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCameraController(cameraController.description);
    }
  }

  Future<void> _initializeCameraController(
      CameraDescription cameraDescription) async {
    final CameraController cameraController =
        CameraController(cameraDescription, ResolutionPreset.max);

    _cameraController = cameraController;

    // If the controller is updated then update the UI.
    cameraController.addListener(() {
      onChanged();
      if (cameraController.value.hasError) {
        showInSnackBar(
            'Camera error ${cameraController.value.errorDescription}');
      }
    });

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      switch (e.code) {
        case 'CameraAccessDenied':
          showInSnackBar('You have denied camera access.');
          break;
        case 'CameraAccessDeniedWithoutPrompt':
          // iOS only
          showInSnackBar('Please go to Settings app to enable camera access.');
          break;
        case 'CameraAccessRestricted':
          // iOS only
          showInSnackBar('Camera access is restricted.');
          break;
        case 'AudioAccessDenied':
          showInSnackBar('You have denied audio access.');
          break;
        case 'AudioAccessDeniedWithoutPrompt':
          // iOS only
          showInSnackBar('Please go to Settings app to enable audio access.');
          break;
        case 'AudioAccessRestricted':
          // iOS only
          showInSnackBar('Audio access is restricted.');
          break;
        default:
          _showCameraException(e);
          break;
      }
    }
    onChanged();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_getWidgetInfo);
    _cameraController =
        CameraController(cameras[0], ResolutionPreset.max, enableAudio: false);
    _cameraController.initialize().then((_) {
      onChanged();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            Get.back();
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  double get position =>
      deviceHeight(context) * 0.1875 + positionY / 2 + Sz.i.s40;
  double get width => deviceWidth(context) - Sz.i.s48;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getColor(context).gray1,
      body: SafeArea(
        child: SizedBox(
          width: deviceWidth(context),
          height: deviceHeight(context),
          child: Stack(
            children: [
              SizedBox.expand(child: CameraPreview(_cameraController)),
              OverlayWithRectangleClipping(position: position),
              _buildOverlay(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOverlay() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 3,
            child: Container(
                color: getColor(context).gray1,
                width: deviceWidth(context),
                padding: EdgeInsets.only(top: Sz.i.s20, left: Sz.i.s10),
                child: const Align(
                    alignment: Alignment.topLeft, child: BuildBackButton()))),
        Expanded(
          flex: 10,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SpacingBox(h: 56),
                SizedBox(key: _widgetKey, width: width, height: width * 0.6789),
                const SpacingBox(h: 25),
                BuildTitleWithSub(
                    title: widget.title, sub: widget.subTitle, size: Sz.i.s20)
              ],
            ),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: isLoading,
          builder: (BuildContext context, bool loading, _) => Expanded(
            flex: 3,
            child: Container(
              width: deviceWidth(context),
              color: getColor(context).gray1,
              padding: EdgeInsets.only(top: Sz.i.s20),
              child: Align(
                alignment: Alignment.topCenter,
                child: isLoading.value
                    ? const CircularProgressIndicator()
                    : GestureDetector(
                        onTap: onTakePictureButtonPressed,
                        child: SvgPicture.asset(AppIcons.buttonCamera),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
