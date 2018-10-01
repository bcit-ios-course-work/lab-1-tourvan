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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let attraction = UserDefaults.standard.string(forKey: "location")
        print("attraction: \(String(describing: attraction))")
        var attractions: [String: [String: String]] = [:]
        if let path = Bundle.main.path(forResource: "Data", ofType: "plist") {
            attractions = NSDictionary(contentsOfFile: path) as! [String : [String: String]]
        }
        
        for (_, value) in attractions {
            
            if (value["name"]! == attraction) {
                locationImage.image = UIImage(named: (value["image"]!))
                locationTitle.text = value["name"]!
                locationDescription.text = value["description"]!
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
