// UIFlow library exports and definition

// Export components
export 'src/components/buttons.dart';
export 'src/components/fonts.dart';
export 'src/components/general.dart';
export 'src/components/images_preview.dart';
export 'src/components/loading.dart';
export 'src/components/multiple_item_select.dart';
export 'src/components/reposnsiveness.dart';
export 'src/components/toast_show.dart';
export 'src/components/widgets_display.dart';

// Export advanced components (NEW!)
export 'src/components/dialogs.dart';
export 'src/components/advanced_widgets.dart';
export 'src/components/animations.dart';

// Export config - themes
export 'src/config/themes/theme_manager.dart';

// Export config - utils - managers
export 'src/config/utils/managers/app_assets.dart';
export 'src/config/utils/managers/app_constants.dart';
export 'src/config/utils/managers/app_enums.dart';
export 'src/config/utils/managers/app_extensions.dart';
export 'src/config/utils/managers/app_values.dart';

// Export advanced utilities (NEW!)
export 'src/config/utils/managers/app_validators.dart';
export 'src/config/utils/managers/app_formatters.dart';

// Export config - utils - styles
export 'src/config/utils/styles/app_colors.dart';
export 'src/config/utils/styles/app_fonts.dart';
export 'src/config/utils/styles/app_textstyles.dart';

// Platform interface and main class
export 'uiflow_platform_interface.dart';

import 'uiflow_platform_interface.dart';

class Uiflow {
  Future<String?> getPlatformVersion() {
    return UiflowPlatform.instance.getPlatformVersion();
  }
}
