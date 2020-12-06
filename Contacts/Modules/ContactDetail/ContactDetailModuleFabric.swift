//
//  ContactDetailModuleFabric.swift
//  ContactsApp
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import Foundation
import UIKit

class ContactDetailModuleFabric {
    static func create(config: ContactDetailConfig) -> UIViewController {
        let presenter = ContactDetailPresenter()
        let view = TableViewController()
        let model = ContactDetailModel()
        presenter.configure(config: config, view: view, model: model)
        view.configure(presenter)
        model.configure(presenter)
        return view
    }
    
}
