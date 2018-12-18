//
//  ControllerViewController.swift
//  Layout Test
//
//  Created by Nik Medgyesy on 18/12/2018.
//  Copyright © 2018 Nik Medgyesy. All rights reserved.
//

import UIKit

class ControllerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuse", for: indexPath) as! CollectionViewCell
        cell.onScroll = cellScrolled(_:)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var toolBar: UIToolbar!

    private var revealFactor: CGFloat = 0 {
        didSet {
            if revealFactor >= 1 {
                revealFactor = 1
            } else if revealFactor <= 0 {
                revealFactor = 0
            }
        }
    }
    open var transformRatio: CGFloat = 50
    open var distanceBeforeEffect: CGFloat = 30
    private var previousScrollOffset: CGFloat = 0
    func cellScrolled(_ scrollView: UIScrollView) {
        defer { previousScrollOffset = scrollView.contentOffset.y }
        let offset =  scrollView.contentOffset.y - previousScrollOffset
        if scrollView.contentOffset.y < (-scrollView.contentInset.top + distanceBeforeEffect) { return }
        if scrollView.contentOffset.y + scrollView.frame.height >= scrollView.contentSize.height { return }
        revealFactor += offset/transformRatio
       
        toolBar.transform = CGAffineTransform(translationX: 0, y: -toolBar.frame.height*revealFactor)
        tabBarController?.tabBar.transform = CGAffineTransform(translationX: 0, y: tabBarController!.tabBar.frame.height*revealFactor)
    }
    

}
