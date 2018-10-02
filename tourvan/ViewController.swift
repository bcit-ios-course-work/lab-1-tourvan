//
//  ViewController.swift
//  tourvan
//
//  Created by Aiste Ulozaite on 2018-09-25.
//  Copyright © 2018 Aiste Ulozaite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var locationPicker: UIPickerView?
    @IBOutlet weak var showButton: UIButton?
    
    var locationData:[String] = [];
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let locationPicker = self.locationPicker else {
            return
        }
        locationData = ["Science World", "Gastown", "Whistler", "Vancouver lookout", "Grouse Grind", "Museum of Vancouver"]
        UserDefaults.standard.set("Science World", forKey: "location")
        locationPicker.reloadAllComponents()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        showButton?.setTitle("Show", for:.normal)

        locationPicker?.delegate = self
        locationPicker?.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locationData.count
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
}

// MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locationData[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(locationData[row], forKey: "location")
    }
}
