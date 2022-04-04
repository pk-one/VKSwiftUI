//
//  CodingStyle.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 04.04.2022.
//

import SwiftUI

enum Decorators {
    case camelCase
    case snakeCase
    case kebabCase
}

@propertyWrapper
final class CodingStyle {
    
    private var value: String
    private var decorator: Decorators = .camelCase
    
    var wrappedValue: String {
        get {
            self.decoratingString()
        }
        
        set {
            self.value = newValue
        }
    }
    
    init(wrappedValue: String, decorator: Decorators) {
        self.value = wrappedValue
        self.decorator = decorator
    }
    
    private func decoratingString() -> String {
        switch decorator {
            
        case .camelCase:
            return setupCamelCase(value)
        case .snakeCase:
            return setupSnakeCase(value)
        case .kebabCase:
            return setupKebabCase(value)
        }
    }
    
    private func setupCamelCase(_ string: String) -> String {
        return string
            .capitalized
            .split(separator: " ")
            .joined()
    }
    
    private func setupSnakeCase(_ string: String) -> String {
        return string
            .capitalized
            .replacingOccurrences(of: " ", with: "_")
    }
    
    private func setupKebabCase(_ string: String) -> String {
        return string
            .capitalized
            .replacingOccurrences(of: " ", with: "-")
    }
    
}

