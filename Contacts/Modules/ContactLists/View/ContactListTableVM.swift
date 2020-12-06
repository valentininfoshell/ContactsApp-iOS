//
//  ContactListTableVM.swift
//  Contacts
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import Foundation
import UIKit

fileprivate enum Sections : Int {
    case contacts
    case count
}

struct ContactListTableVM : TableViewModel {
    
    var items : [Contact]
    
    var sectionsCount: Int {Sections.count.rawValue}
    func rowsCount(for section: Int) -> Int {
        return items.count
    }
    
    func cell(table: UITableView, ip: IndexPath) -> UITableViewCell {
        let cell : ContactInfoCell = table.dequeueCell(at: ip)
        cell.vm = ContactInfoCellVM.create(items[ip.row])
        return cell
        
    }
    
    var didSelectCellHandler: TableDidSelectRowHandler?
}

extension ContactInfoCellVM {
    static func create(_ contact: Contact) -> ContactInfoCellVM {
        ContactInfoCellVM.init(name: contact.fullName, phone: contact.phones?.first, avatar: contact.avatar)
    }
}
