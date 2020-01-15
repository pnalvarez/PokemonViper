//
//  PokemonDetailsViewController.swift
//  ViperEx
//
//  Created by Pedro Alvarez on 05/01/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit
import SDWebImage

class PokemonDetailsViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var presenter: PokemonDetailsPresenterInput?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter?.viewDidAppear()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
    
    @IBAction func previousButtonPressed(_ sender: Any) {
        presenter?.previousButtonPressed()
    }
    @IBAction func nextButtonPressed(_ sender: Any) {
        presenter?.nextButtonPressed()
    }
}

extension PokemonDetailsViewController: PokemonDetailsPresenterOutput {
    
    func updateUI() {
        let display = presenter?.details
        
        DispatchQueue.main.async {
            self.view.stopActivity()
        }
        
        title = display?.name
        infoLabel.text = display?.info
        typeLabel.text = "Tipo: \(display?.types ?? "")"
        attackLabel.text = "Ataque: \(display?.mainMove ?? "")"
        imageView.sd_setImage(with: display?.image, completed: nil)
        
        presenter?.handleSideButtons()
    }
    
    func presentLoading() {
        title = ""
        DispatchQueue.main.async {
            self.view.presentActivity()
        }
    }
    
    func showNextButton() {
        nextButton.alpha = 1.0
    }
    func fadeNextButton() {
        nextButton.alpha = 0.0
    }
    func showPreviousButton() {
        previousButton.alpha = 1.0
    }
    func fadePreviousButton() {
        previousButton.alpha = 0.0
    }
}


