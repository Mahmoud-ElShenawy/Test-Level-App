## Test Level Project
This is a Test Level Project


## 📝 Table of Contents
- [About](#about)
- [Getting Started](#getting_started)
- [Technologies & Tools](#tools)
- [Structure](#structure)
- [Author](#author)

## 🧐 About <a name = "about"></a>
The app helps you to create your own design for making a product - Mug - by selecting an image from your gallery to put it on the product

## 🏁 Getting Started <a name = "getting_started"></a>
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
What things you need to install the software and how to install them.

```
Android Studio IDE(Integrated Development Environment)
Flutter SDK(Software Development Kit) - Preferable version is 2.10.2
JDK(JAVA Development Kit) - To run on Android
Xcode 13 - To run on IOS (MAC OS is required)

```

### Installing
A step by step series that tell you how to get a development env running.

Please, Follow the next instructions.

* First Install Packages :
```
$ cd YourProjectFolder
$ flutter clean
$ flutter pub get

```

* To run this project, Open it directly from lib file after open emulator or connect your device :
```

main.dart

```

* If the project has issues in pubspec.yaml related to old version of packages - try :

```
$ cd YourProjectFolder
$ flutter clean
$ flutter pub upgrade

```

## 🔧 Running the tests <a name = "tests"></a>
You can run the unit tests files which located in test directory.

### Unit Test
A way of testing a unit - the smallest piece of code that can be logically isolated in a system. Business Logic (Cubits) is tested by using BLOC TEST, MOCKTAIL and FLUTTER TEST.


```
$ cd YourProjectFolder
$ flutter test test/unit-tests/cubit/design_cubit_test.dart
$ flutter test test/unit-tests/cubit/image_cubit_test.dart

```

## 🚀 Technologies & Tools <a name="tools"></a>
Every INFO you need to know will find in this section.

```

   1. App Structure is MVVM||BLOC (Design Architecture) &  Cubit (State Management)

   2. Flutter SDK in project is ">=2.16.1 <3.0.0" - Null Safety

   3. Use Packages

```

- Packages (Point 3)

```
   1. IOS icons using [Cupertino Icons : 1.0.4]
   2. Declarative routing for screen navigation solution using [Auto Route : 3.2.4]
   3. SQL local database using [SQFlite : 2.0.2]
   4. A comprehensive path manipulation library using [Path : 1.8.0]
   5. Find commonly locations on host platform file systems using [Path Provider : 2.0.9]
   6. Extensible Logger/Print for debug in console using [Logger : 1.1.0]
   7. Implement value without needing to explicitly override (Operator) and (HashCode) using [Equatable : 2.0.3]
   8. State management solution using [Flutter Bloc : 8.0.1]
   9. Pick images from gallery or camera using [Image Picker : 0.8.4+10]
   10. React hooks adds a new kind of object that manage the life-cycle of a Widget with enhanced code reuse using [Flutter Hooks : 0.18.2+1]
   11. Simple direct Service Locator that allows to decouple the interface from a concrete implementation and to access using [Get It : 7.2.0]
   12. Injectable is a convenient code generator for (Get It Package) using [Injectable 2.0.3]
   13. Test blocs which is used with the bloc state management package and it built to work with (Bloc) and (Mocktail) using [Bloc Test : 9.0.3]
   14. Code generation and modular compilation using [Build Runner & Auto Route Generator & Injectable Generator]

```

## ⛏ Structure <a name = "structure"></a>
Explain project directories and the purpose for each one of them

* Common :-
    - Config :
        - Assets => Images
    - Routes :
        - App Router => Initialize Routes
        - App Router Controller => Navigation Functions
        - App Router Import => Compress Routes Imports
        - App Router Import GR => Auto-Generated
        - App Router Observer => Observe Navigation
    - Style :
        - Colors
        - Dimens => Padding & SizedBox & ScreenHeight & ScreenWidth
* DI :-
    - DI Imports => Compress DIs Imports
    - DI Imports Config => Auto-Generated
    - Injector => Inject Service Locator Classes
    - Injector Cubit => Inject Cubits Classes
* Generated (Auto-Generated)
* Model (Data Layer)
* Cubit (View Models || Cubits)
* Repository (Mediator Between The Domain & Data Mapping Layers)
* Util (Custom Utils for Separated Solutions)
* View :-
    - Custom Widget (Reusable Widgets)
    - Screen (Classes which has Each Screen)
    - Widget (Parts of Screen Classes)

## ✍ Author <a name = "author"></a>
[![creator](https://img.shields.io/badge/Creator-Mahmoud%20El%20Shenawy-blue)](https://www.linkedin.com/in/dev-mahmoud-elshenawy/)