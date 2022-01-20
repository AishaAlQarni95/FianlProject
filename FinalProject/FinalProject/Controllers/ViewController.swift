//
//  ViewController.swift
//  FinalProject
//
//  Created by Aisha Al-Qarni on 03/01/2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var adsArray = [UIImage(named: "Ads_1")!,
                    UIImage(named: "Ads_1")!,
                    UIImage(named: "Ads_1")!]
    var timer: Timer?
    var currentCellIndex = 0
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var hotelLabel: UIButton!
    @IBOutlet weak var spaButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        profileButton.redFloatButton()
        startTimer()
        pageControl.numberOfPages = adsArray.count
        pageControl.pageControlStyle()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    @objc func moveToNextIndex(){
        if currentCellIndex < adsArray.count - 1 {
            currentCellIndex += 1
        }else{
            currentCellIndex = 0
        }
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentCellIndex
    }
    @IBAction func profileButton(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "ToProfile3", sender: nil )
        } else {
            performSegue(withIdentifier: "ToSignUp", sender: nil )
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        adsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewsAndAdsCollectionViewCell
        cell.adsPhoto.image = adsArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
