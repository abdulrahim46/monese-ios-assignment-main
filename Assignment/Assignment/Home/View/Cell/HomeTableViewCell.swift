import UIKit

class HomeTableViewCell: UITableViewCell {

    // view & properties
    private let label = UILabel()
    private let time = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .blue
        configureSubview()
        setOpaqueBackground()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // setting the view here
    private func configureSubview() {
        label.numberOfLines = 0
        time.numberOfLines = 0

        let stackView = UIStackView(arrangedSubviews: [label, time])
        stackView.axis = .horizontal

        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 40),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -40)
        ])
    }

    /// Configuring the view with data
    func configure(launch: Launch) {
        self.label.text = launch.name
        self.time.text = launch.time?.dateOnly(date: launch.time ?? "")
    }
}

private extension HomeTableViewCell {
    static let defaultBackgroundColor = UIColor.white

    func setOpaqueBackground() {
        alpha = 1.0
        backgroundColor = .white
    }
}
