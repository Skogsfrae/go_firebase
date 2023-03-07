# go_firebase

A Flutter project for showcasing the integration between go_router and Firebase tools,
used for a Flutter Heroes talk, available on [YouTube at this link](https://www.youtube.com/watch?v=J5D9MqnXUe8).

## Getting Started

To run and build this project, you need to create a firebase project,
then create a file json for each app you want to integrate and save it in a path like `firebase_config/android.json`
with this content and write your project configuration:

```json
{
    "FIREBASE_API_KEY": "..",
    "FIREBASE_APP_ID": "...",
    "FIREBASE_MESSAGING_SENDER_ID": "...",
    "FIREBASE_PROJECT_ID": "...",
    "FIREBASE_AUTH_DOMAIN": "...",
    "FIREBASE_STORAGE_BUCKET": "...",
    "FIREBASE_IOS_CLIENT_ID": "...",
    "FIREBASE_MEASUREMENT_ID": "..."
}
```

then run 

`flutter run --dart-define-from-file=firebase_config/android.json`

## Rights

All media used in this project is not property of the developer and is used purely for teaching purpose.
