//
//  View + Extensions.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 24.03.2022.
//

import UIKit
import SwiftUI

extension View {
    func calcImageAspectRatio(_ imageName: String) -> CGFloat?
    {
        if let image = UIImage(named: imageName) {
            let size = image.size
            return size.width / size.height
        }
        return nil
    }
}
