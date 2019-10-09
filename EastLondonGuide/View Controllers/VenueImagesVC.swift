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
    var venue = AppDelegate.currentVenue!
    var FlickrURLs: [String] = []
    
    
    fileprivate func setupFetchedResultsController() {
        
        let fetchRequest: NSFetchRequest<CDPhoto> = CDPhoto.fetchRequest()
        let predicate = NSPredicate(format: "venueName == %@", venue.name)
        fetchRequest.predicate = predicate

        let sortDescriptor = NSSortDescriptor(key: "dateAdded", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
            
//         Instantiate fetched results controller
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: dataController.viewContext , sectionNameKeyPath: nil, cacheName: nil)
        

        fetchedResultsController.delegate = self
            do {
                try fetchedResultsController.performFetch()
            } catch {
                fatalError("The fetch could not be performed: \(error.localizedDescription)")
            }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupFetchedResultsController()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        fetchedResultsController = nil
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(venue.name)
        dataController = FavouritesModel.dataController
        
        let space: CGFloat = 3.0
        let size = (view.frame.size.width - (2 * space)) / 2.0

        flowLayout.minimumLineSpacing = space
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSize(width: size, height: size)

//         Uncomment the following line to preserve selection between presentations
//         self.clearsSelectionOnViewWillAppear = false
        
        let venueName = venue.name.replacingOccurrences(of: " ", with: "-")
        
        FlickrClient.getImageForVenue(venueName: venueName, completion: handleImageDownloadResponse(success:error:))
    }

    func handleImageDownloadResponse(success: Bool, error: Error?) {
        if success {
            
            let photoResponse = FlickrClient.Auth.flickrPhotos
            
            if let photoResponse = photoResponse {
                for photo in photoResponse {
                    
                    // Convert downloaded photo data into url string
                    let URLString = "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret).jpg"
                    self.FlickrURLs.append(URLString)
                        
                    let photo = CDPhoto(context: self.dataController.viewContext)
                    photo.urlString = URLString
                    photo.venueName = venue.name
                    photo.dateAdded = Date()
                    
                    try? self.dataController.viewContext.save()
                    
                    }
                }
            }
        }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource




    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchedResultsController.sections?[section].numberOfObjects ?? 12
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCell
        let photo = fetchedResultsController.object(at: indexPath)
        
        
        if let urlString = photo.urlString {
            let url = URL(string: urlString)
            if let imageData = try? Data(contentsOf: url!) {
                let image = UIImage(data: imageData)
                
                photo.image = imageData
                try? dataController.viewContext.save()
                
                cell.imageVIew.image = image
            }
        }

        
        
        
        // Configure the cell
    
        return cell
    }

    
    
    
    
    
    
    
    // MARK: UICollectionViewDelegate

 

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

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


// MARK: Fetched results controller delegate methods

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
