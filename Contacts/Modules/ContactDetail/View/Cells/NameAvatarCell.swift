//
//  NameAvatarCell.swift
//  ContactsApp
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import UIKit
struct NameAvatarCellVM {
    let name: String?
    let avatar: UIImage?
}



class NameAvatarCell: UITableViewCell {

    fileprivate lazy var avatarImage: UIImageView = {
        let iv = UIImageView.init(frame: .zero)
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 40
        self.addSubview(iv)
        return iv
    }()
    
    fileprivate lazy var nameLabel: UILabel = {
        let l = UILabel.init()
        l.textAlignment = .center
        l.font = .boldSystemFont(ofSize: 20)
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
        avatarImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(80)
            
        }
        nameLabel.snp.makeConstraints { [weak avatarImage](make) in
            make.top.equalTo(avatarImage!.snp.bottomMargin).inset(-12)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().inset(4)
        }
    }
    
    var vm : NameAvatarCellVM? {
        didSet {
            self.nameLabel.text = vm?.name
            if vm?.avatar != nil {
                self.avatarImage.image = vm?.avatar
            } else {
                self.avatarImage.image = vm?.name?.initials.image(size: CGSize.init(width: 80, height: 80), background: UIColor.lightGray, tint: UIColor.text)
            }
        }
    }
}
