//
//  SplashViewController.swift
//  RickAndMortyWithVIP
//
//  Created by MacOS on 27.01.2022.
//
import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            let storyBoard = UIStoryboard(name: "CharacterList", bundle: nil)
            let destVC = storyBoard.instantiateViewController(withIdentifier: "CharacterListViewController")
            destVC.modalPresentationStyle = .overFullScreen
            self.present(destVC, animated: false, completion: nil)
        }
    }
}

