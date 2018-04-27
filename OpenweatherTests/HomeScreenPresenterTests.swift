//
//  HomeScreenPresenterTests.swift
//  OpenweatherTests
//
//  Created by Oleksii Horishnii on 4/27/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import XCTest
@testable import Openweather

extension HomeScreenCellModel: Equatable {
    public static func == (lhs: HomeScreenCellModel, rhs: HomeScreenCellModel) -> Bool {
        return (lhs.bgColor == rhs.bgColor) &&
        (lhs.lat == rhs.lat) &&
        (lhs.lon == rhs.lon) &&
        (lhs.name == rhs.name)
    }
}

extension HomeScreenCellType: Equatable {
    public static func == (lhs: HomeScreenCellType, rhs: HomeScreenCellType) -> Bool {
        switch lhs {
        case .main(let model):
            switch rhs {
            case .main(let model2):
                return model == model2
            case .new:
                return false
            }
        case .new:
            switch rhs {
            case .new:
                return true
            default:
                return false
            }
        }
    }
}

class HomeScreenPresenterTests: XCTestCase {
    static let sampleForecast = Forecast(date: Date(), name: "tratata", units: .metric, temperature: 0, humidity: 0, windSpeed: 0, windDegree: 0, weatherId: 0, weatherMain: "", weatherDescription: "", lat: 123, lon: -34.44)

    class HomeUseCaseProxy: HomeUseCase {
        var triggeredDelete = false
        func delete(forecast: Forecast) {
            self.triggeredDelete = true
        }
        
        func allForecast() -> [Forecast] {
            return [sampleForecast]
        }
    }
    
    class HomeRouterProxy: HomeScreenRouter {
        var triggered = false
        func toMap() {
            self.triggered = true
        }
    }
    
    class ToDetailsRouterProxy: HomeToDetailsRouter {
        var triggered = false
        func showDetails(forecast: Forecast) {
            self.triggered = true
        }
    }
    
    let useCase = HomeUseCaseProxy()
    let router1 = HomeRouterProxy()
    let router2 = ToDetailsRouterProxy()
    var presenter: HomeScreenPresenter!

    override func setUp() {
        super.setUp()
        
        self.presenter = HomeScreenPresenterImplementation(homeUseCase: useCase, homeScreenRouter: router1, homeToDetailsRouter: router2)
    }

    
    func testModels() {
        let color = HomeScreenCellModel.colorCycle[0]
        
        XCTAssertEqual(presenter.cellModels, [
            HomeScreenCellType.main(model: HomeScreenCellModel(name: "tratata", lat: "Lat: 123.0", lon: "Lon: -34.44", bgColor: color)),
            HomeScreenCellType.new
            ])
    }
    
    func testNewButton() {
        XCTAssertEqual(router1.triggered, false)
        self.presenter.handleNewButtonClick()
        XCTAssertEqual(router1.triggered, true)
    }
    
    func testClickedAt() {
        XCTAssertEqual(router2.triggered, false)
        self.presenter.forecastClickedAt(index: 0)
        XCTAssertEqual(router2.triggered, true)
    }
    
    func testDeleteAt() {
        XCTAssertEqual(useCase.triggeredDelete, false)
        self.presenter.deleteItemAt(index: 0)
        XCTAssertEqual(presenter.cellModels, [
            HomeScreenCellType.new
            ])
        XCTAssertEqual(useCase.triggeredDelete, true)
    }
}
