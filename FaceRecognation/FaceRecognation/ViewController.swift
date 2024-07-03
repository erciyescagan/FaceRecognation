//
//  ViewController.swift
//  FaceRecognation
//
//  Created by Mert Erciyes Çağan on 6/3/24.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func signIn(_ sender: Any) {
        
        let authContext = LAContext()
        
        var error: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To be sure is that you?") { (success, error) in
                if success == true {
                    
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "segue", sender: nil)

                    }
                } else {
                    DispatchQueue.main.async {
                        self.myLabel.text = "error!"
                    }
                }
            }
        }
    }
}

