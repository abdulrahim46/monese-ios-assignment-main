import UIKit

class HomeViewController: UIViewController {
    
    //MARK: view & properties
    
    private let tableView = UITableView()
    private var launches: [Launch] = []
    private var viewModel = HomeViewModel()
    private(set) var loadingIndicator = UIActivityIndicatorView(style: .medium)
    private let refreshControl = UIRefreshControl()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Lifecycle methods
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupActivityLoader()
        configureTableView()
        fetchAllLaunches()
        addNavigationItem()
        swipeToRefresh()
    }
    
    //MARK: Setting the views
    /// navigation right button setup
    private func addNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Sort",
            style: .plain,
            target: self,
            action: #selector(sortButtonAction)
        )
    }
    
    private func swipeToRefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    // setup tableview here
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    // setting activity indicator here
    private func setupActivityLoader() {
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingIndicator)
        loadingIndicator.startAnimating()
        NSLayoutConstraint.activate([
            loadingIndicator.topAnchor.constraint(equalTo: view.topAnchor),
            loadingIndicator.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    //MARK: fetching data from view model
    
    private func fetchAllLaunches() {
        viewModel.getAllLaunches(completion: { [weak self] response, err in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.tableView.isHidden = false
                self?.loadingIndicator.stopAnimating()
                self?.refreshControl.endRefreshing()
            }
        })
    }
    
    
    // MARK: handle actions
    
    /// sorting action on tap of specific sorts
    @objc func sortButtonAction() {
        /// create the alert
        let alert = UIAlertController(title: "Sort", message: "", preferredStyle: UIAlertController.Style.alert)
        
        /// add the success actions (buttons)
        alert.addAction(UIAlertAction(title: "Success", style: UIAlertAction.Style.default, handler: { [weak self] action in
            self?.filterData(index: 0)
        }))
        
        /// add the success actions (buttons)
        alert.addAction(UIAlertAction(title: "Failure", style: UIAlertAction.Style.default, handler: { [weak self] action in
            self?.filterData(index: 1)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        
        /// show the alert
        DispatchQueue.main.async { [weak self]  in
            self?.present(alert, animated: true, completion: nil)
        }
    }
    
    /// filter data on select of specific sort from sort alert popup
    private func filterData(index: Int) {
        switch index {
        case 0:
            viewModel.launches?.removeAll(where: { $0.success == false || $0.success == nil })
        case 1:
            viewModel.launches?.removeAll(where: { $0.success == true || $0.success == nil })
        default:
            break
        }
        DispatchQueue.main.async { [weak self]  in
            self?.tableView.reloadData()
        }
    }
    
    @objc func refresh(_ sender: AnyObject) {
       fetchAllLaunches()
    }
}

//MARK: Datasources for tableview

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.launches?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else { fatalError("Could not dequeue HomeTableViewCell") }
        if let launch = viewModel.launches?[indexPath.row] {
            cell.configure(launch: launch)
        }
        cell.selectionStyle = .none
        return cell
    }
}

//MARK: Delegate for tableview

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let launch = viewModel.launches?[indexPath.row] {
            AppNavigationHandler.goToLauchDetailScreen(launch: launch, from: self)
        }
    }
    
    // tableview height for row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
