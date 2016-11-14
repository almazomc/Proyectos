//
//  IngredientesViewController.swift
//  CrearPizza
//
//  Created by Celia.Almazo on 08/11/16.
//  Copyright © 2016 Celia. All rights reserved.
//

import UIKit

class IngredientesViewController: UITableViewController {
    var ingredientes:NSArray = NSArray()
    var ingredientesPreseleccionados:NSMutableArray!
    var pizza:Pizza!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.tableFooterView = UIView()
        self.tableView.isEditing = true

        ingredientes = ["Jamón","Pepperoni","Pavo","Pollo","Salchicha","Aceituna", "Cebolla","Pimiento","Piña","Anchoa"]
        ingredientesPreseleccionados = pizza.ingredientes != nil ? pizza.ingredientes as! NSMutableArray : NSMutableArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ingredientes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identificadorCell", for: indexPath)
        cell.textLabel?.text = (ingredientes.object(at: indexPath.row) as! NSString) as String
        if ingredientesPreseleccionados.contains((cell.textLabel?.text)! as String) {
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        }else{
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ingredientesPreseleccionados.add(ingredientes.object(at: indexPath.row))
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let index = ingredientesPreseleccionados.index(of: ingredientes.object(at: indexPath.row))
        ingredientesPreseleccionados.removeObject(at: index)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let siguienteVista =  segue.destination as! ConfirmarPedidoViewController
        pizza.ingredientes = ingredientesPreseleccionados
        siguienteVista.pizza = pizza
    }
    
    func obtenerIngredientes() -> NSArray {
        let indexPaths = self.tableView.indexPathsForSelectedRows
        let ingredientesArray:NSMutableArray = NSMutableArray()
        
        if (indexPaths != nil){
            for indexPath in indexPaths! {
                ingredientesArray.add(ingredientes.object(at: indexPath.row))
            }
        }
        return ingredientesArray
    }
}
