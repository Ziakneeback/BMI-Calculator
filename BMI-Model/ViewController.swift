//
//  ViewController.swift
//  BMI_Model
//
//  Created by Жанибек Асылбек on 03.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var BMI: UILabel!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var Background: UIImageView!
    
    @IBOutlet weak var Button: UIButton!
    var counter = 0
    
    
    @IBAction func result(_ sender: Any) {
        if counter == 0{
            let Height:Float
            let Weight:Float
            let bmi:Float
            if(height.text!=="0" || weight.text!=="0")
                    {
                        return
                BMI.text = ("can't be 0")
                    }
            
            if let tempH = height.text, let tempW = weight.text{
                if let DoubleH = Float(tempH), let DoubleW = Float(tempW){
                    Height = DoubleH / 100
                    Weight = DoubleW
                    bmi = Weight / (Height * Height)
                    
                    BMI.text = (String(round(10 * bmi) / 10))
                    
                    
                    switch bmi {
                    case 0...18.5:
                        Background.image = UIImage(named:"Under")
                    case 18.5...25:
                        Background.image = UIImage(named:"Normal")
                    case 25...30:
                        Background.image = UIImage(named:"Danger")
                    default:
                        Background.image = UIImage(named:"Over")
                    }
                    
                    
                    counter += 1
                    Button.setTitle("Reset", for: .normal)
                }else{
                    BMI.text = "try again"
                }
            }else{
                BMI.text = "try again"
            }
                }
                else {
                    height.text = ""
                    weight.text = ""
                    BMI.text = "BMI:"
                    counter = 0
                    Button.setTitle("Get the BMI", for: .normal)
                    Background.image = UIImage(named:"background")
                }
            }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
