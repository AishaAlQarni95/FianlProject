//
//  SpaFormViewController.swift
//  FinalProject
//
//  Created by Aisha Al-Qarni on 05/01/2022.
//

import UIKit
import Firebase

class SpaFormViewController: UIViewController {
    let db = Firestore.firestore()
    let spaId = UUID().uuidString
    let imageView = UIImageView()
    var imageName = "\(UUID().uuidString).png"
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var owner: UITextField!
    @IBOutlet weak var Description: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var services: UITextField!
    @IBOutlet weak var price: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadImage()
    }
    //MARK: Saving data to firestore & storage
    @IBAction func formSubmissionButton(_ sender: Any) {
        db.collection("Spa request").document("Spa details").setData([
            "SpaID": spaId,
            "Name": name.text!,
            "Owner": owner.text!,
            "Location": location.text!,
            "Price": price.text!,
            "Description": Description.text!,
            "Services": services.text!,
            "Photo": self.imageView.image == UIImage(named: "profile") ? "nil" : self.imageName
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        uploadImage()
    }
    //MARK: Saving hotel's photos to storage
    func uploadImage(){
        let imagefolder = Storage.storage().reference().child("Spa images")
        if let imageData = imageView.image?.jpegData(compressionQuality: 0.1) {
            imagefolder.child(imageName).putData(imageData, metadata: nil){
                (metaData , err) in
                if let error = err {
                    print("Error writing document: \(error)")
                }else {
                    print("Image uploaded successfuly")
                }
            }
        }
    }
}
extension SpaFormViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: - Image Picker
    @IBAction func upLoadPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    //MARK: - Image Picker Delegates
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        guard let selectedImage = info[.editedImage] as? UIImage else { return }
        imageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    //MARK: - Image Picker Cancelation
    func imagePickerControllerDidCancel(
        _ picker: UIImagePickerController
    ) {
        dismiss(animated: true, completion: nil)
    }
}
