//
//  VolumesVC.swift
//  Westerlies
//
//  Created by Adam P Dostalik on 10/20/17.
//  Copyright © 2017 Adam P Dostalik. All rights reserved.
//

import UIKit

class VolumesVC: UIViewController {

    @IBOutlet weak var coffeeLiters: UILabel!
    @IBOutlet weak var coffeeFlOz: UILabel!
    @IBOutlet weak var creamQuarts: UILabel!
    @IBOutlet weak var creamFlOz: UILabel!
    @IBOutlet weak var waterFlOz: UILabel!
    @IBOutlet weak var sugarGrams: UILabel!
    @IBOutlet weak var thcMix: UILabel!
    
    var casesSelected: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if casesSelected != nil {
            setLabels()
        }
        // Do any additional setup after loading the view.
    }
    
    func setLabels() {
        coffeeLiters.text = "\(Double(casesSelected!) * 2.5)"
        coffeeFlOz.text = "\(Double(casesSelected!) * 84.5)"
        creamQuarts.text = "\(casesSelected!)"
        creamFlOz.text = "\(Double(casesSelected!) * 32)"
        waterFlOz.text = "\(Double(casesSelected!) * 8)"
        sugarGrams.text = "\(Double(casesSelected!) * 187)"
        thcMix.text = "\(Double(casesSelected!) * 12)"
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
