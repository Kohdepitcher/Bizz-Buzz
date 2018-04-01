//
//  ViewController.swift
//  Bizz-Buzz
//
//  Created by Kohde Pitcher on 21/9/17.
//  Copyright © 2017 Kohde Pitcher. All rights reserved.
//

import UIKit

class FBViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var firstNumberTextField: UITextField!
    @IBOutlet weak var secondNumberTextField: UITextField!
    @IBOutlet weak var fizzBuzzButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var labelAboveFirst: UILabel!
    @IBOutlet weak var labelAboveSecond: UILabel!
    
    
    @IBOutlet var textField: [UITextField]!
    @IBOutlet weak var backEntryView: backgroundHeaderArrow!
    
    
    //MARK:-
    //MARK: Actions
    @IBAction func actionButton(_ sender: Any) {
        
        if firstNumberTextField.text?.containsValidCharacter == true && secondNumberTextField.text?.containsValidCharacter == true { //continue only if both textfields have correct characters

            if let firstNumberEntered = Int(firstNumberTextField.text!) { //if the text field can be converted to an integer
                firstNumber = firstNumberEntered //assign the converted int to varible to be used later
            }
            
            if let secondNumberEntered = Int(secondNumberTextField.text!) { //if the text field can be converted to an integer
                secondNumber = secondNumberEntered //assign the converted int to varible to be used later
            }
        }
        
        if secondNumber >= firstNumber { //if second number is higher than first number - prevent error
            progressHUD.show()
            fizzBuzzButton.isEnabled = false
            
            DispatchQueue.global(qos: .utility).async { //call algorithm on background thread - use utility qos for energy efficency
                self.fizzBuzzArray = self.calculateFizzBuzz(firstNumber: self.firstNumber, lastNumber: self.secondNumber)

                
                DispatchQueue.main.async { //update the table view to use new data from background thread
                    self.tableView.reloadData()
                    self.progressHUD.hide()
                    self.fizzBuzzButton.isEnabled = true
                }
            }
            
        
        //tableView.reloadData()
        
        }
        dismissKeyboard() //dissmiss keyboard
    }
    
    
    //MARK: -
    
    //MARK: Variables
    var fizzBuzzArray: [fizzBuzzObj] = []
    
    var firstNumber = 0
    var secondNumber = 0
    
    let progressHUD = ActivityHUD(text: "Calculating")
    
    let colorForUI = UIColor(red: 43/255, green: 145/255, blue: 242/255, alpha: 1.0)
    
    let startColor = UIColor(red: 33/225, green: 212/225, blue: 253/225, alpha: 1)
    let endColor = UIColor(red: 183/225, green: 33/225, blue: 255/225, alpha: 1)
    
    //MARK: -
    //MARK: Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addSubview(progressHUD) //add progressHUD view as subview to view controller
        progressHUD.hide() //call it's hide func to hide it upon loading the view controller
        
        
        //assign delegation
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.allowsSelection = false
        
        fizzBuzzButton.layer.cornerRadius = 20 //apply corner radius to button to make it rounded
        
        backEntryView.colorForArrow = colorForUI //assign color to colored arrow in custom view
        backEntryView.colorForViewBack = .black
        
        
        
        //customise first number text field
        firstNumberTextField.textColor = .white //change text color
        firstNumberTextField.backgroundColor = .clear //change background color to clear
        firstNumberTextField.borderStyle = .none //apply no border style
        labelAboveFirst.textColor = .white //change text color
        addLineUnderTextField(textField: firstNumberTextField, lineColor: .white) //call func to draw line under textfield
        
        //customise second number text field
        secondNumberTextField.textColor = colorForUI
        secondNumberTextField.backgroundColor = .clear
        secondNumberTextField.borderStyle = .none
        labelAboveSecond.textColor = colorForUI
        addLineUnderTextField(textField: secondNumberTextField, lineColor: colorForUI)
        
        createToolBar(textField: firstNumberTextField)
        createToolBar(textField: secondNumberTextField)
        
        //let gradientLayer = CAGradientLayer()
        //gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        //gradientLayer.frame = view.frame
        //view.layer.insertSublayer(gradientLayer, at: 0)
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)) //create tap gesture to dismiss keyboard
        view.addGestureRecognizer(tap) //add gesture "tap" to view
        }
    
    @objc func dismissKeyboard() {
        view.endEditing(true) //dissmiss keyboard
    }
    
    

    func calculateFizzBuzz(firstNumber: Int, lastNumber: Int) -> [fizzBuzzObj] {
        
        var tempArray: [fizzBuzzObj] = [] //create temp array to store results of algorithm
        
        for number in firstNumber...lastNumber  { //for in loop that interates over number from first entered number to second entered number
        
            if number % 5 == 0 && number % 3 == 0 {
                //print("\(number) Fizzbuzz")
                let text = fizzBuzzObj(text: "\(number) is a FizzBuzz")
                tempArray.append(text)
            }
            else if number % 3 == 0 {
                //print("\(number) Fizz")
                let text = fizzBuzzObj(text: "\(number) is a Fizz")
                tempArray.append(text)
            }
        
            else if number % 5 == 0 {
                //print("\(number) Buzz")
                let text = fizzBuzzObj(text: "\(number) is a Buzz")
                tempArray.append(text)
            }
        
            else if number % 3 != 0 || number % 5 != 0 {
                //print("\(number) No fizz or buzz")
                let text = fizzBuzzObj(text: "\(number) is not a Fizz or Buzz")
                tempArray.append(text)
            }
        }
        
        return tempArray
    }
    
    func createToolBar(textField: UITextField) {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.dismissKeyboard)) //create done button for toolbar
        let spaceForBar = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil) //create space in toolbar
        toolBar.setItems([spaceForBar, doneButton], animated: false) //add elements to toolbar
        toolBar.isUserInteractionEnabled = true
        
        textField.inputAccessoryView = toolBar //make toolbar inputAccessory to textField
    } //func for setting up toolbar
    
}

func addLineUnderTextField(textField: UITextField, lineColor: UIColor) {
    //adds line under UITextField
    let textFieldBorder = CALayer()
    let textFieldWidth = CGFloat(4.0)
    textFieldBorder.borderColor = lineColor.cgColor
    textFieldBorder.frame = CGRect(x: 0, y: textField.frame.size.height-textFieldWidth, width: textField.frame.size.width, height: textField.frame.size.height)
    textFieldBorder.borderWidth = textFieldWidth
    textField.layer.addSublayer(textFieldBorder)
    textField.layer.masksToBounds = true
}



//MARK: -
//MARK: Extensions
extension String { //only allow digits
    var containsValidCharacter: Bool {
        let characterSet = CharacterSet(charactersIn: "1234567890")
        let range = (self as NSString).rangeOfCharacter(from: characterSet)
        return range.location != NSNotFound
    }
}

extension FBViewController: UITableViewDataSource, UITableViewDelegate { //extend view controller to support delegate and datasource for table views
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fizzBuzzArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fizzBuzz = fizzBuzzArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "fizzBuzzCell") as! fizzBuzzCell
        //cell.setCellText(text: fizzBuzz)
        cell.fizzBuzzCell.text! = fizzBuzz.text
        return cell
        
    }
    
    
}




