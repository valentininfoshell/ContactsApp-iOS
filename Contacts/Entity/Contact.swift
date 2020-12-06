//
//  Contact.swift
//  ContactsApp
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import Foundation
import UIKit
import Contacts

struct Contact {
    let fisrtName : String?
    let secondName : String?
    let phones : [String]?
    let avatar : UIImage?
    
    init(contact: CNContact) {
        self.fisrtName = contact.familyName
        self.secondName = contact.givenName
        self.phones = contact.phoneNumbers.map{ $0.value.stringValue }
        if let imageData = contact.imageData {
            self.avatar = UIImage.init(data: imageData)
        } else {
            self.avatar = nil
        }
    }
}

extension Contact {
    var fullName: String {
         ((self.fisrtName ?? "")  + " " + (self.secondName ?? "")).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}
