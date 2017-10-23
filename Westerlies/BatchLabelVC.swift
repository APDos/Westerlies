//
//  BatchLabelVC.swift
//  Westerlies
//
//  Created by Adam P Dostalik on 10/20/17.
//  Copyright © 2017 Adam P Dostalik. All rights reserved.
//

import UIKit
import GoogleSignIn
import GoogleAPIClientForREST

class BatchLabelVC: UIViewController {
    
    @IBOutlet weak var batchNumLabel: UILabel!
    @IBOutlet weak var expDateLabel: UILabel!
    
    var currentDate: String = ""
    var batchNum: String = ""
    var expDate: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        let futureDate = Date(timeIntervalSinceNow: 60*60*24*30)
        let formatter = DateFormatter()
        let futureFormatter = DateFormatter()
        let calendar = Calendar.current
        formatter.dateFormat = "MMddyyyHHmm"
        futureFormatter.dateFormat = "MM/dd/yyyy"
        batchNum = "\(formatter.string(from: date))"
        expDate = futureFormatter.string(from: futureDate)
        batchNumLabel.text = batchNum
        expDateLabel.text = expDate
        currentDate = futureFormatter.string(from: date)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveBatchSelected() {
        let sheetID = "1MsW_LRkyVlPo48T-jRI1_xpzcQ4soVUtDaYlfEx9UWw"

        let valueRange = GTLRSheets_ValueRange.init()
        valueRange.majorDimension = "COLUMNS"
        valueRange.values = [
            [currentDate],
            [batchNum],
            [expDate],
            [Singleton.main.currentBatch.numberOfCases]]
        let range = "A:D"
        let query = GTLRSheetsQuery_SpreadsheetsValuesAppend.query(withObject: valueRange, spreadsheetId: sheetID, range: range)
        query.valueInputOption = "USER_ENTERED"
        Singleton.main.service.executeQuery(query, delegate: self, didFinish: #selector(displayResultWithTicket(ticket:finishedWithObject:error:)))
    }
    
    @objc func displayResultWithTicket(ticket: GTLRServiceTicket,
                                       finishedWithObject result : GTLRSheets_ValueRange,
                                       error : NSError?) {
        
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        print("SUCCESS!")
    }
    
    func showAlert(title : String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertControllerStyle.alert
        )
        let ok = UIAlertAction(
            title: "OK",
            style: UIAlertActionStyle.default,
            handler: nil
        )
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
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
