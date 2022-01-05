//
//  HotelViewController.swift
//  FinalProject
//
//  Created by Aisha Al-Qarni on 03/01/2022.
//

import UIKit

class HotelViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var hotelTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        hotelTableView.delegate = self
        hotelTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
}
struct HotelCell {
    
}
extension HotelViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HotelTableViewCell
        
        return cell
    }
    
    
}
