//
//  ContactDetailModuleInput.swift
//  ContactsApp
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import Foundation

struct ContactDetailConfig {
    let contact: Contact
}

protocol ContactDetailModuleInput {
    func configure(config: ContactDetailConfig, view: TableViewInput, model: ContactDetailModelInput)
}
