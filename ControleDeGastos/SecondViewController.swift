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
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var categoryIcon: UIImageView!
    var items:[Item] = [Item(type: "Despesa", value: 20.0, category: "Alimentação", description: "Bandeco", payment: "Dinheiro", date: Date(), ifRepeats: 1, when: "Mensalmente", replayNumber: 4)]
   
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
        if let swipeGesture: UISwipeGestureRecognizer = gesture as? UISwipeGestureRecognizer {
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
    
    func formatDate(_ date:Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (items.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell: ItemCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemCell
        let item = items[indexPath.row]
        
        cell.descriptionLabel.text = item.description
        cell.valueLabel.text = String("R$\(item.value)")
        cell.dateLabel.text = formatDate(item.date)
        cell.paymentLabel.text = item.payment
        
        return cell
    }
}

