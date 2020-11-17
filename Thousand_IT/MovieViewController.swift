//
//  ViewController.swift
//  Thousand_IT
//
//  Created by Шынгыс on 11/15/20.
//  Copyright © 2020 Шынгыс. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
     

    @IBOutlet var tableView: UITableView!
    private var viewModel = MovieViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPopularMoviesData()
        
        
        
        
    }
    private func loadPopularMoviesData() {
            viewModel.fetchPopulatMoviesData { [weak self] in
                self?.tableView.dataSource = self
                self?.tableView.reloadData()
            }
        }
    }
extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        
        let movie = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(movie)
        
        return cell
    }
}

