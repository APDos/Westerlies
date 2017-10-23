//
//  CasesNeededVC.swift
//  Westerlies
//
//  Created by Adam P Dostalik on 10/20/17.
//  Copyright © 2017 Adam P Dostalik. All rights reserved.
//

import UIKit

class CasesNeededVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet weak var casesPickerView: UIPickerView!
    
    var numOfCases = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        casesPickerView.delegate = self
        casesPickerView.dataSource = self
        Singleton.main.currentBatch.numberOfCases = numOfCases
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numOfCases = row + 1
        Singleton.main.currentBatch.numberOfCases = row + 1
        print(numOfCases)
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let myTitle = NSAttributedString(string: "\(row + 1)", attributes: [NSAttributedStringKey.font:UIFont(name: "Georgia", size: 15.0)!,NSAttributedStringKey.foregroundColor:UIColor.white])
        return myTitle
    }
    
    @IBAction func nextPressed() {
        self.performSegue(withIdentifier: "showVolumesVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVolumesVC" {
            let vc = segue.destination as! VolumesVC
            vc.casesSelected = numOfCases
        }
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
