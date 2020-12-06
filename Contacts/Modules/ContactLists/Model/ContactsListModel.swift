//
//  ContactsListModel.swift
//  Contacts
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import Foundation
import Contacts



class ContactListModel {
    fileprivate weak var presenter: ContactListModelOutput!
    fileprivate let keys = [CNContactPhoneNumbersKey, CNContactFamilyNameKey, CNContactGivenNameKey, CNContactImageDataKey] as [CNKeyDescriptor]
    fileprivate var contacts = [Contact]()
}

extension ContactListModel : ContactListModelInput {
    
    func selectContact(index: Int) {
        self.presenter.open(contact: contacts[index])
    }
    
    func configure(_ output: ContactListModelOutput) {
        self.presenter = output
    }
    
    func loadContacts() {
        DispatchQueue.global().async {
            let store = CNContactStore()
            let request = CNContactFetchRequest.init(keysToFetch: self.keys)
            do {
                try store.enumerateContacts(with: request, usingBlock: { (contact, pointer) in
                    let item = Contact.init(contact: contact)
                    self.contacts.append(item)
                })
                DispatchQueue.main.async { self.presenter.didLoad(contacts: self.contacts) }
            } catch {
                DispatchQueue.main.async { self.presenter.error(error) }
            }
        }
    }
    
}
