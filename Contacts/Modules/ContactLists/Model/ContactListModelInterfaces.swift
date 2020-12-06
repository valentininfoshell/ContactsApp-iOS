//
//  ContactListModelInterfaces.swift
//  Contacts
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import Foundation

protocol ContactListModelInput : AnyObject {
    func configure(_ output: ContactListModelOutput)
    func loadContacts()
    func selectContact(index: Int)
}

protocol ContactListModelOutput : AnyObject {
    func error(_ error: Error)
    func didLoad(contacts: [Contact])
    func open(contact: Contact)
}
