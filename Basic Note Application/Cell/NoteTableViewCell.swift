//
//  NoteTableViewCell.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 10.12.2022.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    static let identifier: String = "CustomTableViewCell"
    var notes: NoteModel?


    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    public let titleLabel: UILabel = {
       let title = UILabel()
        title.textColor = .appBlack
        title.font = .systemFont(ofSize: 14, weight: .bold)
        return title
    }()
    
    public let subtitleLabel: UILabel = {
       let subtitle = UILabel()
        subtitle.textColor = .appLightGray
        subtitle.font = .systemFont(ofSize: 14, weight: .bold)
        subtitle.numberOfLines = 3
        return subtitle
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(stackView)
        stackView.edgesToSuperview(insets: .init(top: 10, left: 24, bottom: 24, right: 24))
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
    }
    
    func setCellItem(viewModel: NoteModel) {
        self.notes = viewModel
        let url = baseUrl + "users/me/notes?page=1"
        self.titleLabel.text = notes?.title
        self.subtitleLabel.text = notes?.note
    }
}
