//
//  SpaViewController.swift
//  FinalProject
//
//  Created by Aisha Al-Qarni on 03/01/2022.
//

import UIKit
import Firebase

class SpaViewController: UIViewController {
    
    var spaArray = [SpaCell]()
    var spaStruct : SpaCell?
    let db = Firestore.firestore()
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var spaTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spaTableView.delegate = self
        spaTableView.dataSource = self
        getData()
    }
    func getData(){
        //MARK: Reading gdata from firestore
        db.collection("Spas").getDocuments
        { querySnapshot, error in
            self.spaArray = []
            if let _ = error {
                print("error")
                
            }else {
                for doc in querySnapshot!.documents {
                    let data = doc.data()
                    let name = data["Name"] as? String ?? "nil"
                    let newdata = SpaCell(name : name )
                    self.spaArray.append(newdata)
                    print(newdata)
                    self.spaTableView.reloadData()
                }
            }
        }
    }
}

extension SpaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        spaArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SpaTableViewCell
        cell.spaName.text = spaArray[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = spaArray[indexPath.row]
        performSegue(withIdentifier: "ToSpaDetails", sender: selectedRow)
    }
}
