//
//  CharacterViewController.swift
//  BobEsponjaApp
//
//  Created by Cristian Guillermo Romero Garcia on 17/10/26.
//

import UIKit

class CharacterViewController: UIViewController {
    
    @IBOutlet weak var characterTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView(){
        characterTableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.reuseIdentifier)
    }
    
}
