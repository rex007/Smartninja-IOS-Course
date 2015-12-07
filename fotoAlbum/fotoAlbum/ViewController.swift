//
//  ViewController.swift
//  fotoAlbum
//
//  Created by Andraz Kuret on 18. 11. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit
import Photos

class ViewController: UICollectionViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    var imagePicker = UIImagePickerController()
    
    
    @IBAction func addButton(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum) {
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
                imagePicker.allowsEditing = false
        
                self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView?.delegate = self
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationVC = segue.destinationViewController as? ImageViewController{
            
            destinationVC.slika = UIImage()
        }
    }
    
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
        return CGSize(width: 100, height: 100)
    }

    
    // init Collection View
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("imageCell", forIndexPath: indexPath) as UICollectionViewCell
       
        return cell
    }


}

