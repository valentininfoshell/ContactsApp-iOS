//
//  ContactListModuleFabric.swift
//  Contacts
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import Foundation
import UIKit
class ContactListModuleFabric {
    static func create(config: ContactListConfig) -> UIViewController {
        let presenter = ContactListPresenter()
        let view = TableViewController()
        let model = ContactListModel()
        presenter.configure(config: config, view: view, model: model)
        view.configure(presenter)
        model.configure(presenter)
        return view
    }
    
}

