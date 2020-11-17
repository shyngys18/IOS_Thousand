//
//  ApiService.swift
//  Thousand_IT
//
//  Created by Шынгыс on 11/15/20.
//  Copyright © 2020 Шынгыс. All rights reserved.
//

import Foundation


class ApiService {
    private var dataTask: URLSessionDataTask?
    
    func getPopularMoviesData(completion:@escaping(Result<MoviesData,Error>) -> Void) {
        let popularMoviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=65ce8b655d3a436e6944beb828094187&language=en-US&page=1"
        guard let url = URL(string:popularMoviesURL) else {return}
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                print("Empty Data")
                return
            }
            do {
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode(MoviesData.self, from: data)
                        
                        
                    DispatchQueue.main.async {
                        completion(.success(jsonData))
                    }
                } catch let error {
                        completion(.failure(error))
                    }
                    
            }
                dataTask?.resume()
            
    }
    }

