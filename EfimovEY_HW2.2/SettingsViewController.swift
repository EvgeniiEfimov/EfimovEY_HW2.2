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

class SettingsViewController: UIViewController {

    @IBOutlet weak var colorViewOutlet: UIView!
    
    @IBOutlet weak var redColorLabel: UILabel!
    @IBOutlet weak var greenColorLabel: UILabel!
    @IBOutlet weak var blueColorLabel: UILabel!
    
    @IBOutlet var sliderOutlet: [UISlider]!
    
    @IBOutlet var valueColor: [UILabel]!
    
    @IBOutlet weak var redColorTF: UITextField!
    @IBOutlet weak var greenColorTF: UITextField!
    @IBOutlet weak var blueColorTF: UITextField!
    
    var transmissionDelegate: TransmissionDelegate!
    var colorViewSettingVC: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startSetingUI()
        setingSlider()
        setingsTF()
        
        colorViewOutlet.backgroundColor = colorViewSettingVC
        
        redColorTF.delegate = self
        greenColorTF.delegate = self
        blueColorTF.delegate = self
        
        setingsTF()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func doneButtonPressed() {
        view.endEditing(true)
        transmissionDelegate.updateView(color: UIColor(
                                            red: CGFloat(sliderOutlet[0].value),
                                            green: CGFloat(sliderOutlet[1].value),
                                            blue: CGFloat(sliderOutlet[2].value),
                                            alpha: 1))
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func allSliderAction(_ sender: UISlider) {
        viewBackgroundColor()
        switch sender.tag {
        case 1:
            valueColorText(slider: 0)
            redColorTF.text = valueColor[0].text
        case 2:
            valueColorText(slider: 1)
            greenColorTF.text = valueColor[1].text
        default:
            valueColorText(slider: 2)
            blueColorTF.text = valueColor[2].text
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
            if textField == redColorTF { greenColorTF.becomeFirstResponder()
            } else if textField == greenColorTF { blueColorTF.becomeFirstResponder()
            } else { doneButtonPressed()}
            return true
        }
    
    private func startSetingUI () {
        guard let colorViewStartVC = colorViewSettingVC.cgColor.components else { return }
        sliderOutlet[0].value = Float(colorViewStartVC[0])
        sliderOutlet[1].value = Float(colorViewStartVC[1])
        sliderOutlet[2].value = Float(colorViewStartVC[2])
       
        valueColorText(slider: 0)
        valueColorText(slider: 1)
        valueColorText(slider: 2)
        
        valueColor[0].textColor = UIColor.red
        valueColor[1].textColor = UIColor.green
        valueColor[2].textColor = UIColor.blue
        
        redColorLabel.textColor = UIColor.red
        greenColorLabel.textColor = UIColor.green
        blueColorLabel.textColor = UIColor.blue
        redColorLabel.text = "\(Color.Red):"
        greenColorLabel.text = "\(Color.Green):"
        blueColorLabel.text = "\(Color.Blue):"
    }
    
    private func setingsTF() {
        redColorTF.text = valueColor[0].text
        greenColorTF.text = valueColor[1].text
        blueColorTF.text = valueColor[2].text
    }
    
    private func setingSlider() {
        sliderOutlet[0].minimumTrackTintColor = UIColor.red
        sliderOutlet[1].minimumTrackTintColor = UIColor.green
        sliderOutlet[2].minimumTrackTintColor = UIColor.blue
        
        colorViewOutlet.layer.cornerRadius = 10.0
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

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue) else { return }
        textField.text = String(format: "%.2f", numberValue)
        switch textField {
        case redColorTF:
            sliderOutlet[0].value = numberValue
            viewBackgroundColor()
            valueColorText(slider: 0)
        case greenColorTF:
            sliderOutlet[1].value = numberValue
            viewBackgroundColor()
            valueColorText(slider: 1)
        default:
            sliderOutlet[2].value = numberValue
            viewBackgroundColor()
            valueColorText(slider: 2)
        }
    }
}


