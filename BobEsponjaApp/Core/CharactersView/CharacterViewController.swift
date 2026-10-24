//
//  CharacterViewController.swift
//  BobEsponjaApp
//
//  Created by Cristian Guillermo Romero Garcia on 17/10/26.
//

import UIKit

var favoriteCharacters: [CharactersModel] = []

class CharacterViewController: UIViewController {
    
    @IBOutlet weak var characterTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let model = characterTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView(){
        title = "Personajes"
        characterTableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.reuseIdentifier)
        characterTableView.dataSource = self
        characterTableView.delegate = self
        model.filterCharacters(with: "")
        characterTableView.reloadData()
        characterTableView.rowHeight = UITableView.automaticDimension
        characterTableView.estimatedRowHeight = 64
    }
    
}

extension CharacterViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.reuseIdentifier, for: indexPath) as? CharacterTableViewCell else {return UITableViewCell()}
        let character = model.getCharacter(index: indexPath.row)
        cell.configure(with: character)
        return cell
    }
    
    
}

extension CharacterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let charactersDetailView = CharactersDetailViewController()
        charactersDetailView.character = model.getCharacter(index: indexPath.row)
        navigationController?.pushViewController(charactersDetailView, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //Podemos regresar diiferentes secciones con switch
//        switch section{
//        case 0 : return "Bob Esponja"
//        case 1: return "Phineas y Ferb"
//        case 2: return "Los Simpson"
//        default: return ""
//        }
        "Bob Esponja"
    }
    
    //Podemos modificar la altura de la celda
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        300
//    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let addFavorite = UIContextualAction(style: .normal, title: "Agregar favorito") { _, _, completion in
            let character = self.model.characters[indexPath.row]

            if !favoriteCharacters.contains(where: { $0.alias == character.alias}){
                favoriteCharacters.append(character)
            }
            completion(true)
        }
        
        addFavorite.image = UIImage(systemName: "heart.fill")
        addFavorite.backgroundColor = .systemPink
        
        let configuration = UISwipeActionsConfiguration(actions: [addFavorite])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
}


extension CharacterViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        model.filterCharacters(with: searchText)
        characterTableView.reloadData()
    }
}
