//
//  BannerView.swift
//  ToastBannerKit-Demo
//
//  Created by Theo Sementa on 11/12/2025.
//

import SwiftUI
import ToastBannerKit

struct BannerView: View {
    
    // MARK: Dependencies
    let banner: BannerUIModel?
    
    // MARK: - View
    var body: some View {
        if let banner {
            VStack(alignment: .leading, spacing: 8) {
                Text(banner.title)
                
                if let description = banner.description {
                    Text(description)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(banner.style.rawValue == BannerStyle.success.rawValue ? Color.green : Color.red)
        }
    }
}

// MARK: - Preview
#Preview {
    BannerView(banner: .init(title: "preview", style: BannerStyle.success))
}
