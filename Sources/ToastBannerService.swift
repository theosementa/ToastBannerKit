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
    
    public var banner: BannerUIModel?
    
    public init() { }
}

public extension ToastBannerService {
    
    public func send(_ item: BannerUIModel) {
        self.banner = item
    }
    
}
