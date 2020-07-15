//
//  InspirationVC.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 29/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import Contentful
import UIKit

class InspirationVC: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var inspoTableView: UITableView!
    @IBOutlet var titleHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabelTopConstraint: NSLayoutConstraint!
    
    
    // MARK: - Properties

    var articleImages = [UIImage]() {
        didSet {
            if articleData.count == articleImages.count {
                loadTableAndAnimate()
            }
        }
    }
    var articleData = [ArticleType]()
    var contentfulArticles = [ContentfulArticle]()
    var chosenArticle = ""
    let contentfulClient = Client(spaceId: Keys.spaceID, accessToken: Keys.contentfulAccessToken, contentTypeClasses: [ContentfulArticle.self, ArticleType.self])
    let titleMinHeight: CGFloat = 0.0
    var titleViewMaxHeight: CGFloat!
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        titleHeightConstraint.constant = view.frame.size.height
        inspoTableView.rowHeight = 300
        letterSpacing(label: titleLabel, value: 13.0)
        
        titleViewMaxHeight = view.frame.height / 3
        
        
        // Fetch article data from Contentful API and get images for tableView
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
                
                self.loadTableAndAnimate()
                
            case .error:
                DispatchQueue.main.async {
                    self.showErrorAlert(title: "No inspiration at this time!", error: "Something went wrong whilst trying to download inspiration articles, please try reloading the application.")
                }
            }
        }
        
        // Fetch articles from Contentful API
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
    
    
    // MARK: - Helper Methods
    
    fileprivate func loadTableAndAnimate() {
        DispatchQueue.main.async {
            self.animateTableviewReload(tableView: self.inspoTableView, transitionType: .fromBottom)
            
            UIView.animate(withDuration: 1.7, delay: 0, options: .curveEaseInOut, animations: {
                self.titleHeightConstraint.constant = self.titleViewMaxHeight
                self.titleLabelTopConstraint.constant = 15
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ArticleVC
        vc.chosenArticleTitle = chosenArticle
        vc.contentfulArticles = contentfulArticles
    }
}


// MARK: - Table View Delegates

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


// MARK: - Scroll View Delegates

extension InspirationVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        let newTitleHeight = titleHeightConstraint.constant - contentOffsetY
        
        if newTitleHeight < titleMinHeight {
            titleHeightConstraint.constant = titleMinHeight
        } else if newTitleHeight > titleViewMaxHeight {
            titleHeightConstraint.constant = titleViewMaxHeight
        } else {
            titleHeightConstraint.constant = titleHeightConstraint.constant - contentOffsetY
            scrollView.contentOffset.y = 0.0
        }
    }
}
