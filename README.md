# Product Catalog

A new Flutter project for a product catalog app, featuring a clean and scalable code structure, dynamic UI, and API integration to display products with detailed information.

## Table of Contents
- [Getting Started](#getting-started)
- [Features](#features)
- [Installation](#installation)
- [Directory Structure](#directory-structure)
- [Running the Project](#running-the-project)
- [Common Issues & Solutions](#common-issues--solutions)
- [Useful Resources](#useful-resources)

## Getting Started

This project serves as a starting point for building a Flutter-based product catalog application.

## Features

- Home screen with horizontally scrollable product categories
- Grid view of products
- Detailed product page
- API integration for fetching products and product details
- Clean and maintainable code structure
- Scalable UI with error handling
- Loading states and error messages
- Navigation between screens

## Installation

### Prerequisites
Ensure the following are installed on your system:
- Flutter SDK
- IDE (Android Studio or VS Code)
- Platform SDKs (Android and/or iOS)
- Environment variables configured for Flutter

### Setting Up the Project

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/product_catalog.git
   cd product_catalog
2. **Install dependencies: Add the HTTP package to your pubspec.yaml file**:
   ```bash
   dependencies:
   flutter:
    sdk: flutter
   http: ^1.1.0
   
  **Then install the dependencies**:
  ```bash
   flutter pub get
```

3. **Directory Structure Create the following directory structure under lib/**:
   ```bash
   lib/
   ├── models/
   │   └── product.dart
   ├── screens/
   │   ├── home_screen.dart
   │   └── product_detail_screen.dart
   ├── widgets/
   │   └── product_card.dart
   └── main.dart

### Running the Project

1. **Check Flutter Setup**:
   ```
   flutter doctor

2. **Create and Navigate to Your Project**:
   ```
   flutter create product_catalog
   cd product_catalog

3. **Connect a Device/Emulator**:
   ```
   flutter devices

4. **Run the Project**:
   ```
   flutter run

### Common Issues & Solutions

1. **Dependencies aren't resolving**:
   ```
   flutter pub cache clean
   flutter pub get

2. **Build fails**:
   ```
   flutter clean
   flutter pub get
   flutter run

## Useful Resources

If you're new to Flutter, here are some resources to help you get started:

- [Flutter Codelab - Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter Cookbook - Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter Documentation](https://docs.flutter.dev/)



   



   
