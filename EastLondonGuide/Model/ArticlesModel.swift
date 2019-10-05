//
//  ArticlesModel.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 04/10/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import Foundation


struct Article {
    let title: String
    let venue: String
    let info: String

    init(dictionary: [String : String]) {
        self.title = dictionary["Title"]!
        self.venue = dictionary["Venue"]!
        self.info = dictionary["Info"]!
    }
    
    static let articleTitles = ["THE BEST \nSUNDAY \nROASTS IN \nEAST LONDON",
                    "OUR \nFAVOURITE \nEAST LONDON \nBREAKFASTS",
                    "EAST LONDON \nBREWERIES \nAND \nTAPROOMS",
                    "BEST PIZZA IN \nEAST LONDON"]
}

//MARK: - All Articles

extension Article {

    
    
    static var allArticles: [Article]! {

        var articlesArray = [Article]()
        
        for article in articleData() {
            articlesArray.append(Article(dictionary: article))
        }
        return articlesArray
    }
    

    
    static func articleData() -> [[String : String]] {

        return [
            ["Title" : "The Best Sunday Roasts In East London", "Venue" : "SMOKESTAK", "Info" : BestRoastsInEastLondon.SmokestakRoast.rawValue],
            ["Title" : "The Best Sunday Roasts In East London", "Venue" : "Goodhood", "Info" : BestRoastsInEastLondon.GoodhoodRoast.rawValue],
            ["Title" : "The Best Sunday Roasts In East London", "Venue" : "NT's", "Info" : BestRoastsInEastLondon.NTs.rawValue],
            
            ["Title" : "Our Favourite East London Breakfasts", "Venue" : "SMOKESTAK", "Info" : OurFavouriteBreakfastsInEastLondon.SmokestakRoast.rawValue],
            ["Title" : "Our Favourite East London Breakfasts", "Venue" : "Goodhood", "Info" : OurFavouriteBreakfastsInEastLondon.GoodhoodRoast.rawValue],
            ["Title" : "Our Favourite East London Breakfasts", "Venue" : "NT's", "Info" : OurFavouriteBreakfastsInEastLondon.NTs.rawValue]
        ]
    }

}




// DUMMY DATA

enum BestRoastsInEastLondon: String {
    case SmokestakRoast = "Erm, I'm from up north. Though there is a bit more of a story. Back when I was younger, I'd go out for on a Friday night with my friends and the next thing I know, it'd be Sunday afternoon and all I would have consumed was alcohol and small bags of salt. There would be a realisation amongst myself and whoever still had more sanity than sobriety, that a roast dinner would be required. You know, to replenish all the lost vitamins from the weekend's activities. I lived in Reading back then, and sometimes we'd get a good roast dinner, other times a fairly horrific plate of uncooked anti-food. So I took it upon myself to start a blog. Given my, erm, active social life back then, I managed one review a year. Until I got old and started bashing them out regularly."
    case GoodhoodRoast = "The George in The Strand. Or possibly Fleet Street. It isn't a place that is talked about, it isn't a trendy place. They barely use social media to promote themselves. It didn't look especially great inside. I expected a very average roast and I still keep questioning whether it really was that good, but everything really was very good. There were some real 'wow' moments, such as the parsnip mash and the amazing cauliflower and leek cheese. The roast potatoes were actually crispy, the chicken was the plumpest and juiciest chicken that I've reviewed, and it was a fairly thick gravy. I have been told that the pork belly there isn't quite up to scratch — my tip is the chicken roast. \nBlacklock is supposed to be amazing, but I'm saving that for a special occasion. Like maybe after losing my virginity. Though you have to book weeks in advance... that'll be some holding out if I do find someone desperate enough."
    case NTs = "When are you going to stop peddling your left-wing fake-news media? It isn't £20. Well, not where I eat anyway, and I think you'd agree that I eat in a wide range of venues. At the time of writing, my average roast dinner price is just short of £16. \nI feel that you are right on picking up on a significant price increase recently. Once I've been doing this for a year or so more (which will probably happen unless I get shot or girlfriended) then I should have some good statistics in terms of average prices. \nAs to why the price has risen, I suspect that this is down to a number of business costs having risen significantly. Firstly many businesses are facing increasing rents and business rates, particularly in central London. Also staffing costs have risen due to the increased minimum wage in London (bloody Tories and their higher minimum wage). Unemployment is very low so employees are harder to find — and retain, again putting upwards pressure on staffing costs. Finally, there was a totally coincidental fall in sterling on 24 June 2016 from some unknown event that has caused much higher import costs — though on the bright side, some of Nigel Farage's hedge fund buddies made a fair few quid (allegedly)."
}

enum OurFavouriteBreakfastsInEastLondon: String {
    case SmokestakRoast = "Great Breakfasts Great BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat Breakfasts"
    case GoodhoodRoast = "THE Pancakes oh jesus Great BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat Breakfasts"
    case NTs = "How about bacon and eggsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat BreakfastsGreat Breakfasts SEAN?"
}
