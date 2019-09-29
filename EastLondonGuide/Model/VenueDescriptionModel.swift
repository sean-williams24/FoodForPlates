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
    case BricklaneMarket = "Hunt for a bargain within the bric-a-brac at this bustling East End market, bursting full of antiques, stunning fabrics and kitsch collectables. Once you’ve found your treasure, refuel at one of the numerous food stalls in the area or head into a Brick Lane restaurant.\n\nAlongside fruits and vegetable stalls, you’ll find plenty of street food vendors lining Brick Lane on Sundays. Try The Rib Man for some of the best ribs in London.\n\nFor street food throughout the week, head to Ely’s Yard at the Old Truman Brewery where you can feast on buttermilk chicken strips from Mother Clucker.\n\nThe area is famed for its brilliant curry houses and Indian restaurants, such as Aladin Brick Lane, which serves excellent Balti and tandoori dishes. There are also several Jewish bagel shops including the popular Brick Lane Beigel Bake, which is open 24/7."
    

    
//Bethnal Green
    
    //Food
    case TheMarksman = "If there’s a better lunch to be had in Britain right now than the beef and barley buns with horseradish, the kid goat curry with the fried potatoes and the brown butter and honey tart served at the Marksman pub on the Hackney Road, I want to know about it. I want it brought to me, or, if necessary, I want me brought to it. I won’t hold my breath, because I really doubt there is one. The joy is not simply in the cooking, though it does possess the sort of vigour and attitude that makes properly greedy people swoon. It’s in the simplicity of the offering, the straightforwardness, the resolute lack of tiresome, self-regarding flimflam and hauteur. Their approach comes down to this: we cooked some stuff; we think you might like it. \n\nOh, but I do.\n\nThis doesn’t come as a huge surprise. I visited the pub out of profound irritation with last week’s dreary misunderstanding of Vietnamese cooking at Leicester House. The Marksman is where Tom Harris, the previous chef in that space – both when it was the St John Hotel and 1 Leicester Street – went next, to team up with Jon Rotheram, formerly of Jamie Oliver’s 15. I needed my faith restored and I believed a short trip to London E2 would do so."
    case Bistrotheque = "Head to the first floor of this East End trendsetter for the light, white restaurant and big oval bar (the Manchichi, where walk-ins can eat and good cocktails are mixed). Although the hipster count is high, the welcome and service are friendly, and there’s a level of professionalism here that’s missing from many local restaurants.\n\nThe kitchen is capable of highs – duck confit with puy lentils and mushrooms was a stellar version – but a steady B-plus is more usual. Pricing is variable too – the generous prix fixe costs £17.50 for three good-sized courses, while a tiny portion of cured salmon salad with beetroot and horseradish remoulade was £14 (we can’t imagine what the £8 size looks like).\n\nThe menu (and short wine list) is more French-leaning than truly Gallic: a cheeseburger with pancetta and caramelised onions sits alongside onglet with chips and béarnaise sauce, and treacle tart with clotted cream next to crème brûlée.\n\nA popular weekend brunch adds the likes of (US-style) pancakes with bacon and maple syrup to the mix. Less welcome at brunch are the 90-minute dining slots, and the tables set uncomfortably close to the piano. Overall, it's a reliable but fun restaurant that hasn’t become complacent."
    
    
    // Drinks
    case SatansWhiskers = "The less intrepid Londoner may be put off by the street view of Satan’s Whiskers: it looks every bit a down-and-out dive bar. Inside though, it breaks the east London bar mould, with hip hop on the stereo, a smartly modish setting, vintage French posters on the wall and some of the best cocktails to be found in Bethnal Green’s burgeoning booze scene. But luckily, it’s more of a laid-back neighbourhood hangout than an out-of-place, high-end cocktail bar. Think not so much stuffy, more stuffed animals – there’s plenty of taxidermy pals lounging around, but it never borders on the tacky. \n\nThe drinks list changes daily, which attracts a keen crowd of booze enthusiasts as well as Tinder’s finest out to impress. On our latest trip we sat at the bar, a prime position to catch the attention of staff in shirts and braces, who gladly ran us through their favourites on the menu. You’re in for a hell of a night at Satan’s Whiskers."
    case TheRoyalOak = "To misquote the late Brian Moore, this is a pub of two halves. Upstairs is a cultured, calm and almost sedate dining room, within which nouveau Eastenders tuck into expensive but impressive Modern European cooking. \n\nDownstairs in the good-looking pub, built around a handsome central bar, the scene is more boisterous, as easily distracted staff deliver pricey wines and ales to an assortment of vintage-clad creatives who keep the hum of conversation going throughout the night. \n\nIt’s at its best earlier in the week: Fridays and Saturdays can be uncomfortably frantic, and the flower market on the doorstep means Sundays can be a crush.\n\nKeen-eyed sitcom enthusiasts may recognise the Royal Oak from its starring role in Goodnight Sweetheart, although the current owners seem strangely reluctant to advertise the source of the pub’s 15 minutes."
    
    
    //Coffee
    
    
    //Shopping
    case ConservatoryArchives = "A PLACE OF TRUE INSPIRATION \n\nA shop by trade - the name Conservatory Archives reveals the true identity of this incredible, varied and unique collection of plants archived in their shop. They have collaborated with big retail brands including Cos and Marks & Spencer, which has certainly proven their talent, however it was London based botanical illustrator Katie Scott, featured in our most recent Expose series, who counted Conservatory Archives as one of her favourite places of inspiration for her work, and a plant destination that everyone needs to know about. "
    
    
    //Markets
    
    
//London Fields & Hackney Central
    
    //Food
    case ElGansoCafe = "Given the rustic restaurant aesthetic, with exposed bricks and Moorish tiling, we’re expecting some equally classic tapas. And the menu would have you believing this too. Filled with the likes of albondigas (meatballs), tortilla and croquetas, it’s hardly a ground-breaking read. But dishes are a sweet surprise when they arrive, served in a way that defies expectation. Silky ham croquetas are lined on a spread of thick and punchy romesco purée, with pretty pea shoots adding textural crunch, while pork belly with delightfully crisp crackling is served alongside a curve of vibrant green apple jelly. These plates are really beautiful, and even the patatas bravas at our neighbouring table come pimped up in a mini frying basket. \n\nWe’re in love with arroz negro (paella blackened with squid ink), with tender morsels of squid buried deep in a pile of rice and enlivened by garlic-heavy aioli and a squeeze of lemon. Seafood, it would seem, is treated well across the board – our dish of gambas al ajillo held juicy prawns in a sea of even more garlic, with the aftershock of smoky pimentón lingering.\n\nAs it gets busy, we find ourselves forgotten in a corner and our dessert order gets confused in the hullabaloo. But when you leave your neighbourhood tapas joint basking in the heat of the Med (not to mention feeling as fat as that eponymous goose), it’s hard to hold any grudges for long."
    
    
    // Drinks
    case NTs = "Rejoice, Night Tales fans! Your favourite pop-up has popped up permanently in an indoor venue just in time for the crappiest of the crap weather. The newest addition to Netil House, this café-by-day/cocktail-bar-by-night has a similar vibe to its seasonal counterpart: good food, DJs and (obvs) innovative cocktails.\n\nUp just enough stairs to remind you that you haven’t been to gym lately, the space channels warehouse chic, softened with leather chairs, communal tables and potted plants, all bathed in a pink neon hue that renders Instagram filters redundant. It’s like hanging out at the New York-style apartment of a friend who’s cooler and more successful than you. \n\nNT’s cocktail list includes interesting twists while managing to remain unfussy: no bells and whistles for the sake of it. Bar staff get through a small forest of straws with their perfectionist tasting – bad for the environment but good for your tastebuds. The Con Man – fusing rum, bitters, ginger and whisky – tastes seductively medicinal but trust us: it’ll do you more harm than good in the long run. Coriander Southside had an interesting herbal bite, but not enough to make us feel like we’d stumbled into a curry house. Cocktails range from £8 to £9.50. \n\nFood, like the drinks, is kept simple: glorious toasties from Morty & Bobs. We pimped ours with mushrooms and truffle oil. "
    
    
    //Coffee
    case ClimpsonAndSons = "Founded way back in 2005 Climpson & Sons have spearheaded the evolving London speciality coffee scene. Their exceptional range of espressos, blends and single origin beans reflect their unwavering commitment to exploring the possibilities of flavour. Considered one of the inaugural venues for London’s Coffee Revolution Climpson & Son’s beloved flagship café is constantly stocked with their popular roasts and situated in the heart of Hackney’s Broadway Market where the company also run a stall on market day.\n\nNobody could deny that these coffee pioneers take their work seriously; with coffee brewing methods continually evolving Climpson & Sons constantly seek the best flavour profiles and extraction techniques to understand how their roasts react in coffee-making equipment. They have a strong commitment to sustainability and ethical sourcing alongside selecting coffee for flavour and quality – you can therefore be assured the coffees Climpson roast and sell have not only have character but also a transparent story! They reward this quality by paying a higher price to the producer in order to facilitate strengthening relationships for the future."
    
    
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





