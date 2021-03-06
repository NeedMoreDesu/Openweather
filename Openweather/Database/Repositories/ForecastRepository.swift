//
//  ForecastRepository.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit
import CoreData

extension DBForecast {
    func fromPONSO(_ ponso: Forecast) {
        self.date = ponso.date
        self.name = ponso.name
        self.temperature = ponso.temperature
        self.humidity = ponso.humidity
        self.windSpeed = ponso.windSpeed
        self.weatherId = Int32(ponso.weatherId)
        self.weatherMain = ponso.weatherMain
        self.weatherDescription = ponso.weatherDescription
        self.lat = ponso.lat
        self.lon = ponso.lon
        self.units = ponso.units.rawValue
    }
    func toPONSO() -> Forecast {
        return Forecast(date: self.date!, name: self.name!, units: Forecast.Units(rawValue: self.units!)!,
                        temperature: self.temperature, humidity: self.humidity,
                        windSpeed: self.windSpeed, windDegree: self.windDegree,
                        weatherId: Int(self.weatherId), weatherMain: self.weatherMain!, weatherDescription: self.weatherDescription!,
                        lat: self.lat, lon: self.lon)
    }
}

extension DatabaseManager: ForecastRepository {
    private func new(_ forecast: Forecast) -> DBForecast {
        let dbobj = DBForecast.init(entity: DBForecast.entity(), insertInto: self.managedObjectContext)
        return dbobj
    }
    
    private func find(_ forecast: Forecast) -> DBForecast? {
        let request = NSFetchRequest<DBForecast>(entityName: "Forecast")
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "date = %@ AND lat = \(forecast.lat) AND lon = \(forecast.lon)", forecast.date as CVarArg)
        let result = try? self.managedObjectContext.fetch(request)
        return result?.first
    }
    
    public func save(_ forecast: Forecast) {
        let dbobj = self.find(forecast) ?? self.new(forecast)
        dbobj.fromPONSO(forecast)
        try? self.managedObjectContext.save()
    }
    
    public func delete(_ forecast: Forecast) {
        if let dbobj = self.find(forecast) {
            self.managedObjectContext.delete(dbobj)
            try? self.managedObjectContext.save()
        }
    }
    
    public func allForecast() -> [Forecast] {
        let request = NSFetchRequest<DBForecast>(entityName: "Forecast")
        let result = try? self.managedObjectContext.fetch(request)
        let forecasts = result?.map({ (dbobj) -> Forecast in
            return dbobj.toPONSO()
        })
        return forecasts ?? []
    }
}
