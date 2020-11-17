//
//  Model.swift
//  Thousand_IT
//
//  Created by Шынгыс on 11/15/20.
//  Copyright © 2020 Шынгыс. All rights reserved.
//

import Foundation

struct MoviesData:Decodable{
    let movies : [Movie]

private enum CodingKeys:String,CodingKey{
    case movies = "results"
}
}
struct Movie:Decodable{
    let title : String?
    let year :  String?
    let rate : Double?
    let posterImage : String?

    private enum CodingKeys:String,CodingKey{
        case title
        case year = "release_date"
        case rate = "vote_average"
        case posterImage = "poster_path"
}
}
