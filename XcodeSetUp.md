# 💻 macOS Setup for Flutter & React Native 

This guide covers all the setup steps needed to configure Flutter and React Native on macOS Ventura using Homebrew, Xcode, and CocoaPods.

---

## ✅ 1. Switch to Full Xcode (Not CLI Tools)

```bash
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -license
```

Press `space` to scroll, then type `agree`.

---

## ✅ 2. Confirm Xcode Is Set Correctly

```bash
xcode-select -p
# Should return: /Applications/Xcode.app/Contents/Developer

xcodebuild -version
# Example:
# Xcode 14.3.1
# Build version 14E300c
```

---

## ✅ 3. Install CocoaPods (Required for iOS)

### Option 1: Using Homebrew (recommended)

```bash
brew install cocoapods
```

### Option 2: Using Ruby (fallback)

```bash
sudo gem install cocoapods
```

### Setup CocoaPods:

```bash
pod setup
```

---

## ✅ 4. Check Flutter Environment

```bash
flutter doctor
```

> If you see a warning about Android licenses, run:

```bash
flutter doctor --android-licenses
```

Press `y` for each license prompt.

---

## ✅ 5. Run Flutter App on iOS Simulator

Create and run a test project:

```bash
flutter create myapp
cd myapp
flutter run -d ios
```

---

## ⚠️ Notes About Xcode Version

* Flutter **recommends** Xcode 15+, but **Xcode 14.3.1 still works** on Ventura.
* The App Store will not allow Xcode 15+ unless you're on macOS **Sonoma** or later.

---

## ✅ 6. React Native iOS Setup

Inside your React Native project:

```bash
cd ios
pod install
cd ..
npx react-native run-ios
```

Make sure you have these tools:

```bash
brew install node
brew install watchman
```

---

## Optional: Create a New React Native App

```bash
npx react-native init MyApp
cd MyApp
npx react-native run-ios
```

---

## ✅ Final Checklist

* [x] Homebrew installed
* [x] Xcode installed and licensed
* [x] CocoaPods installed and set up
* [x] Flutter doctor ✅ (except Xcode version warning)
* [x] Able to run iOS apps in both Flutter and React Native


### b
---
```bash
open -a Simulator
flutter run
flutter run -d iPhone-14
flutter devices           # List all connected/simulated devices
flutter run -d <deviceId>  # Run on specific device
xcrun simctl list runtimes # to see available runtimes:
xcrun simctl list devices # check installed simulators:

```


### vil
```bash
### Accept Xcode license and install CLI tools
sudo xcodebuild -license
xcode-select --install


```
