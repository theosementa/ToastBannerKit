//
//  BannerManager.swift
//  ToastBannerKit
//
//  Created by Theo Sementa on 11/12/2025.
//


import Foundation

@Observable
public class ToastBannerService {
    @MainActor public static let shared: ToastBannerService = .init()
    
    public var toastBanner: ToastBannerUIModel?
    
    public init() { }
}

public extension ToastBannerService {
    
    @MainActor
    func send(_ item: ToastBannerUIModel, delay: Double = 0) {
        Task {
            if delay > 0 {
                try? await Task.sleep(for: .seconds(delay))
            }
            self.toastBanner = item
        }
    }
    
}
