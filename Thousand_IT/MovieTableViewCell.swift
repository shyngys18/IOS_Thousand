//
//  MovieTableViewCell.swift
//  Thousand_IT
//
//  Created by Шынгыс on 11/16/20.
//  Copyright © 2020 Шынгыс. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet var moviePoster: UIImageView!
    
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieYear: UILabel!
    @IBOutlet var movieRate: UILabel!
    
    private var urlString: String = ""
    
    func setCellWithValuesOf(_ movie:Movie) {
        updateUI(title: movie.title, releaseDate: movie.year, rating: movie.rate, poster: movie.posterImage)
    }
    
    
    private func updateUI(title:String?,releaseDate:String?,rating:Double?,poster:String?){
        self.movieTitle.text = title
        self.movieYear.text = convertDateFormater(releaseDate)
        guard let rate = rating else {return}
        self.movieRate.text = String(rate)
        print(String(rate))
        guard let posterString = poster else {return}
        urlString = "https://image.tmdb.org/t/p/w300" + posterString
        
        guard let posterImageURL = URL(string:urlString) else{
            self.moviePoster.image = UIImage(named:"noImageAvailable")
            return
        }
        
        self.moviePoster.image = nil
        
        getImageDataFrom(url: posterImageURL)
        
    }
    private func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle Error
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.moviePoster.image = image
                }
            }
        }.resume()
    }
    
    //Date Converter
    func convertDateFormater(_ date: String?) -> String {
    var fixDate = ""
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    if let originalDate = date {
        if let newDate = dateFormatter.date(from: originalDate) {
            dateFormatter.dateFormat = "dd.MM.yyyy"
            fixDate = dateFormatter.string(from: newDate)
        }
    }
    return fixDate
    
}
}
