//
//  TrackDetailViewController.swift
//  ItunesTable
//
//  Created by Isaac on 9/7/18.
//  Copyright © 2018 Mudpie. All rights reserved.
//

import UIKit

class TrackDetailViewController: UIViewController {
  @IBOutlet weak var imageAlbum: UIImageView!
  @IBOutlet weak var labelTrackName: UILabel!
  @IBOutlet weak var labelArtistName: UILabel!
  var detailTrack: Track?
    override func viewDidLoad() {
        super.viewDidLoad()
      if let track = detailTrack {
         iniViewTrack(detail: track)
      }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func iniViewTrack(detail: Track) {
    do{
      let urlImage = URL(string: detail.artworkUrl100)
      let dataImage = try Data(contentsOf: urlImage!)
      imageAlbum.image = UIImage(data: dataImage)
    }catch{
      print(error)
    }
    labelTrackName.text = detail.trackName
    labelArtistName.text = detail.artistName
  }

}
