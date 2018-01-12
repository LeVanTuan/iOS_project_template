//
//  NowPlayingViewModel.swift
//  iOSProjectTemplate
//
//  Created by Tuan LE on 1/12/18.
//  Copyright © 2018 Leo LE. All rights reserved.
//

import Foundation
import RxSwift

protocol NowPlayingViewModel: ListMoviesViewModel {
    
    var disposeBag: DisposeBag { get }
    
}

extension NowPlayingViewModel {
    
    var disposeBag: DisposeBag {
        return DisposeBag()
    }
    
    func getListMovies() {
        let input = NowPlayingMoviesInput(page: currentPage + 1)
        movieServices.getNowPlayingMovies(input: input)
        .asObservable()
            .subscribe(onNext: { output in
                if output.results.count > 0 {
                    self.movies.append(contentsOf: output.results)
                    NotificationCenter.default.post(name:
                        AppUtility.NotificationName.reloadNowPlayingMovies.notificationName, object: nil)
                }
            }, onError: { error in
                print((error as? APIError)?.description ?? "")
            })
        .addDisposableTo(disposeBag)
    }
    
    func handleListMoviesOutput(output: ListMoviesOutput) {
    
    }
}
