//
//  ViewController.swift
//  iOS_Demo
//
//  Created by Infaz Ariff on 20/6/22.
//

import UIKit

class ViewController: UIViewController {

    //
    // MARK: - Class Values
    //
    var viewModel: MovieViewModelProtocol?
    var nowPlayingMoviesArr: [Any] = []
    var popularMoviesArr: [Any] = []
    
    let movieService = MovieService()
    
    //
    // MARK: - IBOutlets
    //
    @IBOutlet weak var moviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = MovieViewModel()
        self.bindUI()
        self.UIChanges()
        self.viewModel?.getNowPlayingMovies()
        self.viewModel?.getPopularMovies()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    private func UIChanges(){
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    /// Bind ViewController with viewModel
    private func bindUI() {
        self.viewModel?.isLoaderHidden.bind({ [weak self] in
            self?.shouldHideLoader(isHidden: $0)
        })
        self.viewModel?.alertMessage.bind({ [weak self] in
            self?.showAlertWith(message: $0)
        })
        self.viewModel?.successResponse.bind({ [weak self] in
            if let response = $0 {
                self?.nowPlayingMoviesArr = response.results!
                self?.moviesTableView.reloadData()
            }
        })
        self.viewModel?.successPopularMovieResponse.bind({ [weak self] in
            if let response = $0 {
                self?.popularMoviesArr = response.results!
                self?.moviesTableView.reloadData()
            }
        })
    }
}

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let headerView : SectionHeaderView = SectionHeaderView.instanceFromNib(index: 0) as! SectionHeaderView
        if section == 0 {
            headerView.configure(sectionTitle: TextOnScreens.playingNow)
            return headerView
        }
        headerView.configure(sectionTitle: TextOnScreens.mostPopular)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return TableRowHeight.nowPlayingRowHeight
        }else{
            return TableRowHeight.mostPopularRowHeight
        }
    }
}

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        //Section 1 -> Show Horizontal Movie images (Now Playing)
        //Section 2 -> Show Vetical Movie images (Popular)
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return nowPlayingMoviesArr.count > 0 ? 1 : 0 //1 - show header | 0 - dont show header
        }else{
            return self.popularMoviesArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell:MovieHoriCell = tableView.dequeueReusableCell(withIdentifier: "MovieHoriCell",
                                                               for: indexPath) as! MovieHoriCell
                        
            cell.configure(movieObjs: nowPlayingMoviesArr as! [MovieModel.MovieListModel])
            return cell
        }else{
            let cell:MovieCell = tableView.dequeueReusableCell(withIdentifier: "MovieCell",
                                                               for: indexPath) as! MovieCell
            cell.configure(movieObj: popularMoviesArr[indexPath.row] as! MovieModel.MovieListModel)
            return cell
        }
    }
}


