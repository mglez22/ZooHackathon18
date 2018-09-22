//
//  ResultadoFiltradoViewController.swift
//  ZooHack
//
//  Created by David Higuera on 15/9/18.
//  Copyright © 2018 UPM. All rights reserved.
//

import UIKit

class ResultadoFiltradoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var nResultados = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nResultados
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalFiltrado", for: indexPath) as! AnimalTableViewCell
        switch indexPath.row {
       
        default:
            cell.imagenAnimal.image = UIImage(named:"banderaUK")
            cell.nombreAnimal.text = "English"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "DetallesAnimal") as! DetallesAnimalViewController
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Atrás", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
