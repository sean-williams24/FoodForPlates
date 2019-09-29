//
//  VenueDetailsModel.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 26/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import Foundation

enum Description: String {
    
//Shoreditch & Hoxton
    
    //Food
    case Smokestak = "A big bricks-n-mortar smokehouse from the cult street food vendors. About time, too. Having built a cult following for its smokehouse meats, street food supremo Smokestak has done the decent thing, opening up a restaurant proper. And a proper restaurant it is: 75 seats inside, 30 more outside. A stygian, semi-industrial space with a hum of throbbing beats, it’s like eating in a medieval nightclub. \n\nKeeping with the medieval theme, it was – on the night of my visit at least – dominated by men. Not in a lads-lads-lads kind of way, calling us wenches and slapping our bottoms, but more of a bring-the-boys-for-a-night-of-bromance kind of shizzle. Tables and booths were taken up with bearded thirtysomething blokes, supping on craft beers and cocktails: all part of the man-tastic, meat-lovin’ vibe. At one stage, I saw two fellas do a tiny fist pump (too cute!). Turns out, they’d just found the beef brisket on the menu.\n\nThis is a signature dish and rightly so. It comes two ways: a single hunk of flesh, or shredded, in a bun. I prefer the latter, which I first ate at Meatopia (a three-day festival of meat), where it was one of the ‘must-try’ dishes, with a perpetual queue. It’s equally the sine qua non of eating here. Moist, smoky, sweet and salty meat (the brisket is smoked overnight, for 12-14 hours, over English oak) comes snuggled inside a pillowy, slightly sweet bun, brushed with a lick of barbecue sauce and bone marrow butter. It also has a scatter of pickled fresh red chilli, with just the right amount of both tang and heat. Price? A fiver. That’s scandalously good value.\n\nI also approved of the simplicity and restraint of the pastrami: just four slices carved from a brine-cured, hand-rubbed, house-smoked slab of brisket. Here, the smoke is more subtle, as is the sweet-salt balance; there’s a deliciously fatty rind you should definitely eat. Plus slices of classic sweet gherkins and a fresh, crunchy ‘sauerkraut’ of lightly pickled, still-crunchy cabbage and fennel, spiked with caraway seeds.\n\nGarlicky wild mushrooms are cooked in bone marrow: the sticky, unctuous pile is served over beef dripping toast. Don’t take a vegetarian, basically. Or, in fact, a pescatarian. You could technically order fish, but as the two guys next to me scoffed (when I innocently asked if they’d consider it), ‘Why would you?’ Indeed, the biggest thumbs-down of the night was an unpleasantly strong-tasting mackerel (I sent it back; it was instantly struck from the bill – a big tick for service, at least).\n\nBut a bigger issue is this: every dish comes laden with ‘smoke’, or calories, or both. Choose carelessly, and you’ll end up with an exhausting, ‘one-note’ meal. A baby gem ‘salad’ arrived under a blanket of grated cheese and sour cream. An ice cream arrived unpalatably smoky (enough already! You have your own smoker. We get it). The sticky toffee pud is insanely good, but may just push you over the edge.\n\nSo go hungry – and I mean, caveman hungry – and order plenty of the citrussy fennel and celery slaw. A palate-cleansing yin to all that meaty yang, it’ll allow you to appreciate what Smokestak does best."
    
    case Dishoom = "The first thing you notice about Dishoom is just how busy it is. No matter which location you’re visiting, you’ll almost always a find a queue of people waiting for a table and a palpable energy of excitement in the room. Because Dishoom is more than just a restaurant - it’s a phenomenon. \nThe original Dishoom opened in Covent Garden in 2010, and it immediately changed Londoners’ expectations of what an Indian restaurant could and should be. The combination of homestyle cooking, vibey retro surroundings, and excellent cocktails proved to be a successful recipe for a young population looking for a good restaurant that could serve almost any need, from breakfast to brunch to big group dinners with fancy drinks. \nSince then it’s become the go-to place for anyone who wants to eat Indian food in this city, both locals and tourists alike. There are now several Dishoom locations across London and they’re moving into other parts of England like a Led Zeppelin reunion tour. \nOf all the Dishooms, this Shoreditch branch is by far our favourite, mostly because it has the best atmosphere. There’s a nice verandah with wicker chairs that’s made for warm days and nights, and the booths overlook the busy Shoreditch High Street and the skyscrapers of the City in the distance. It’s more spacious than the original Covent Garden location, it’s cooler than the Kings Cross, and the waits tend to be a bit shorter than in Soho.\nAs for the food, sticking to the regular curry and bread combos would be a mistake. Dishoom has a brilliant list of starters and snacks that are spot-on versions of things that you might actually eat in an Indian home kitchen, and the lamb chops and chicken ruby should be on your table. Follow our Food Rundown below for the hits, but know that it’s generally hard to go wrong. You don’t earn the title of “phenomenon” with a menu that’s hit and miss."
    
    
    // Drinks
    case WellAndBucket = "When a pub closes, as this one did way back in 1989, the worst thing that can happen to it is to be turned into a Tesco Metro. Next bad, demolition, followed by change of use to chicken shop or bookies. But sometimes, a pub comes back from the dead. Not in a creepy, zombie way, but a joyous, on-the-third-day style. And here is one of these born-again boozers – following wilderness years as a Chinese restaurant and a leather wholesaler, the Well and Bucket is once again brimming over with beer.\n\nA lot of care has been spent restoring the big room to resemble a pub once again. The Victorian tiling was once noted across London for its splendour; it now looks a bit battleworn, but is brilliantly atmospheric. Close your eyes and you can imagine the place packed with porter-drinking, pipe-smoking, H-dropping Cockneys of yesteryear. \n\nPhantom East Enders might be a bit unfamiliar with the huge array of craft beer on offer, which includes about 18 on tap: on our visit there was Evil Twin’s Hipster APA (vividly described by my companion as ‘dad-strong’), to the fruity, prickly, almost Hawaiian-tropical Omnipollo Fatamorgana. There’s even a little cocktail bar downstairs: in short, definitely one for the bucket list."
    
    
    //Coffee
    case ShoreditchGrind = "This post-industrial refectory on Old Street’s ‘silicon roundabout’ opens for continental-style breakfasts, and offers an all-day roster of cakes, soups and sandwiches (try the BRAT – bacon, rocket, avocado, tomato and aïoli). The ‘grind’ of the title refers to freshly roasted and brewed coffee in all its forms, from skinny lattes during the day to espressos in the evening, and the house blend is available to take away, too. After that, groove the night away with designer beers such as Brooklyn Pale Ale, bargain-priced wines and cocktails, which are served to Blue Note-era jazz and other cool sounds. Order a frozen Hemingway daiquiri or a rhubarb and ginger negroni, then book into the venue’s own recording studio if you fancy a step up from pub karaoke but can’t brave going on The Voice."
    
    
    //Shopping
    case Goodhood = "After seven years on Hoxton’s Coronet Road, The Goodhood Store upped sticks to a super-size, 3,000 square foot site just a few streets away on Curtain Road. Spread over two floors, the interior boasts wooden display structures, a gnarly log cabin, little exhibition spaces and a basement café in partnership with Brett Redman (of Elliot’s, Borough Market, and Victoria Park’s Pavilion Café).\n\nThe space houses an expanded Goodhood edit of womenswear, menswear, accessories, kids’ stuff, beauty and grooming products, plus homeware and fancy camping gear.\n\nThe upscale, leftfield stock is hand picked to appeal to Goodhood’s very East End customer, but is shot through with a real sense of humour and a few easy, low-cost buys: branded tees, jackets and hats plus cheap as chips mugs, badges and stickers. "
    
    
    //Markets
    case BricklaneMarket
    

    
//Bethnal Green
    
    //Food
    case TheMarksman = "A beautiful venue with terrible foodA beautiful venue with terrible foodA beautiful venue with terrible foodA beautiful venue with terrible foodA beautiful venue with terrible foodA beautiful venue with terrible foodA beautiful venue with terrible foodA beautiful venue with terrible foodA beautiful venue with terrible foodA beautiful venue with terrible foodA beautiful venue with terrible foodA beautiful venue with terrible foodA beautiful venue with terrible foodA beautiful venue with terrible foodA beautiful venue with terrible foodA beautiful venue with terrible foodA beautiful venue with terrible foodA beautiful venue with terrible foodA beautiful venue with terrible food"
    case Bistrotheque = "yummmmmmmy"
    
    
    // Drinks
    case SatansWhiskers
    case TheRoyalOak
    
    
    //Coffee
    
    
    //Shopping
    case ConservatoryArchives
    
    
    //Markets
    
    
//London Fields & Hackney Central
    
    //Food
    case ElGansoCafe
    
    
    // Drinks
    case NTs
    
    
    //Coffee
    case ClimpsonAndSons
    
    
    //Shopping
    case StrangerThanParadise
    
    
    //Markets
    case BroadwayMarket
    

//Hackney Wick
    
    //Food
    case CRATEBrewery
    
    
    // Drinks
    case BeerMerchantsTap
    case HowlingHops
    
    
    //Coffee
    case HWK
    case StourSpace
    
    //Shopping
    
    
    //Markets
    
    
//Bow & Mile End
    
    //Food
    case RustyBike
    case LordMorpeth
    
    
    // Drinks
    case EastLondonLiquorCompany
    case TheMorganArms
    
    
    //Coffee
    case MaeAndHarvey
    
    //Shopping
    
    
    //Markets
    
}





