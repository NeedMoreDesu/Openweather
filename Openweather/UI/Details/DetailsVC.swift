//
//  DetailsVC.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/27/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

protocol DetailsPresenter {
    var title: String { get }
    var mainCellModel: DetailsCellModel { get }
    var forecastDayTitles: [String] { get }
    var forecastsByDay: [[DetailsCellModel]] { get }
}

class DetailsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, DetailsView {
    //MARK:- public
    public class func create(presenter: DetailsPresenter) -> DetailsVC {
        let `self` = Utils.createVC(storyboardId: "Details", vcId: "DetailsVC") as DetailsVC
        self.presenter = presenter
        return self
    }
    public func updateUI() {
        self.collectionView.reloadData()
    }
    
    //MARK:- private
    private var presenter: DetailsPresenter!
    
    //MARK:- outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK:- lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.presenter.title
    }
    
    //MARK:- collectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.presenter.forecastDayTitles.count + 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return self.presenter.forecastsByDay[section-1].count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCell", for: indexPath) as! DetailsCell
        if indexPath.section == 0 {
            cell.model = self.presenter.mainCellModel
        } else {
            cell.model = self.presenter.forecastsByDay[indexPath.section-1][indexPath.row]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let mult = CGFloat(372.0/255.0) // based on storyboard current value
        if indexPath.section == 0 {
            return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width/mult)
        } else {
            return CGSize(width: (UIScreen.main.bounds.width/3-1), height: UIScreen.main.bounds.width/mult/3)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "DetailsHeaderCell", for: indexPath) as! DetailsHeaderCell
        if indexPath.section == 0 {
            return cell
        }
        let title = self.presenter.forecastDayTitles[indexPath.section-1]
        cell.titleLabel.text = title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize.zero
        } else {
            return CGSize(width: 0, height: 20.0)
        }
    }
}
