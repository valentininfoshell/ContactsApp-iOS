//
//  UITableView+Dequeue.swift
//  Contacts
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import Foundation
import UIKit

extension UITableView {
    
    func dequeueCell<T: UITableViewCell>(at indexPath: IndexPath) -> T {
        let tempCell = self.dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath)
        guard let cell = tempCell as? T else {
            assertionFailure("Can't cast cell \(T.self)")
            return T()
        }
        return cell
    }
    
    func register(_ T: UITableViewCell.Type) {
        self.register(T.self, forCellReuseIdentifier: "\(T.self)")
    }
    
}
