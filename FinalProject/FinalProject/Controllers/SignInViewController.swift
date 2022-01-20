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
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.yellowButton()
        email.setUnderLine()
        password.setUnderLine()
    }
    
    
    @IBAction func clickedSignIn(_ sender: Any) {
        if email.text != "" && password.text != "" {
            Auth.auth().signIn(withEmail: email.text!, password: password.text! , completion: { user, error in
                
                if error == nil {
                    print("Signed in successfully")
                    self.performSegue(withIdentifier: "ToProfile2", sender: nil)
                    
                    
                }else{
                    let alert = UIAlertController(title: "Warning", message: error?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            })
        } else {
            let alert = UIAlertController(title: "Incomplete information", message: "Email or password is incorrect", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}



