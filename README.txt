# Food For Plates

This app is a guide for the public on places to eat, drink and shop in East London. The idea was to focus on a preferred selection of venues that, rather than including everywhere like most other guides. This app was designed with a clean and easy to navigate structure and user-experience in mind, again differentiating from other similar apps which are overloaded with information, controls and features which bombard the user and unnecessarily over-complicate things. This app was built for my final project in the Udacity iOS Nanodegree with the intention of releasing it to the app store eventually once I have all the required content.

## Pre-requisites

- Uber Rides iOS SDK (included in project files)

## Getting Started

Start by launching the EastLondonGuide.xcworkspace file. The app's structure is based on 4 tabs, launching on the Inspiration page, which consists of articles to inspire the user on places to visit if they don't have anything in mind. You can view the articles on the next page and then tap on the venue info button at the bottom of each article for additional information on each venue.

The guides tab breaks down the the venues first of all by areas in East London, then categories (food, drinks, coffee, shopping and markets) so the user can narrow down venues for the requirements. 

The browse tab lists all venues, tapping on a venue (cell) will take you through to the venue details page. The segmented control allows you to filter venues by their category and the arrow button on the right of the navigation controller enables additional filtering by location. To the left of the arrow is a heart button which displays the user's favourite venues. The refresh button resets the table view to all venues.

The map tab will initially zoom to view East London displaying annotations for every venue. The map can be filtered in the same way as the browse tab by category and by choosing an area via the area menu; the map will focus on that map region. An annotation can be tapped and by then tapping the callout accessory, you will again be taken to the venue details page.

The venue details page consists of a description about the venue, its address (which can be tapped to take the user to the Apple Maps app), opening times, phone number (which will allow the user to tap to call or text), an email address if one exists (tapping opens email client) and an Uber button which will take the user to the native Uber app displaying the journey from their current location and prices. The navigation bar contains 4 buttons if the venue has a menu available or 3 if not. Tapping the right-most button will add or remove the venue from favourites (which are persisted in user defaults); to the left is the images button which will search for and download a set of photos for the venue if there are any (persisting them in core data), tapping the refresh button will perform a new search; tapping the next button to the left will display the venue on the map; the left-most button will display the venue's menu on it's website in a webview. If navigation is required a navigation bar is displayed allowing the user to move back and forward between webpages. 

## License

Food For Plates is Copyright © 2019 Sean Williams. It is free software, and may be redistributed under the terms specified in the LICENSE file. 

