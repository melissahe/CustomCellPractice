//
//  Movie.swift
//  CustomTableViewCellPractice
//
//  Created by C4Q on 10/31/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import Foundation

class Movie {
    var name: String
    var year: Int
    var genre: String
    var cast: [String]
    var locations: [String]
    var posterImageName: String
    public var description: String
    init(name: String, year: Int, genre: String, cast: [String], locations: [String], posterImageName: String, description: String) {
        self.name = name
        self.year = year
        self.genre = genre
        self.cast = cast
        self.locations = locations
        self.posterImageName = posterImageName
        self.description = description
    }
}
