//
//  ViewController.swift
//  EfimovEY_HW2.2
//
//  Created by User on 09.07.2021.
//

import UIKit

enum Color {
    case Red, Green, Blue
}

class ViewController: UIViewController {

    @IBOutlet weak var colorViewOutlet: UIView!
    
    @IBOutlet weak var redColorLabel: UILabel!
    @IBOutlet weak var greenColorLabel: UILabel!
    @IBOutlet weak var blueColorLabel: UILabel!
    
    @IBOutlet var sliderOutlet: [UISlider]!
    
    @IBOutlet var valueColor: [UILabel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueColor[0].textColor = UIColor.red
        valueColor[1].textColor = UIColor.green
        valueColor[2].textColor = UIColor.blue
        valueColor[0].text = "\(CGFloat(sliderOutlet[0].value))"
        valueColor[1].text = "\(CGFloat(sliderOutlet[1].value))"
        valueColor[2].text = "\(CGFloat(sliderOutlet[2].value))"
        
        redColorLabel.textColor = UIColor.red
        greenColorLabel.textColor = UIColor.green
        blueColorLabel.textColor = UIColor.blue
        redColorLabel.text = "\(Color.Red):"
        greenColorLabel.text = "\(Color.Green):"
        blueColorLabel.text = "\(Color.Blue):"
        setingSlider()
    }
    
    @IBAction func allSliderAction(_ sender: UISlider) {
        viewBackgroundColor()
        switch sender.tag {
        case 1:
            valueColorText(slider: 0)
        case 2:
            valueColorText(slider: 1)
        default:
            valueColorText(slider: 2)
        }
    }
    
    private func setingSlider() {
        sliderOutlet[0].minimumTrackTintColor = UIColor.red
        sliderOutlet[1].minimumTrackTintColor = UIColor.green
        sliderOutlet[2].minimumTrackTintColor = UIColor.blue
        
        colorViewOutlet.layer.cornerRadius = 10.0
        viewBackgroundColor()
    }
    
    private func viewBackgroundColor(){
        colorViewOutlet.backgroundColor = UIColor(
            red: CGFloat(sliderOutlet[0].value),
            green: CGFloat(sliderOutlet[1].value),
            blue: CGFloat(sliderOutlet[2].value),
            alpha: 1)
    }
    private func valueColorText (slider: Int){
        valueColor[slider].text = "\((round(sliderOutlet[slider].value * 100)) / 100)"
    }
}

