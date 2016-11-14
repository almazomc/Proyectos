//
//  TipoDeMasaViewController.swift
//  CrearPizza
//
//  Created by Celia.Almazo on 08/11/16.
//  Copyright © 2016 Celia. All rights reserved.
//

import UIKit

class TipoDeMasaViewController: UITableViewController {
    var pizza:Pizza!
    var indexSelected:IndexPath = IndexPath()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return super.tableView(tableView, numberOfRowsInSection: section)
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (((cell.textLabel?.text)! as String).isEqual(pizza.tipoMasa)) {
            cell.accessoryType = .checkmark
            indexSelected = indexPath
        }else{
            cell.accessoryType = .none
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexSelected.compare(indexPath) != .orderedSame && indexSelected.count > 0{
            let tableCell:UITableViewCell = tableView.cellForRow(at: indexSelected)!
            tableCell.accessoryType = .none
        }
        
        indexSelected = indexPath

        let tableCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        tableCell.accessoryType = .checkmark
        pizza.tipoMasa = tableCell.textLabel?.text as NSString!
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let siguienteVista =  segue.destination as! TipoDeQuesoViewController
        siguienteVista.pizza = pizza
    }
    
}
