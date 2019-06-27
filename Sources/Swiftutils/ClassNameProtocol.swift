//
//  ClassNameProtocol.swift
//
//
//  Created by Sasha Prokhorenko on 27.06.19.
//

import Foundation

/// Get a class name
///
/// ```
/// UIView.className   => "UIView"
///
/// UILabel().className => "UILabel"
/// ```
public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }

    var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}
