//
//  ContactDetailPresenter.swift
//  ContactsApp
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import Foundation

class ContactDetailPresenter {
    fileprivate weak var view: TableViewInput!
    fileprivate var model: ContactDetailModelInput!
}

extension ContactDetailPresenter: TableViewOutput {
    func viewLoaded() {
        self.view.registerCell(NameAvatarCell.self)
        self.view.registerCell(PhoneNumberCell.self)
        if let contact = model.contact {
            let vm = ContactDetailTableVM.init(name: contact.fullName, image: contact.avatar, phones: contact.phones ?? [String](), didSelectCellHandler: nil)
            self.view.update(table: vm)
        }
    }
    
    func viewClosed() {}
}

extension ContactDetailPresenter: ContactDetailModelOutput {}


extension ContactDetailPresenter: ContactDetailModuleInput {
    func configure(config: ContactDetailConfig, view: TableViewInput, model: ContactDetailModelInput) {
        self.model = model
        self.view = view
        self.model.contact = config.contact
    }
}
