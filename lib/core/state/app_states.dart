enum AppStates {
  loading, // For when a request is being processed
  success, // For when a request is successful
  failure, // For when an error or failure occurs
  empty, // For when data is successfully fetched but is empty
  idle, // For when the state is not yet initialized
}
