import 'dart:async';
import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/routes/routes.dart';
import 'package:image_picker/image_picker.dart';

class CameraCustom extends StatefulWidget {
  CameraCustom({super.key});

  @override
  State<CameraCustom> createState() => _CameraCustomState();
}

class _CameraCustomState extends State<CameraCustom> {
  final Set<MediaCapture?> events = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: CameraAwesomeBuilder.awesome(
          saveConfig: SaveConfig.photo(),
          topActionsBuilder: (state) => AwesomeTopActions(
            padding: EdgeInsets.zero,
            state: state,
            children: [
              SizedBox(
                width: 50.0,
              ),
              if (state is PhotoCameraState)
                AwesomeAspectRatioButton(state: state),
              AwesomeFlashButton(state: state),
            ],
          ),
          middleContentBuilder: (state) => Container(),
          onMediaTap: (p0) {
            final file = p0.captureRequest.when(single: (single) {
              return XFile(single.file!.path);
            });
            Modular.to.pushNamed(Routes.photoView, arguments: file);
          },
          bottomActionsBuilder: (state) {
            return AwesomeBottomActions(
                state: state,
                left: AwesomeCameraSwitchButton(
                  state: state,
                  scale: 1.0,
                  onSwitchTap: (state) {
                    state.switchCameraSensor(
                      aspectRatio: state.sensorConfig.aspectRatio,
                    );
                  },
                ),
                right: StreamBuilder<MediaCapture?>(
                  stream: state.captureState$,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const SizedBox(width: 60, height: 60);
                    }
                    return SizedBox(
                      width: 60,
                      child: AwesomeMediaPreview(
                        mediaCapture: snapshot.requireData,
                        onMediaTap: (mediaCapture) {
                          final file = mediaCapture.captureRequest.when(
                              single: (single) {
                            return XFile(single.file!.path);
                          });
                          Modular.to
                              .pushNamed(Routes.photoView, arguments: file);
                        },
                      ),
                    );
                  },
                ));
          },
        ));
  }
}

class PhotoView extends StatelessWidget {
  final XFile file;

  const PhotoView({
    super.key,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.file(File(file.path)),
        Positioned(
          height: 60,
          bottom: 0,
          width: MediaQuery.of(context).size.width,
          child: Container(
            color: Colors.black.withOpacity(0.6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.0),
                  child: IconButton(
                    splashRadius: 20,
                    iconSize: 30,
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      Modular.to.pop();
                    },
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.0),
                  child: IconButton(
                    splashRadius: 20,
                    iconSize: 30,
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Modular.to.pop();
                      Modular.to.pop(file);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
