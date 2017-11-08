//
//  DataManager.swift
//  
//
//  Created by Aaron Eisses on 11/8/17.
//
//

import Foundation
import Alamofire

class RESTManager: NSObject {


    func loadWeatherData() {
        Alamofire.request("https://data.novascotia.ca/resource/vvb6-f978.json").responseJSON { response in

            debugPrint(response)

            if let json = response.result.value {
                print("JSON: \(json)")
            }
        }
    }

}
