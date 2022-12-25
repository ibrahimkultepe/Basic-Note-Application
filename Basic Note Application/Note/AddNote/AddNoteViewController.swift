//
//  AddNoteViewController.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 22.12.2022.
//

import UIKit

class AddNoteViewController: BaseViewController<AddNoteViewModel> {
    
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
extension AddNoteViewController {
    
    private func addSubviews() {
        view.addSubview(stackView)
        
        stackView.edgesToSuperview(excluding: .bottom, insets: .init(top: 100, left: 20, bottom: 0, right: 20))
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
extension AddNoteViewController {
    private func configureContent() {
        view.backgroundColor = .white
        titleTextView.textColor = .appBlack
        titleTextView.font = .systemFont(ofSize: 22, weight: .bold)
        subtitleTextView.font = .systemFont(ofSize: 16, weight: .light)
        subtitleTextView.textColor = .appLightGray
        saveNoteButton.addTarget(self, action: #selector(saveNoteButtonAction), for: .touchUpInside)
    }
}
// MARK: - SetLocalize
extension AddNoteViewController {
    
    private func setLocalize() {
        saveNoteButton.setTitle("Save Note", for: .normal)
    }
}
// MARK: - Actions
extension AddNoteViewController {
    
    @objc
    private func saveNoteButtonAction() {
        guard
            let unwrappedTitle = titleTextView.text,
            let unwrappedSubtitle = subtitleTextView.text
        else { return }
        viewModel.addNoteRequest(title: unwrappedTitle, note: unwrappedSubtitle)
        
        navigationController?.popViewController(animated: true)
    }
}
