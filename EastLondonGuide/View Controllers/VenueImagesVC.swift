//
//  VenueImagesVC.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 08/10/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit
import CoreData

private let reuseIdentifier = "PhotoCell"


class VenueImagesVC: UICollectionViewController {

    @IBOutlet var flowLayout: UICollectionViewFlowLayout!
    
    var dataController: DataController!
    var fetchedResultsController: NSFetchedResultsController<CDPhoto>!
    var currentVenue = AppDelegate.currentVenue!
    var FlickrURLs: [String] = []
    
    
    
    //MARK: - Lifecylce Methods
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataController = FlickrClient.Auth.dataController
        
        let space: CGFloat = 3.0
        let size = (view.frame.size.width - (2 * space)) / 2.0

        flowLayout.minimumLineSpacing = space
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSize(width: size, height: size)
        
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(reloadPhotos))
        refreshButton.tintColor = .darkGray
        self.navigationItem.rightBarButtonItem = refreshButton

//         Uncomment the following line to preserve selection between presentations
//         self.clearsSelectionOnViewWillAppear = false
    }
 
    @objc func reloadPhotos() {
        let coreDataPhotos = fetchedResultsController.fetchedObjects
        
        if let coreDataPhotos = coreDataPhotos {
            for photo in coreDataPhotos {
                dataController.viewContext.delete(photo)
                try? dataController.viewContext.save()
            }
        }
        downloadPhotosFromFlickr()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupFetchedResultsController()
        
        if fetchedResultsController.fetchedObjects?.count == 0 {
            print("No photos on fetched results controller - download new set")
            downloadPhotosFromFlickr()
         }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        fetchedResultsController = nil
    }
    
    
    //MARK: - Private Methods
    
    fileprivate func setupFetchedResultsController() {
        
        let fetchRequest: NSFetchRequest<CDPhoto> = CDPhoto.fetchRequest()
        let predicate = NSPredicate(format: "venueName == %@", currentVenue.name)
        fetchRequest.predicate = predicate

        let sortDescriptor = NSSortDescriptor(key: "dateAdded", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
            
        //Instantiate fetched results controller
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: dataController.viewContext , sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultsController.delegate = self
            do {
                try fetchedResultsController.performFetch()
            } catch {
                fatalError("The fetch could not be performed: \(error.localizedDescription)")
            }
    }

    func handleImageDownloadResponse(success: Bool, error: Error?) {
        if success {
            
            DispatchQueue.main.async {
                self.collectionView.backgroundView = .none
            }
            
            let photoResponse = FlickrClient.Auth.flickrPhotos
            
            if let photoResponse = photoResponse {
                for photo in photoResponse {
                    
                    // Convert downloaded photo data into url string
                    let URLString = "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret).jpg"
                    self.FlickrURLs.append(URLString)
                        
                    let photo = CDPhoto(context: self.dataController.viewContext)
                    photo.urlString = URLString
                    photo.venueName = currentVenue.name
                    photo.dateAdded = Date()
                    try? self.dataController.viewContext.save()
                    
                    }
                }
            
            if self.FlickrURLs.count == 0 {
                // If there are no photos at location then display message on collection view background
                DispatchQueue.main.async {
                    let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.collectionView.frame.width, height: self.collectionView.frame.height))
                    messageLabel.text = "SORRY, NO ADDITIONAL PHOTOS \nFOUND FOR THIS LOCATION"
                    messageLabel.textColor = .black
                    messageLabel.numberOfLines = 0;
                    messageLabel.textAlignment = .center;
                    messageLabel.font = UIFont(name: "JosefinSans-Light", size: 15)
                    messageLabel.sizeToFit()
                    self.collectionView.backgroundView = messageLabel;
                }

            }
            
            
        } else {
            print("Error downloading photos from flickr")
            showErrorAlert(title: "Download Error", error: "An error was encountered whilst downloading photos from Flickr, please try again.")
        }
    }
    
    
     fileprivate func downloadPhotosFromFlickr() {
        let vn1 = currentVenue.name.replacingOccurrences(of: " ", with: "+")
        let vn2 = vn1.replacingOccurrences(of: "&", with: "%26")
        let finalVenueName = vn2.replacingOccurrences(of: "'", with: "%27")
        FlickrClient.getImageForVenue(venueName: "\(finalVenueName)+\(currentVenue.category)", completion: handleImageDownloadResponse(success:error:))
     }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - UICollectionViewDataSource & Delegates

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchedResultsController.sections?[section].numberOfObjects ?? 12
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCell
        let photo = fetchedResultsController.object(at: indexPath)
                
        if photo.image == nil {
            cell.activityIndicator.startAnimating()
            
            DispatchQueue.global(qos: .background).async {
                if let urlString = photo.urlString {
                    let url = URL(string: urlString)
                    if let imageData = try? Data(contentsOf: url!) {
                        let image = UIImage(data: imageData)
                        
                        DispatchQueue.main.async {
                            photo.image = imageData
                            cell.activityIndicator.stopAnimating()
                            try? self.dataController.viewContext.save()
                            cell.imageVIew.image = image
                        }

                    }
                }
            }
        }  else {
                   
            // If image already exist for the photo, show previously downloaded images from FRC
            if let photo = photo.image {
               let image = UIImage(data: photo)
               DispatchQueue.main.async {
                   cell.imageVIew.image = image
               }
           }
       }
        return cell
    }

    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let photoToDelete = fetchedResultsController.object(at: indexPath)
//        dataController.viewContext.delete(photoToDelete)
//        try? dataController.viewContext.save()
    }
    
    
    
 

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}


// MARK: - Fetched results controller delegate method

extension VenueImagesVC: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            collectionView.insertItems(at: [newIndexPath!])
        case .delete:
            collectionView.deleteItems(at: [indexPath!])
        case .update:
            collectionView.reloadItems(at: [newIndexPath!])
        default:
            break
        }
    }
}
