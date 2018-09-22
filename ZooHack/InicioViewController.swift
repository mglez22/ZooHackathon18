//
//  InicioViewController.swift
//  ZooHack
//
//  Created by David Higuera on 15/9/18.
//  Copyright © 2018 UPM. All rights reserved.
//

import UIKit

class InicioViewController: UIViewController {

    @IBOutlet weak var restriccionesBoton: UIButton!
    @IBOutlet weak var suspensionesBoton: UIButton!
    
    @IBAction func suspensionesPulsado(_ sender: Any) {
        let tabBarController = UITabBarController()
        
        let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "ListaSuspensiones") as! ListasSuspensionesViewController
        let viewControllerFiltrar =  self.storyboard?.instantiateViewController(withIdentifier: "Filtrado") as! FiltradoViewController
        let viewControllerAjustes =  self.storyboard?.instantiateViewController(withIdentifier: "Ajustes") as! AjustesViewController
        
        let navigationController1 = UINavigationController(rootViewController:viewController)
        let navigationController2 = UINavigationController(rootViewController:viewControllerFiltrar)
        let controllers = [navigationController1,navigationController2,viewControllerAjustes]
        tabBarController.viewControllers = controllers
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Atrás", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        
        navigationController1.tabBarItem.image = UIImage(named:"listado")
        navigationController2.tabBarItem.image = UIImage(named:"filtrado")
        viewControllerAjustes.tabBarItem.image = UIImage(named:"ajustes")
        navigationController1.tabBarItem.title = "Listado"
        navigationController2.tabBarItem.title = "Filtrar"
        viewControllerAjustes.tabBarItem.title = "Idioma"
        tabBarController.tabBar.barTintColor = UIColor.white
        tabBarController.tabBar.tintColor = UIColor.black

        self.navigationController?.pushViewController(tabBarController, animated: true)
    }
    
    @IBAction func restriccionesPulsado(_ sender: Any) {
        let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "ListaRestricciones") as! ListaRestriccionesViewController
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Atrás", style: UIBarButtonItemStyle.plain, target: self, action: nil)

        self.navigationController?.pushViewController(viewController, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        suspensionesBoton.layer.cornerRadius = 10.0
        restriccionesBoton.layer.cornerRadius = 10.0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
