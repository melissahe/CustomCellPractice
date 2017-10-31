//
//  ViewController.swift
//  CustomTableViewCellPractice
//
//  Created by C4Q on 10/31/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var movies: [Movie] = []
    
    @IBOutlet weak var customTableView: UITableView!
//    @IBOutlet weak var sortSegmentedControl: UISegmentedControl!
    
    //Model - all of the logic and classes that don't touch/interact with the UI
        //They should be in separate files
    
    override func viewDidLoad() {
        loadData()
        super.viewDidLoad()
//        customTableView.delegate = self
        //if you set everything up but your table is blank all the time, you need
        customTableView.dataSource = self
        //If you want your cells to be a certain height automatically, but if it doesn't work out, it won't cut off text
        customTableView.rowHeight = UITableViewAutomaticDimension
//        customTableView.estimatedRowHeight = 200.0

    }
    
    //usually we have functions like this to grab data from the internet, etc. so there's usually more than just a line like this
    func loadData() {
        //how you would sort the information going into the cell, commonplace to use higher ordered functions, like sort
            //if you want to have buttons at the bottom that let you sort the data differently, this is where those
        let allMovies = MovieData.movies
        let sortedMovies = allMovies.sorted{$0.name < $1.name}
        self.movies = sortedMovies
    }
    
    //Table View Delegate Methods - what happens when you tap the table
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    
    //Table View Data Source Methods - Your data source NEEDS to know two pieces of information -> How many rows there will be in the table, and how each cell will look like
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    //while the view controller sets up the information the cell will display, the custom table cell class will set up how 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Identify row to set up
        let rowToSetUp = indexPath.row
        let movieToSetUp = movies[rowToSetUp]
        
        //Identify cell
        let cell = (rowToSetUp % 2 == 0) ? (tableView.dequeueReusableCell(withIdentifier: "Movie Cell", for: indexPath)) : (tableView.dequeueReusableCell(withIdentifier: "Movie Cell 2", for: indexPath))
        
        //Downcast to make sure cell can be returned as our custom table view cell class
        if rowToSetUp % 2 == 0, let movieCell = cell as? MovieTableViewCell {
            //Set up cell
            movieCell.titleLabel.text = "\(movieToSetUp.name) - (\(movieToSetUp.genre))"
            movieCell.descriptionLabel.text = movieToSetUp.description
            //how to make the image appear
            movieCell.moviePosterImageView?.image = UIImage(named: movieToSetUp.posterImageName)
            return movieCell
        } else if let movieRightCell = cell as? MovieRightAlignedTableViewCell {
            //Set up cell
            movieRightCell.titleLabel.text = "\(movieToSetUp.name) - (\(movieToSetUp.genre))"
            movieRightCell.descriptionLabel.text = movieToSetUp.description
            //how to make the image appear
            movieRightCell.moviePosterImageView?.image = UIImage(named: movieToSetUp.posterImageName)
            return movieRightCell
        }
            
//        //Set up cell - generically
//        cell.textLabel?.text = movieToSetUp.name
//        cell.detailTextLabel?.text = movieToSetUp.description
        
        //how would we customize our cells?
        
        return cell
    }
    
    //hard code version
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200 //changes the height for each row, but will cut the text off
//    }
    
    //how to set up segmented control - figure this out later
    @IBAction func sortButtonPressed(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            //sort by movies
            self.movies = movies.sorted{$0.name < $1.name}
        } else if sender.selectedSegmentIndex == 1 {
            //sort by genre
            self.movies = movies.sorted{$0.genre < $1.genre}
        }
        customTableView.reloadData()
    }
    
    
}

