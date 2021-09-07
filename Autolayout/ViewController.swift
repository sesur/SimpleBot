//
//  ViewController.swift
//  Autolayout
//
//  Created by Sergiu on 2/14/19.
//  Copyright © 2019 Sergiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private (set) weak var showLabel: UILabel!
    @IBOutlet private (set) weak var watchLabel: UILabel!
    @IBOutlet private (set) weak var addTextFied: UITextField!
    @IBOutlet private (set) weak var showStackView: UIStackView!
    @IBOutlet private (set) weak var staticShowLabel: UILabel!
    @IBOutlet private (set) weak var suggestRestaurantStackView: UIStackView!
    @IBOutlet private (set) weak var addRestaurantStackView: UIStackView!
    @IBOutlet private (set) weak var suggestButton: UIButton!
    @IBOutlet private (set) weak var addButton: UIButton!
    
    private var showArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [showStackView, suggestRestaurantStackView].forEach {
            $0?.isHidden = true
        }
        showStackView.isHidden = true
        suggestRestaurantStackView.isHidden = true
        
    }
    
    @IBAction private func whatRestaurantButtonPressed(_ sender: UIButton) {
        watchLabel.text = showArray.randomElement()
        
        [watchLabel, staticShowLabel].forEach {
            $0?.isHidden = false
        }
    }

    @IBAction private func addRestaurantButtonPressed(_ sender: UIButton) {
        updateShows()
    }
    
    private func updateShows() {
        guard let text = addTextFied.text else {return}
        if !text.isEmpty {
            showArray.append(text)
            showStackView.isHidden = false
            updateShowLabel()
            
            if showArray.count > 1 {
                suggestRestaurantStackView.isHidden = false
                if !watchLabel.text!.isEmpty  {
                    staticShowLabel.isHidden = false
                    watchLabel.isHidden = false
                } else {
                    staticShowLabel.isHidden = true
                    watchLabel.isHidden = true
                }
            }
            addTextFied.text = ""
        }
    }
    
    private func updateShowLabel(){
        showLabel.text = showArray.joined(separator: ", ")
    }
    
}
