//
//  PublisherCollectionViewCell.swift
//  NewsReader
//
//  Created by Tan Vinh Phan on 12/27/18.
//  Copyright © 2018 PTV. All rights reserved.
//

import UIKit

class PublisherCollectionViewCell: UICollectionViewCell
{
    
    @IBOutlet weak var publisherImageView: UIImageView!
    @IBOutlet weak var publisherTitleLabel: UILabel!
    
    var publisher: Publisher! {
        didSet {
            self.publisherImageView.image = self.publisher.image
            self.publisherTitleLabel.text = self.publisher.title
            
            self.publisherImageView.layer.cornerRadius = 3.0
            self.publisherImageView.layer.masksToBounds = true
        }
    }
    
}
