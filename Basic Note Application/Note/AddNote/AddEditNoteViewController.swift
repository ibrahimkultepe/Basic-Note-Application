//
//  AddNoteViewController.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 22.12.2022.
//

import UIKit

class AddEditNoteViewController: BaseViewController<AddEditNoteViewModel> {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private let titleTextView = NoteTextView()
    private let subtitleTextView = NoteTextView()
    
    private let saveNoteButton: UIButton = {
        let saveNoteButton = UIButton()
        saveNoteButton.backgroundColor = .appLightBlue
        saveNoteButton.setTitleColor(.white, for: .normal)
        return saveNoteButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContent()
        setLocalize()
    }
}

// MARK: - UILayout
extension AddEditNoteViewController {
    
    private func addSubviews() {
        view.addSubview(stackView)
        stackView.edgesToSuperview(excluding: .bottom, insets: .init(top: 150, left: 20, bottom: 0, right: 20))
        stackView.addArrangedSubview(titleTextView)
        titleTextView.height(50)
        stackView.addArrangedSubview(subtitleTextView)
        subtitleTextView.height(200)
        stackView.setCustomSpacing(50, after: subtitleTextView)
        
        view.addSubview(saveNoteButton)
        saveNoteButton.bottomToSuperview(usingSafeArea: true)
        saveNoteButton.centerXToSuperview()
        saveNoteButton.height(41)
        saveNoteButton.width(142)
    }
}

// MARK: - Configure
extension AddEditNoteViewController {
    
    private func configureContent() {
        view.backgroundColor = .white
        titleTextView.textColor = .appBlack
        titleTextView.font = .systemFont(ofSize: 22, weight: .bold)
        subtitleTextView.font = .systemFont(ofSize: 16, weight: .light)
        subtitleTextView.textColor = .appLightGray
        saveNoteButton.addTarget(self, action: #selector(saveNoteButtonAction), for: .touchUpInside)
        subscribe()
    }
}

// MARK: - SetLocalize
extension AddEditNoteViewController {
    
    private func setLocalize() {
        saveNoteButton.setTitle("Save Note", for: .normal)
        titleTextView.text = viewModel.title
        subtitleTextView.text = viewModel.subtitle
    }
}

// MARK: - Actions
extension AddEditNoteViewController {
    
    @objc
    private func saveNoteButtonAction() {
        guard
            let title = titleTextView.text,
            let subtitle = subtitleTextView.text
        else { return }
        
        if isEditing {
            viewModel.updateNoteRequest(title: title, note: subtitle)
        } else {
            viewModel.addNoteRequest(title: title, note: subtitle)
        }
    }
}

// MARK: - Subscribe
extension AddEditNoteViewController {
    
    private func subscribe() {
        viewModel.pushToNoteListVC = { [weak self] in
            guard let self = self else { return }
            self.navigationController?.popViewController(animated: true)
        }
    }
}
