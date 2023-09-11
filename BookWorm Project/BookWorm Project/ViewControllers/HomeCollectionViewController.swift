//
//  HomeCollectionViewController.swift
//  BookWorm Project
//
//  Created by 이유진 on 2023/07/31.
//

import UIKit
import RealmSwift

struct BookData {
    
    var _id: String
    var title: String = ""
    var author: String = ""
    var thumbnailURL: String = ""
    var price: Int = 0
    var favorite: Bool = false
    
    init(book: BookTable){
        self._id = book._id.stringValue
        self.title = book.title
        self.author = book.author
        self.thumbnailURL = book.thumbnailURL
        self.price = book.price
        self.favorite = book.favorite
    }
    
    init(_id:String,title: String, author: String, thumbnailURL: String, price: Int,favorite: Bool) {
        self._id = _id
        self.title = title
        self.author = author
        self.thumbnailURL = thumbnailURL
        self.price = price
        self.favorite = favorite
    }
    
}


class HomeCollectionViewController: UICollectionViewController {
    let realm = try! Realm()
    //    var tasks: Results<BookTable>!
    var bookList: Results<BookTable>!
    //    var bookList: Results<BookTable>!
    //    var searchedList = Results<BookTable>()
    var searchedList = [BookData](){
        didSet{
            print("searchedList didset")
            collectionView.reloadData()
        }
    }
    
    //    var searchedList = Results<BookTable>.{
    //        didSet{
    //            collectionView.reloadData()
    //        }
    //    }
    //    var movieList = MovieInfo().movie
    //    var searchedList = [Movie] {
    //        didSet{
    //            collectionView.reloadData()
    //        }
    //    }
    let searchBar = UISearchBar()
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: SearchViewController.identifier)
        let nav = UINavigationController(rootViewController: vc)
        nav.modalTransitionStyle = .coverVertical
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        registerMovieCollectionViewCell()
        setCollectionViewLayout()
        design()
        setDelegate()
        readBookTable()
        initData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        print(bookList)
        print(searchedList)
        searchedList = bookList.map{BookData(_id: $0._id.stringValue, title: $0.title, author: $0.author, thumbnailURL: $0.thumbnailURL, price: $0.price, favorite: $0.favorite)}
    }
    func readBookTable(){
      
        bookList = realm.objects(BookTable.self)
        
    }
    func registerMovieCollectionViewCell(){
        let nib = UINib(nibName: MovieCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
    }
    func design() {
        navigationItem.title = "고래밥님의 책장"
        navigationItem.titleView = searchBar
    }
    func initData(){
        //                searchedList = movieList
//        searchedList = bookList.map{BookTable(value: $0)}
    }
    func setDelegate(){
        searchBar.delegate = self
        
    }
    
    func setCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        let width = UIScreen.main.bounds.width - (spacing*4)
        layout.itemSize = CGSize(width: width/2, height: width/2)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell()}
        cell.heartButton.tag = indexPath.row
        cell.heartButton.addTarget(self, action: #selector(heartButtonDidTap), for: .touchUpInside)
        //        cell.configure(movie: searchedList[indexPath.row])
        cell.configure(book: searchedList[indexPath.row])
        
        return cell
    }
    @objc func heartButtonDidTap(_ sender: UIButton){
        
       
        try! realm.write {
            print("검색111111\(searchedList[0].favorite)")
            searchedList[sender.tag].favorite.toggle()
            bookList[sender.tag].favorite.toggle()
            print("검색\(searchedList[0].favorite)")
            print("북\(bookList[0].favorite)")
            
//            let title = searchedList[sender.tag].title
            
//            for (index,item) in bookList.enumerated(){
//                if(item.title == title){
////                    bookList[index].favorite.toggle()
//                    print("찾음")
//                    print("==========")
//                    print("검색\(searchedList[0].favorite)")
//                    print("북\(bookList[0].favorite)")
//                    print("==========")
//
////                    collectionView.reloadData()
//
//
//                }
            }
        }
        
        
        
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var sb = UIStoryboard(name: "Main", bundle: nil)
        var vc = sb.instantiateViewController(identifier: DetailViewController.identifier) as! DetailViewController
        vc.navigationTitle = searchedList[indexPath.row].title
//        vc.book = searchedList[indexPath.row]
//        let book = searchedList[indexPath.row]
//        vc.book = BookTable(_id:book._id,title: book.title, author: book.author, thumbnailURL: book.thumbnailURL, price: book.price)
        vc.bookId = searchedList[indexPath.row]._id
        vc.viewTransitionType = .push
        searchBar.endEditing(true)
        navigationController?.pushViewController(vc, animated: true)
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchedList.count
    }
}

extension HomeCollectionViewController:UISearchBarDelegate{
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchingMovie()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchingMovie()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
//        searchedList = bookList.map{BookTable(value: $0)}
    }
    
    func searchingMovie(){
//        searchedList = [BookTable]()
        searchedList = [BookData]()
        
        for m in bookList{
            if m.title.contains(searchBar.text!){
//                searchedList.append(m)
                searchedList.append(BookData(book: m))
            }
        }
        if(searchBar.text == ""){
//            searchedList = bookList.map{BookTable(value: $0)}
            searchedList = bookList.map{BookData(book:$0)}
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
