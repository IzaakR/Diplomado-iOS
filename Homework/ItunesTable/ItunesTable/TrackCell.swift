//
//  TrackCell.swift
//  ItunesTable
//
//  Created by Isaac on 9/7/18.
//  Copyright © 2018 Mudpie. All rights reserved.
//

import UIKit

class TrackCell: UITableViewCell {
  @IBOutlet weak var imageAlbum: UIImageView!
  @IBOutlet weak var labelNameTrack: UILabel!
  @IBOutlet weak var labelNameArtist: UILabel!
  
  func bindToTrack(track: Track) {
    do{
      let urlImage = URL(string: track.artworkUrl100)
      let dataImage = try Data(contentsOf: urlImage!)
      imageAlbum.image = UIImage(data: dataImage)
    }catch{
      print(error)
    }
    labelNameTrack.text = track.trackName
    labelNameArtist.text = track.artistName
  }
}
