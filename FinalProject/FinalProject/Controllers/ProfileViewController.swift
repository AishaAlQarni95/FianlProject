//
//  ProfileViewController.swift
//  FinalProject
//
//  Created by Aisha Al-Qarni on 03/01/2022.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let db = Firestore.firestore()
    var userId = Auth.auth().currentUser?.uid
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        signOutButton.redFloatButton()
        backButton.yellowFloatButton()
        loadUser()
        avatar.layer.cornerRadius = avatar.frame.height / 2
    }
    func loadUser() {
        if let userId = userId {
            db.collection("Users").document(userId).getDocument { documentSnapshot, error in
                if let error = error {
                    print("Error: ",error.localizedDescription)
                }else {
                    self.labelOne.text = documentSnapshot?.get("Name") as? String ?? "nil"
                    //                    self.pointLbl.text = String(documentSnapshot?.get("point") as? Int ?? 0) + "_"
                    let imgStr = documentSnapshot?.get("Photo") as? String
                    if imgStr == "nil" {
                        self.avatar.image = UIImage(named: "profile")
                    }
                    else {
                        self.loadImage(imgStr: imgStr!)
                    }
                }
            }
        }
    }
    func loadImage(imgStr: String) {
        let url = "gs://petsworld-a47b4.appspot.com/images/" + "\(imgStr)"
        
        let Ref = Storage.storage().reference(forURL: url)
        Ref.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil {
                print("Error: Image could not download!")
                print("Error: ",error!.localizedDescription)
            } else {
                self.avatar.image = UIImage(data: data!)
            }
        }
    }
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "ToHome", sender: nil )
    }
    @IBAction func clickedSignOut(_ sender: Any) {
        do{
            try  Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
        }catch{
            print("Error", error.localizedDescription)
        }
    }
}
struct StatusCell {
    
}
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StatusTableViewCell
        
        return cell
    }
}
