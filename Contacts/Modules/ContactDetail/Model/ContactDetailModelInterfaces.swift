//
//  ContactDetailModelInterfaces.swift
//  ContactsApp
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import Foundation
protocol ContactDetailModelInput: AnyObject {
    func configure(_ output: ContactDetailModelOutput)
    var contact: Contact? {get set}
}

protocol ContactDetailModelOutput: AnyObject {}
