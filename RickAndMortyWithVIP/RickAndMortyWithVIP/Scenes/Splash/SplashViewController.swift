//
//  SplashViewController.swift
//  RickAndMortyWithVIP
//
//  Created by MacOS on 27.01.2022.
//
import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var splashImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        splashImageView.image = UIImage(named: "splash")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let storyBoard = UIStoryboard(name: "CharacterList", bundle: nil)
            let destVC = storyBoard.instantiateViewController(withIdentifier: "CharacterListViewController")
            destVC.modalPresentationStyle = .overFullScreen
            self.navigationController?.pushViewController(destVC, animated: false)
        }
    }
}

