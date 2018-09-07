//
//  ViewController.swift
//  ItunesTable
//
//  Created by Isaac on 9/7/18.
//  Copyright © 2018 Mudpie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource {
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var tableView: UITableView!
  var tracks : [Track] = []
  let BaseURL = URL(string: "https://itunes.apple.com/search?")!

  override func viewDidLoad() {
    super.viewDidLoad()
    searchBar.delegate = self
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toSecond"{
      let indexPath = tableView.indexPathForSelectedRow
      let destination = segue.destination as! TrackDetailViewController
      destination.detailTrack = tracks[(indexPath?.row)!]
    }
  }
  
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    if searchText.isEmpty {
      searchBar.resignFirstResponder()
      tracks.removeAll()
      tableView.reloadData()
    }
  }
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    fetchData(name: searchBar.text!)
    searchBar.text?.removeAll()
    searchBar.resignFirstResponder()
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tracks.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "TrackCell", for: indexPath) as? TrackCell else {fatalError("Could not dequeue a cell")}
    let track = self.tracks[indexPath.row]
    cell.bindToTrack(track: track)
    return cell
  }

  
  func fetchData(name: String){
    let query : [String: String] = [
      "term" : name,
      "limit": "50"
    ]
    let url =  BaseURL.withQueries(query)
    let jsonDecoder = JSONDecoder()
    let task = URLSession.shared.dataTask(with: url!){ (data, response, error) in
      if let data = data, let trackList = try? jsonDecoder.decode(Results.self, from: data)
      {
        var temp:[Track] = []
        trackList.results.forEach({ (track) in
          temp.append(track)
        })
        self.tracks = temp
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      }else{
        print(error.debugDescription)
      }
    }
    task.resume()
  }
}
