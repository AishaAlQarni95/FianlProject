//
//  HotelFormViewController.swift
//  FinalProject
//
//  Created by Aisha Al-Qarni on 05/01/2022.
//

import UIKit
import Firebase

class HotelFormViewController: UIViewController {
    let db = Firestore.firestore()
    let hotelId = UUID().uuidString
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var owner: UITextField!
    @IBOutlet weak var Description: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var price: UITextField!
    var imageName = "\(UUID().uuidString).png"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func formSubmissionButton(_ sender: Any) {
        
        db.collection("Hotels").document("Hotel").setData([
            "HotelID": hotelId,
            "Name": name.text!,
            "Owner": owner.text!,
            "Location": location.text!,
            "Price": price.text!,
            "Description": Description.text!,
            "Photo":""
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
    }
    
    

    

}
extension HotelFormViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Image Picker
    @IBAction func didTapButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    // MARK: - Image Picker Delegates
    func imagePickerController(
      _ picker: UIImagePickerController,
      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        
      dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(
      _ picker: UIImagePickerController
    ) {
      dismiss(animated: true, completion: nil)
    }
    
    
//    func uploadImage(){
//           let imagefolder = Storage.storage().reference().child("images")
//           //@IBOutlet weak var userImg: UIImageView!
//           if let imageData = userImg.image?.jpegData(compressionQuality: 0.1) {
//               imagefolder.child(imageName).putData(imageData, metadata: nil){
//                   (metaData , err) in
//                   if let error = err {
//                       print("Error in image uploading: \(error?.localizedDescription ?? "")")
//                   }else {
//                       print("Image uploaded successfuly")
//                   }
//               }
//           }
//       }
}
//if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
//   imageView.contentMode = .ScaleAspectFit
//   imageView.image = pickedImage
