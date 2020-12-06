//
//  PhoneNumberCell.swift
//  ContactsApp
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import UIKit

struct PhoneNumberCellVM {
    let phone: String
}

class PhoneNumberCell: UITableViewCell {
    
    fileprivate lazy var phoneLabel: UILabel = {
        let l = UILabel.init()
        l.textAlignment = .left
        l.font = .boldSystemFont(ofSize: 14)
        l.textColor = UIColor.text
        self.addSubview(l)
        return l
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    
    fileprivate func setupUI() {
        phoneLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(8)
        }
    }
    
    var vm : PhoneNumberCellVM? {
        didSet {
            self.phoneLabel.text = vm?.phone
        }
    }
    
}
