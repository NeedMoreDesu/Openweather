//
//  MapInteractor.swift
//  OpenweatherTests
//
//  Created by Oleksii Horishnii on 4/27/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import XCTest
@testable import Openweather

class MapInteractorTests: XCTestCase {
    static let sampleForecast = Forecast(date: Date(), name: "tratata", units: .metric, temperature: 0, humidity: 0, windSpeed: 0, windDegree: 0, weatherId: 0, weatherMain: "", weatherDescription: "", lat: 0, lon: 0)
    
    class CurrentRouterProxy: CurrentRouter {
        static func current(params: [URLs.Params], completion: @escaping ((Forecast?, Error?) -> Void)) {
            completion(sampleForecast, nil)
        }
    }
    
    class ForecastRepositoryProxy: ForecastRepository {
        var saved: Forecast?
        func save(_ forecast: Forecast) {
            self.saved = forecast
        }
        
        func delete(_ forecast: Forecast) {
            
        }
        
        func allForecast() -> [Forecast] {
            return [sampleForecast]
        }
    }
    
    func testOne() {
        let forecastRepo = ForecastRepositoryProxy()
        let mapUseCase = MapInteractor(forecastRepository: forecastRepo, currentRouter: CurrentRouterProxy.self)
        XCTAssertEqual(forecastRepo.saved, nil)
        XCTAssertEqual(mapUseCase.allForecast(), [MapInteractorTests.sampleForecast])
        mapUseCase.newLocation(lat: 0, lon: 0) {
            XCTAssertEqual(forecastRepo.saved, MapInteractorTests.sampleForecast)
        }
    }
}
