//
//  NoteViewController.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 9.12.2022.
//

import UIKit
import Alamofire
import KeychainSwift

class NoteListViewController: BaseViewController<NoteListViewModel> {
        
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NoteTableViewCell.self, forCellReuseIdentifier: NoteTableViewCell.identifier)
        return tableView
    }()
    
    private let addNoteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .appLightBlue
        button.setTitleColor(.white, for: .normal)
        button.width(142)
        button.height(41)
        return button
    }()
    
    private let noteTableViewCell = NoteTableViewCell()
    
    private let keyChainSwift = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContent()
        setLocalize()
        viewModel.addNotesRequest(title: "Lose Yourself", note: """
                        No more games, I'ma change what you call rage
                        Tear this motherfuckin' roof off like two dogs caged
                        I was playin' in the beginning, the mood all changed
                        I've been chewed up and spit out and booed off stage
                        """)
        viewModel.getMyNotes()
    }
}

// MARK: - UILayout
extension NoteListViewController {
    
    private func addSubviews() {
        view.addSubview(searchBar)
        searchBar.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
        
        view.addSubview(tableView)
        tableView.topToBottom(of: searchBar)
        tableView.leadingToSuperview()
        tableView.trailingToSuperview()
        
        view.addSubview(addNoteButton)
        addNoteButton.topToBottom(of: tableView)
        addNoteButton.bottomToSuperview(usingSafeArea: true)
        addNoteButton.centerXToSuperview()
        addNoteButton.height(41)
        addNoteButton.width(142)
    }
}

// MARK: - Configure
extension NoteListViewController {
    
    private func configureContent() {
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        addNoteButton.addTarget(self, action: #selector(addNoteButtonAction), for: .touchUpInside)
        subscribe()
    }
}

// MARK: - SetLocalize
extension NoteListViewController {
    
    private func setLocalize() {
        addNoteButton.setTitle("+ Add Note", for: .normal)
    }
}

// MARK: - Actions
extension NoteListViewController {
    
    @objc
    private func addNoteButtonAction() {

    }
}

// MARK: - Subscribe
extension NoteListViewController {
    
    private func subscribe() {
        viewModel.reloadData = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
}

extension NoteListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.identifier, for: indexPath) as? NoteTableViewCell {
            let cellItem = viewModel.cellItemForAt(indexPath: indexPath)
            cell.setCellItem(viewModel: cellItem)
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
}

extension NoteListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, handler) in
            self?.viewModel.notes.remove(at: indexPath.row)
            self?.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let editAction = UIContextualAction(style: .normal, title: "Edit") { [weak self] (action, view, handler) in
            guard let self = self else { return }
            
        }
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        return configuration
    }
}
