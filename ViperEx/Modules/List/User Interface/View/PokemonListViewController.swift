//
//  PokemonListViewController.swift
//  ViperEx
//
//  Created by Pedro Alvarez on 05/01/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

class PokemonListViewController: UIViewController {

    @IBOutlet weak var sortSegmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: PokemonListPresenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
        setUpNavigation()
        presenter?.viewDidLoad()
    }
    
    @IBAction func sortIndexChanged(_ sender: Any) {
        presenter?.sortBy(selectedIndex: sortSegmentedControl.selectedSegmentIndex)
    }
}

extension PokemonListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.pokemonCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.defaultReuseIdentifier, for: indexPath) as! PokemonTableViewCell
        
        cell.display = presenter?.getPokemon(at: indexPath.row)
        cell.setUp()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectCell(at: indexPath.row)
    }
}

extension PokemonListViewController: PokemonListPresenterOutput {
    
    func updateUIList() {
        DispatchQueue.main.async {
            self.view.stopActivity()
            self.tableView.reloadData()
        }
    }
    
    func updateUISortOtions() {
        DispatchQueue.main.async {
            self.setUpSegmentedControl()
        }
    }
    
    func presentLoading() {
        DispatchQueue.main.async {
            self.view.presentActivity()
        }
    }
}

extension PokemonListViewController {
    
    private func setUpSegmentedControl() {
        sortSegmentedControl.removeAllSegments()
        
        guard let sortOptions = presenter?.sortOptionsModel else { return }
        
        for option in sortOptions {
            guard let index = sortOptions.firstIndex(of: option) else { return }
            sortSegmentedControl.insertSegment(withTitle: option, at: index, animated: true)
        }
        sortSegmentedControl.selectedSegmentIndex = 1
    }
    
    private func setUpTableView() {
        tableView.registerNib(nibName: PokemonTableViewCell.defaultReuseIdentifier, bundle: nil)
        tableView.assignTo(delegate: self, dataSource: self)
    }
    
    private func setUpNavigation() {
        title = presenter?.title
        navigationController?.navigationBar.backgroundColor = .primary
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(self.refresh))
    }
    
    private func setUpSelectedDefault() {
        sortSegmentedControl.selectedSegmentIndex = 1
    }
    
    @objc private func refresh() {
        presenter?.viewDidLoad()
    }
}
