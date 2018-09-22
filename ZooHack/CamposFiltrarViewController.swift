//
//  CamposFiltrarViewController.swift
//  ZooHack
//
//  Created by David Higuera on 15/9/18.
//  Copyright © 2018 UPM. All rights reserved.
//

import UIKit

class CamposFiltrarViewController: UIViewController {

    @IBOutlet weak var labelFiltrado: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var textfield2: UITextField!
    @IBOutlet weak var textfield3: UITextField!
    
    @IBAction func filtrarPulsado(_ sender: Any) {
        let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "ResultadoFiltrado") as! ResultadoFiltradoViewController
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Atrás", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        viewController.nResultados = 5
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBOutlet weak var botonFiltrar: UIButton!
    var tipoFiltrado = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        textField.alpha = 0
        labelFiltrado.alpha = 0
        textfield2.alpha = 0
        label2.alpha = 0
        textfield3.alpha = 0
        label3.alpha = 0

        switch tipoFiltrado {
        case "Pais":
            labelFiltrado.alpha = 1
            textField.alpha = 1
            labelFiltrado.text = "Introduce el País"
        case "Clase":
            labelFiltrado.alpha = 1
            textField.alpha = 1
            labelFiltrado.text = "Introduce la clase del animal"
        case "Orden":
            labelFiltrado.alpha = 1
            textField.alpha = 1
            labelFiltrado.text = "Introduce la orden"
        default:
            textField.alpha = 1
            labelFiltrado.alpha = 1
            textfield2.alpha = 1
            label2.alpha = 1
            textfield3.alpha = 1
            label3.alpha = 1
            
            labelFiltrado.text = "Introduce la orden"
            label2.text = "Introduce el País"
            label3.text = "Introduce la clase del animal"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
