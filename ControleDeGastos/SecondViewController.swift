//
//  SecondViewController.swift
//  ControleDeGastos
//
//  Created by Julianny Favinha on 3/29/17.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import UIKit
import HFSwipeView.Swift

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   
    
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var items:[Item] = [Item(name: "Almoço", date: "25 de abril", value: 30.00, category: "Alimentação")]
 
    @IBAction func Cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(SecondViewController.respond(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
    
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(SecondViewController.respond(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    func respond(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                self.items.removeAll()
                // carregar dados e preencher items
                self.tableView.reloadData()
            case UISwipeGestureRecognizerDirection.left:
                self.items.removeAll()
                // carregar dados e preencher items
                self.tableView.reloadData()
            default:
                break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (items.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemCell
        
        cell.name.text = items[indexPath.row].name
        cell.value.text = String("R$\(items[indexPath.row].value)")
        cell.date.text = String("\(items[indexPath.row].date) - \(items[indexPath.row].category)")
        
        return cell
    }
}

