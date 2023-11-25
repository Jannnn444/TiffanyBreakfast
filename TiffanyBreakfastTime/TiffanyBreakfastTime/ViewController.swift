//
//  ViewController.swift
//  TiffanyBreakfastTime
//
//  Created by yucian huang on 2023/11/22.
//

import UIKit
import Foundation


class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var flavourSegments: UISegmentedControl!
    @IBOutlet weak var heatSlider: UISlider!
    @IBOutlet weak var blackCoffeeSwitch: UISwitch!
    @IBOutlet weak var iceSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var secondLable: UILabel!
    @IBOutlet weak var iceLabel: UILabel!
    
    var croissant = "經典原味"
    var blackTea = ""
    var sugar = "無糖"
    var ice = "去冰"
    var order = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = " Kindly place your order! "
    }
    
//choose croissant flavour
    @IBAction func changeFlavour(_ sender: UISegmentedControl) {
        if flavourSegments.selectedSegmentIndex == 0 {
            croissant = "經典原味"
        }else if flavourSegments.selectedSegmentIndex == 1 {
            croissant = "草莓口味"
        } else {
            croissant = "歐式巧克力"
        }
    }
            
//add the black tea switch
            @IBAction func blackCoffeeSwitchChanged(_ sender: UISwitch) {
                guard let blackSwitch = blackCoffeeSwitch else {
                       print("blackCoffeeSwitch is nil")
                       return
                   }

                   if blackSwitch.isOn {
                       blackTea = "☕️加購黑咖啡"
                   } else {
                       blackTea = ""
                   }
               }
//adjust heat
    @IBAction func changeHeat(_ sender: UISlider) {
//set slider into interger
        heatSlider.value.round()
        if heatSlider.value == 1 {
            secondLable.text = "加熱0秒"
        }else if heatSlider.value == 2 {
            secondLable.text = "加熱10秒"
        }else if heatSlider.value == 3 {
            secondLable.text = "加熱20秒"
        }else if heatSlider.value == 4 {
            secondLable.text = "加熱30秒"
        }else if heatSlider.value == 5 {
            secondLable.text = "加熱40秒"
        }else if heatSlider.value == 6 {
            secondLable.text = "加熱50秒"
        }else{
            secondLable.text = "加熱60秒"
        }
    }
    
//ice adjust
    @IBAction func changeIce(_ sender: UISlider) {
        //set the slidre into interger
        iceSlider.value.round()
        //set the slider from 1-4, by if else, was set 1-4
        if iceSlider.value == 1 {
            iceLabel.text = "去冰"
        }else if iceSlider.value == 2{
            iceLabel.text = "微冰"
        }else if iceSlider.value == 3{
            iceLabel.text = "少冰"
        }else{
            iceLabel.text = "正常冰"
        }
    }
    
// send the order output
        @IBAction func orderButton(_ sender: UIButton) {
            let name = nameTextField.text!
            
            if name == "" {
                resultLabel.text = "Please fill in your order name"
            }else if blackCoffeeSwitch.isOn == false {
                resultLabel.text = name + "今早想來點：\n\n" + croissant + "可頌\n\n" + secondLable.text!
            }else{
                resultLabel.text = name + "今早想來點：\n\n" + croissant + "可頌\n\n🔥" + secondLable.text! + blackTea+iceLabel.text!
            }
//end the keyboard
            view.endEditing(true)
            }
//clear infos
        @IBAction func clearButton(_ sender: UIButton) {
            nameTextField.text = ""
            flavourSegments.selectedSegmentIndex = 0

            resultLabel.text = ""
            }
        }
        
    
