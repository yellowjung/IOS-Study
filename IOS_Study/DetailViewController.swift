//
//  DetailViewController.swift
//  IOS_Study
//
//  Created by 정영돈 on 2021/03/01.
//

import UIKit

class DetailViewController: UIViewController {

    //MVVM
    
    //Model
    // - BountyInfo
    // - Make BountyInfo
    
    //View
    // - imgView, nameLabel, bountyLabel
    // > view들은 viewModel 통해서 구성하기
    
    //ViewModel
    // - DetailViewModel
    // > ViewLayer에서 필요한 Method만들기
    // > Model 가지고 있기
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI(){
  
        if let bountyInfo = viewModel.bountyInfo{
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"

        }
    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

class DetailViewModel{
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?){
        bountyInfo = model
    }
}
