//
//  TableViewControllerInterfaces.swift
//  Contacts
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import Foundation
import UIKit

typealias TableDidSelectRowHandler = (_ ip: IndexPath) -> Void

protocol TableViewModel {
    var sectionsCount : Int {get}
    func rowsCount(for section: Int) -> Int
    func cell(table: UITableView, ip: IndexPath) -> UITableViewCell
    var didSelectCellHandler: TableDidSelectRowHandler? {get set}
}

protocol TableViewInput: AnyObject {
    func configure(_ output: TableViewOutput)
    func registerCell(_ T: UITableViewCell.Type)
    func update(table config: TableViewModel)
    func update(title: String)
    func open(vc: UIViewController)
    func show(message: String?)
    func spinnerStart()
    func spinnerStop()
}

protocol TableViewOutput: AnyObject {
    func viewLoaded()
    func viewClosed()
}
