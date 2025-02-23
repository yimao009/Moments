//
//  InternalMenuViewController.swift
//  Moments
//
//  Created by GRZ on 2025/2/11.
//

import UIKit
import RxDataSources
import SnapKit

class InternalMenuViewController: BaseViewController {
    let viewModel: InternalMenuViewModelType
    
    init(viewModel: InternalMenuViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var tableView: UITableView = configure(UITableView(frame: CGRect.zero, style: .grouped)) {
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 44
        
        $0.register(InternalMenuDescriptionCell.self, forCellReuseIdentifier: InternalMenuItemType.description.rawValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.title
        
        setupLayout()
        setupBindings()
    }
    
    func setupLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setupBindings() {
        let dataSource = RxTableViewSectionedReloadDataSource<InternalMenuSection> { _, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: item.type.rawValue, for: indexPath)
            if let cell = cell as? InternalMenuItemViewing {
                cell.update(with: item)
            }
            return cell
        } titleForHeaderInSection: { dataSource, section in
            return dataSource.sectionModels[section].title
        } titleForFooterInSection: { dataSource, section in
            return dataSource.sectionModels[section].title
        }
        
        viewModel.sections
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        tableView.rx
            .itemSelected
            .subscribe(onNext: { indexPath in
                self.tableView.deselectRow(at: indexPath, animated: true)
            })
            .disposed(by: disposeBag)
        
        tableView.rx
            .modelSelected(InternalMenuItemViewModel.self)
            .subscribe { item in
                item.select()
            }
            .disposed(by: disposeBag)
    }
    
    @objc
    func dismissModal() {
        dismiss(animated: true, completion: nil)
    }
}
