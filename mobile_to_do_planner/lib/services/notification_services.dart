import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BildirimServisi {
  FlutterLocalNotificationsPlugin bildirimEklentisi =
      FlutterLocalNotificationsPlugin();

  // Bildirimleri başlatmak için ayar
  bildirimleriBaslat() async {
    // iOS Ayarları
    final DarwinInitializationSettings iosAyarlar =
        DarwinInitializationSettings(
            requestSoundPermission: true,
            requestBadgePermission: true,
            requestAlertPermission: true);

    // Android Ayarları
    final AndroidInitializationSettings androidAyarlar =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    // Genel Ayarlar
    final InitializationSettings genelAyarlar = InitializationSettings(
      iOS: iosAyarlar,
      android: androidAyarlar,
    );

    // Bildirimleri başlat
    await bildirimEklentisi.initialize(
      genelAyarlar,
      onDidReceiveNotificationResponse: (NotificationResponse yanit) async {
        if (yanit.payload != null) {
          print('Payload: ${yanit.payload}');
        }
        Get.to(() => Container(color: Colors.white));
      },
    );
  }

  // Bildirim Gösterme
  Future bildirimGoster(String baslik, String govde) async {
    const AndroidNotificationDetails androidBildirimDetay =
        AndroidNotificationDetails('kanal_id', 'kanal_adi',
            importance: Importance.max, priority: Priority.high);

    const NotificationDetails bildirimDetay =
        NotificationDetails(android: androidBildirimDetay);

    await bildirimEklentisi.show(
      0,
      baslik,
      govde,
      bildirimDetay,
      payload: 'Bildirim verisi',
    );
  }
}
