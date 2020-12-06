//
//  ContactInfoCell.swift
//  Contacts
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import UIKit
import SnapKit

struct ContactInfoCellVM {
    let name: String?
    let phone: String?
    let avatar: UIImage?
}


class ContactInfoCell: UITableViewCell {

    fileprivate lazy var avatarImage: UIImageView = {
        let iv = UIImageView.init(frame: .zero)
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 20
        self.addSubview(iv)
        return iv
    }()
    
    fileprivate lazy var nameLabel: UILabel = {
        let l = UILabel.init()
        l.textAlignment = .left
        l.font = .boldSystemFont(ofSize: 14)
        l.textColor = UIColor.text
        self.addSubview(l)
        return l
    }()
    
    fileprivate lazy var phoneLabel: UILabel = {
        let l = UILabel.init()
        l.textAlignment = .left
        l.font = .systemFont(ofSize: 12)
        l.textColor = UIColor.subText
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
        avatarImage.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(40)
            make.height.equalTo(40).priority(999)
            make.top.equalToSuperview().inset(4)
            make.bottom.equalToSuperview().inset(4)
        }
        nameLabel.snp.makeConstraints { [weak avatarImage](make) in
            make.top.equalTo(avatarImage!)
            make.bottom.equalTo(avatarImage!.snp.centerY)
            make.leading.equalTo(avatarImage!.snp.trailing).offset(8)
            make.trailing.equalToSuperview().inset(15)
        }

        phoneLabel.snp.makeConstraints { [weak nameLabel](make) in
            make.top.equalTo(nameLabel!.snp.bottom)
            make.bottom.equalToSuperview().inset(4)
            make.leading.equalTo(nameLabel!)
            make.trailing.equalTo(nameLabel!)
        }
    }
    
    var vm : ContactInfoCellVM? {
        didSet {
            self.nameLabel.text = vm?.name
            self.phoneLabel.text = vm?.phone
            if vm?.avatar != nil {
                self.avatarImage.image = vm?.avatar
            } else {
                self.avatarImage.image = vm?.name?.initials.image(size: CGSize.init(width: 40, height: 40), background: UIColor.lightGray, tint: UIColor.text)
            }
        }
    }
    
}
