//
//  CharacterListCollectionViewCell.swift
//  RickAndMortyWithVIP
//
//  Created by MacOS on 27.01.2022.
//

import UIKit
import Kingfisher

class CharacterListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterStatusLabel: UILabel!
    @IBOutlet weak var characterNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(viewModel: Characters.Fetch.ViewModel.Character) {
        characterNameLabel.text = viewModel.name
        characterStatusLabel.text = viewModel.status
        let urlString = viewModel.image!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        characterImageView.kf.setImage(with: URL(string: urlString!))
    }

}
