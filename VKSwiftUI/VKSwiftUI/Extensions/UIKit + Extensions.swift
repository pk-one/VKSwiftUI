//
//  UIKit + Extensions.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 24.03.2022.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
