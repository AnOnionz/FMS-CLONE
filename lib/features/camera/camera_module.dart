import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

import '../../routes/routes.dart';
import 'camera_custom.dart';

class CameraModule extends Module {
  static const String route = '/camera/';
  static const String preview = '/preview';

  @override
  void routes(RouteManager r) {
    r.child(Routes.root, child: (_) => CameraCustom());
    r.child(Routes.root + preview,
        child: (_) => PhotoView(file: r.args.data as XFile),
        transition: TransitionType.noTransition);
  }
}
