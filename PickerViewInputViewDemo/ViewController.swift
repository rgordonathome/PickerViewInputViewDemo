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
    
    @IBOutlet weak var textFieldGoals: UITextField!
    
    // MARK: Properties
    
    // Create a list (aka an array) of all the values that should show in the points picker view
    var pointsOptions = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]

    // Create a list (aka an array) of all the values that should show in the points picker view
    var goalsOptions = ["0", "1", "2", "3"]
    
    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create a picker view in code for the points text field
        let pointsPicker = UIPickerView()
        
        // Make the view controller the delegate for the points picker
        pointsPicker.delegate = self
        
        // Make the picker appear when someone sets focus to the text field
        textFieldPoints.inputView = pointsPicker
        
        // Define a tag so that we can distinguish one picker from another later on
        pointsPicker.tag = 1

        // Create a picker view in code for the points text field
        let goalsPicker = UIPickerView()
        
        // Make the view controller the delegate for the points picker
        goalsPicker.delegate = self
        
        // Make the picker appear when someone sets focus to the text field
        textFieldGoals.inputView = goalsPicker

        // Define a tag so that we can distinguish one picker from another later on
        goalsPicker.tag = 2
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        // A touch actually has many points (since a finger is large) so
        // only proceed if we can get the first touch
        guard let touch = touches.first else {
            return
        }
        
        // Determine what view the touch was made on, if something other than a picker view, dismiss the picker view
        if (touch.view as? UIPickerView) == nil {
            // It was not a picker view, so dismiss the picker view sheet
            self.view.endEditing(true)
        }

    }
    
    // MARK: UIPickerView
    
    // This tells the picker view how many components it has
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 1 {
            return 1
        } else if pickerView.tag == 2 {
            return 1
        } else {
            return 1
        }
    }
    
    // This sets the number of rows in the picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 1 {
            // Set the number of rows in the picker view to the number of elements in the pointsOptions array
            return pointsOptions.count
        } else if pickerView.tag == 2 {
            // Set the number of rows in the picker view to the number of elements in the goalsOptions array
            return goalsOptions.count
        } else {
            return 0
        }
    }
    
    // Set a title, or value, to show for each row in the picker view
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        // Return the value for the current row, using the pointsOption array as the data source
        if pickerView.tag == 1 {
            // Set the number of rows in the picker view to the number of elements in the pointsOptions array
            return pointsOptions[row]
        } else if pickerView.tag == 2 {
            // Set the number of rows in the picker view to the number of elements in the goalsOptions array
            return goalsOptions[row]
        } else {
            return nil
        }
    }
    
    // Update the textfield text when a row is selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // Return the value for the current row, using the pointsOption array as the data source
        if pickerView.tag == 1 {
            // Set the number of rows in the picker view to the number of elements in the pointsOptions array
            textFieldPoints.text = pointsOptions[row]
        } else if pickerView.tag == 2 {
            // Set the number of rows in the picker view to the number of elements in the goalsOptions array
            textFieldGoals.text = goalsOptions[row]
        }
        
    }
    


}

