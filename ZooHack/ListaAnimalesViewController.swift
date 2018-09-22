//
//  ListaAnimalesViewController.swift
//  ZooHack
//
//  Created by David Higuera on 16/9/18.
//  Copyright © 2018 UPM. All rights reserved.
//

import UIKit

class ListaAnimalesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    typealias animal = [String : Any]
    var animales = [animal]()
    var imgCache = [String: UIImage]()

    func updatePhoto(_ strurl: String, for indexPath: IndexPath) {
        DispatchQueue.global().async {
            if let url = URL(string: strurl),
                let data = try? Data(contentsOf: url),
                let img = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.imgCache[strurl] = img
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(animales.count)
        return animales.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalListado", for: indexPath) as! AnimalTableViewCell
        
        let animal = animales[indexPath.row]
        print("animal", animal)
        if let imgAnimal = animal["imagen"] as? String{
            if let img = imgCache[imgAnimal] {
                cell.imagenAnimal.image = img
            }else {
                updatePhoto(imgAnimal, for: indexPath)
            }
        }
        cell.nombreAnimal.text = animal["nombre"] as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "DetallesAnimal") as! DetallesAnimalViewController
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Atrás", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        viewController.imagenAnimal = imgCache[self.animales[indexPath.row]["imagen"] as! String]
        viewController.nombreAnimal = self.animales[indexPath.row]["nombre"] as! String
        if  (self.animales[indexPath.row]["souvenir1"]) != nil{}else{
            viewController.nProductos = [self.animales[indexPath.row]["souvenir1"] as! String,self.animales[indexPath.row]["souvenir2"] as! String,self.animales[indexPath.row]["souvenir3"] as! String]
        }
        if  (self.animales[indexPath.row]["datasheet"]) != nil{}else{
            viewController.info = self.animales[indexPath.row]["datasheet"] as? String
        }
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}
