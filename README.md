# ToastBannerKit
A Swift package for easily displaying toast banners in SwiftUI 

<br>

## Features
- [X] Send toast banner
- [ ] Send toast banner in dynamic island
- [X] Add examples

<br>

## How to use?

```swift
import ToastBannerKit
```

<br>

Conform an enum to `ToastBannerStyleProtocol` 
```swift
enum ToastBannerStyle: String, ToastBannerStyleProtocol {
    case error
    case success
}
```

<br>

Create a ToastBanner model
```swift
extension ToastBannerUIModel {
    static let successBanner: ToastBannerUIModel = .init(
        title: "This is a success banner",
        description: "This is a description for my toast banner.",
        style: ToastBannerStyle.success
    )
}
```

<br>

Create an UI for the banner
```swift
struct ToastBannerView: View {
    
    // MARK: Dependencies
    let toastBanner: ToastBannerUIModel?
    
    // MARK: - View
    var body: some View {
        if let toastBanner {
            VStack(alignment: .leading, spacing: 8) {
                Text(toastBanner.title)
                
                if let description = toastBanner.description {
                    Text(description)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(toastBanner.style.rawValue == ToastBannerStyle.success.rawValue ? Color.green : Color.red)
        }
    }
}
```

<br>

Add the modifier `.toastBanner` at the top of your app
```swift
@main
struct ToastBannerKit_DemoApp: App {
    
    @State private var toastBannerService: ToastBannerService = .shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(toastBannerService)
                .toastBanner(item: $toastBannerService.toastBanner) { toastBanner in
                    ToastBannerView(toastBanner: toastBanner)
                }
        }
    }
}
```

<br>

Send a banner
```swift
Button {
    toastBannerService.send(.successBanner)
} label: {
    Text("Send a banner")
}
```

<br>

## Credits
Handmade by [Théo Sementa](https://x.com/theosementa)
