//
//  PokemonDetailsPresenter.swift
//  ViperEx
//
//  Created by Pedro Alvarez on 05/01/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import Foundation

protocol PokemonDetailsPresenterInput {
    var output: PokemonDetailsPresenterOutput? { get set }
    var details: PokemonDetailsViewModel? { get }
    
    func viewWillAppear()
    func viewDidAppear()
    func nextButtonPressed()
    func previousButtonPressed()
}

protocol PokemonDetailsPresenterOutput: class {
    func updateUI()
    func presentLoading()
}

class PokemonDetailsPresenter: PokemonDetailsPresenterInput {
    
    weak var output: PokemonDetailsPresenterOutput?
    var interactor: PokemonDetailsInteractorInput
    var router: PokemonDetailsRouter
    
    var details: PokemonDetailsViewModel? {
        return viewModel
    }
    
    private var viewModel: PokemonDetailsViewModel? {
        didSet {
            output?.updateUI()
        }
    }
    
    init(interactor: PokemonDetailsInteractorInput, router: PokemonDetailsRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewWillAppear() {
        output?.presentLoading()
    }
    
    func viewDidAppear() {
        interactor.fetchDetails(id: router.id)
    }
    
    func nextButtonPressed() {
        output?.presentLoading()
        
        let id = viewModel?.id ?? 1
        interactor.fetchDetails(id: id + 1)
    }
    
    func previousButtonPressed() {
        output?.presentLoading()
        
        let id = viewModel?.id ?? 1
        interactor.fetchDetails(id: id - 1)
    }
}

extension PokemonDetailsPresenter: PokemonDetailsInteractorOutput {
    
    func fetchedDetails(_ details: PokemonDetailsEntity) {
        viewModel = PokemonMapper.parse(from: details)
    }
}
