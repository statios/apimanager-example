//
//  ViewController.swift
//  apimanager-example
//
//  Created by sogihyeon on 2020/05/03.
//  Copyright © 2020 statios. All rights reserved.
//

import UIKit
import RxSwift
import RxAlamofire
import SnapKit

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let movieNamesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(movieNamesLabel)
        
        movieNamesLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        self.movieNamesLabel.text = "fetching data..."
        
        Networking
            .request(ofType: BoxOffice.self, MovieAPI.boxOffice)
            .subscribe(onNext: { [weak self] result in
                switch result {
                case let .success(object):
                    var moviesName: String = ""
                    object.boxOfficeResult.dailyBoxOfficeList.forEach {
                        moviesName += $0.movieNm + "\n"
                    }
                    self?.movieNamesLabel.text = moviesName
                case let .failure(failure):
                    self?.movieNamesLabel.text = failure.message
                }
            }, onError: { [weak self] networkError in
                self?.movieNamesLabel.text = networkError.localizedDescription
            })
            .disposed(by: disposeBag)
    }


}

