//
//  MovieViewModel.swift
//  Thousand_IT
//
//  Created by Шынгыс on 11/16/20.
//  Copyright © 2020 Шынгыс. All rights reserved.
//

import Foundation


class MovieViewModel{
    private var apiService = ApiService()
    private var popularMovies = [Movie]()
    
    
    
    func fetchPopulatMoviesData(completion:@escaping() -> ()){
        apiService.getPopularMoviesData{[weak self](result) in
            
            switch result{
            case.success(let listOf):
                self?.popularMovies = listOf.movies
                completion()
            case.failure(let error):
                print("Error process:\(error)")
            }
    }
    }
    func numberOfRowsInSection(section:Int) -> Int{
        if popularMovies.count != 0{
            return popularMovies.count
        }
        return  0
    }
    
    func cellForRowAt(indexPath:IndexPath) -> Movie{
        return popularMovies[indexPath.row]
    }
}
