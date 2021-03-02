//
//  BountyViewController.swift
//  IOS_Study
//
//  Created by 정영돈 on 2021/03/01.
//

import UIKit

class BountyViewController: UIViewController,
                            UITableViewDataSource,
                            UITableViewDelegate{

    //MVVM
    
    //Model
    // - BountyInfo
    // - Make BountyInfo
    
    //View
    // - ListCell
    // > ListCell 필요한 정보를 ViewModel한테서 받아야함
    // > ListCell ViewModel로 부터 받은 정보를 업데이트
    
    //ViewModel
    // - BountyViewModel
    // > BountyViewModel을 만들고, ViewLayer에서 필요한 Method만들기
    // > Model 가지고 있어야 함 BountyInfo들
    
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 30000000),
        BountyInfo(name: "nami", bounty: 1600000),
        BountyInfo(name: "robin", bounty: 8000000),
        BountyInfo(name: "sanji", bounty: 7700000),
        BountyInfo(name: "zoro", bounty: 12000000)
    ]
    
//    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
//    let bountyList = [33000000, 50, 44000000, 30000000, 1600000, 8000000, 7700000, 12000000]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //DetailViewController 에 데이터 전송
        if segue.identifier == "showDetail"{
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int{
                
                let bountyInfo = bountyInfoList[index]
                
//                vc?.name = nameList[index]
//                vc?.bounty = bountyList[index]
                vc?.bountyInfo = bountyInfo
//                vc?.name = bountyInfo.name
//                vc?.bounty = bountyInfo.bounty
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
            return UITableViewCell()
        }
        
//        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
//        cell.imgView.image = img
//        cell.nameLabel.text = nameList[indexPath.row]
//        cell.bountyLabel.text = "\(bountyList[indexPath.row])"
        let bountyInfo = bountyInfoList[indexPath.row]
        cell.imgView.image = bountyInfo.image
        cell.nameLabel.text = bountyInfo.name
        cell.bountyLabel.text = "\(bountyInfo.bounty)"
        
        
        return cell;
    }
    
    //UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!

}

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
