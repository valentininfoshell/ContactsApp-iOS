//
//  ContactDetailTableVM.swift
//  ContactsApp
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import Foundation
import UIKit

fileprivate enum Sections : Int {
    case top
    case phones
    case count
}

struct ContactDetailTableVM : TableViewModel {
    
    var name: String
    var image: UIImage?
    var phones: [String]

    var sectionsCount: Int {Sections.count.rawValue}
    
    func rowsCount(for section: Int) -> Int {
        guard let s = Sections.init(rawValue: section) else {return 0}
        switch s {
        case .top: return 1
        case .phones: return phones.count
        case .count: return 0
        }
    }
    
    func cell(table: UITableView, ip: IndexPath) -> UITableViewCell {
        guard let s = Sections.init(rawValue: ip.section) else {return UITableViewCell()}
        switch s {
        case .top: return self.nameAvatarCell(table: table, ip: ip)
        case .phones: return self.phoneCell(table: table, ip: ip)
        case .count: return UITableViewCell()
        }
    }
    
    var didSelectCellHandler: TableDidSelectRowHandler?
    
    fileprivate func nameAvatarCell(table: UITableView, ip: IndexPath) -> UITableViewCell {
        let cell: NameAvatarCell = table.dequeueCell(at: ip)
        cell.selectionStyle = .none
        cell.vm = NameAvatarCellVM.init(name: self.name, avatar: self.image)
        return cell
    }
    
    fileprivate func phoneCell(table: UITableView, ip: IndexPath) -> UITableViewCell {
        let cell: PhoneNumberCell = table.dequeueCell(at: ip)
        cell.vm = PhoneNumberCellVM.init(phone: phones[ip.row])
        cell.selectionStyle = .none
        return cell
    }
    
}

