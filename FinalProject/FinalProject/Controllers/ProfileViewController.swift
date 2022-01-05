//
//  ProfileViewController.swift
//  FinalProject
//
//  Created by Aisha Al-Qarni on 03/01/2022.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
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



struct StatuCell {
    
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
