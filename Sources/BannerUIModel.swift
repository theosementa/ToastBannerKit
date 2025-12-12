//
//  File.swift
//  ToastBannerKit
//
//  Created by Theo Sementa on 12/12/2025.
//

import Foundation
import UIKit

public struct BannerUIModel: Equatable {
    public var title: String
    public var description: String?
    public var uiImage: UIImage?
    public var style: ToastBannerStyleProtocol
    public var duration: Double
    
    // MARK: Init
    public init(
        title: String,
        description: String? = nil,
        uiImage: UIImage? = nil,
        style: ToastBannerStyleProtocol,
        duration: Double = 3,
    ) {
        self.title = title
        self.description = description
        self.uiImage = uiImage
        self.style = style
        self.duration = duration
    }
    
    // MARK: Equatable
    public static func == (lhs: BannerUIModel, rhs: BannerUIModel) -> Bool {
        return lhs.title == rhs.title
    }
}
