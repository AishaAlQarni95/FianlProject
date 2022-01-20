//
//  SignUpViewController.swift
//  FinalProject
//
//  Created by Aisha Al-Qarni on 03/01/2022.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    @IBOutlet weak var avatar: UIImageView!
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
    var imageName = "\(UUID().uuidString).png"
    var image: UIImage? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAvatar()
        signUpButton.yellowButton()
        nameTextField.setUnderLine()
        emailTextField.setUnderLine()
        passwordTextField.setUnderLine()
    }
    func setupAvatar(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
        avatar.layer.cornerRadius = avatar.frame.height / 2
        avatar.addGestureRecognizer(tapGesture)
    }
    @objc func presentPicker(){
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    @IBAction func clickedSignUp(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { user, Error in
                if Error == nil {
                    self.addUser(userId: (user?.user.uid)!)
                    self.performSegue(withIdentifier: "ToProfile", sender: nil )
                } else{
                    let alert = UIAlertController(title: "Warning", message: Error?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        } else {
            let alert = UIAlertController(title: "Incomplete information", message: "Email or password is incorrect", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        dismiss(animated: true, completion: nil)
    }
    func addUser(userId: String) {
        if avatar.image != UIImage(named: "profile") {
            uploadImage()
        }
        self.db.collection("Users")
            .document(userId).setData(
                [
                    "Name" : self.nameTextField.text!,
                    "Email" : self.emailTextField.text!,
                    "Photo": avatar.image == UIImage(named: "profile") ? "nil" : imageName,
                    "Password" : self.passwordTextField.text!,
                    //                    "groups" : [""],
                    //                    "bookmark" : [""]
                ])
        {(error) in
            if error == nil {
                print("Added Succ..")
                
            }else {
                print(error!.localizedDescription)
            }
        }
    }
    func uploadImage() {
        let imagefolder = Storage.storage().reference().child("images")
        if let imageData = avatar.image?.jpegData(compressionQuality: 0.1) {
            imagefolder.child(imageName).putData(imageData, metadata: nil){
                (metaData , err) in
                if let error = err {
                    print(error.localizedDescription)
                }else {
                    print("Avatar successfully uploaded")
                }
            }
        }
    }
}
extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            image = imageSelected
            avatar.image = imageSelected
        }
        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            image = imageOriginal
            avatar.image = imageOriginal
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

