//
//  NewItemViewController.swift
//  ControleDeGastos
//
//  Created by Julianny Favinha on 3/31/17.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import UIKit
import CloudKit

class NewItemViewController: UIViewController, KPDropMenuDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    // INICIO MENU CATEGORIA
    @IBOutlet weak var dropMenu: KPDropMenu!
    var dropMenuSelected:Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize.height = 1000
     
        dropMenu.title = "Selecione"
        dropMenu.items = ["Sem categoria", "Alimentação", "Aluguel", "Farmácia", "Lazer", "Salário", "Saúde", "Telefonia", "Transporte", "Vestuário"]
        dropMenu.itemsIDs = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        dropMenu.itemsFont = UIFont(name: "Helvetica-Regular", size: 12.0)
        dropMenu.titleTextAlignment = .center
        
        //dropMenu.delegate = self
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(NewItemViewController.dismissKeyboard))
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        self.dismissKeyboard()
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func didShow( _ dropMenu: KPDropMenu!) {
        print("didShow")
    }
    
    func didHide(_ dropMenu: KPDropMenu!) {
        print("didHide")
    }
    
    func didSelectItem(_ dropMenu: KPDropMenu!, at atIntedex: Int32) {
        
        if (dropMenu == self.dropMenu) {
            print(atIntedex)
            print("\(dropMenu.items[Int(atIntedex)]), with TAG: \(dropMenu.tag)")
        }
        
        dropMenuSelected = Int(atIntedex)
    }
    
    func getCategoryName(_ index:Int) -> String{
        return String(describing: dropMenu.items[index])
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
    @IBOutlet weak var replayNumberTextField: UITextField!
    
    @IBOutlet weak var whenLabel: UILabel!
    @IBOutlet weak var replayNumberLabel: UILabel!
    
    
    @IBAction func savePressed(_ sender: Any) {
        let newItem = CKRecord(recordType: "Item")
        
        //Adding type
        if(typeSegmentedControl.selectedSegmentIndex == 0){
            newItem.setObject("Despesa" as CKRecordValue?, forKey: "itemsType")
        } else {
            newItem.setObject("Receita" as CKRecordValue?, forKey: "itemsType")
        }
        
        //Adding value
        if let value = valueTextField.text {
            newItem.setObject(Double(value) as CKRecordValue?, forKey: "value")
        }
        
        //Adding description
        if let description = descriptionTextField.text {
            newItem.setObject(description as CKRecordValue?, forKey: "description")
        }
        
        //Adding payment type
        if(paymentSegmentedControl.selectedSegmentIndex == 0){
            newItem.setObject("Dinheiro" as CKRecordValue?, forKey: "paymentType")
        } else if(paymentSegmentedControl.selectedSegmentIndex == 1){
            newItem.setObject("Crédito" as CKRecordValue?, forKey: "paymentType")
        } else {
            newItem.setObject("Débito" as CKRecordValue?, forKey: "paymentType")
        }
        
        //Adding category
        if(dropMenuSelected != -1){
            newItem.setObject(getCategoryName(dropMenuSelected) as CKRecordValue?, forKey: "categoryType")
        } else {
            newItem.setObject("Sem categoria" as CKRecordValue?, forKey: "categoryType")
        }
        
        //Adding input date
        let formatDate:Date = datePicker.date
        newItem.setObject(formatDate as CKRecordValue?, forKey: "occurrenceDate")
        
        //Adding frequency
        if(whenSegmentedControl.selectedSegmentIndex == 0){
            newItem.setObject("Semanalmente" as CKRecordValue?, forKey: "frequencyType")
        } else if(whenSegmentedControl.selectedSegmentIndex == 1){
            newItem.setObject("Mensalmente" as CKRecordValue?, forKey: "frequencyType")
        }
        
        if(replaySwitch.isOn){
            newItem.setObject(1 as CKRecordValue?, forKey: "ifRepeats")
        } else {
            newItem.setObject(0 as CKRecordValue?, forKey: "ifRepeats")
        }
        
        if let replayNumber = replayNumberTextField.text{
            newItem.setObject(Int(replayNumber) as CKRecordValue?, forKey: "replayNumber")
        }
        
        //Uploading to CloudKit
        let publicData = CKContainer.default().publicCloudDatabase
        publicData.save(newItem, completionHandler: {(record:CKRecord?, error:Error?) -> Void in
            if error != nil{
                //print("Error --->" + (error!.localizedDescription))
            }
        })
        
        self.dismiss(animated: true, completion: nil)
        
        
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
    
    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var replayLabel: UILabel!
    
    @IBAction func typeValueChanged(_ sender: UISegmentedControl) {
        if typeSegmentedControl.selectedSegmentIndex == 1 {
            scrollView.contentSize.height = 700
            paymentLabel.isHidden = true
            paymentSegmentedControl.isHidden = true
            replayLabel.isHidden = true
            replaySwitch.isOn = false // return default value
            replaySwitch.isHidden = true
            whenLabel.isHidden = true
            whenSegmentedControl.isHidden = true
            replayNumberLabel.isHidden = true
            replayNumberTextField.isHidden = true
        }
        else {
            paymentLabel.isHidden = false
            paymentSegmentedControl.isHidden = false
            replayLabel.isHidden = false
            replaySwitch.isHidden = false
        }
    }
    
    @IBAction func replayValueChanged(_ sender: UISwitch) {
        scrollView.contentSize.height = 1300
        //let cg:CGPoint = CGPoint(x: 0, y: 400)
        if sender.isOn {
            //scrollView.setContentOffset(CGPoint(x: 0 , y: 400), animated: true)
            whenLabel.isHidden = false
            whenSegmentedControl.isHidden = false
            replayNumberLabel.isHidden = false
            replayNumberTextField.isHidden = false
        }
        else {
            scrollView.setContentOffset(CGPoint(x: 0 , y: 0), animated: true)
            whenLabel.isHidden = true
            whenSegmentedControl.isHidden = true
            replayNumberLabel.isHidden = true
            replayNumberTextField.isHidden = true
        }
    }
}
