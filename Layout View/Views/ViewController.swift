//
//  ViewController.swift
//  Layout View
//
//  Created by Mohamed Khaled Gomaa on 31/07/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView! {
        didSet {
            tableview.backgroundColor = .secondarySystemBackground
        }
    }
    private var content: [[[String: Any]]] = [
        [
            [:]
        ],
        [
            ["title": "Starred Messages", "image": "StarredMessages", "tintColor": UIColor.systemYellow],
            ["title": "Linked Devices", "image": "LinkedDevices", "tintColor": UIColor.systemMint]
        ],
        [
            ["title": "Account", "image": "Account", "tintColor": UIColor.systemBlue],
            ["title": "Privacy", "image": "Privacy", "tintColor": UIColor.systemMint],
            ["title": "Chats", "image": "Chats", "tintColor": UIColor.systemGreen],
            ["title": "Notifications", "image": "Notifications", "tintColor": UIColor.systemRed],
            ["title": "Storage and Data", "image": "StorageAndData", "tintColor": UIColor.systemGreen]
        ],
        [
            ["title": "Help", "image": "Help", "tintColor": UIColor.link],
            ["title": "Tell a Friend", "image": "TellAFriend", "tintColor": UIColor.systemPink]
        ]
    ]
    
    
    private let searchController: UISearchController = {
        let controller = UISearchController()
        return controller
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupConfig()
        registerTabelCell()
        
    }
    
    override func viewDidLayoutSubviews() {
        tableview.frame = view.bounds
        view.addSubview(tableview)
    }
    
    private func registerTabelCell(){
        tableview.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
        tableview.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    private func setupConfig() {
        navigationItem.searchController = searchController
        view.backgroundColor = .secondarySystemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Settings"
    }
    
}
typealias table_View_Type = UITableViewDataSource & UITableViewDelegate

extension ViewController : table_View_Type {
    // retrun number of section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    // to retrun header in appove sections
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil
        }
        return "Settings"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return content[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
            cell.label2.text = "Mohamed Kahled Gomaa"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
            let section = indexPath.section
            let row = indexPath.row
            cell.images.image = UIImage(named: content[section][row]["image"] as! String)
            cell.label.text = content[section][row]["title"] as? String
            cell.accessoryType = .disclosureIndicator // to add > at end of cell
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 70
        }
        return 40
    }
    
    
}

