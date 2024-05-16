# SwiftUI ile Yerel (uygulama içerisinden) Bildirimler Göndermek

3 adımda kullanıcının yerel bildirimler (local notifications) göndermesini sağlayalım.

1. Kullanıcıdan bildirim izni isteme
2. Zamanlayıcı ile bir bildirim gönderme
3. Belirli bir tarih ve saate göre tekrar eden bir bildirim gönderme

*UserNotifications çerçevesi bildirimleri yönetmek için kullanılır.*


```swift
import UserNotifications
```

**1. Kullanıcıdan bildirim izni isteme**
```swift
UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
    if success {
        print("İzin verildi!")
    } else if let error = error {
        print(error.localizedDescription)
    }
}
```

**2. Zamanlayıcı ile bir bildirim gönderme**
```swift
// Bildirim içeriğini oluştur.
let content = UNMutableNotificationContent()
content.title = "Bildirim Başlığı"
content.subtitle = "Bildirim mesajı veya içeriği."
content.sound = UNNotificationSound.default

// Bildirimin ne zaman gönderileceğini hazırlamak için tetikleyici oluştur.
let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)

// Bildirim isteğini oluştur.
let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

// Bildirimi, bildirim merkezine ekle.
UNUserNotificationCenter.current().add(request)
```

**3. Belirli bir tarih ve saate göre tekrar eden bir bildirim gönderme**
```swift
// Bildirim içeriğini oluştur.
let content = UNMutableNotificationContent()
content.title = "Bildirim Başlığı"
content.subtitle = "Bildirim mesajı veya içeriği."
content.sound = UNNotificationSound.default

var dateComponents = DateComponents()
dateComponents.calendar = Calendar.current // Cihazın takvimini kullanacak.

dateComponents.weekday = 1  // Hangi gün
dateComponents.hour = 12    // Hangi saat

// Bildirimin ne zaman gönderileceğini hazırlamak için tetikleyici oluştur.
let trigger = UNCalendarNotificationTrigger(
         dateMatching: dateComponents, repeats: true)

// Bildirim isteğini oluştur.
let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

// Bildirimi, bildirim merkezine ekle.
UNUserNotificationCenter.current().add(request)
```
