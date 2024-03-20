//
//  InfoTableViewCell.swift
//  MiniJSONProject
//
//  Created by Илья Десятов on 26.02.2024.
//


import UIKit

final class InfoTableViewCell: UITableViewCell {
    
    static let identifier = "InfoTableViewCell"
    
    private lazy var apiLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "api"
        label.backgroundColor = .cyan
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "descripton"
        label.backgroundColor = .red
        return label
    }()
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "category"
        label.backgroundColor = .blue
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
   func configureCell(with user: EntryDates) {
        apiLabel.text = user.api
        descriptionLabel.text = user.description
        categoryLabel.text = user.category
    }
    
    //MARK: - Add the UI components
    
    private func setupUI() {
        contentView.addSubview(apiLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(categoryLabel)
        
        NSLayoutConstraint.activate([
            apiLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            apiLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            apiLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            apiLabel.heightAnchor.constraint(equalToConstant: 32),
            apiLabel.widthAnchor.constraint(equalToConstant: 200),
            
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 24),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 200),
            
            categoryLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            categoryLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
