//
//  BountyInfo.swift
//  IOS_Study
//
//  Created by 정영돈 on 2021/03/02.
//

import UIKit

struct BountyInfo{
    let name: String
    let bounty: Int
    
    var image: UIImage?{
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int){
        self.name = name
        self.bounty = bounty
    }
}
