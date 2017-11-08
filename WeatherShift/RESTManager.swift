//
//  DataManager.swift
//  
//
//  Created by Aaron Eisses on 11/8/17.
//
//

import Foundation
import Alamofire
import CoreData

class RESTManager: NSObject {


    func loadWeatherData() {
        Alamofire.request("https://data.novascotia.ca/resource/vvb6-f978.json").responseJSON { response in

            debugPrint(response)

            if let json = response.result.value {
                print(json)
                self.saveWeatherData(json: json)
            }
        }
    }

    func saveWeatherData(json: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "WeatherData", in: context);

        if let array = json as? [Any] {
            for object in array {
                if let dictonary = object as? [String: Any] {
                    let data = NSManagedObject(entity: entity!, insertInto: context)
                    if let parameter = dictonary["parameter"] as? String {
                        data.setValue(parameter, forKey: "parameter")
                    }
                    if let range = dictonary["range"] as? String {
                        data.setValue(range, forKey: "range")
                    }
                    if let region = dictonary["region"] as? String {
                        data.setValue(region, forKey: "region")
                    }
                    if let unit = dictonary["unit"] as? String {
                        data.setValue(unit, forKey: "unit")
                    }
                    if let value = dictonary["value"] as? Decimal {
                        data.setValue(value, forKey: "value")
                    }
                }
                appDelegate.saveContext()
            }
        }
    }

    func weatherDataForLocation(location: String) -> Array<WeatherData> {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let locationFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "WeatherData")
        locationFetch.predicate = NSPredicate(format: "region == %@", location)

        let fetchedLocations:Array<WeatherData>
        do {
            fetchedLocations = try context.fetch(locationFetch) as! [WeatherData]
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }

        return fetchedLocations;
    }
}
