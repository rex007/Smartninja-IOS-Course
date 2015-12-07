//
//  WeatherIconView.swift
//  vreme
//
//  Created by Andraz Kuret on 26. 11. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit

enum WeatherIcon: String {
    
    case Cloudy = "cloudy"
    case Sunny = "sun"
    case Fog = "fog"
    case Rain = "rain"
    case FewClouds = "fewCloud"
    case Snow = "snow"
    case Storm = "storm"
    case SunRain = "sun-rain"
    case SunCloud = "sun-cloud"
}

class WeatherIconView: UIView {
    
    var iconType: WeatherIcon = .Sunny {
        didSet{
            imageView.image = UIImage(named: iconType.rawValue)
        }
    }
    
    private var imageView: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.image = UIImage(named: WeatherIcon.Sunny.rawValue)
        
        addSubview(imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        imageView.image = UIImage(named: WeatherIcon.Sunny.rawValue)
        
        addSubview(imageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = self.bounds
    }
    
    

}