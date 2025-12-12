//
//  File.swift
//  ToastBannerKit
//
//  Created by Theo Sementa on 12/12/2025.
//

import Foundation
import UIKit

public struct ToastBannerUIModel: Equatable {
    public var title: String
    public var description: String?
    public var uiImage: UIImage?
    public var style: any ToastBannerStyleProtocol
    public var duration: Double
    
    // MARK: Init
    public init(
        title: String,
        description: String? = nil,
        uiImage: UIImage? = nil,
        style: any ToastBannerStyleProtocol,
        duration: Double = 3,
    ) {
        self.title = title
        self.description = description
        self.uiImage = uiImage
        self.style = style
        self.duration = duration
    }
    
    // MARK: Equatable
    public static func == (lhs: ToastBannerUIModel, rhs: ToastBannerUIModel) -> Bool {
        return lhs.title == rhs.title
    }
}
