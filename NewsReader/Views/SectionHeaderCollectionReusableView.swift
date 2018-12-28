//
//  SectionHeaderCollectionReusableView.swift
//  NewsReader
//
//  Created by Tan Vinh Phan on 12/27/18.
//  Copyright © 2018 PTV. All rights reserved.
//

import UIKit

class SectionHeaderCollectionReusableView: UICollectionReusableView
{
    @IBOutlet weak var sectionHeaderLabel: UILabel!
    
    var publisher: Publisher! {
        didSet {
            self.sectionHeaderLabel.text = publisher.section.uppercased()
        }
    }
}
