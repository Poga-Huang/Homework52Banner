//
//  BannerCollectionViewController.swift
//  Homework52Banner
//
//  Created by 黃柏嘉 on 2022/1/11.
//

import UIKit

private let reuseIdentifier = "imageCell"

class BannerCollectionViewController: UICollectionViewController {
    
    let numberArray = ["1","2","3","4","5","1"]
    var timer:Timer?
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFlowLayout()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(autoScrollBanner), userInfo: nil, repeats: true)
    }
    
    //設定CollectionView的FlowLayout
    func setupFlowLayout(){
        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        flowLayout?.itemSize = view.bounds.size
        flowLayout?.minimumInteritemSpacing = 0
        flowLayout?.minimumLineSpacing = 0
        flowLayout?.estimatedItemSize = .zero
        flowLayout?.sectionInset = .zero
        flowLayout?.scrollDirection = .horizontal
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return numberArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageCollectionViewCell
        cell.bannerImageView.image = UIImage(named: "\(numberArray[indexPath.item])")
        return cell
    }
    
    @objc func autoScrollBanner(){
        
        index += 1
        if index < numberArray.count{
            collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
        }else if index == numberArray.count{
            index = 0
            collectionView.scrollToItem(at:IndexPath(item: index, section: 0), at:.centeredHorizontally, animated: false)
            autoScrollBanner()
        }
        
    }
    

}
