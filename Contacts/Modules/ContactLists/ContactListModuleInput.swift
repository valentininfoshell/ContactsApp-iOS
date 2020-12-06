//
//  ContactListModuleInput.swift
//  Contacts
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import Foundation

struct ContactListConfig {}

protocol ContactsListModuleInput {
    func configure(config: ContactListConfig, view: TableViewInput, model: ContactListModelInput)
}
