//
//  ContentView.swift
//  ToastBannerKit-Demo
//
//  Created by Theo Sementa on 11/12/2025.
//

import SwiftUI
import ToastBannerKit

struct ContentView: View {
    
    // MARK: Envrionments
    @Environment(ToastBannerService.self) private var toastBannerService
    
    // MARK: - View
    var body: some View {
        VStack {
            Button {
                toastBannerService.send(.successBanner)
            } label: {
                Text("Send a banner")
            }
        }
        .padding()
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
