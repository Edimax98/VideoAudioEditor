//
//  ViewController.swift
//  PhotoVideoEditor
//
//  Created by Даниил on 13.09.2018.
//  Copyright © 2018 Даниил. All rights reserved.
//

import UIKit

class LangingPageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let colorForOddCell = UIColor(red: 45 / 255, green: 46 / 255, blue: 73 / 255, alpha: 1)
    fileprivate let colorForEvenCell = UIColor(red: 60 / 255, green: 61 / 255, blue: 98 / 255, alpha: 1)
    fileprivate let titlesForSection = ["Music, Voice & Sounds", "Customize your video",
                                        "Animated Stickers & Text", "Amazing filters",
                                        "Convertation & Share"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "HeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: HeaderView.identifier)
        tableView.register(UINib(nibName: "MusicCustomisationCell", bundle: nil), forCellReuseIdentifier: MusicCustomisationCell.identifier)
        tableView.register(UINib(nibName: "VideoCustomisationCell", bundle: nil), forCellReuseIdentifier: VideoCustomisationCell.identifier)
    }
    
    fileprivate func getBackgroundColor(for section: Int) -> UIColor {
        if section % 2 == 0 {
            return colorForEvenCell
        } else {
         return colorForOddCell
        }
    }
}

// MARK: - UITableViewDataSource
extension LangingPageViewController: UITableViewDataSource {
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicCustomisationCell.identifier, for: indexPath) as? MusicCustomisationCell else {
                return UITableViewCell()
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: VideoCustomisationCell.identifier, for: indexPath) as? VideoCustomisationCell else {
                return UITableViewCell()
            }
            return cell
        default:
            break
        }
        
       return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension LangingPageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.identifier) as? HeaderView else {
            return UIView()
        }
        header.containerView.backgroundColor = getBackgroundColor(for: section)
        header.sectionTitleLabel.text = titlesForSection[section]
    
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 1))
        view.backgroundColor = getBackgroundColor(for: section)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return 510
        case 1:
            return 600
        default:
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
}







