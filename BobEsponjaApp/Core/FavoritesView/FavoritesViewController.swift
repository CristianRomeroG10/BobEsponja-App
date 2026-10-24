//
//  FavoritesViewController.swift
//  BobEsponjaApp
//
//  Created by Cristian Guillermo Romero Garcia on 17/10/26.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var favoritesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favoritesTableView.reloadData()
    }

    private func setUpView(){
        title = "Favoritos"
        view.backgroundColor = .systemBackground
        favoritesTableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: FavoritesTableViewCell.reuseIdentifier)
        favoritesTableView.dataSource = self
        favoritesTableView.delegate = self
        favoritesTableView.rowHeight = UITableView.automaticDimension
        favoritesTableView.estimatedRowHeight = 75
    }


}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.reuseIdentifier, for: indexPath) as? FavoritesTableViewCell else {
            return UITableViewCell()
        }
        let favorite = favoriteCharacters[indexPath.row]
        cell.configuration(with: favorite)
        return cell
        
    }
    


}

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favoriteDatail =  CharactersDetailViewController()
        favoriteDatail.character = favoriteCharacters[indexPath.row]
        self.navigationController?.pushViewController(favoriteDatail, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteFavorite = UIContextualAction(style: .destructive, title: "Eliminar Favorito") { _, _, complention in
            favoriteCharacters.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            complention(true)
        }
        deleteFavorite.image = UIImage(systemName: "trash")
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteFavorite])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
}
