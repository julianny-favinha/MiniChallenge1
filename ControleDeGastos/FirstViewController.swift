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
        
        self.incomeImageView.image = UIImage(named: "piggy-bank.png")
        self.expenseImageView.image = UIImage(named: "wallet.png")
        
        self.view.addSubview(pieChart)
        pieChart.layers = [createCustomViewsLayer(), createTextLayer()]
        //pieChart.delegate = self
        pieChart.models = createModels()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /// Creates all slices in pie chart, each one with a color
    ///
    /// - Returns: array of slices in pie chart
    fileprivate func createModels() -> [PieSliceModel] {
        /* get information of categories in database to make a pie chart */
        let quantity:[Double] = [20, 10, 5, 2]
        let colors:[UIColor] = [UIColor(red:0.86, green:0.86, blue:0.86, alpha:1.0), UIColor(red:0.91, green:0.33, blue:0.33, alpha:1.0), UIColor(red:0.33, green:0.46, blue:0.91, alpha:1.0), UIColor(red:0.92, green:0.89, blue:0.47, alpha:1.0)]
        var modelsArray:[PieSliceModel] = []
        
        for i in 0..<quantity.count {
            modelsArray.append(PieSliceModel(value: quantity[i], color: colors[i]))
        }
        
        return modelsArray
    }
    
    /// View to labels of categories
    ///
    /// - Returns: view that contains labels of categories
    fileprivate func createCustomViewsLayer() -> PieCustomViewsLayer {
        let viewLayer = PieCustomViewsLayer()
        
        let settings = PieCustomViewsLayerSettings()
        settings.viewRadius = 130
        settings.hideOnOverflow = false
        viewLayer.settings = settings
        
        viewLayer.viewGenerator = createViewGenerator()
        
        return viewLayer
    }
    
    /// Creates labels of percentage and puts into each piece of pie chart
    ///
    /// - Returns: labels of percentage
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
    
    /// Creates labels of categories and puts into each piece of pie chart
    ///
    /// - Returns: labels of categories
    fileprivate func createViewGenerator() -> (PieSlice, CGPoint) -> UIView {
        return {slice, center in
            /* get information of categories in database to make a pie chart */
            let categories:[String] = ["Alimentação", "Vestuário", "Lazer", "Fármacia"]
            
            let container = UIView()
            container.frame.size = CGSize(width: 240, height: 240)
            container.center = center
            let view = UIImageView()
            view.frame = CGRect(x: 0, y: 0, width: 240, height: 240)
            container.addSubview(view)
            
            let specialTextLabel = UILabel()
            specialTextLabel.textAlignment = .center
            specialTextLabel.text = categories[slice.data.id]
            specialTextLabel.sizeToFit()
            specialTextLabel.frame = CGRect(x: 15, y: 0, width: 240, height: 240)
            
            container.addSubview(specialTextLabel)
            container.frame.size = CGSize(width: 240, height: 240)
            
            return container
        }
    }
}

