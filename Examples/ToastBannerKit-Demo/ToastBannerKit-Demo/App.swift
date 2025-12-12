//
//  ToastBannerKit_DemoApp.swift
//  ToastBannerKit-Demo
//
//  Created by Theo Sementa on 11/12/2025.
//

import SwiftUI
import ToastBannerKit

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
