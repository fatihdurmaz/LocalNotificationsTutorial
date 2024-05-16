# Sending Local Notifications with SwiftUI

<img src="https://yourimageshare.com/ib/xjCvJQIC6f.webp" alt="SwiftUI Local Notifications">

## Let's Enable Users to Send Local Notifications in 3 Steps

1. Request Notification Permission from the User
2. Send a Notification with a Timer
3. Send a Recurring Notification at a Specific Date and Time

*UserNotifications framework is used to manage notifications.*


```swift
import UserNotifications
```

**1. Request Notification Permission from the User**
```swift
UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
    if success {
        print("Permission granted!")
    } else if let error = error {
        print(error.localizedDescription)
    }
}
```

**2. Send a Notification with a Timer**
```swift
// Make notification content.
let content = UNMutableNotificationContent()
content.title = "Notification Title"
content.subtitle = "Notification Message"
content.sound = UNNotificationSound.default

// Create a trigger to schedule when the notification will be sent.
let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)

// Create the notification request.
let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

// Add the notification to the notification center.
UNUserNotificationCenter.current().add(request)
```

**3. Send a Recurring Notification at a Specific Date and Time**
```swift
// Make notification content.
let content = UNMutableNotificationContent()
content.title = "Notification Title"
content.subtitle = "Notification Message"
content.sound = UNNotificationSound.default

var dateComponents = DateComponents()
dateComponents.calendar = Calendar.current // Will use the device's calendar.

dateComponents.weekday = 1  // Which day
dateComponents.hour = 12    // Which hour

// Create a trigger to schedule when the notification will be sent.
let trigger = UNCalendarNotificationTrigger(
         dateMatching: dateComponents, repeats: true)

// Create the notification request.
let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

// Add the notification to the notification center.
UNUserNotificationCenter.current().add(request)
```
