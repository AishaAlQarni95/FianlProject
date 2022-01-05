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
                    "Email": self.emailTextField.text!,
                    "Password": self.passwordTextField.text!
                ]) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                    }
                }
                self.performSegue(withIdentifier: "ToProfile", sender: nil)
            }else {
                print(error?.localizedDescription)
            }
        }
    }
}

//Auth.auth().createUser(withEmail: email.text!, password: password.text!) { result, error in
//    if error == nil {
//        self.db.collection("Users")
//            .addDocument(data:
//                            [
//                                "name": self.nameTextField.text! ,
//                                "email": self.emailTextField.text! ,
//                                "password": self.passwordTextField.text!
//                            ]
//            )
//        self.performSegue(withIdentifier: "ToProfile", sender: nil)
//    }else {
//        print(error?.localizedDescription)
//    }
//}



//db.collection("Users")
//    .document("User")
//    .setData(
//[
//"Name": nameTextField.text!,
//"Email": emailTextField.text!,
//"ID": userId!
//]
//    )
//{(error) in
//    if error == nil {
//        print("New document has been created..")
//    }else{
//        print(error?.localizedDescription)
//    }
//
//}
//Auth.auth().createUser(withEmail: emailTextField.text! , password: passwordTextField.text!){ authResult, error in
//
//    if error == nil {
//        self.performSegue(withIdentifier: "ToProfile", sender: nil)
//    }else{
//        print(error?.localizedDescription)
//    }
//}
