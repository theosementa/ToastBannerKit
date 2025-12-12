//
//  File.swift
//  ToastBannerKit
//
//  Created by Theo Sementa on 11/12/2025.
//

import Foundation
import SwiftUI

struct ToastBannerModifier<BannerView: View>: ViewModifier {

    // MARK: Dependencies
    @Binding var item: ToastBannerUIModel?
    let bannerView: (ToastBannerUIModel) -> BannerView

    // MARK: States
    @State private var workItem: DispatchWorkItem?

    // MARK: Init
    init(
        item: Binding<ToastBannerUIModel?>,
        bannerView: @escaping (ToastBannerUIModel) -> BannerView
    ) {
        self._item = item
        self.bannerView = bannerView
    }

    // MARK: - View
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay {
                bannerDisplayedView()
                    .offset(y: 30)
                    .animation(.spring(), value: item)
            }
            .onChange(of: item) {
                showBanner()
            }
    }
}

// MARK: - Subviews
extension ToastBannerModifier {

    @ViewBuilder
    func bannerDisplayedView() -> some View {
        if let item {
            VStack {
                bannerView(item)
                    .onTapGesture { dismissBanner() }
                Spacer()
            }
            .transition(.move(edge: .top))
        }
    }
}

// MARK: - Functions
extension ToastBannerModifier {

    private func showBanner() {
        guard let item else { return }

        if item.duration > 0 {
            workItem?.cancel()

            let task = DispatchWorkItem {
                dismissBanner()
            }

            workItem = task
            DispatchQueue.main.asyncAfter(deadline: .now() + item.duration, execute: task)
        }
    }

    private func dismissBanner() {
        withAnimation { item = nil }
        workItem?.cancel()
        workItem = nil
    }
}

// MARK: - UI
public extension View {
    func toastBanner<BannerContent: View>(
        item: Binding<ToastBannerUIModel?>,
        @ViewBuilder content: @escaping (ToastBannerUIModel) -> BannerContent
    ) -> some View {
        modifier(ToastBannerModifier(item: item, bannerView: content))
    }
}
