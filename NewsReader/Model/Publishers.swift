//
//  Publishers.swift
//  NewsReader
//
//  Created by Tan Vinh Phan on 12/27/18.
//  Copyright © 2018 PTV. All rights reserved.
//

import UIKit

class PublishersStore
{
    //MARK: - Public API
    
//    var numberOfPublishers: Int {
//        return publishers.count
//    }

    var numberOfSection: Int {
        return sections.count
    }
    
    
    init() {
        self.sections = ["My Favorites", "Politics", "Travel", "Technology"]
        self.publishers = createPublishers()
    }
    
    func numberOfPublishers(inSection section: Int) -> Int {
        let numberOfPublishers = self.publisher(inSection: section)
        return numberOfPublishers.count
    }
    
    func publisherForItem(atIndexPath indexPath: IndexPath) -> Publisher?
    {
        if indexPath.section > 0 {
            let publishers = publisher(inSection: indexPath.section)
            return publishers[indexPath.item]
        } else {
            return self.publishers[indexPath.item]
        }
    }
    
    func titleForSection(atIndexPath indexPath: IndexPath) -> String? {
        if indexPath.section < self.sections.count
        { return self.sections[indexPath.section]
        }
        else
        { return nil
        }
    }
    
    //MARK: - Private
    private var publishers = [Publisher]()
    private var sections = [String]()
    
    private func createPublishers() -> [Publisher]
    {
        var publishersList = [Publisher]()
        
        publishersList += MyFavorites.Publishers()
        publishersList += Politics.publishers()
        publishersList += Technology.publishers()
        publishersList += Travel.publishers()
        
        return publishersList
    }
    
    private func publisher(inSection section: Int) -> [Publisher]
    {
        let section = self.sections[section]
        var publisherInSection = [Publisher]()
        
        for publisher in publishers {
            if  publisher.section == section
            {
                publisherInSection.append(publisher)
            }
        }
        return publisherInSection
    }
}


class MyFavorites
{
    class func Publishers () -> [Publisher]
    {
        var publishers = [Publisher]()
        
        publishers.append(Publisher(title: "TIME", url: URL(string: "http://time.com")!, section: "My Favorites", image: UIImage(named: "TIME")!))
        publishers.append(Publisher(title: "The New York Times", url: URL(string: "http://www.nytimes.com")!, section: "My Favorites", image: UIImage(named: "The New York Times")!))
        publishers.append(Publisher(title: "TED", url: URL(string: "https://www.ted.com")!, section: "My Favorites", image: UIImage(named: "TED")!))
        publishers.append(Publisher(title: "Re/code", url: URL(string: "http://recode.net")!, section: "My Favorites", image: UIImage(named: "Recode")!))
        publishers.append(Publisher(title: "WIRED", url: URL(string: "http://www.wired.com")!, section: "My Favorites", image: UIImage(named: "WIRED")!))
        
        return publishers
    }
}

class Politics
{
    class func publishers() -> [Publisher] {
        var publishers = [Publisher]()
        
        publishers.append(Publisher(title: "The Atlantic", url: URL(string: "http://www.theatlantic.com")!, section: "Politics", image: UIImage(named: "The Atlantic")!))
        publishers.append(Publisher(title: "The Hill", url: URL(string: "http://thehill.com")!, section: "Politics", image: UIImage(named: "The Hill")!))
        publishers.append(Publisher(title: "Daily Intelligencer", url: URL(string: "http://nymag.com/daily/intelligencer/")!, section: "Politics", image: UIImage(named: "Daily Intelligencer")!))
        publishers.append(Publisher(title: "Vanity Fair", url: URL(string: "http://recode.net")!, section: "Politics", image: UIImage(named: "Vanity Fair")!))
        publishers.append(Publisher(title: "TIME", url: URL(string: "http://time.com")!, section: "Politics", image: UIImage(named: "TIME")!))
        publishers.append(Publisher(title: "The Huffington Post", url: URL(string: "http://www.huffingtonpost.com")!, section: "Politics", image: UIImage(named: "The Huffington Post")!))
        
        return publishers
    }
}

class Travel
{
    class func publishers() -> [Publisher] {
        var publishers = [Publisher]()
        
        publishers.append(Publisher(title: "AFAR", url: URL(string: "http://www.afar.com")!, section: "Travel", image: UIImage(named: "AFAR")!))
        publishers.append(Publisher(title: "The New York Times", url: URL(string: "http://www.nytimes.com")!, section: "Travel", image: UIImage(named: "The New York Times")!))
        publishers.append(Publisher(title: "Men’s Journal", url: URL(string: "http://www.mensjournal.com")!, section: "Travel", image: UIImage(named: "Men’s Journal")!))
        publishers.append(Publisher(title: "Smithsonian", url: URL(string: "http://www.smithsonianmag.com/?no-ist")!, section: "Travel", image: UIImage(named: "Smithsonian")!))
        publishers.append(Publisher(title: "Wallpaper", url: URL(string: "http://www.wallpaper.com")!, section: "Travel", image: UIImage(named: "Wallpaper")!))
        publishers.append(Publisher(title: "Sunset", url: URL(string: "http://www.sunset.com")!, section: "Travel", image: UIImage(named: "Sunset")!))
        
        return publishers
    }
}

class Technology
{
    class func publishers() -> [Publisher] {
        var publishers = [Publisher]()
        
        publishers.append(Publisher(title: "WIRED", url: URL(string: "http://www.wired.com")!, section: "Technology", image: UIImage(named: "WIRED")!))
        publishers.append(Publisher(title: "Re/code", url: URL(string: "http://recode.net")!, section: "Technology", image: UIImage(named: "Recode")!))
        publishers.append(Publisher(title: "Quartz", url: URL(string: "http://qz.com")!, section: "Technology", image: UIImage(named: "Quartz")!))
        publishers.append(Publisher(title: "Daring Fireball", url: URL(string: "http://daringfireball.net")!, section: "Technology", image: UIImage(named: "Daring Fireball")!))
        publishers.append(Publisher(title: "MIT Technology Review", url: URL(string: "http://www.technologyreview.com")!, section: "Technology", image: UIImage(named: "MIT Technology Review")!))
        
        return publishers
    }
}

