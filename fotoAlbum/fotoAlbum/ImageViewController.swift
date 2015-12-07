//
//  ImageViewController.swift
//  fotoAlbum
//
//  Created by Andraz Kuret on 23. 11. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate{
    @IBOutlet weak var scrollView: UIScrollView!
    
    var slika: UIImage?
    var imageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let slika = slika{
            imageDetail.image = slika
        }
        if let slika = slika{
            imageView = UIImageView(image: slika)
            scrollView.addSubview(imageView!)
            scrollView.contentSize = slika.size
            
            scrollView.delegate = self
        }
        
    }
    @IBOutlet weak var imageDetail: UIImageView!
    

}
