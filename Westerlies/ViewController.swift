//
//  ViewController.swift
//  Westerlies
//
//  Created by Adam P Dostalik on 10/20/17.
//  Copyright © 2017 Adam P Dostalik. All rights reserved.
//

import UIKit
import GoogleSignIn
import GoogleAPIClientForREST

class ViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    
    let signInButton = GIDSignInButton()
    private let scopes = [kGTLRAuthScopeSheetsSpreadsheets]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        signInButton.center = view.center
        view.addSubview(signInButton)
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().scopes = scopes
        GIDSignIn.sharedInstance().signInSilently()
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let err = error {
            showAlert(title: "Auth Error", message: error.localizedDescription)
            Singleton.main.service.authorizer = nil
        } else {
            Singleton.main.service.authorizer = user.authentication.fetcherAuthorizer()
        }
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

}

