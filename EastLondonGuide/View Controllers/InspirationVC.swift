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
    
    
    let articleImages = ["Roast", "Breakfast", "Brewery", "Pizza"]
    
//    let articleData = Article.allArticles!
    var articleData = [ArticleType]()
    var chosenArticle: String!
        
//    let contentfulClient = Client(spaceId: "c9r6nen9oeba", accessToken: "fVnA9iHijhpv1paHJVpG3mWe1xSssghByKiwHPvvJbs")
    let contentfulClient = Client(spaceId: "c9r6nen9oeba", accessToken: "fVnA9iHijhpv1paHJVpG3mWe1xSssghByKiwHPvvJbs", contentTypeClasses: [ContentfulArticle.self, ArticleType.self])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inspoTableView.rowHeight = 300
        letterSpacing(label: titleLabel, value: 13.0)
        
        
        
//        let query = Query.where(contentTypeId: "articles")
        let articleQuery = QueryOn<ContentfulArticle>.where(contentTypeId: "articles")

        contentfulClient.fetchArray(of: ContentfulArticle.self, matching: articleQuery) { (result: Result<ArrayResponse<ContentfulArticle>>) in
          switch result {
          case .success(let entriesArrayResponse):
            let articles = entriesArrayResponse.items
            // Do stuff with article entries.
//            print(articles.first?.info)

          case .error(let error):
            print("Oh no something went wrong: \(error)")
          }
        }
        
        
        let articleTypeQuery = QueryOn<ArticleType>.where(contentTypeId: "articleType")
        
        contentfulClient.fetchArray(of: ArticleType.self, matching: articleTypeQuery) { (result: Result<ArrayResponse<ArticleType>>) in
          switch result {
          case .success(let entriesArrayResponse):
            let articleType = entriesArrayResponse.items
            // Do stuff with article entries.
            print(articleType.count)
            
            self.articleData = articleType
            
            if let firstArticle = articleType.first {
//                print(firstArticle.title)
                if let articles = firstArticle.articleData {
                    print(articles.count)
                }
            }
            
            DispatchQueue.main.async {
                self.inspoTableView.reloadData()
            }

//            print(articles?.count)
            
          case .error(let error):
            print("Oh no something went wrong: \(error)")
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
        
//        cell.customImageView.image = UIImage(named: articleImages[indexPath.row])
//        cell.customTextLabel.text = Article.articleTitles[indexPath.row]
        
        let article = articleData[indexPath.row]
        
        if let url = article.image?.url {
            do {
                let imageData = try Data(contentsOf: url)
                let image = UIImage(data: imageData)
                cell.customImageView.image = image

            } catch {
                print(error)
            }

        }
        
        cell.customTextLabel.text = article.title
        print(article.title as Any)
        
        letterSpacing(label: cell.customTextLabel, value: 8.0)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenArticle = Article.articleTitles[indexPath.row]
        performSegue(withIdentifier: "ArticleVC", sender: self)
    }
}
