<h1 align="center">🎨 UIFlow Components 🚀</h1>
<p align="center">
  <img src="https://github.com/Syf-Almjd/uiflow/blob/main/assets/logo.png?raw=true" alt="Library Logo" width="300">
</p>


<div align="center"> 

![Pub status](https://img.shields.io/badge/STATUS-WIP-orange?style=for-the-badge&amp;color=blue)
![GitHub license](https://img.shields.io/github/license/Syf-Almjd/uiflow?style=for-the-badge)
![Pub version forks](https://img.shields.io/pub/v/uiflow?style=for-the-badge)

[![Pub Package](https://img.shields.io/pub/v/uiflow?label=Pub&logo=dart)](https://pub.dev/packages/uiflow)
[![Star on Github](https://img.shields.io/github/stars/Syf-almjd/uiflow.svg?style=flat&logo=github&colorB=deeppink&label=Stars)](https://github.com/Syf-Almjd/uiflow)
[![Forks on Github](https://img.shields.io/github/forks/Syf-almjd/uiflow?style=flat&logo=github&colorB=deeppink&label=Forks&logo=github)](https://github.com/Syf-Almjd/uiflow)
[![Contributors](https://img.shields.io/github/contributors/Syf-almjd/uiflow.svg?style=flat&logo=github&colorB=yellow&label=Contributors)](https://github.com/Syf-Almjd/uiflow)
[![Code Size](https://img.shields.io/github/languages/code-size/Syf-almjd/uiflow?logo=github&color=blue&label=Size)](https://github.com/Syf-Almjd/uiflow)
[![License: MIT](https://img.shields.io/github/license/Syf-almjd/uiflow?label=License&color=red&logo=Leanpub)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/Platform-Android%20|%20iOS%20-blue.svg?logo=flutter)](https://pub.dev/packages/uiflow)

</div>


<p align="center">
  A collection of delightful Flutter components for building beautiful and responsive user interfaces.
</p>


## ✨ Features

### 🎨 Theming & Styling
- **Pre-built Themes**: Light and dark theme support out of the box
- **Consistent Color Palette**: Predefined colors for consistent UI
- **Typography System**: Multiple text styles (regular, medium, bold, semi-bold)
- **Customizable**: Easy to override with your brand colors

### 🧩 UI Components
- **Smart Buttons**: Pre-styled buttons with various styles and states
- **Loading Widgets**: Beautiful loading indicators and dialogs
- **Toast Notifications**: Quick feedback with success, error, and info toasts
- **Image Preview**: Advanced image viewing with network loading states
- **Multi-Select Widget**: Elegant selection UI with single/multiple selection modes
- **Display Widgets**: Pre-built widgets for lists, grids, and cards
- **🆕 Badges**: Notification badges with count support
- **🆕 Chips**: Selectable and deletable chip widgets
- **🆕 Cards**: Pre-styled card components with elevation
- **🆕 Avatars**: User avatars with fallback initials
- **🆕 Dividers**: Text dividers and separators
- **🆕 Empty States**: Beautiful empty state screens
- **🆕 Progress Bars**: Linear progress indicators with labels

### 🎭 Animations
- **🆕 Slide Transitions**: From top, bottom, left, right
- **🆕 Fade Animations**: Smooth fade in/out effects
- **🆕 Scale Animations**: Elastic and smooth scaling
- **🆕 Rotation Animations**: Rotation transitions
- **🆕 Combined Animations**: Fade+Slide, Fade+Scale combos
- **🆕 Staggered Lists**: Beautiful list entrance animations
- **🆕 Shimmer Loading**: Skeleton loading effect

### 📋 Forms & Validation
- **🆕 Form Validators**: Email, password, phone, credit card, URL, username, etc.
- **🆕 Text Formatters**: Phone, credit card, currency, date, SSN formatting
- **🆕 Custom Validators**: Combine multiple validators
- **🆕 Password Strength**: Configurable password requirements

### 💬 Dialogs & Modals
- **🆕 Confirmation Dialogs**: Yes/No with danger mode
- **🆕 Info Dialogs**: Informational alerts
- **🆕 Error Dialogs**: Error notifications
- **🆕 Success Dialogs**: Success confirmations
- **🆕 Input Dialogs**: Text input with validation
- **🆕 Selection Dialogs**: Choose from list
- **🆕 Bottom Sheets**: Modal bottom sheets
- **🆕 Custom Dialogs**: Fully customizable

### 📐 Responsive Design
- **Screen Aware**: Automatic responsive sizing based on screen dimensions
- **Easy to Use**: Simple `getWidth()` and `getHeight()` functions
- **Cross-Platform**: Works seamlessly on mobile, tablet, and desktop

### 🛠️ Utilities & Extensions
- **Asset Management**: Centralized asset path management
- **Constants**: App-wide constants for consistency
- **Enums**: Type-safe enumerations for better code quality
- **🆕 String Extensions**: 25+ string helpers (capitalize, truncate, validate, mask, etc.)
- **🆕 DateTime Extensions**: Time ago, formatting, date math
- **🆕 List Extensions**: Chunking, unique, shuffle
- **🆕 BuildContext Extensions**: Screen size, theme access, navigation shortcuts
- **🆕 Number Extensions**: Currency formatting, ordinals

### 🚀 Developer Experience
- **Well Documented**: Comprehensive inline documentation
- **Type Safe**: Full null-safety support
- **Easy Integration**: Simple import and use
- **Minimal Dependencies**: Only essential plugins included
- **Production Ready**: Battle-tested components
- **35+ Components**: Extensive toolkit for rapid development

## 📗 Installation

Add `uiflow` to your `pubspec.yaml` file:

```yaml
dependencies:
  uiflow: ^0.3.1
```

Then run:

```bash
flutter pub get
```

## 🗜️ Usage

Import the library in your Dart file:

```dart
import 'package:uiflow/uiflow.dart';
```

You can also import with a prefix for better code organization:

```dart
import 'package:uiflow/uiflow.dart' as ui;
```

Now you can start using the various components provided by `uiflow` to enhance your Flutter app!

## 🈂️ Examples

### Basic Usage

```dart
import 'package:flutter/material.dart';
import 'package:uiflow/uiflow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UIFlow Demo',
      theme: getApplicationTheme(), // Use UIFlow theme
      darkTheme: getDarkApplicationTheme(), // Dark theme support
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UIFlow Components',
          style: getBoldStyle(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Using text styles
            Text(
              'Welcome to UIFlow!',
              style: getBoldStyle(
                color: AppColors.primaryColor,
                fontSize: AppFontSize.s24,
              ),
            ),
            const SizedBox(height: 20),
            
            // Using responsive design
            Text(
              'Responsive Width: ${getWidth(50, context)}',
              style: getRegularStyle(),
            ),
            const SizedBox(height: 20),
            
            // Using buttons
            getButton(
              text: 'Primary Button',
              onPressed: () {
                showToast(
                  msg: 'Button clicked!',
                  toastType: ToastType.success,
                );
              },
              context: context,
            ),
          ],
        ),
      ),
    );
  }
}
```

### Using Multiple Item Selection

```dart
MultipleItemSelect(
  name: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
  multiSelection: true,
  primaryColor: AppColors.primaryColor,
  secondaryColor: AppColors.grey,
  itemPerRow: 2,
  onTap: (selectedItem) {
    print('Selected: $selectedItem');
  },
)
```

### Using Loading Widgets

```dart
// Show loading indicator
showLoadingDialog(context);

// After async operation
Navigator.pop(context);
```

### Responsive Design

```dart
Container(
  width: getWidth(80, context), // 80% of screen width
  height: getHeight(30, context), // 30% of screen height
  child: YourWidget(),
)
```

## 📚 API Reference

### Theming

#### `getApplicationTheme()`
Returns the light theme for your application.

```dart
MaterialApp(
  theme: getApplicationTheme(),
)
```

#### `getDarkApplicationTheme()`
Returns the dark theme for your application.

```dart
MaterialApp(
  darkTheme: getDarkApplicationTheme(),
)
```

### Text Styles

All text style functions accept optional `color` and `fontSize` parameters.

```dart
// Available text styles
getRegularStyle({Color? color, double? fontSize})
getMediumStyle({Color? color, double? fontSize})
getSemiBoldStyle({Color? color, double? fontSize})
getBoldStyle({Color? color, double? fontSize})
getLightStyle({Color? color, double? fontSize})
```

### Buttons

#### `getButton()`
Creates a customizable button with various styles.

```dart
getButton(
  text: 'Click Me',
  onPressed: () {},
  context: context,
  backgroundColor: AppColors.primaryColor, // optional
  textColor: AppColors.white, // optional
  width: double.infinity, // optional
)
```

### Responsive Design

```dart
// Get responsive width (percentage of screen width)
double width = getWidth(50, context); // 50% of screen width

// Get responsive height (percentage of screen height)
double height = getHeight(30, context); // 30% of screen height
```

### Toast Notifications

```dart
showToast(
  msg: 'Your message here',
  toastType: ToastType.success, // or ToastType.error, ToastType.info
)
```

### Loading Dialogs

```dart
// Show loading dialog
showLoadingDialog(context);

// Dismiss loading dialog
Navigator.pop(context);
```

### Colors

Access predefined colors from `AppColors`:

```dart
AppColors.primaryColor
AppColors.darkColor
AppColors.white
AppColors.grey
AppColors.greyDark
AppColors.greenColor
AppColors.redColor
AppColors.lowPriority
```

### Font Sizes

Access consistent font sizes from `AppFontSize`:

```dart
AppFontSize.s12
AppFontSize.s14
AppFontSize.s16
AppFontSize.s18
AppFontSize.s20
AppFontSize.s24
// and more...
```



Explore detailed documentation and examples by visiting the [official documentation](https://pub.dev/packages/uiflow/example). Whether you're a beginner or an experienced developer, this resource provides valuable insights into effectively using UIFlow Components.

### Features:

- **Comprehensive Examples:** Dive into a rich collection of examples showcasing various use cases and implementation scenarios.
- **Integration Guides:** Find step-by-step guides and best practices for seamless integration of UIFlow Components into your Flutter projects.


## 🤙 Contributing

We actively encourage and appreciate contributions from the community! To get started, please read our [Contribution Guide](https://github.com/Syf-Almjd/uiflow/issues). This guide outlines the process of contributing, coding standards, and how to submit pull requests. Your input is valuable in enhancing and expanding UIFlow Components.

### How to Contribute:

1. **Fork the Repository:** Start by forking the repository to your GitHub account.
2. **Create a Branch:** Create a new branch for your contribution to keep your changes isolated.
3. **Make Changes:** Implement your improvements or fixes, following the guidelines in the Contribution Guide.
4. **Submit a Pull Request:** Once your changes are ready, submit a pull request, and we'll review it promptly.


## 💳 License

This project is licensed under the MIT License, a widely recognized open-source license that promotes flexibility and collaboration. The MIT License allows you the freedom to use, modify, and distribute UIFlow Components in your projects, both personal and commercial.

### Key Points:

- **Permissions:** You are granted extensive permissions under the MIT License, including the right to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the software.

- **Attribution:** While not required, it is appreciated if you include the original copyright notice and the disclaimer when you redistribute the software or substantial portions of it.

### Full Details:

For full details and legal terms, please refer to the [LICENSE](LICENSE) file included with this project. It's important to review the license to understand your rights and responsibilities.

Feel confident incorporating UIFlow Components into your projects, knowing that you have the freedom and flexibility to adapt and share the software according to your needs.

## 🛎️ Connect with SaifAlmajd
<h3 align="center">SaifAlmajd - Passionate of Full Stack Mobile/Web Development</h3>
<p align="center"> <a href="https://instagram.com/saif_almajd" target="blank"><img src="https://img.shields.io/twitter/follow/SaifAlmajd?logo=instagram&style=for-the-badge" alt="saif_almajd" /></a> <a href="https://github.com/Syf-Almjd" target="blank"><img src="https://img.shields.io/twitter/follow/Syf-Almjd?logo=github&style=for-the-badge" alt="saif_almajd" /></a> <a href="https://www.linkedin.com/in/saif-almajd/" target="blank"><img src="https://img.shields.io/twitter/follow/SaifAlmajd?logo=linkedin&style=for-the-badge" alt="saif_almajd" /></a> <a href="https://twitter.com/hsaifalmajd" target="blank"><img src="https://img.shields.io/twitter/follow/hsaifalmajd?logo=twitter&style=for-the-badge" alt="hsaifalmajd" /></a>
<a href="https://pub.dev/publishers/saifalmajd.blogspot.com/packages" target="blank"><img src="https://img.shields.io/twitter/follow/saifalmajd?logo=dart&style=for-the-badge" alt="saifalmajd" /></a>
</p>




<!-- Stay connected with us through the following channels: -->
<!-- 
- **Github:** Follow us on Github at [@Syf-Almjd](https://github.com/Syf-Almjd) for updates and announcements.
- **Developer Portfolio:** Connect with the developer, SaifAlmajd, via their portfolio at [SaifAlmajd](https://saifalmajd.web.app/). -->


<!-- <h3 align="center">Connect with Me:</h3> -->
<p align="center">
<!-- <a href="https://dev.to/https://dev.to/saifalmajd" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/devto.svg" alt="https://dev.to/saifalmajd" height="30" width="40" /></a> -->
<a href="https://twitter.com/hsaifalmajd" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/twitter.svg" alt="hsaifalmajd" height="30" width="40" /></a>
<a href="https://linkedin.com/in/saif-almajd" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/linked-in-alt.svg" alt="saif-almajd" height="30" width="40" /></a>
<a href="https://stackoverflow.com/users/19370215" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/stack-overflow.svg" alt="19370215" height="30" width="40" /></a>
<a href="https://instagram.com/saif_almajd/" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/instagram.svg" alt="saif_almajd/" height="30" width="40" /></a>
<a href="https://dribbble.com/saifalmajd" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/dribbble.svg" alt="saifalmajd" height="30" width="40" /></a>
<a href="https://hashnode.com/@saifalmajd" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/hashnode.svg" alt="@saifalmajd" height="30" width="40" /></a>
<a href="https://auth.geeksforgeeks.org/user/syfalm4h6f" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/geeks-for-geeks.svg" alt="syfalm4h6f" height="30" width="40" /></a>
<a href="/https://github.com/syf-almjd.atom" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/rss.svg" alt="https://github.com/syf-almjd.atom" height="30" width="40" /></a>
</p>


<p align="center">Happy Flutter Coding! 🚀✨</p>

## 🔥 Support FF_Components Dev.

<p align="center"> <a href="https://www.buymeacoffee.com/saifalmajdalmassri"> <img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" height="50" width="210" alt="https://www.buymeacoffee.com/saifalmajdalmassri" /></a><a href="https://ko-fi.com/saifalmajdalmassri"> &nbsp; <img src="https://cdn.ko-fi.com/cdn/kofi3.png?v=3" height="50" width="210" alt="https://ko-fi.com/saifalmajdalmassri" 

<p align="center">Happy Flutter Coding! 🚀✨</p>


/></a></p><br><br>

