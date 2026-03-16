import 'dart:convert';
import 'dart:io';

import 'package:base_clean_arch/core/constants/color_constants.dart';
import 'package:base_clean_arch/core/services/log_service.dart';
import 'package:base_clean_arch/feature/base/domain/entities/notification/notification_local_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

/// Service to handle local notifications.
class LocalNotificationService {
  LocalNotificationService._();

  static final LocalNotificationService instance = LocalNotificationService._();

  static final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();

  // Using a BehaviorSubject allows you to get the last emitted value immediately upon subscription.
  static final BehaviorSubject<NotificationLocalEntity?> onNotifications = BehaviorSubject<NotificationLocalEntity?>();

  /// Initializes the local notification plugin.
  /// The `onDidReceiveNotificationResponse` callback handles notification clicks.
  Future<void> init() async {
    const AndroidInitializationSettings androidSettings = AndroidInitializationSettings('ic_notification');
    const DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    const DarwinInitializationSettings macosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
      macOS: macosSettings,
    );
    try {
      LogService.debugPrint('Initializing local notifications...');
      await _plugin.initialize(
        settings: settings,
        onDidReceiveNotificationResponse: onNotificationResponse,
      );
    } catch (e, s) {
      // Handle any errors that occur during initialization
      LogService.debugLog('Error initializing local notifications: $e', stackTrace: s);
    }

    // Request permissions
    await requestLocalPermissions();
  }

  /// Requests permissions for local notifications.
  /// This method is called to ensure the app has the necessary permissions to show notifications.
  /// Returns true if permissions are granted, false otherwise.
  static Future<void> requestLocalPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await _plugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      await _plugin.resolvePlatformSpecificImplementation<MacOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    } else if (Platform.isAndroid) {
      final androidImplementation = _plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      await androidImplementation?.requestNotificationsPermission();
    }
  }

  /// Static method to handle notification responses (clicks).
  /// This method is called when a user interacts with a notification.
  static void onNotificationResponse(NotificationResponse response) async {
    // This code executes when a user clicks on a notification
    final String? payload = response.payload;
    if (payload != null) {
      LogService.debugPrint('Notification clicked with payload: $payload');
      try {
        final NotificationLocalEntity? parsedPayload = await parseJsonCompute(payload);
        if (parsedPayload != null) {
          onNotifications.add(parsedPayload);
        }
      } catch (e, s) {
        LogService.debugLog('Error parsing notification payload: $e', stackTrace: s);
      }
    } else {
      // Handle the case where there is no payload
    }
  }

  // Parse json using compute
  static Future<NotificationLocalEntity?> parseJsonCompute(String? json) async {
    return await compute(parseJson, json);
  }

  static Future<NotificationLocalEntity?> parseJson(String? json) async {
    if (json == null) return null;
    try {
      final Map<String, dynamic> data = jsonDecode(json);
      return NotificationLocalEntity.fromJson(data);
    } catch (e) {
      LogService.debugPrint('Error parsing JSON: $e');
      return null;
    }
  }

  /// Shows a simple notification.
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    try {
      const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
        'default_channel',
        'Default',
        channelDescription: 'Default channel for notifications',
        importance: Importance.max,
        priority: Priority.high,
        icon: 'ic_notification',
        color: ColorConstants.primary,
      );
      const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        presentBanner: true,
        presentList: true,
      );

      const DarwinNotificationDetails macosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        presentBanner: true,
        presentList: true,
      );

      const NotificationDetails details = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
        macOS: macosDetails,
      );
      try {
        await _plugin.show(
          id: id,
          title: title,
          body: body,
          notificationDetails: details,
          payload: payload,
        );
      } catch (e, s) {
        // Handle any errors that occur while showing the notification
        LogService.debugLog('Error showing notification: $e', stackTrace: s);
      }
    } catch (e) {
      // Handle any errors that occur during the notification setup
    }
  }
}
