//
//  HotelDetailsViewController.swift
//  FinalProject
//
//  Created by Aisha Al-Qarni on 05/01/2022.
//

import UIKit

class HotelDetailsViewController: UIViewController {


    @IBOutlet weak var hotelDetailsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
struct Cell {
    
}
extension HotelDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = hotelDetailsCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HotelImageCollectionViewCell
        
        return cell
    }
    
    
}
