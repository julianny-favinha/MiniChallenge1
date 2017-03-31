//
//  NewItemViewController.swift
//  ControleDeGastos
//
//  Created by Julianny Favinha on 3/31/17.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController, KPDropMenuDelegate {
    
    // INICIO MENU CATEGORIA
    @IBOutlet weak var dropMenu: KPDropMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropMenu.title = "Selecione"
        dropMenu.items = ["Alimentação", "Vestuário", "Lazer", "Fármacia"]
        dropMenu.itemsIDs = ["0", "1", "2", "3"]
        dropMenu.itemsFont = UIFont(name: "Helvetica-Regular", size: 12.0)
        dropMenu.titleTextAlignment = .center
        dropMenu.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func didShow( _ dropMenu: KPDropMenu!) {
        print("didShow")
    }
    
    func didHide(_ dropMenu: KPDropMenu!) {
        print("didHide")
    }
    
    func didSelectItem(_ dropMenu: KPDropMenu!, at atIntedex: Int32) {
        
        if (dropMenu == self.dropMenu) {
            print("\(dropMenu.items[Int(atIntedex)]), with TAG: \(dropMenu.tag)")
        }
    }
    // FIM MENU CATEGORIA
    
    
    
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
