//
//  FirstViewController.swift
//  ControleDeGastos
//
//  Created by Julianny Favinha on 3/29/17.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var iconDespesasTot: UIImageView!
    @IBOutlet weak var iconReceitasTot: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let line = UIView(frame: CGRect(x: 15, y: 285, width: 345, height: 1))
        line.backgroundColor = UIColor.lightGray
        self.view.addSubview(line)
        
        self.iconReceitasTot.image = UIImage(named: "piggy-bank.png")
        self.iconDespesasTot.image = UIImage(named: "wallet.png")
        
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

