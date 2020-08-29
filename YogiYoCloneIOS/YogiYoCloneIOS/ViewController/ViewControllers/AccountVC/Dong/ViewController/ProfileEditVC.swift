//
//  ProfileEditVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/29.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class ProfileEditVC: UIViewController {
    
    // MARK: Properties
    var user: User? {
        didSet {
            print(user)
        }
    }
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        return tableView
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavi()
        configure()
        configureViews()
    }
    
    // MARK: @Objc
    @objc private func didTapDismissButton() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: Helpers
    private func configureNavi() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        title = "내 정보 수정"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(didTapDismissButton))
    }
    
    // MARK: Configure
    private func configure() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(EmailIDCell.self, forCellReuseIdentifier: EmailIDCell.cellID)
        tableView.register(PasswordCell.self, forCellReuseIdentifier: PasswordCell.cellID)
        tableView.register(PhoneInfoCell.self, forCellReuseIdentifier: PhoneInfoCell.cellID)
        tableView.register(NickNameCell.self, forCellReuseIdentifier: NickNameCell.cellID)
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        view.backgroundColor = .red
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension ProfileEditVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        65
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EmailIDCell.cellID, for: indexPath) as? EmailIDCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PasswordCell.cellID, for: indexPath) as? PasswordCell else { return UITableViewCell() }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PhoneInfoCell.cellID, for: indexPath) as? PhoneInfoCell else { return UITableViewCell() }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NickNameCell.cellID, for: indexPath) as? NickNameCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
}
