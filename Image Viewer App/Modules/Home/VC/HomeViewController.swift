//
//  HomeViewController.swift
//  Image Viewer App
//
//  Created by Adwaith V V on 14/02/23.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {

    // MARK: - Properties
    
    var myModel = [Model]()
    @IBOutlet weak var tabVw: UITableView!

    let url = "https://picsum.photos/v2/list"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialiseViewController()
        
    }
    
    // MARK: - View initialisation
    
    func initialiseViewController(){
        self.get()
        self.tabVw.dataSource = self
        self.tabVw.delegate = self
        self.tabVw.register(UINib(nibName: "DataTableViewCell", bundle: nil), forCellReuseIdentifier: "DataTableViewCell")
    }
    
    // MARK: - Network Call
    
    func get(){
        AF.request(url, method: .get).responseJSON { resp in
            switch resp.result{
                
            case .success(let suc):
//                print(suc)
                if let conv = suc as? [[String: Any]]{
                    print(conv)
                    for i in conv{
                        self.myModel.append(Model(fromData: i))
                    }
                    self.tabVw.reloadData()
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    // MARK: - Button Action
    
    @IBAction func didLogOutButtonTapped(_ sender: UIButton){
        let nextVc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")as! LoginViewController
        self.navigationController?.pushViewController(nextVc, animated: false)
    }
    

}

    // MARK: - Model Class


class Model {

    let width: Int?
    let download_url: String?
    let id: Int?
    let author: String?
    let url: String?
    let height: Int?
    init(fromData: [String:Any]){
        self.width = fromData["width"] as? Int
        self.download_url = fromData["download_url"] as? String
        self.id = fromData["id"] as? Int
        self.author = fromData["author"] as? String
        self.url = fromData["url"] as? String
        self.height = fromData["height"] as? Int
    }

}

    // MARK: - Extension


extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell", for: indexPath)as! DataTableViewCell
        cell.configCellForData(data: myModel[indexPath.row])
        return cell
    }
    
    
}
