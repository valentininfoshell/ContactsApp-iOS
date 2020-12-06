//
//  ContactListPresenter.swift
//  Contacts
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import Foundation

class ContactListPresenter {
    fileprivate weak var view: TableViewInput!
    fileprivate var model: ContactListModelInput!
    fileprivate var config: ContactListConfig!
}


extension ContactListPresenter: TableViewOutput {
    func viewLoaded() {
        self.view.update(title: Strings.Titles.contacts)
        self.view.registerCell(ContactInfoCell.self)
        self.view.spinnerStart()
        self.model.loadContacts()
    }
    
    func viewClosed() {}
    
    fileprivate func cellTapped(ip: IndexPath) {
        self.model.selectContact(index: ip.row)
    }
    
}

extension ContactListPresenter: ContactListModelOutput {
    func open(contact: Contact) {
        let config = ContactDetailConfig.init(contact: contact)
        let contactDetail = Assembly.create(module: .contactDetail(config: config))
        self.view.open(vc: contactDetail)
    }
    
    func error(_ error: Error) {
        self.view.spinnerStop()
        self.view.show(message: error.localizedDescription)
    }
    
    func didLoad(contacts: [Contact]) {
        self.view.spinnerStop()
        let tableVM = ContactListTableVM.init(items: contacts) { [weak self](ip) in
            self?.cellTapped(ip: ip)
        }
        self.view.update(table: tableVM)
    }
    
    
}

extension ContactListPresenter: ContactsListModuleInput {
    func configure(config: ContactListConfig, view: TableViewInput, model: ContactListModelInput) {
        self.config = config
        self.view = view
        self.model = model
    }
}
