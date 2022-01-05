//
//  SpaViewController.swift
//  FinalProject
//
//  Created by Aisha Al-Qarni on 03/01/2022.
//

import UIKit

class SpaViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var spaTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        spaTableView.delegate = self
        spaTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
}
struct SpaCell {
    
}
extension SpaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SpaTableViewCell
        
        return cell
    }
    
    
}
