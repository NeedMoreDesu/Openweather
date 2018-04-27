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
}

class DetailsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //MARK:- public
    public class func create(presenter: DetailsPresenter) -> DetailsVC {
        let `self` = Utils.createVC(storyboardId: "Details", vcId: "DetailsVC") as DetailsVC
        self.presenter = presenter
        return self
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
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCell", for: indexPath) as! DetailsCell
        cell.model = self.presenter.mainCellModel
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width/1.5)
    }
}
