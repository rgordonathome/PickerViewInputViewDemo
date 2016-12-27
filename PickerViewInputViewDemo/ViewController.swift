//
//  ViewController.swift
//  PickerViewInputViewDemo
//
//  Created by Russell Gordon on 12/27/16.
//  Copyright © 2016 Russell Gordon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    // MARK: Outlets
    @IBOutlet weak var textFieldPoints: UITextField!
    
    // MARK: Properties
    
    // Create a list (aka an array) of all the values that should show in the picker view
    var pointsOptions = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create a picker view in code
        let pointsPicker = UIPickerView()
        
        // Make the view controller the delegate for the picker
        pointsPicker.delegate = self
        
        // Make the picker appear when someone sets focus to the text field
        textFieldPoints.inputView = pointsPicker
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UIPickerView
    
    // This tells the picker view how many components it has
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // This sets the number of rows in the picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        // Set the number of rows in the picker view to the number of elements in the pointsOptions array
        return pointsOptions.count
    }
    
    // Set a title, or value, to show for each row in the picker view
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        // Return the value for the current row, using the pointsOption array as the data source
        return pointsOptions[row]

    }
    
    // Update the textfield text when a row is selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        textFieldPoints.text = pointsOptions[row]
        
    }
    


}

