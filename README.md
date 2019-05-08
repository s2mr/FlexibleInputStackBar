<p align="center">
   <img width="200" src="https://raw.githubusercontent.com/SvenTiigi/SwiftKit/gh-pages/readMeAssets/SwiftKitLogo.png" alt="FlexibleInputStackBar Logo">
</p>

<p align="center">
   <a href="https://developer.apple.com/swift/">
      <img src="https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat" alt="Swift 5.0">
   </a>
   <a href="http://cocoapods.org/pods/FlexibleInputStackBar">
      <img src="https://img.shields.io/cocoapods/v/FlexibleInputStackBar.svg?style=flat" alt="Version">
   </a>
   <a href="http://cocoapods.org/pods/FlexibleInputStackBar">
      <img src="https://img.shields.io/cocoapods/p/FlexibleInputStackBar.svg?style=flat" alt="Platform">
   </a>
   <a href="https://github.com/Carthage/Carthage">
      <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage Compatible">
   </a>
   <a href="https://github.com/apple/swift-package-manager">
      <img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg" alt="SPM">
   </a>
</p>

# FlexibleInputStackBar

<p align="center">
Customizable input accessory view
</p>

## Video of example
![](https://raw.githubusercontent.com/kzumu/FlexibleInputStackBar/resource/Resources/demo.gif)

## Features

- [x] You can create an bar on the keyboard with easy way.
- [x] FlexibleInputStackBar has two UIStackView at left and right.


## Example

The example application is the best way to see `FlexibleInputStackBarDemo` in action. Simply open the `Demo.xcworkspace`.

## Installation

### CocoaPods

FlexibleInputStackBar is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```bash
pod 'FlexibleInputStackBar'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

To integrate FlexibleInputStackBar into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "kzumu/FlexibleInputStackBar"
```

Run `carthage update` to build the framework and drag the built `FlexibleInputStackBar.framework` into your Xcode project. 

On your application targets’ “Build Phases” settings tab, click the “+” icon and choose “New Run Script Phase” and add the Framework path as mentioned in [Carthage Getting started Step 4, 5 and 6](https://github.com/Carthage/Carthage/blob/master/README.md#if-youre-building-for-ios-tvos-or-watchos)

### Swift Package Manager

To integrate using Apple's [Swift Package Manager](https://swift.org/package-manager/), add the following as a dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/kzumu/FlexibleInputStackBar.git", from: "0.0.2")
]
```

## Usage
```swift
import FlexibleInputStackBar

class ViewController: UIViewController {
    private let textField: UITextField = {
        let field = UITextField()
        return field
    }()

    private lazy var flexibleInputStackBar: FlexibleInputStackBar = {
        let bar = FlexibleInputStackBar(height: 40)
        bar.addArrangedSubviewToLeft(leftButton1)
        bar.addArrangedSubviewToRight(rightButton2)
        return bar
    }()
    private let leftButton1 = UIButton(frame: .init(x: 0, y: 0, width: 40, height: 40))
    private let rightButton1 = UIButton(frame: .init(x: 0, y: 0, width: 40, height: 40))

    override var inputAccessoryView: UIView? { return flexibleInputStackBar }

     // if you return true, always input bar is shown.
    override var canBecomeFirstResponder: Bool { return true }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(textField)
    }
}
```


## Contributing
Contributions are very welcome 🙌
