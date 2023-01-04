//
//  NoteViewController.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 9.12.2022.
//

import UIKit

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
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContent()
        setLocalize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        let addNoteVC = AddEditNoteViewController(viewModel: AddEditNoteViewModel())
        self.navigationController?.pushViewController(addNoteVC, animated: true)
    }
}

// MARK: - Subscribe
extension NoteListViewController {
    
    private func subscribe() {
        viewModel.reloadData = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
        
        viewModel.deleteRow = { [weak self] (indexPath) in
            guard let self = self else { return }
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.endUpdates()
        }
    }
}

// MARK: - UITableViewDataSource
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

// MARK: - UITableViewDelegate
extension NoteListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, handler) in
            guard let id = self?.viewModel.cellItemForAt(indexPath: indexPath).id else { return }
            self?.viewModel.deleteNoteRequest(noteId: id, indexPath: indexPath)
        }
        let editAction = UIContextualAction(style: .normal, title: "Edit") { [weak self] (action, view, handler) in
            guard let self = self else { return }
            let addEditNoteViewModel = AddEditNoteViewModel()
            let addEditNoteVC = AddEditNoteViewController(viewModel: addEditNoteViewModel)
            addEditNoteViewModel.isNoteEditing = true
            addEditNoteViewModel.note = self.viewModel.notes[indexPath.row]
            self.navigationController?.pushViewController(addEditNoteVC, animated: true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        return configuration
    }
}
