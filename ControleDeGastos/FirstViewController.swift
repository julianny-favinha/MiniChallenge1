//
//  FirstViewController.swift
//  ControleDeGastos
//
//  Created by Julianny Favinha on 3/29/17.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import UIKit
import PieCharts

class FirstViewController: UIViewController {

    @IBOutlet weak var expenseImageView: UIImageView!
    @IBOutlet weak var incomeImageView: UIImageView!
    @IBOutlet weak var pieChart: PieChart!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let line:UIView = UIView(frame: CGRect(x: 15, y: 285, width: 345, height: 1))
        line.backgroundColor = UIColor.lightGray
        self.view.addSubview(line)
        
        //self.iconReceitasTot.image = UIImage(named: "piggy-bank.png")
        //self.iconDespesasTot.image = UIImage(named: "wallet.png")
        
        /* get information of categories in database to make a pie chart */
        let categories:[String] = ["Alimentação", "Vestuário", "Lazer", "Farmácia"]
        let quantity:[Double] = [20, 10, 5, 2]
        let colors:[UIColor] = [.orange, .red, .blue, .purple]
        var modelsArray:[PieSliceModel] = []
        
        for i in 0..<categories.count {
            modelsArray.append(PieSliceModel(value: quantity[i], color: colors[i]))
        }
        pieChart.models = modelsArray
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

