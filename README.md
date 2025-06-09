# musicapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



| Feature                            | Android API                      | iOS API                        |
| ---------------------------------- | -------------------------------- | ------------------------------ |
| Battery info                       | `BatteryManager`                 | `UIDevice.batteryLevel`        |
| Camera                             | `Camera2 API` / `CameraX`        | `AVFoundation`                 |
| Microphone                         | `MediaRecorder`                  | `AVAudioRecorder`              |
| Sensors (accelerometer, gyroscope) | `SensorManager`                  | `CoreMotion`                   |
| Location / GPS                     | `LocationManager` / Google Play  | `CoreLocation`                 |
| Bluetooth                          | `BluetoothAdapter` / BLE APIs    | `CoreBluetooth`                |
| NFC                                | `NfcAdapter`                     | `CoreNFC`                      |
| Biometrics (fingerprint/face)      | `BiometricPrompt`                | `LocalAuthentication`          |
| Push Notifications                 | `Firebase / NotificationManager` | `UNUserNotificationCenter`     |
| Vibration                          | `Vibrator`                       | `AudioServicesPlaySystemSound` |
| File System Access                 | `File`, `ContentResolver`        | `FileManager`                  |

| Feature                     | Android API                    | iOS API                          |
| --------------------------- | ------------------------------ | -------------------------------- |
| Internet connectivity check | `ConnectivityManager`          | `NWPathMonitor` / `Reachability` |
| Wifi state / SSID           | `WifiManager`                  | `CNCopyCurrentNetworkInfo`       |
| HTTP requests               | `HttpURLConnection` / Retrofit | `URLSession`                     |

| Feature                      | Android API                        | iOS API                          |
| ---------------------------- | ---------------------------------- | -------------------------------- |
| Shared Preferences / Storage | `SharedPreferences`                | `UserDefaults`                   |
| Contacts                     | `ContactsContract`                 | `CNContactStore`                 |
| Calendar                     | `CalendarContract`                 | `EventKit`                       |
| SMS                          | `SmsManager`, `Intent.ACTION_SEND` | `MFMessageComposeViewController` |
| Email                        | `Intent.ACTION_SEND`               | `MFMailComposeViewController`    |
| Call logs                    | `CallLog.Calls`                    | Not publicly accessible          |
| App lifecycle                | `LifecycleObserver`, `Activity`    | `UIApplicationDelegate`          |
| Background tasks             | `WorkManager`, `JobScheduler`      | `BackgroundTasks`, `App Refresh` |
| Audio playback               | `MediaPlayer`, `ExoPlayer`         | `AVAudioPlayer`                  |
| Video playback               | `MediaPlayer`, `ExoPlayer`         | `AVPlayer`                       |

| Feature    | Android API                | iOS API                           |
| ---------- | -------------------------- | --------------------------------- |
| Toast      | `Toast.makeText()`         | `UIAlertController` (alert)       |
| Dialogs    | `AlertDialog.Builder`      | `UIAlertController`               |
| Widgets    | `View`, `RecyclerView`     | `UIView`, `UITableView`           |
| Animations | `ObjectAnimator`, `Lottie` | `UIView.animate`, `CoreAnimation` |

| Feature            | Android API                 | iOS API                  |
| ------------------ | --------------------------- | ------------------------ |
| AR                 | `ARCore`                    | `ARKit`                  |
| VR                 | `Google VR SDK`             | Not officially supported |
| Speech Recognition | `SpeechRecognizer`          | `Speech` framework       |
| Machine Learning   | `ML Kit`, `TensorFlow Lite` | `CoreML`                 |
| Screen recording   | `MediaProjection API`       | `ReplayKit`              |

# musicApp_flutter
