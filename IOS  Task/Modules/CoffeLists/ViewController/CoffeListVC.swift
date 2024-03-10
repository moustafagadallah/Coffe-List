//
//  CoffeListVC.swift
//  IOS  Task
//
//  Created by Moustafa Gadallah on 29/08/1445 AH.
//

import UIKit

class CoffeListVC: UIViewController {
   
    // MARK: - Outlets
    @IBOutlet weak var coffeTableView: UITableView!


    

    // MARK: - Variabels
    lazy var viewModel = CoffeListViewModel()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
    viewModel.getCoffeList()
      
        setupViewModel()
        setupTableView()
        pulltoRefresh()
    }
    
    
    // MARK: - SetupViewModel
    
    func setupViewModel() {
        
        viewModel.navigateToViewController = { [unowned self] (vc) in
        
            self.navigationController?.pushViewController(vc, animated: true)

            
        }
        
        viewModel.reloadTableView = { [unowned self] in
            
            self.coffeTableView.reloadData()
        }
        
        viewModel.removeRefreshController = { [unowned self] in
            
            self.coffeTableView.refreshControl?.endRefreshing()
        }
        
        
    }
    
    // MARK: - Helper Methods
    func setupTableView() {
        
        self.coffeTableView.delegate = self
        self.coffeTableView.dataSource = self
    }
    
    func pulltoRefresh() {
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        coffeTableView.refreshControl = refreshControl
        
    }
    
    @objc func handleRefresh(){
        
        viewModel.getCoffeList()
        
    }

    
    // MARK: - Initialization
    
    class func initializeFromStoryboard() -> CoffeListVC {
        
        let storyboard = UIStoryboard(name: StoryBoards.CoffeListVC, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: CoffeListVC.self)) as! CoffeListVC
    }

    
    

}

// MARK: - UITableViewDelegate

extension CoffeListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        viewModel.didSelectItem(atIndex: indexPath.row)
        
    }
    
}
    
    
// MARK: - UITableViewDataSource

extension CoffeListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CoffeTableViewCell.self), for: indexPath) as! CoffeTableViewCell
        let item = viewModel.coffee(atIndex: indexPath.row)
        cell.showCoffe(item)

        return cell
        
    }
    
    
    
    
    
    
    
}

