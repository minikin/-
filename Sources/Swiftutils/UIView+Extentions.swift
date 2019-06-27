//
//  UIView+Extentions.swift
//
//
//  Created by Sasha Prokhorenko on 27.06.19.
//

import UIKit

public extension UIView {
    /// Make a view the same size as the superview
    ///
    /// ```
    /// superView.addSubview(view)
    /// view.fillSuperview()
    /// ```
    func fillSuperview() {
        guard let superview = self.superview else { return }
        translatesAutoresizingMaskIntoConstraints = superview.translatesAutoresizingMaskIntoConstraints
        if translatesAutoresizingMaskIntoConstraints {
            autoresizingMask = [.flexibleWidth, .flexibleHeight]
            frame = superview.bounds
        } else {
            if #available(iOS 9.0, *) {
                topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
                bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
                leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
                rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
            } else {
                fatalError("Not supported!")
            }
        }
    }
}
