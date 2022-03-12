//
//  CharacterDetailsViewController.swift
//  RickAndMortyWithVIP
//
//  Created by MacOS on 27.01.2022.
//

import UIKit
protocol CharacterDetailsDisplayLogic: AnyObject {
    func displayCharacter(viewModel: Character.Fetch.ViewModel)
}

class CharacterDetailsViewController: UIViewController {
    var interactor: CharacterDetailsBusinessLogic?
    var router: (CharacterDetailsRoutingLogic & CharacterDetailsDataPassing)?
    var gridFlowLayout = GridFlowLayout()
    var viewModel: Character.Fetch.ViewModel?
    
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var detailsGenderLabel: UILabel!
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var detailsSpeciesLabel: UILabel!
    @IBOutlet weak var detailsStatusLabel: UILabel!
    @IBOutlet weak var detailsNameLabel: UILabel!
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Details"
        self.navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = CharacterDetailsInteractor(worker: CharacterDetailsWorker())
        let presenter = CharacterDetailsPresenter()
        let router = CharacterDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchCharacter()
    }
}

extension CharacterDetailsViewController: CharacterDetailsDisplayLogic {
    
    func displayCharacter(viewModel: Character.Fetch.ViewModel) {
        self.viewModel = viewModel
        detailsStatusLabel.text = viewModel.status
        detailsNameLabel.text = viewModel.name
        let urlString = viewModel.image!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        detailsImageView.kf.setImage(with: URL(string: urlString!))
        detailsSpeciesLabel.text = viewModel.species
        detailsGenderLabel.text = viewModel.gender
        detailsView.dropViewShadow()
        detailsImageView.layer.cornerRadius = 10
        detailsImageView.layer.masksToBounds = true
    }
}


