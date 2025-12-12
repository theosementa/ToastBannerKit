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
    
    func send(_ item: ToastBannerUIModel) {
        self.toastBanner = item
    }
    
}
