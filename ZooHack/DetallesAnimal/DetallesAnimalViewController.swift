//
//  DetallesAnimalViewController.swift
//  ZooHack
//
//  Created by David Higuera on 15/9/18.
//  Copyright © 2018 UPM. All rights reserved.
//

import UIKit

class DetallesAnimalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    var nProductos = [String]()
    var imagenAnimal : UIImage?
    var nombreAnimal : String = ""
    var nProductosFinal = 3
    var info : String?
    @IBOutlet weak var masInfo: UIButton!
    @IBAction func masInfoPulsado(_ sender: Any) {
        let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "WKAnimal") as! WKAnimalViewController
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Atrás", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        viewController.urlAnimal = "http://citeswiki.unep-wcmc.org/IdentificationManual/tabid/56/ctl/sheet/mid/369/currentTaxaID/4185/currentTaxaType/Species/currentKingdom/0/sheetId/2558/language/es-ES/Default.aspx"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        masInfo.layer.cornerRadius = 10.0
        self.tabBarController?.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return 1
            case 1:
                return nProductosFinal
            default:
                return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 300
        default:
            return 150
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalPhoto", for: indexPath) as! AnimalPhotoTableViewCell
            cell.imagenAnimal.image = imagenAnimal
            cell.imagenAnimal.layer.cornerRadius = 10.0
            return cell

        default:
            switch indexPath.row{
            case 0:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "Productos", for: indexPath) as! ProductoTableViewCell
                cell.imagenProducto.image = UIImage(named:"d4bed9d6cb401616de0102")
                cell.nombreProducto.text = "Cuenco de marfil"
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Productos", for: indexPath) as! ProductoTableViewCell
                cell.imagenProducto.image = UIImage(named:"thai_ivory_buddhas_daniel_stiles_traffic_southeast_asia_395423")
                cell.nombreProducto.text = "Budas de marfil"
                return cell
             default:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "Productos", for: indexPath) as! ProductoTableViewCell
                cell.imagenProducto.image = UIImage(named:"Image-57.0.0")
                cell.nombreProducto.text = "Tallados del cuerno"
                return cell
            }
        }
    }
}
