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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 10, left: 4, bottom: 10, right: 4)
        contentView.frame = contentView.frame.inset(by: margins)
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = UIColor.white
        contentView.layer.borderColor = UIColor.systemBlue.cgColor
        contentView.layer.borderWidth = 0.7
        contentView.clipsToBounds = true
        characterImageView.layer.cornerRadius = 8
        characterImageView.clipsToBounds = true
    }
    
    func configure(viewModel: Characters.Fetch.ViewModel.Character) {
        characterNameLabel.text = viewModel.name
        characterStatusLabel.text = viewModel.status
        let urlString = viewModel.image!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        characterImageView.kf.setImage(with: URL(string: urlString!))
    }

}
