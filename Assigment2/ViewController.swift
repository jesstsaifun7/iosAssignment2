//
//  ViewController.swift
//  Assigment2
//
//  Created by CHI on 2021/4/14.
//

import UIKit

class ViewController: UIViewController,
                      UITableViewDelegate,
                      UITableViewDataSource{
    
    
    var airports: [Airport] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        
        title = "Airport List"
        
        tableView.delegate = self
        tableView.dataSource = self
        // start here...
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "airportCell", for: indexPath) as! AirportCell
    

        let airport = airports[indexPath.row]
        
        cell.airportImage.image = UIImage(named: airport.imageName)
        cell.nameLabel.text = airport.name
        cell.countryLabel.text = airport.country
        
        return cell
   }
    
    //傳遞
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let airport = airports[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController")  as? SecondViewController

        vc?.image = UIImage(named: airport.imageName)!
        vc?.name = airport.name
        vc?.IATA = airport.IATA
        vc?.shortName = airport.shortName
        vc?.servedCity = airport.servedCity
        print("tap")
        self.navigationController?.pushViewController(vc!, animated: true)

    }
}







extension ViewController {
    private func fetchData() {
        guard let path = Bundle.main.path(forResource: "airports", ofType: "plist"),
              let xml = FileManager.default.contents(atPath: path),
              let airports = try? PropertyListDecoder().decode([Airport].self, from: xml) else {
            return
        }
        self.airports = airports
    }
}

