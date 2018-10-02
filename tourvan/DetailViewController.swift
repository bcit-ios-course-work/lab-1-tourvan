//
//  DetailController.swift
//  tourvan
//
//  Created by Aiste Ulozaite on 2018-09-25.
//  Copyright © 2018 Aiste Ulozaite. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var locationTitle: UILabel?
    @IBOutlet weak var locationImage: UIImageView?
    @IBOutlet weak var locationDescription: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO @runquest: refactor to smaller methods
        
        guard let locationImage = self.locationImage,
            let locationTitle = self.locationTitle,
            let locationDescription = self.locationDescription
        else { return }
        
        let attraction = UserDefaults.standard.string(forKey: "location")
        
        guard let path = Bundle.main.path(forResource: "Data", ofType: "plist"),
            let attractions = NSDictionary(contentsOfFile: path) as? [String : [String: String]] else {
            return
        }
        
        for (_, value) in attractions {
            
            if (value["name"] == attraction) {
                locationImage.image = UIImage(named: (value["image"] ?? "gastown.jpg"))
                locationTitle.text = value["name"] ?? "No name"

                let description: String = value["description"] ?? "No description"
                locationDescription.text = description
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
