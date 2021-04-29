//
//  SecondViewController.swift
//  Assigment2
//
//  Created by jesstsai on 2021/4/24.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

//    var information: Airport?
    var image = UIImage()
    var IATA = ""
    var name = ""
    var servedCity = ""
    var shortName = ""
    var info = ["Name","Location", "IATA", "Short Name"]
    
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView2)
        tableView2.delegate = self
        tableView2.dataSource = self
        
        title = "\(IATA)"
        
        img.image = image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell2 = tableView2.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as? AirportCell
        
        cell2?.info.text = info[indexPath.row]
        
        switch indexPath.row{
        case 0:
            cell2?.name.text = "\(name)"
        case 1:
            cell2?.name.text = "\(servedCity)"
        case 2:
            cell2?.name.text = "\(IATA)"
        default:
            cell2?.name.text = "\(shortName)"
        }
//        if indexPath.row == 0{
//            cell2?.name.text = "\(name)"
//        }
//        else if indexPath.row == 1{
//            cell2?.name.text = "\(servedCity)"
//        }
//        else if indexPath.row == 2{
//            cell2?.name.text = "\(IATA)"
//        }
//        else {
//            cell2?.name.text = "\(shortName)"
//        }
       
        return cell2!
    }

}
