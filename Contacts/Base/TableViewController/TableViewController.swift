//
//  TableViewController.swift
//  Contacts
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import UIKit
import SnapKit
class TableViewController: UIViewController {
    fileprivate var presenter: TableViewOutput!
    fileprivate var tableVM: TableViewModel?
    lazy fileprivate var tableView: UITableView = {
        let table = UITableView.init(frame: .zero)
        table.dataSource = self
        table.delegate = self
        table.tableFooterView = UIView(frame: .zero)
        table.estimatedRowHeight = 40
        self.view.addSubview(table)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiSetup()
        self.presenter.viewLoaded()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.presenter.viewClosed()
        super.viewDidDisappear(animated)
    }
    
    fileprivate func uiSetup() {
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
}


extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableVM?.rowsCount(for: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.tableVM?.cell(table: tableView, ip: indexPath) ?? UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableVM?.sectionsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableVM?.didSelectCellHandler?(indexPath)
    }
}

extension TableViewController : TableViewInput {

    func configure(_ output: TableViewOutput) {
        self.presenter = output
    }
    
    func registerCell(_ T: UITableViewCell.Type) {
        self.tableView.register(T)
    }
    
    func update(table config: TableViewModel) {
        self.tableVM = config
        self.tableView.reloadData()
    }
    
    func update(title: String) {
        self.title = title
    }
    
    func open(vc: UIViewController) {
        if let nc = self.navigationController {
            nc.pushViewController(vc, animated: true)
        } else {
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func show(message: String?) {
        let alert = UIAlertController.init(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: Strings.Buttons.ok, style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func spinnerStart() {
        LoaderSheet.sharedInstance.showLoader()
    }
    
    func spinnerStop() {
        LoaderSheet.sharedInstance.removeLoader()
    }
    
}
