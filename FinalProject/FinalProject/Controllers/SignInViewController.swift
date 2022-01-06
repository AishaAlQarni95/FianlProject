//
//  SignInViewController.swift
//  FinalProject
//
//  Created by Aisha Al-Qarni on 03/01/2022.
//

import UIKit
import Firebase
class SignInViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func clickedSignIn(_ sender: Any) {
        Auth.auth().signIn(withEmail: email.text! , password: password.text! ) { authResult, error in
            if error == nil {
                self.performSegue(withIdentifier: "ToProfile2", sender: nil)
                print("Successfully logged in")
            } else {
                print(error?.localizedDescription)
                print("Log in failed")
            }
        }
    }
    
}



