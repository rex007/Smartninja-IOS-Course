//
//  ImageViewCell.swift
//  fotoAlbum
//
//  Created by Andraz Kuret on 18. 11. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit

class ImageViewCell: UIViewController {
    var slika: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViewDetail.image = slika
    }
    
    @IBOutlet weak var imageViewDetail: UIImageView!
    
    
}
