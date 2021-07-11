//
//  ViewController.swift
//  EfimovEY_HW2.2
//
//  Created by User on 09.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorViewOutlet: UIView!
    
    @IBOutlet weak var redColorLabel: UILabel!
    @IBOutlet weak var greenColorLabel: UILabel!
    @IBOutlet weak var blueColorLabel: UILabel!
    
    @IBOutlet var sliderOutlet: [UISlider]!
    
    @IBOutlet var valueColor: [UILabel]!
    
    enum Color {
        case Red, Green, Blue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        valueColor[0].textColor = UIColor.red
        valueColor[0].text = "\(CGFloat(sliderOutlet[0].value))"
        valueColor[1].textColor = UIColor.green
        valueColor[1].text = "\(CGFloat(sliderOutlet[1].value))"
        valueColor[2].textColor = UIColor.blue
        valueColor[2].text = "\(CGFloat(sliderOutlet[2].value))"
        
        redColorLabel.textColor = UIColor.red
        redColorLabel.text = "\(Color.Red):"
        greenColorLabel.textColor = UIColor.green
        greenColorLabel.text = "\(Color.Green):"
        blueColorLabel.textColor = UIColor.blue
        blueColorLabel.text = "\(Color.Blue):"
        
        sliderOutlet[0].minimumTrackTintColor = UIColor.red
        sliderOutlet[1].minimumTrackTintColor = UIColor.green
        sliderOutlet[2].minimumTrackTintColor = UIColor.blue
        
        colorViewOutlet.layer.cornerRadius = 10.0
        viewBackgroundColor()
    }
    
    private func viewBackgroundColor(){
        colorViewOutlet.backgroundColor = UIColor.init(red: CGFloat(sliderOutlet[0].value), green: CGFloat(sliderOutlet[1].value), blue: CGFloat(sliderOutlet[2].value), alpha: 1)
    }
    private func valueColorText (slider: Int){
        valueColor[slider].text = "\((round(sliderOutlet[slider].value * 100)) / 100)"
    }
    
    @IBAction func redSlider() {
        valueColorText(slider: 0)
        viewBackgroundColor()
    }
    @IBAction func greenSlider() {
        valueColorText(slider: 1)
        viewBackgroundColor()
    }
    @IBAction func blueSlider() {
        valueColorText(slider: 2)
        viewBackgroundColor()
    }
    
}

