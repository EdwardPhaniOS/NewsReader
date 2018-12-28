//
//  PublisherCollectionViewController.swift
//  NewsReader
//
//  Created by Tan Vinh Phan on 12/28/18.
//  Copyright © 2018 PTV. All rights reserved.
//

import UIKit
import SafariServices

class PublisherCollectionViewController: UICollectionViewController {
    
    var publishersStore = PublishersStore()
    
    struct Storyboard {
        static let totalSpacingPerRow: CGFloat = 32.0
        static let totalItemsPerRow: CGFloat = 3.0
        static let titleHeightAdjustment: CGFloat = 30.0
        
        static let publisherHeader = "PublisherHeader"
        static let publisherCell = "PublisherCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionViewWidth = collectionView.frame.width
        let itemWidth = (collectionViewWidth - Storyboard.totalSpacingPerRow) / Storyboard.totalItemsPerRow
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth + Storyboard.titleHeightAdjustment)
 
    }
    
    // MARK: - UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return publishersStore.numberOfSection
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return publishersStore.numberOfPublishers(inSection: section)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.publisherCell, for: indexPath) as! PublisherCollectionViewCell
        let publisher = publishersStore.publisherForItem(atIndexPath: indexPath)
        
        cell.publisher = publisher
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Storyboard.publisherHeader, for: indexPath) as! SectionHeaderCollectionReusableView
        
        if let publisher = publishersStore.publisherForItem(atIndexPath: indexPath)
        {
            headerView.publisher = publisher
        }
        return headerView
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let publisher = publishersStore.publisherForItem(atIndexPath: indexPath)
        if let url = publisher?.url {
            let safariVC = SFSafariViewController(url: url)
            self.present(safariVC, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Ooops!", message: "Something is wrong with this url", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
