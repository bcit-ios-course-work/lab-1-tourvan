//
//  ViewController.swift
//  tourvan
//
//  Created by Aiste Ulozaite on 2018-09-25.
//  Copyright © 2018 Aiste Ulozaite. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
    @IBOutlet weak var locationPicker: UIPickerView?;
    @IBOutlet weak var showButton: UIButton?;
    
    var locationData:[String] = [];
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locationData.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locationData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(locationData[row], forKey: "location")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        locationData = ["Science World", "Gastown", "Whistler", "Vancouver lookout", "Grouse Grind", "Museum of Vancouver"]
        UserDefaults.standard.set("Science World", forKey: "location")
        locationPicker?.reloadAllComponents()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let showButton = self.showButton {
            showButton.setTitle("Show", for:.normal)
        } else {
            // recover
            // self.button
        }
        
        if let locationPicker = self.locationPicker {
            locationPicker.delegate = self
            locationPicker.dataSource = self
        } else {
            // recover
            // self.button
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

