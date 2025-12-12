//
//  BannerView.swift
//  ToastBannerKit-Demo
//
//  Created by Theo Sementa on 11/12/2025.
//

import SwiftUI
import ToastBannerKit

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

// MARK: - Preview
#Preview {
    ToastBannerView(toastBanner: .init(title: "preview", style: ToastBannerStyle.success))
}
