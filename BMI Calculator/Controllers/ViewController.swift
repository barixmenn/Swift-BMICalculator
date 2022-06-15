//
//  ViewController.swift
//  BMI Calculator


import UIKit

class ViewController: UIViewController {


    var calculatorBrain =  CalculatorBrain()
   
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightProgressBar(_ sender: UISlider) {
        heightLabel.text =  String(format: "%.2f", sender.value )
    }
    
    @IBAction func weightProgressBar(_ sender: UISlider) {
        weightLabel.text =  String(format: "%.0f", sender.value )
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        let weight = weightSlider.value
        let height = heightSlider.value
        
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        
        self.performSegue(withIdentifier: "result", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "result" {
            let destinationVC = segue.destination as!  ResultViewController
            destinationVC.bmiValue  = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}



