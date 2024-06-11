//
//  ViewController.swift
//  Diet
//
//  Created by PMW on 2024/06/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var mealSegmentedControl: UISegmentedControl!
    @IBOutlet weak var calorieTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var totalCalories = 0
    var dailyCalorieLimit = 2000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.text = "오늘 하루 칼로리 기록을 시작하세요."
    }
    
    @IBAction func genderChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            dailyCalorieLimit = 2500
        } else {
            dailyCalorieLimit = 2000
        }
    }
    

    @IBAction func addCalorie(_ sender: UIButton) {
        guard let calorieText = calorieTextField.text,
              let calories = Int(calorieText) else{
            resultLabel.text = "유효한 칼로리를 입력하세요."
            return
        }
        
        totalCalories += calories
        
        if totalCalories > dailyCalorieLimit{
            resultLabel.text = "오늘 하루 섭취한 칼로리\n\(totalCalories)\n(권장 칼로리를 초과했습니다!)"
        } else {
            resultLabel.text = "오늘 하루 섭취한 칼로리\n\(totalCalories)\n(권장 칼로리 이내"
        }
        
        calorieTextField.text = ""
    }
    
}

