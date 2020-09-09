//
//  OderForOnePersonVC.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/08/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

private let reuseIdentifier = "StoreListCell"

class CategoryVC: UIViewController {
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configureTableView(index: Int) -> UIView {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(StoreListCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 120

        tableView.tableFooterView = UIView()

        let height = view.frame.height - 200
        let xPos: Int = 415 * index
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)

        view.frame = CGRect(x: CGFloat(xPos), y: 0, width: 0, height: 0)
        view.sizeToFit()
        view.addSubview(tableView)
        
        
        print("뷰의 사이즈는 11:\(view.frame.height)")
        return view
        
    }
    
}
    
    
    extension CategoryVC : UITableViewDataSource , UITableViewDelegate{
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "슈퍼레드위크"
        }
        
        //헤더뷰
        func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            if let headerView = view as? UITableViewHeaderFooterView {
                headerView.contentView.backgroundColor = .white
                headerView.backgroundView?.backgroundColor = .white
                headerView.textLabel?.textColor = .black
                //            headerView.snp.makeConstraints { (make) in
                //                make.top.equalTo(headerView.snp.top).offset(100)
                //            }
            }
        }
        
        
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 3
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! StoreListCell
            //        cell.
            return cell
        }
        
        // 셀이 선택되었을때 실행할 액션
        //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        <#code#>
        //    }
        
        
    }
