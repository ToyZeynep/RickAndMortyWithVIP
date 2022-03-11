//
//  Alert.swift
//  RickAndMortyWithVIP
//
//  Created by MacOS on 11.03.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alertViewController, animated: true, completion: nil)
    }
    
    func alertAction(title: String, message: String, action: UIAlertAction) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}
