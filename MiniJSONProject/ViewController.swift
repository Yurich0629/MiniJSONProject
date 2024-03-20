//
//  ViewController.swift
//  MiniJSONProject
//
//  Created by Илья Десятов on 25.02.2024.
//

import UIKit

final class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var itemInfoList: [EntryDates] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        view.addSubview(tableView)
        constraintTableView()
        configureTableView()
        
        NetworkService.sharedObj.getQuotes { entrys in
            self.itemInfoList = entrys
            self.tableView.reloadData()
            print(entrys)
        }
    }
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private func constraintTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.identifier)
        
    }
    
    //MARK: - Table View Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.identifier, for: indexPath) as? InfoTableViewCell else {
            fatalError("Table View could not dequeue a custom cell in View Controller.")
        }
        let model = itemInfoList[indexPath.row]
        cell.configureCell(with: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIViewController()
        let model = itemInfoList[indexPath.row]
        vc.view.backgroundColor = .yellow
        let button = UIButton(frame: .init(x: 50, y: 10, width: 100, height: 100))
        button.backgroundColor = .red
        button.setTitle(model.category, for: .normal)
        vc.view.addSubview(button)
        self.present(vc, animated: true)
    }
    
}
