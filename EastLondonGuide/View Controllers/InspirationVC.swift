//
//  InspirationVC.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 29/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import Contentful
import UIKit
import UIImageViewAlignedSwift

class InspirationVC: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var inspoTableView: UITableView!
    @IBOutlet var titleHeightConstraint: NSLayoutConstraint!
    
    var articleImages = [UIImage]()
    var articleData = [ArticleType]()
    var contentfulArticles = [ContentfulArticle]()
    var chosenArticle = ""

    let contentfulClient = Client(spaceId: "c9r6nen9oeba", accessToken: "fVnA9iHijhpv1paHJVpG3mWe1xSssghByKiwHPvvJbs", contentTypeClasses: [ContentfulArticle.self, ArticleType.self])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleHeightConstraint.constant = view.frame.size.height
        inspoTableView.rowHeight = 300
        letterSpacing(label: titleLabel, value: 13.0)
        
        let articleTypeQuery = QueryOn<ArticleType>.where(contentTypeId: "articleType")
        
        contentfulClient.fetchArray(of: ArticleType.self, matching: articleTypeQuery) { (result: Result<HomogeneousArrayResponse<ArticleType>>) in
            switch result {
            case .success(let entriesArrayResponse):
                self.articleData = entriesArrayResponse.items
                
                // Assign article images to local array
                for articleType in self.articleData {
                    if let url = articleType.image?.url {
                        do {
                            let imageData = try Data(contentsOf: url)
                            if let image = UIImage(data: imageData) {
                                self.articleImages.append(image)
                            }
                        } catch {
                            DispatchQueue.main.async {
                            self.showErrorAlert(title: "Error downloading images.", error: "Something went wrong whilst trying to download images, please try reloading the application.")
                            }
                        }
                    }
                }
                
                DispatchQueue.main.async {
                    UIView.animate(withDuration: 3, delay: 2, options: .curveEaseInOut, animations: {
                        self.titleHeightConstraint.constant = 150
                        self.view.layoutIfNeeded()
                    })
                    self.animateTableviewReload(tableView: self.inspoTableView, transitionType: .fromTop)
                }
                
            case .error:
                DispatchQueue.main.async {
                    self.showErrorAlert(title: "No inspiration at this time!", error: "Something went wrong whilst trying to download inspiration articles, please try reloading the application.")
                }
            }
        }
        
        let articleQuery = QueryOn<ContentfulArticle>.where(contentTypeId: "articles")
        
        contentfulClient.fetchArray(of: ContentfulArticle.self, matching: articleQuery) { (result: Result<HomogeneousArrayResponse<ContentfulArticle>>) in
            switch result {
            case .success(let entriesArrayResponse):
                self.contentfulArticles = entriesArrayResponse.items
            case .error:
                DispatchQueue.main.async {
                self.showErrorAlert(title: "No inspiration at this time!", error: "Something went wrong whilst trying to download inspiration articles, please try reloading the application.")
                    }
            }
        }
    }
    
    
    //MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ArticleVC
        vc.chosenArticleTitle = chosenArticle
        vc.contentfulArticles = contentfulArticles
    }
    
    // MARK: - Table View Delegates
    
}

extension InspirationVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InspirationCell", for: indexPath) as! InspirationCell
        
        cell.customImageView.image = articleImages[indexPath.row]
        cell.customTextLabel.text = articleData[indexPath.row].title?.uppercased()
        letterSpacing(label: cell.customTextLabel, value: 8.0)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let articleTitle = articleData[indexPath.row].title {
            chosenArticle = articleTitle
        }
        performSegue(withIdentifier: "ArticleVC", sender: self)
    }
}
