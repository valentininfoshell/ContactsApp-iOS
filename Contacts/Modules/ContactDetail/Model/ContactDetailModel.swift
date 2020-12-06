//
//  ContactDetailModel.swift
//  ContactsApp
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import Foundation

class ContactDetailModel{
    fileprivate weak var presenter: ContactDetailModelOutput!
    fileprivate var _contact: Contact!
}

extension ContactDetailModel: ContactDetailModelInput {
    
    var contact: Contact? {
        get {
            _contact
        }
        set {
            _contact = newValue
        }
    }
    
    func configure(_ output: ContactDetailModelOutput) {
        self.presenter = output
    }
    
    
}
