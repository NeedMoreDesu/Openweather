//
//  ViewController.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

protocol HomeScreenPresenter {
    var title: String { get }
    var cellModels: [HomeScreenCellType] { get }
    func updateCellModels()

    func handleNewButtonClick()
    func forecastClickedAt(index: Int)
}

class HomeScreenVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK:- public
    public func updateUI() {
        self.tableView.reloadData()
    }
    public class func create(presenter: HomeScreenPresenter) -> HomeScreenVC {
        let `self` = Utils.createVC(storyboardId: "Home", vcId: "HomeScreenVC") as HomeScreenVC
        self.presenter = presenter
        return self
    }
    
    //MARK:- outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- private
    var presenter: HomeScreenPresenter!
    
    //MARK:- lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.presenter.title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter.updateCellModels()
        self.updateUI()
    }
    
    //MARK:- table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.presenter.cellModels[indexPath.row]
        
        switch item {
        case .main(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeScreenCell", for: indexPath) as! HomeScreenCell
            cell.model = model
            return cell
        case .new:
            let cell = tableView.dequeueReusableCell(withIdentifier: "addCell", for: indexPath)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.presenter.cellModels[indexPath.row]
        
        switch item {
        case .new:
            self.presenter.handleNewButtonClick()
        case .main(_):
            self.presenter.forecastClickedAt(index: indexPath.row)
        }
    }
}

