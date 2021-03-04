//
//  BountyViewController.swift
//  IOS_Study
//
//  Created by 정영돈 on 2021/03/01.
//

import UIKit

class BountyViewController: UIViewController,
                            UICollectionViewDataSource,
                            UICollectionViewDelegate,
                            UICollectionViewDelegateFlowLayout
{


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
    
    let viewModel = BountyViewModel()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //DetailViewController 에 데이터 전송
        if segue.identifier == "showDetail"{
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int{
                

                let bountyInfo = viewModel.bountyInfo(at: index)
                vc?.viewModel.update(model: bountyInfo)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //UICollectionViewDataSource
    // 몇개를 보여주나
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfBountyInfoList
    }
    // 셀은 어떻게 표현하나
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as?
        GridCell else {
            return UICollectionViewCell()
        }
            
        let bountyInfo = viewModel.bountyInfo(at: indexPath.item)
        cell.update(info: bountyInfo)

        return cell
    }
    
    
    //UICollectionViewDelegate
    //셀이 클릭되었을 때 어떻게 하나
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                print("--> \(indexPath.item)")
                performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
    
    //UICollectionViewDelegateFlowLayout
    //cell size를 어떻게 계산해서 표현하나 (기기별 사이즈)
    
    
    
    //UITableViewDataSource
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.numOfBountyInfoList
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
//            return UITableViewCell()
//        }
//        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
//        cell.update(info: bountyInfo)
//
//        return cell;
//    }
//
//    //UITableViewDelegate
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("--> \(indexPath.row)")
//        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
//    }
}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!

    func update(info: BountyInfo){
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}



class BountyViewModel{
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
    
    var sortedList: [BountyInfo] {
        let sortedList = bountyInfoList.sorted { prev, next in
            return prev.bounty > next.bounty
            
        }
        return sortedList
    }
    
    var numOfBountyInfoList: Int{
        return bountyInfoList.count
    }
    
    func bountyInfo(at index: Int) -> BountyInfo{
        return sortedList[index]
    }
}

class GridCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!

    func update(info: BountyInfo){
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}
