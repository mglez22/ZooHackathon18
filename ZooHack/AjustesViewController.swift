//
//  AjustesViewController.swift
//  ZooHack
//
//  Created by David Higuera on 15/9/18.
//  Copyright © 2018 UPM. All rights reserved.
//

import UIKit

class AjustesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Idioma", for: indexPath) as! IdiomaTableViewCell
        switch indexPath.row {
        case 0:
            cell.bandera.image = UIImage(named:"Europa")
            cell.idioma.text = "European Union"
        case 1:
            cell.bandera.image = UIImage(named:"Estados_Unidos")
            cell.idioma.text = "USA"
        case 2:
            cell.bandera.image = UIImage(named:"banderaEspaña")
            cell.idioma.text = "Spain"
        default:
            cell.bandera.image = UIImage(named:"Uk")
            cell.idioma.text = "United Kingdom"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let indexPathSelected = IndexPath (row: 0, section: 0)
            let indexPathDeselected = IndexPath (row: 1, section: 0)
             let indexPathDeselected2 = IndexPath (row: 2, section: 0)
             let indexPathDeselected3 = IndexPath (row: 3, section: 0)
            tableView.cellForRow(at: indexPathSelected)?.accessoryType = .checkmark
            tableView.cellForRow(at: indexPathDeselected)?.accessoryType = .none
            tableView.cellForRow(at: indexPathDeselected2)?.accessoryType = .none
            tableView.cellForRow(at: indexPathDeselected3)?.accessoryType = .none

        case 1:
            let indexPathSelected = IndexPath (row: 1, section: 0)
            let indexPathDeselected = IndexPath (row: 0, section: 0)
            let indexPathDeselected2 = IndexPath (row: 2, section: 0)
            let indexPathDeselected3 = IndexPath (row: 3, section: 0)
            tableView.cellForRow(at: indexPathSelected)?.accessoryType = .checkmark
            tableView.cellForRow(at: indexPathDeselected)?.accessoryType = .none
            tableView.cellForRow(at: indexPathDeselected2)?.accessoryType = .none
            tableView.cellForRow(at: indexPathDeselected3)?.accessoryType = .none
        case 2:
            let indexPathSelected = IndexPath (row: 2, section: 0)
            let indexPathDeselected = IndexPath (row: 1, section: 0)
            let indexPathDeselected2 = IndexPath (row: 0, section: 0)
            let indexPathDeselected3 = IndexPath (row: 3, section: 0)
            tableView.cellForRow(at: indexPathSelected)?.accessoryType = .checkmark
            tableView.cellForRow(at: indexPathDeselected)?.accessoryType = .none
            tableView.cellForRow(at: indexPathDeselected2)?.accessoryType = .none
            tableView.cellForRow(at: indexPathDeselected3)?.accessoryType = .none
        default:
            let indexPathSelected = IndexPath (row: 3, section: 0)
            let indexPathDeselected = IndexPath (row: 0, section: 0)
            let indexPathDeselected2 = IndexPath (row: 2, section: 0)
            let indexPathDeselected3 = IndexPath (row: 1, section: 0)
            tableView.cellForRow(at: indexPathSelected)?.accessoryType = .checkmark
              tableView.cellForRow(at: indexPathDeselected)?.accessoryType = .none
            tableView.cellForRow(at: indexPathDeselected2)?.accessoryType = .none
            tableView.cellForRow(at: indexPathDeselected3)?.accessoryType = .none
        }
    }
    
    
}
