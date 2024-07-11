# Boilerplate Base Clean Architecture Flutter

Boilerplate Base Clean Architecture Flutter is a base project for flutter that is built using clean architecture and bloc pattern. 
This project is a starting point for a Flutter application.

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/fuadreza/base_clean_arch.git
```

**Step 2:**

Create or Copy ENV files for production `.env.production` and for staging `.env.staging` consisting of these values:

```
ENV_NAME=
PROJECT_NAME=
API_URL=
API_TELEGRAM_URL=
API_PORT=
APP_TITLE=
APP_VERSION=
SENTRY_DSN=
FRESHCHAT_APP_ID=
FRESHCHAT_APP_KEY=
FRESHCHAT_DOMAIN=
```

**Step 3:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get
```


**Step 4:**

Connect device with debugging on using adb and run project with:

```
flutter run lib/main.dart
```

## Formatting

**Step 1:**

Check if the codes need any fix by running:

```bash
dart fix --dry-run
```

**Step 2:**

Apply fix to the codes by running:

```bash
dart fix --apply
```

**Step 3:**

Fix formatting by running, change line length 300 to preferred length:

```bash
dart format --line-length 300 lib test
```

## Build

### Release (Android)

**Step 1:**

Make sure there is signed key for Android `your-key.jks` and place it into `android/app` folder.

**Step 2:**

Create file `key.properties` in folder `android` and fill with these values:

```
storePassword={{ YOUR_KEYSTORE_PASSWORD }}
keyPassword={{ YOUR_KEY_PASSWORD }}
keyAlias={{ YOUR_KEY_ALIAS }}
storeFile={{ YOUR_KEYSTORE_FILE }}
```

**Step 3:**

Run these command to create android package:

```
flutter build apk --split-per-abi --release --build-name={{ APP_VERSION }} --build-number={{ LATEST_GOOGLE_PLAY_BUILD_NUMBER }}
```

or for appbundle

```
flutter build appbundle --release --build-name={{ APP_VERSION }} --build-number={{ LATEST_GOOGLE_PLAY_BUILD_NUMBER }}
```
