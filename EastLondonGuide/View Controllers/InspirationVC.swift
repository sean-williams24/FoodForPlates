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
    
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var inspoTableView: UITableView!
    @IBOutlet var titleLabelHeight: NSLayoutConstraint!
    
    
    var articleImages = [UIImage]()
    
//    let articleData = Article.allArticles!
    var articleData = [ArticleType]()
    var chosenArticle: String!
        
//    let contentfulClient = Client(spaceId: "c9r6nen9oeba", accessToken: "fVnA9iHijhpv1paHJVpG3mWe1xSssghByKiwHPvvJbs")
    let contentfulClient = Client(spaceId: "c9r6nen9oeba", accessToken: "fVnA9iHijhpv1paHJVpG3mWe1xSssghByKiwHPvvJbs", contentTypeClasses: [ContentfulArticle.self, ArticleType.self])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabelHeight.constant = UIScreen.main.bounds.height
        inspoTableView.rowHeight = 300
        letterSpacing(label: titleLabel, value: 13.0)
        
        titleLabel.center = CGPoint(x: UIScreen.main.bounds.width / 8, y: 0)
        UIView.animate(withDuration: 1, delay: 1, options: .curveEaseInOut, animations: {
            self.titleLabel.center = CGPoint(x: 0, y: 0)
        }) { (success) in
            
        }
        
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
                        print(error)
                    }
                }
            }
            
            

            
            DispatchQueue.main.async {
                UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut, animations: {
                    self.titleLabelHeight.constant = 150
                    self.view.layoutIfNeeded()
                }) { (success) in
                    
                }
                
                let transition = CATransition()
                transition.type = CATransitionType.push
                transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                transition.fillMode = CAMediaTimingFillMode.forwards
                transition.duration = 0.9
                transition.subtype = CATransitionSubtype.fromTop
                self.inspoTableView.layer.add(transition, forKey: "UITableViewReloadDataAnimationKey")
                self.inspoTableView.reloadData()
            }
            
          case .error(let error):
            print("Oh no something went wrong: \(error)")
          }
        }
        
        
                
                
        //        let query = Query.where(contentTypeId: "articles")
        //        let articleQuery = QueryOn<ContentfulArticle>.where(contentTypeId: "articles")
        //
        //        contentfulClient.fetchArray(of: ContentfulArticle.self, matching: articleQuery) { (result: Result<ArrayResponse<ContentfulArticle>>) in
        //          switch result {
        //          case .success(let entriesArrayResponse):
        //            let articles = entriesArrayResponse.items
        //            // Do stuff with article entries.
        //
        //          case .error(let error):
        //            print("Oh no something went wrong: \(error)")
        //          }
        //        }
        
    }
    
    
    //MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ArticleVC
        vc.chosenArticleTitle = chosenArticle
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
        chosenArticle = articleData[indexPath.row].title
        performSegue(withIdentifier: "ArticleVC", sender: self)
    }
}



//        contentfulClient.fetch(Entry.self, id: "3CByBM1l0weMSOBF3bkbOM") { (result: Result<Entry>) in
//            switch result {
//                case .success(let entry):
//                    print(entry.id)
//                case .error(let error):
//                    print("Error \(error)!")
//            }
//        }
     
//        let query2 = QueryOn<Cat>.where(field: .color, .equals("gray"))
//
//        // Note the type in the asynchronously returned result: An `ArrayResponse` with `Cat` as the item type.
//        contentfulClient.fetchArray(of: Cat.self, matching: query2) { (result: Result<ArrayResponse<Cat>>) in
//          switch result {
//          case .success(let catsResponse):
//            guard let cat = catsResponse.items.first else { return }
//            print(cat.color!) // Prints "gray" to console.
//
//          case .error(let error):
//            print("Oh no something went wrong: \(error)")
//          }
//        }
