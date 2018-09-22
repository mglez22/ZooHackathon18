//
//  ListasSuspensionesViewController.swift
//  ZooHack
//
//  Created by David Higuera on 15/9/18.
//  Copyright © 2018 UPM. All rights reserved.
//

import UIKit

class ListasSuspensionesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    typealias animal = [String:Any]
    var animales = [animal]()
    var session = URLSession.shared
    var paises = [String]()
    var animalesPaisSeleccionado = [animal]()
    
    func getPaises(){
        var paisesEncontrados : [String] = []
        for a in animales {
            let pais = (a["paises"]) as! String
            if !paisesEncontrados.contains(pais){
                paisesEncontrados.append(pais)
            }
        }
        paises = paisesEncontrados.sorted()
    }
    
    func getAnimalesPais( _ indexPath : IndexPath){
        for animalSel in animales{
            let pais = (animalSel["paises"]) as! String
            if (pais) == paises[indexPath.row]{
                animalesPaisSeleccionado.append(animalSel)
            }
        }
    }
    
    func downloadAnimals(){
        let strurl =  "http://127.0.0.1:8001/Animales"
        if let url = NSURL(string: strurl){
            let tarea = session.dataTask(with: url as URL){ (data, response, error) in
                if error != nil{
                    print("ERROR TIPO1", error)
                    return
                }
                if (response as! HTTPURLResponse).statusCode != 200 {
                    print ("ERROR 2")
                }
                if let animalesDescargados = ( try?JSONSerialization.jsonObject(with: data!)) {
                    DispatchQueue.main.async {
                        self.animales = animalesDescargados as! [animal]
                        self.getPaises()
                        self.tableView.reloadData()
                    }
                }
            }
            tarea.resume()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationController?.setNavigationBarHidden(false, animated: true)
        downloadAnimals()
        tableView.reloadData()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paises.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalFiltrado", for: indexPath) as! AnimalTableViewCell
        
        let pais = paises[indexPath.row]
       
        cell.imagenAnimal.image = UIImage(named: pais)
        cell.nombreAnimal.text = pais

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "ListaAnimales") as! ListaAnimalesViewController
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Atrás", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        getAnimalesPais(indexPath)
        viewController.animales = self.animalesPaisSeleccionado
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}
