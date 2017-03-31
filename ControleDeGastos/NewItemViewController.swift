//
//  NewItemViewController.swift
//  ControleDeGastos
//
//  Created by Julianny Favinha on 3/31/17.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {

    @IBOutlet weak var saveBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var paymentSegmentedControl: UISegmentedControl!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var replaySwitch: UISwitch!
    @IBOutlet weak var whenSegmentedControl: UISegmentedControl!
    @IBOutlet weak var replayNumberSegmentedControl: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func savePressed(_ sender: Any) {
        // CONECTAR COM O BANCO DE DADOS
    }
    
}
