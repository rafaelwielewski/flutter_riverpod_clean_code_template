# Flutter Riverpod Clean Architecture Template

This template is a starting point for Flutter applications following the Clean Architecture principles and using Riverpod for state management. It's designed to provide a solid foundation for building scalable, maintainable, and testable Flutter applications.

## Features

- **Clean Architecture**: Organized in a way that separates concerns and follows the principles of Clean Architecture, making the codebase more maintainable and scalable.
- **State Management with Riverpod**: Utilizes Riverpod for state management, providing a flexible and scalable approach to managing app state.
- **Dependency Injection**: Easy dependency management and injection, facilitating testing and modularity.
- **Biometric Authentication**: Integrated biometric authentication for enhanced security.
- **Secure Storage**: Uses `flutter_secure_storage` for secure data storage.
- **Networking**: Implemented with `dio` for network calls, including error handling and retries.
- **Localization**: Support for internationalization using `intl`.
- **Routing**: Uses `auto_route` for declarative routing and navigation.
- **Custom Fonts and Themes**: Includes custom fonts and theming options to enhance UI/UX.
- **Splash Screen**: Customizable native splash screen for a better app launch experience.

## Getting Started

To get started with this template, ensure you have Flutter installed on your machine. Clone this repository and navigate to the project directory:

```bash
git clone https://github.com/yourgithubusername/flutter_riverpod_clean_architecture_template.git
cd flutter_riverpod_clean_architecture_template
```

Install the dependencies:
```bash
flutter pub get
```
Run the application:
```bash
flutter run
```

## Project Structure

The project is meticulously organized following the Clean Architecture principles, ensuring a clear separation of concerns. This structure not only makes the codebase more maintainable and scalable but also facilitates testing. Here's a breakdown of the main components:

### Data Layer
- **DTOs (Data Transfer Objects)**: Objects that carry data between processes in order to reduce the number of method calls. They are used for mapping data from the database or external APIs into a format that is more convenient to work with in the application.
- **Repositories**: Concrete implementations of the repository interfaces defined in the Domain layer. They are responsible for coordinating data from various sources (like the Remote and Local Data Sources).
- **Data Sources**: Handles data transactions. It's further divided into:
  - **Remote Data Source**: Manages network calls, interfacing with external APIs.
  - **Local Data Source**: Manages local persistence, such as caching or using databases.

### Domain Layer
- **Models**: The core business logic objects of the application. These are usually plain Dart classes that represent the data used across the application.
- **Enums**: Enumerations that define a set of named constants used throughout the application, such as error types or status values.
- **Services**: Classes that encapsulate business logic and operations, such as user authentication or data processing, not directly related to the UI.
- **Providers (Riverpod)**: Riverpod providers that encapsulate and provide an interface for accessing the application's state and logic in a reactive way.
- **Exceptions**: Custom exception classes that represent errors within the domain layer, making error handling more explicit and manageable.
- **Repositories Interfaces**: Abstract definitions for the operations that can be performed on the entities.

### Presentation Layer
- **Screens**: Represents the screens or pages of the application.
- **Widgets**: Reusable UI components.
- **State Management (Riverpod)**: Manages the state of the UI components, facilitating a reactive and efficient UI.
- **Styles**: Defines the global theme data, including colors, typography, and other styling constants that ensure a consistent look and feel across the application.
- **Layouts**: Reusable layout widgets or templates that provide a consistent structure for screens, such as a standard scaffold with a navigation bar.


### Utils
- **Extensions**: Dart extension methods on existing classes, providing additional functionality or shortcuts for common operations.
- **Validators**: Functions or classes that handle form validation, ensuring data integrity before it's processed or sent to the backend.
- **Helpers**: Miscellaneous utility classes or functions that perform common tasks, such as date formatting or string manipulation, not fitting into other categories.

