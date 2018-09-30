//
//  DetailController.swift
//  tourvan
//
//  Created by Aiste Ulozaite on 2018-09-25.
//  Copyright © 2018 Aiste Ulozaite. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var locationTitle: UILabel!
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var locationDescription: UITextView!
    
    //set up our data
    var grouse = [
        "name":"Grouse Grind",
        "image":"grouse-grind.jpg",
        "description":"Grouse Grind is one of the North Shore Mountains of the Pacific Ranges in the District Municipality of North Vancouver, British Columbia, Canada. With a maximum elevation of over 1,200 m (4,100 feet) at its peak, the mountain is the site of an alpine ski area, Grouse Mountain Resort, which overlooks Greater Vancouver has four chairlifts servicing 33 runs. In the summer, Grouse Mountain Resort features lumberjack shows."
    ]
    
    var museum = [
        "name":"Museum of Vancouver",
        "image":"museum-of-vancouver.jpeg",
        "description":"The Museum of Vancouver is an award-winning civic history museum located in Vanier Park, Vancouver, British Columbia. The MOV is the largest civic museum in Canada and the oldest museum in Vancouver."
    ]
    
    var whistler = [
        "name":"Whistler",
        "image":"whistler.jpg",
        "description":"Whistler is a town north of Vancouver, British Columbia, that's home to Whistler Blackcomb, one of the largest ski resorts in North America. Besides skiing and snowboarding, the area offers snowshoeing, tobogganing and ski jumping at the Olympic Park, a venue for the 2010 Vancouver Winter Olympics. The hub of Whistler is a compact, chalet-style pedestrian village at the base of Whistler and Blackcomb mountains."
    ]
    
    var lookout = [
        "name":"Vancouver lookout",
        "image":"vancouver-lookout.jpg",
        "description":"Sightseers ascend this tower in a glass elevator to an observation deck with 360° views of the city."
    ]
    
    var gastown = [
        "name":"Gastown",
        "image":"gastown.jpg",
        "description":"Lively Gastown is known for its whistling Steam Clock and mix of souvenir shops, indie art galleries and decor stores in Victorian buildings. A trendy food and drink scene includes chic cocktail lounges and restaurants serving everything from gourmet sandwiches to local seafood. Hip eateries also dot the neighboring Downtown Eastside area, while the up-and-coming Railtown district is home to edgy fashion studios."
    ]
    
    var scienceworld = [
        "name":"Science World",
        "image":"science-world.jpg",
        "description":"Science World at Telus World of Science, Vancouver is a science centre run by a not-for-profit organization in Vancouver, British Columbia, Canada. It is located at the end of False Creek, and features many permanent interactive exhibits and displays, as well as areas with varying topics throughout the years. "
    ]
    
    let dataPlistUrl = Bundle.main.url(forResource: "Data", withExtension: "plist")
    let fileManager = FileManager.default
    let dataArray = NSArray()
    
//    let dataArray =
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var attractions:[[String: String]] = [grouse, museum, whistler, lookout, gastown, scienceworld];
        
        // 1. get access to the file
        // 2. create object
        // 3. write to the file
        
        // Remove after first run
        print("Starting to generate pList")
        for i in (0...attractions.count-1) {
            
            let attractionImage = UIImage(named: attractions[i]["image"]!)
            let attractionData = UIImage.pngData(attractionImage!)
            let attractionName = attractions[i]["name"]!
            let attractionDescription = attractions[i]["description"]!
            
            let object = ["name" : attractionName, "description" : attractionDescription, "image" :  attractionData ] as [String : Any]
            print("Adding object to array")
            dataArray.adding(object)
        }
        
        print("done adding to dataArray \(dataArray)")

        let serializedData = try! PropertyListSerialization.data(fromPropertyList: dataArray, format: PropertyListSerialization.PropertyListFormat.xml, options: 0)
        print("serializedData")
        let document = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        print("document")

        let logFileURL = document?.appendingPathComponent("attractionData.plist")
        print("logFileURL")

       try! serializedData.write(to: logFileURL!, options: [])
        print("write")
        let attraction = UserDefaults.standard.object(forKey: "location")

        for i in (0...attractions.count-1) {
            if (attractions[i]["name"]! == attraction as! String) {
                locationImage.image = UIImage(named: attractions[i]["image"]!)
                locationTitle.text = attractions[i]["name"]!
                locationDescription.text = attractions[i]["description"]!
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
