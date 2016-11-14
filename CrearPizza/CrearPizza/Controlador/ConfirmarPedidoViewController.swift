//
//  ConfirmarPedidoViewController.swift
//  CrearPizza
//
//  Created by Celia.Almazo on 08/11/16.
//  Copyright © 2016 Celia. All rights reserved.
//

import UIKit

class ConfirmarPedidoViewController: UITableViewController {
    var pizza:Pizza!

    @IBOutlet weak var lblTamano: UILabel!
    @IBOutlet weak var lblTipoDeMasa: UILabel!
    @IBOutlet weak var lblTipoDeQueso: UILabel!
    @IBOutlet weak var lblIngredientes: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.tableFooterView = UIView()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        lblTamano.text = pizza.tamano as String?
        lblTipoDeMasa.text = pizza.tipoMasa as String?
        lblTipoDeQueso.text = pizza.tipoQueso as String?
        lblIngredientes.text = obtenerCadenaDeIngredientes() as String
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    @IBAction func confirmar(_ sender: AnyObject) {
        if pizza.tamano == nil || pizza.tamano.isEqual(to: "") {
            mostrarAlertaCon(mensaje: "No has seleccionado el tamaño")
            return
        }
        
        if pizza.tipoMasa == nil || pizza.tipoMasa.isEqual(to: "") {
            mostrarAlertaCon(mensaje: "No has seleccionado tipo de masa")
            return
        }
        
        if pizza.tipoQueso == nil || pizza.tipoQueso.isEqual(to: "") {
            mostrarAlertaCon(mensaje: "No has seleccionado tipo de queso.\nSi no debea un tipo de queso, favor de elegir la opcion \"Sin queso\"")
            return
        }
        
        if pizza.ingredientes == nil || pizza.ingredientes.count <= 0 {
            mostrarAlertaCon(mensaje: "No has seleccionado ningún ingrediente")
            return
        }
        
        mostrarAlertaDePedidoRealizado()
    }
    
    func mostrarAlertaCon(mensaje:String) {
        let aceptar = UIAlertAction(title: "OK", style: .default, handler: nil)
        let alerta:UIAlertController = UIAlertController(title: "Aviso", message: mensaje, preferredStyle: .alert)
        alerta.addAction(aceptar)
        self.present(alerta, animated: true, completion: nil)
    }
    
    func mostrarAlertaDePedidoRealizado() {
        let aceptar = UIAlertAction(title: "OK", style: .default, handler:{ (UIAlertAction) in
            self.navigationController?.dismiss(animated: true, completion: nil)
        })
        let alerta:UIAlertController = UIAlertController(title: "Aviso", message: "¡Tu pedido ha sido enviado a la cocina!", preferredStyle: .alert)
        alerta.addAction(aceptar)
        self.present(alerta, animated: true, completion: nil)
    }
    
    func obtenerCadenaDeIngredientes() -> String {
        var ingredientesString:NSMutableString = NSMutableString()
        
        if (pizza.ingredientes != nil){
            for ingrediente in pizza.ingredientes! {
                ingredientesString.append(String(format: "%@ | ", (ingrediente as! String)))
            }
            if ingredientesString.hasSuffix(" | ") {
                ingredientesString = NSMutableString(string: ingredientesString.substring(to: ingredientesString.length - 3))
            }
        }
        return ingredientesString as String
    }
}
