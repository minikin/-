//
//  UITableView+Extensions.swift
//
//
//  Created by Sasha Prokhorenko on 27.06.19.
//

import UIKit

public extension UITableView {
    /// Register UITableViewCell with Xib
    ///
    /// ```
    /// tableView.register(cellType: MyCell.self)
    /// ```
    func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }

    /// Register UITableViewCell
    ///
    /// ```
    /// tableView.register(cellTypes: [MyCell1.self, MyCell2.self])
    /// ```
    func register<T: UITableViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }

    /// Dequeue UITableViewCell
    ///
    /// ```
    /// let cell = tableView.dequeueReusableCell(with: MyCell.self, for: indexPath)
    /// ```
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
}
