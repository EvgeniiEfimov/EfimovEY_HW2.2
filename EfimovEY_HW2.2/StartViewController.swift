//
//  ViewController.swift
//  EfimovEY_HW2.2
//
//  Created by User on 23.07.2021.
//

import UIKit

protocol TransmissionDelegate {
    func  updateView(color: UIColor)
}

class StartViewController: UIViewController {
    
    var valueColor: UIColor?

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingsViewController else { return }
        settingVC.colorViewSettingVC = view.backgroundColor
        settingVC.transmissionDelegate = self
    }
}

extension StartViewController: TransmissionDelegate {
    func updateView(color: UIColor) {
        view.backgroundColor = color
    }
}
