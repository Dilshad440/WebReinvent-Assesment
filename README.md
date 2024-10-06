## Key Plugins Used:

1. **get_it**: Used for dependency injection to manage and inject dependencies throughout the app.
2. **flutter_bloc**: Employed for state management, allowing separation of concerns and reactive UI updates.
3. **sqf_lite**: Used as the local database for persistent storage.
4. **equatable**: Used alongside `flutter_bloc` to manage states efficiently by comparing objects in the state.
5. **uuid**: A simple library to generate unique identifiers.
6. **dartz**: Utilized for functional error handling and the representation of data types.
7. **fluttertoast**: Used to display toast messages for user feedback.

## SDK Versions

- **Flutter SDK**: `3.24.3`
- **Dart SDK**: `3.5.3`
- **IDE**: Android Studio: `Koala Feature Drop | 2024.1.2`

## Folder Structure (Clean Architecture)

The project is developed following **Clean Architecture**, ensuring separation of concerns and scalability. Here's a breakdown of the folder structure:

```plaintext
lib/
 |-- core/            # Contains common widgets, constants, and base setup
 | -- src
   | -- feature
      |-- data/             # Data layer: Responsible for accessing and managing local & remote data
         |-- models/        # Data models or entities representing objects from the database/API
         |-- repositories/  # Repository implementations that handle data source logic

      |-- domain/           # Domain layer: Contains  business logic and use cases
         |-- repositories/  # Abstract repository interfaces used by the data layer
         |-- usecases/      # Business logic or use cases

      |-- di/               # Used for the dependency injection
       
      |-- presentation/    # Presentation layer: Handles UI and user interactions
         |-- bloc/        # Bloc or cubit classes for state management
         |-- pages/       # UI screens or pages
         |-- widgets/     # Reusable UI components/widgets
         
   |-- common utils/      # Used for the common utilities and toast message
   
```

