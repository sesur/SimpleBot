//
//  ViewController.swift
//  Autolayout
//
//  Created by Sergiu on 2/14/19.
//  Copyright © 2019 Sergiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var showLabel: UILabel!
    @IBOutlet private weak var whatYouShouldWatchLabel: UILabel!
    @IBOutlet private weak var addRestaurantTextFied: UITextField!
    @IBOutlet private weak var showStackView: UIStackView!
    @IBOutlet private weak var staticRestaurantShow: UILabel!
    @IBOutlet private weak var restaurantSpokenStackView: UIStackView!
    @IBOutlet private weak var addRestaurantStackView: UIStackView!
    
    private var showArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [showStackView, restaurantSpokenStackView].forEach {
            $0?.isHidden = true
        }
        showStackView.isHidden = true
        restaurantSpokenStackView.isHidden = true
        
    }
    
    @IBAction private func whatRestaurantButtonPressed(_ sender: UIButton) {
        whatYouShouldWatchLabel.text = showArray.randomElement()
        
        [whatYouShouldWatchLabel, staticRestaurantShow].forEach {
            $0?.isHidden = false
        }
    }

    @IBAction private func addRestaurantButtonPressed(_ sender: UIButton) {
        updateShows()
    }
    
    private func updateShows() {
        guard let text = addRestaurantTextFied.text else {return}
        if !text.isEmpty {
            showArray.append(text)
            showStackView.isHidden = false
            updateShowLabel()
            
            if showArray.count > 1 {
                restaurantSpokenStackView.isHidden = false
                if !whatYouShouldWatchLabel.text!.isEmpty  {
                    staticRestaurantShow.isHidden = false
                    whatYouShouldWatchLabel.isHidden = false
                } else {
                    staticRestaurantShow.isHidden = true
                    whatYouShouldWatchLabel.isHidden = true
                }
            }
            addRestaurantTextFied.text = ""
        }
    }
    
    private func updateShowLabel(){
        showLabel.text = showArray.joined(separator: ", ")
    }
    
}
