import UIKit

class HomeViewController: UIViewController {
    
    //MARK: view & properties
    
    private let tableView = UITableView()
    private var launches: [Launch] = []
    private var viewModel = HomeViewModel()
    private(set) var loadingIndicator = UIActivityIndicatorView(style: .medium)
    
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
    }
    
    // setup tableview here
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
        tableView.alwaysBounceVertical = true
        tableView.keyboardDismissMode = .onDrag
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.nameOfClass)
        
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
            }
        })
    }
}

//MARK: Datasources for tableview

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.launches?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.nameOfClass, for: indexPath) as? HomeTableViewCell else { fatalError("Could not dequeue AllCollectionViewCell") }
        if let launch = viewModel.launches?[indexPath.row] {
            cell.configure(launch: launch)
        }
        return cell
    }
}

//MARK: Delegate for tableview

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // tableview height for row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
