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
        
        self.view.addSubview(pieChart)
        pieChart.layers = [/*createCustomViewsLayer(),*/ createTextLayer()]
        pieChart.models = createModels()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func createModels() -> [PieSliceModel] {
        /* get information of categories in database to make a pie chart */
        let categories:[String] = ["Alimentação", "Vestuário", "Lazer", "Farmácia"]
        let quantity:[Double] = [20, 10, 5, 2]
        let colors:[UIColor] = [.orange, .red, .blue, .purple]
        var modelsArray:[PieSliceModel] = []
        
        for i in 0..<categories.count {
            modelsArray.append(PieSliceModel(value: quantity[i], color: colors[i]))
        }
        
        return modelsArray
    }
    
    fileprivate func createCustomViewsLayer() -> PieCustomViewsLayer {
        let viewLayer = PieCustomViewsLayer()
        let settings = PieCustomViewsLayerSettings()
        
        settings.viewRadius = 135
        settings.hideOnOverflow = false
        
        viewLayer.settings = settings
        viewLayer.viewGenerator = createViewGenerator()
        
        return viewLayer
    }
    
    fileprivate func createTextLayer() -> PiePlainTextLayer {
        let textLayerSettings = PiePlainTextLayerSettings()
        textLayerSettings.viewRadius = 75
        textLayerSettings.hideOnOverflow = true
        textLayerSettings.label.font = UIFont.systemFont(ofSize: 12)
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        textLayerSettings.label.textGenerator = {slice in
            return formatter.string(from: slice.data.percentage * 100 as NSNumber).map{"\($0)%"} ?? ""
        }
        
        let textLayer = PiePlainTextLayer()
        textLayer.settings = textLayerSettings
        return textLayer
    }
    
    fileprivate func createViewGenerator() -> (PieSlice, CGPoint) -> UIView {
        return {slice, center in
            
            let container = UIView()
            container.frame.size = CGSize(width: 100, height: 40)
            container.center = center
            let view = UIImageView()
            view.frame = CGRect(x: 30, y: 0, width: 40, height: 40)
            container.addSubview(view)
            
            if slice.data.id == 3 || slice.data.id == 0 {
                let specialTextLabel = UILabel()
                specialTextLabel.textAlignment = .center
                if slice.data.id == 0 {
                    specialTextLabel.text = "views"
                    specialTextLabel.font = UIFont.boldSystemFont(ofSize: 18)
                } else if slice.data.id == 3 {
                    specialTextLabel.textColor = UIColor.blue
                    specialTextLabel.text = "Custom"
                }
                specialTextLabel.sizeToFit()
                specialTextLabel.frame = CGRect(x: 0, y: 40, width: 100, height: 20)
                container.addSubview(specialTextLabel)
                container.frame.size = CGSize(width: 100, height: 60)
            }
            
            
            /* src of images: www.freepik.com, http://www.flaticon.com/authors/madebyoliver
            let imageName: String? = {
                switch slice.data.id {
                case 0: return "fish"
                case 1: return "grapes"
                case 2: return "doughnut"
                case 3: return "water"
                case 4: return "chicken"
                case 5: return "beet"
                case 6: return "cheese"
                default: return nil
                }
            }()
            view.image = imageName.flatMap{UIImage(named: $0)}*/
            
            return container
        }
    }
}

