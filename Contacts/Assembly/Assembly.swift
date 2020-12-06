//
//  Assembly.swift
//  Contacts
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import UIKit


enum Module {
    case contactList(config: ContactListConfig)
    case contactDetail(config: ContactDetailConfig)
}


class Assembly {

    static func startModule() -> UIViewController {
        let config = ContactListConfig()
        let module = Assembly.create(module: .contactList(config: config))
        let nc = UINavigationController.init(rootViewController: module)
        return nc
    }
    
    static func create(module: Module) -> UIViewController {
        switch module {
        case let .contactList(config):
            return ContactListModuleFabric.create(config: config)
        case let .contactDetail(config):
            return ContactDetailModuleFabric.create(config: config)
        }
    }
    
    
}
