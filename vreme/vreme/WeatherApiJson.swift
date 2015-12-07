//
//  WeatherApiJson.swift
//  vreme
//
//  Created by Andraz Kuret on 26. 11. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit

class WeatherApiJson: NSObject {

    var lat: String
    var long: String
    
    let apiKey = "c3a0ad1a3491fe0fb803fc709ef3d6cb"
    
    init(lat: String, long: String) {
        self.lat = lat
        self.long = long
    }    
    
    func loadData(lat: String, long: String) {
        var cn: [String: AnyObject]
        let latitude = Int(lat)!
        let weatherURL = "http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&appid=\(apiKey)"
        let request = NSMutableURLRequest()
        request.URL = NSURL(string: weatherURL)
        request.HTTPMethod = "GET"
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request){
            (data,response,error) -> Void in
            
            if let data = data{
                do{
                    let JSON = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0)) as! [String: AnyObject]
                    
                    let currentLocation = JSON["sys"]!
                    let cityName = currentLocation as! [String: AnyObject]
                    
                   // cn = cityName["name"]
                    
                }
                catch{
                
                }
            }
        }
        task.resume()
    }
    


    
}
