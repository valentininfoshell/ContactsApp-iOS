//
//  String+Image.swift
//  ContactsApp
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import Foundation
import UIKit

extension String {
    
    func image(size: CGSize, background: UIColor, tint: UIColor) -> UIImage? {
        let label = UILabel.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: size))
        label.text = self.uppercased()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: size.height / 2  )
        label.backgroundColor = background
        label.textColor = tint
        UIGraphicsBeginImageContext(size)
        if let currentContext = UIGraphicsGetCurrentContext() {
            label.layer.render(in: currentContext)
            let nameImage = UIGraphicsGetImageFromCurrentImageContext()
            return nameImage
        }
        return nil
    }
 
    var initials: String {
        let words = self.components(separatedBy: CharacterSet.whitespaces)
        var result = ""
        for word in words {
            result += String(word.first!)
        }
        return result
    }
}
