# DeviceInsight 📱🔍

[![Build Status](https://github.com/example/deviceinsight/actions/workflows/main.yml/badge.svg)](https://github.com/example/deviceinsight/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?logo=flutter&logoColor=white)](https://flutter.dev/)

DeviceInsight is a premium, production-ready Android diagnostics and monitoring application. Built with a modern Flutter architecture, it provides deep system monitoring through native Method Channels with an elegant glassmorphism UI.

## Features ✨

*   **System Dashboard**: Real-time overview of overall device health.
*   **CPU & Memory**: Monitor architecture, core usages, and frequencies.
*   **Battery & Thermal**: Deep insights into battery health, temperature, voltage, and charging status.
*   **Network Stats**: Track WiFi, Cellular, and real-time upload/download speeds.
*   **Storage Analyzer**: Visualize used and free space.
*   **Material 3**: Responsive glassmorphism UI with Dark and Light mode support.

## Architecture 🏗️

DeviceInsight follows a **Feature-first Clean Architecture** powered by **Riverpod** and **Freezed**.

*   **Presentation Layer**: Riverpod providers and UI widgets.
*   **Domain Layer**: Data models and entities.
*   **Data Layer**: Repositories communicating with native Android APIs via Method Channels.

## Getting Started 🚀

1.  **Clone the repository**
    ```bash
    git clone https://github.com/example/deviceinsight.git
    cd deviceinsight
    ```
2.  **Install dependencies**
    ```bash
    flutter pub get
    ```
3.  **Run the app**
    ```bash
    flutter run
    ```

## Testing 🧪

Run the test suite using:
```bash
flutter test
```

## Contributing 🤝

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
