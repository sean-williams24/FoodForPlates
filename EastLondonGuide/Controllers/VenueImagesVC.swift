//
//  VenueImagesVC.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 08/10/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit
import CoreData


class VenueImagesVC: UICollectionViewController {

    //MARK: - Outlets

    @IBOutlet var flowLayout: UICollectionViewFlowLayout!
    
    
    //MARK: - Properties

    var dataController: DataController!
    var fetchedResultsController: NSFetchedResultsController<CDPhoto>!
    var currentVenue = Global.currentVenue!
    var FlickrURLs: [String] = []
    private let reuseIdentifier = "PhotoCell"

    
    //MARK: - Lifecylce Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataController = Global.dataController
        
        let space: CGFloat = 3.0
        let size = (view.frame.size.width - (2 * space)) / 2.0

        flowLayout.minimumLineSpacing = space
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSize(width: size, height: size)
        
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(reloadPhotos))
        refreshButton.tintColor = .darkGray
        self.navigationItem.rightBarButtonItem = refreshButton
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupFetchedResultsController()
        
        if fetchedResultsController.fetchedObjects?.count == 0 {
            downloadPhotosFromFlickr()
         }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        fetchedResultsController = nil
    }
    
    
    //MARK: - Helper Methods
    
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
            print("The fetch could not be performed: \(error.localizedDescription)")
        }
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
                    messageLabel.numberOfLines = 0
                    messageLabel.textAlignment = .center
                    messageLabel.font = UIFont(name: "JosefinSans-Light", size: 15)
                    messageLabel.sizeToFit()
                    self.collectionView.backgroundView = messageLabel
                }
            }
        } else {
            showErrorAlert(title: "Download Error", error: "An error was encountered whilst downloading photos from Flickr, please try again.")
        }
    }
    
     fileprivate func downloadPhotosFromFlickr() {
        let venueName = currentVenue.name.replacingOccurrences(of: " ", with: "+")
        let editedVenueName = venueName.replacingOccurrences(of: "&", with: "%26")
        let finalVenueName = editedVenueName.replacingOccurrences(of: "'", with: "%27")
        FlickrClient.getImageForVenue(venueName: "\(finalVenueName)+\(currentVenue.category)", completion: handleImageDownloadResponse(success:error:))
     }
    
    
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
