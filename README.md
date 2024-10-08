# My own clean architecture Project Structure

## lib

- **core**

  - **network**

    - dio_configuration
    - **error_handling**
      - error_model
      - exceptions
      - dio_exception_handler
      - failure

  - **dependency_injection**

    - core_injection.dart
    - network_injection.dart
    - user_injection.dart (for example)
    - main_injection.dart

  - **state**

    - app_states

  - routing
  - theming
  - widgets
  - helpers/cache_helper

- **features**

  - **Presentation**

    - pages
    - widgets
    - state

  - **Business**

    - usecases
    - entities

  - **Data**
    - **repository**
    - **services**
      - **remote**
        - get_user_service (for example)
      - **local**
        - cache_user_service (for example)
    - models
    - **data_source**
      - **remote**
        - remote_api_service
      - **local**
        - local_api_service

# Packages Needed

- provider
- dartz
- get_it
- dio
- retrofit
- retrofit_generator
- pretty_dio_logger
- json_serializable
- build_runner
- json_annotation
- logger
- data_connection_checker_tv
- shared_preferences
