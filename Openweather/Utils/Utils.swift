//
//  Utils.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

class Utils: NSObject {
    public class func createVC<Type>(storyboardId: String, vcId: String) -> Type {
        let type = Type.self as! AnyClass
        let bundle = Bundle(for: type)
        let storyboard = UIStoryboard.init(name: storyboardId, bundle: bundle)
        let vc = storyboard.instantiateViewController(withIdentifier: vcId)
        
        return vc as! Type
    }
    
    public class func afterDelay(seconds: Double, fn: @escaping (() -> ())) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            fn()
        }
    }
}
