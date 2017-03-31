//
//  NewItemViewController.swift
//  ControleDeGastos
//
//  Created by Julianny Favinha on 3/31/17.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
    
    /* 0 -> Despesa
       1 -> Receita */
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    
    /* 0 -> Dinheiro
       1 -> Crédito
       2 -> Débito */
    @IBOutlet weak var paymentSegmentedControl: UISegmentedControl!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var replaySwitch: UISwitch!
    
    /* 0 -> Semanalmente
       1 -> Mensalmente */
    @IBOutlet weak var whenSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var saveBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var replayNumberSegmentedControl: UITextField!
    
    @IBOutlet weak var whenLabel: UILabel!
    @IBOutlet weak var replayNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func savePressed(_ sender: Any) {
        /* segmentedControl
            para pegar o indice dos SegmentedControls, usar o metodo selectedSegmentIndex */
        
        /* datePicker data crua */
        //print(datePicker.date)
        
        /* datePicker data formatada */
        //let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "MM/dd/yy"
        //let dateString = dateFormatter.string(from: datePicker.date)
        //print(dateString)
        
        /* switch */
        //replaySwitch.isOn -> True if is on, False if not
    }
    
    @IBAction func replayValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            whenLabel.isHidden = false
            whenSegmentedControl.isHidden = false
            replayNumberLabel.isHidden = false
            replayNumberSegmentedControl.isHidden = false
        }
        else {
            whenLabel.isHidden = true
            whenSegmentedControl.isHidden = true
            replayNumberLabel.isHidden = true
            replayNumberSegmentedControl.isHidden = true
        }
    }
}
