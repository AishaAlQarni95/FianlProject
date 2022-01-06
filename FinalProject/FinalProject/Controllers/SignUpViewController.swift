//
//  SignUpViewController.swift
//  FinalProject
//
//  Created by Aisha Al-Qarni on 03/01/2022.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    let db = Firestore.firestore()
    let userId = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func clickedSignUp(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { result, error in
            if error == nil {
                self.db.collection("Users").document("User").setData([
                    "Name": self.nameTextField.text!,
                    "Username": self.usernameTextField.text!,
                    "Email": self.emailTextField.text!,
                    "Password": self.passwordTextField.text!,
                    "Location": self.cityTextField.text!
                ]) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                    }
                }
                self.performSegue(withIdentifier: "ToProfile", sender: nil)
            }else {
                print("Error in create user: \(error?.localizedDescription ?? "")")
            }
        }
    }
}
