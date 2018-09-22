//
//  FiltradoViewController.swift
//  ZooHack
//
//  Created by David Higuera on 15/9/18.
//  Copyright © 2018 UPM. All rights reserved.
//

import UIKit

class FiltradoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    let opcionesFiltrado : [String] = ["Por País","Por Clase","Por Orden","Todos"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)

        // Do any additional setup after loading the view.
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "OpcionFiltrado", for: indexPath)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = opcionesFiltrado[0]
        case 1:
            cell.textLabel?.text = opcionesFiltrado[1]
        case 2:
            cell.textLabel?.text = opcionesFiltrado[2]
        default:
            cell.textLabel?.text = opcionesFiltrado[3]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "CamposFiltrar") as! CamposFiltrarViewController
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Atrás", style: UIBarButtonItemStyle.plain, target: self, action: nil)
            viewController.tipoFiltrado = "Pais"
            self.navigationController?.pushViewController(viewController, animated: true)
            
        case 1:
            let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "CamposFiltrar") as! CamposFiltrarViewController
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Atrás", style: UIBarButtonItemStyle.plain, target: self, action: nil)
            viewController.tipoFiltrado = "Clase"
            self.navigationController?.pushViewController(viewController, animated: true)
            
        case 2:
            let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "CamposFiltrar") as! CamposFiltrarViewController
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Atrás", style: UIBarButtonItemStyle.plain, target: self, action: nil)
            viewController.tipoFiltrado = "Orden"
            self.navigationController?.pushViewController(viewController, animated: true)
            
        default:
            let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "CamposFiltrar") as! CamposFiltrarViewController
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Atrás", style: UIBarButtonItemStyle.plain, target: self, action: nil)
            viewController.tipoFiltrado = "Todos"
            self.navigationController?.pushViewController(viewController, animated: true)
            
        }
    }

}
