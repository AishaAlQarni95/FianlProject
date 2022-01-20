//
//  HotelViewController.swift
//  FinalProject
//
//  Created by Aisha Al-Qarni on 03/01/2022.
//

import UIKit
import Firebase

class HotelViewController: UIViewController {
    
    var hotelsArray = [HotelCell]()
    var hotelStruct : HotelCell?
    let db = Firestore.firestore()
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var hotelTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hotelTableView.delegate = self
        hotelTableView.dataSource = self
        getData()
    }
    func getData(){
        //MARK: Reading gdata from firestore
        db.collection("Hotels").getDocuments
        { querySnapshot, error in
            self.hotelsArray = []
            if let _ = error {
                print("error")
                
            }else {
                for doc in querySnapshot!.documents {
                    let data = doc.data()
                    let name = data["Name"] as? String ?? "nil"
                    let newdata = HotelCell(name : name )
                    self.hotelsArray.append(newdata)
                    print(newdata)
                    self.hotelTableView.reloadData()
                }
            }
        }
    }
}

extension HotelViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        hotelsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HotelTableViewCell
        cell.hotelName.text = hotelsArray[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = hotelsArray[indexPath.row]
        performSegue(withIdentifier: "ToHotelDetails", sender: selectedRow)
    }
    
    
}
