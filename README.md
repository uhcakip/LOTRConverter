<div align="center">
  <h1>LOTRConverter</h1>

  <p>
    <a href="https://developer.apple.com/swift/" target="_blank"><img src="https://img.shields.io/badge/Swift-5.9-585b70?logo=swift&style=for-the-badge&labelColor=313244&logoColor=fab387" alt="Swift 5.10"></a>
    <a href="https://developer.apple.com/xcode/"><img src="https://img.shields.io/badge/Xcode-15.4-585b70?logo=Xcode&style=for-the-badge&labelColor=313244&logoColor=89b4fa" alt="Xcode 15.4"></a>
    <a href="https://developer.apple.com/ios/"><img src="https://img.shields.io/badge/iOS-17-585b70?logo=apple&style=for-the-badge&labelColor=313244&logoColor=cdd6f4" alt="iOS 17"></a>
  </p>

  <div>
    <img src="_Demo/1-mockup-main-screen.png" alt="Main Screen" width="250"/>&nbsp;&nbsp;&nbsp;
    <img src="_Demo/2-mockup-exchange-rates-view.png" alt="Exchange Rates View" width="250"/>&nbsp;&nbsp;&nbsp;
    <img src="_Demo/3-mockup-currency-view.png" alt="Currency View" width="250"/>
  </div>

</div>

## Overview
This SwiftUI project is a Lord of the Rings themed currency converter application. Here are the features:

- Convert between different Middle-earth currencies
- Interactive UI with custom backgrounds and icons
- Informative popover tips for improved user experience
- Persistent storage of user's last selected currencies

Based on the Udemy course [iOS 18, SwiftUI 6, & Swift 6: Build iOS Apps From Scratch](https://www.udemy.com/course/ios-15-app-development-with-swiftui-3-and-swift-5/), **with the following implementations by myself**:

- Added persistent storage for user preferences (last selected currencies)
- Integration of additional packages (as shown in [Packages](#packages)) to extend capabilities and streamline development
- Project structure layout (as shown in [Project Structure](#project-structure)) for better organization
- Improved code quality and functionality (as shown in [Enhancements and Refactoring](#enhancements-and-refactoring))

## Demo
<img src="_Demo/demo.gif" alt="LOTRConverter Demo">

## Packages
- [Inject](https://github.com/krzysztofzablocki/Inject) - Used for hot reloading during development

## Project Structure
- `Features/`: Contains the main feature of the app, Currency Exchange
  - `Views/`: Main views for the currency conversion interface
  - `Models/`: Data models and business logic
  - `Components/`: Reusable UI components
  - `Extensions/`: Swift extensions for additional functionality
  - `Tips/`: Custom tips for improved user experience

```
LOTRConverter/
├── LOTRConverterApp.swift
├── Assets.xcassets
├── Features/
│   └── CurrencyExchange/
│       ├── Views/
│       │   ├── CurrencyExchangeView.swift
│       │   ├── CurrencyExchangeInfoView.swift
│       │   └── CurrencySelectionView.swift
│       ├── Models/
│       │   └── CurrencyModel.swift
│       ├── Components/
│       │   ├── BackgroundView.swift
│       │   ├── CurrencyExchangeRateView.swift
│       │   ├── CurrencyIconGridView.swift
│       │   ├── CurrencyIconView.swift
│       │   └── CurrencyInputView.swift
│       ├── Extensions/
│       │   └── UserDefaultsExtension.swift
│       └── Tips/
│           └── CurrencySelectionTip.swift
```

## Enhancements and Refactoring
- Implemented a more modular project structure
- Created reusable UI components for improved maintainability
