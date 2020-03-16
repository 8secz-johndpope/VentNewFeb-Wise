//
//  DepressionViewController.swift
//  Cleanse
//
//  Created by Alek Matthiessen on 12/19/19.
//  Copyright © 2019 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseDatabase

class DepressionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    @IBOutlet weak var backimage: UIImageView!
    var books: [Book] = [] {
              didSet {

                  self.titleCollectionView.reloadData()

              }
          }
      var genreindex = Int()

      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            switch collectionView {
                case self.genreCollectionView:
                    return genres.count
                case self.titleCollectionView:
                    return books.count
                default:
                    return 0
                }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

            refer = "On Tap Discover"

            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
            self.view.endEditing(true)
            titleCollectionView.isUserInteractionEnabled = true

            if collectionView.tag == 1 {

                selectedindex = indexPath.row

                genreCollectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)

                collectionView.alpha = 0

                selectedgenre = genres[indexPath.row]


                genreindex = indexPath.row

                queryforids { () -> Void in

                }

    //            titleCollectionView.scrollToItem(at: indexPath, at: .top, animated: false)
                

                genreCollectionView.reloadData()

            } else {

                let book = self.book(atIndexPath: indexPath)
                
                
                headlines.removeAll()
                
                bookindex = indexPath.row
                selectedauthorname = book?.author ?? ""
                selectedtitle = book?.name ?? ""
                selectedurl = book?.audioURL ?? ""
                selectedbookid = book?.bookID ?? ""
                selectedgenre = book?.genre ?? ""
                selectedamazonurl = book?.amazonURL ?? ""
                selecteddescription = book?.description ?? ""
                selectedduration = book?.duration ?? 15
                selectedheadline = book?.headline1 ?? ""
                selectedprofession = book?.profession ?? ""
                selectedauthorimage = book?.authorImage ?? ""
                selectedbackground = book?.imageURL ?? ""

                    
                headlines.append(book?.headline1 ?? "x")
                headlines.append(book?.headline2 ?? "x")
                headlines.append(book?.headline3 ?? "x")
                headlines.append(book?.headline4 ?? "x")
                headlines.append(book?.headline5 ?? "x")
                headlines.append(book?.headline6 ?? "x")
                headlines.append(book?.headline7 ?? "x")
                headlines.append(book?.headline8 ?? "x")
                
                headlines = headlines.filter{$0 != "x"}

                let alert = UIAlertController(title: "What would you like to do?", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Read", style: .default, handler: { action in
                      switch action.style{
                      case .default:
                            print("default")

                        
                      case .cancel:
                            print("cancel")

                      case .destructive:
                            print("destructive")


                }}))
                alert.addAction(UIAlertAction(title: "Listen", style: .default, handler: { action in
                               switch action.style{
                               case .default:
                                     print("default")

                                     self.performSegue(withIdentifier: "HomeToListen", sender: self)
                               case .cancel:
                                     print("cancel")

                               case .destructive:
                                     print("destructive")


                         }}))
                
                
                    self.performSegue(withIdentifier: "DepressionToRead", sender: self)

             
            }


        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        // Genre collection
        case self.genreCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Categories", for: indexPath) as! GenreCollectionViewCell
            
            collectionView.alpha = 1
            cell.titlelabel.text = genres[indexPath.row]
            //            cell.titlelabel.sizeToFit()
            
            cell.selectedimage.layer.cornerRadius = 10.0
            cell.selectedimage.layer.masksToBounds = true
            
            
            
            
            genreCollectionView.alpha = 1
            
            if selectedindex == 0 {
                
                if indexPath.row == 0 {
                    
                    cell.titlelabel.alpha = 1
                    cell.selectedimage.alpha = 1
                    
                } else {
                    
                    cell.titlelabel.alpha = 0.25
                    cell.selectedimage.alpha = 0
                    
                }
            }
            
            if selectedindex == 1 {
                
                if indexPath.row == 1 {
                    
                    cell.titlelabel.alpha = 1
                    cell.selectedimage.alpha = 1
                    
                } else {
                    
                    cell.titlelabel.alpha = 0.25
                    cell.selectedimage.alpha = 0
                    
                }
                
            }
            
            if selectedindex == 2 {
                
                if indexPath.row == 2 {
                    
                    cell.titlelabel.alpha = 1
                    cell.selectedimage.alpha = 1
                    
                } else {
                    
                    cell.titlelabel.alpha = 0.25
                    cell.selectedimage.alpha = 0
                    
                }
                
            }
            
            if selectedindex == 3 {
                
                if indexPath.row == 3 {
                    
                    cell.titlelabel.alpha = 1
                    cell.selectedimage.alpha = 1
                    
                } else {
                    
                    cell.titlelabel.alpha = 0.25
                    cell.selectedimage.alpha = 0
                    
                }
                
            }
            
            if selectedindex == 4 {
                
                if indexPath.row == 4 {
                    
                    cell.titlelabel.alpha = 1
                    cell.selectedimage.alpha = 1
                    
                } else {
                    
                    cell.titlelabel.alpha = 0.25
                    cell.selectedimage.alpha = 0
                    
                }
            }
            
            if selectedindex == 5 {
                
                if indexPath.row == 5 {
                    
                    cell.titlelabel.alpha = 1
                    cell.selectedimage.alpha = 1
                    
                } else {
                    
                    cell.titlelabel.alpha = 0.25
                    cell.selectedimage.alpha = 0
                    
                }
                
            }
            
            if selectedindex == 6 {
                
                if indexPath.row == 6 {
                    
                    cell.titlelabel.alpha = 1
                    cell.selectedimage.alpha = 1
                    
                } else {
                    
                    cell.titlelabel.alpha = 0.25
                    cell.selectedimage.alpha = 0
                    
                }
                
            }
            
            if selectedindex == 7 {
                
                if indexPath.row == 7 {
                    
                    cell.titlelabel.alpha = 1
                    cell.selectedimage.alpha = 1
                    
                } else {
                    
                    cell.titlelabel.alpha = 0.25
                    cell.selectedimage.alpha = 0
                    
                }
                
            }
            
            if selectedindex == 8 {
                
                if indexPath.row == 8 {
                    
                    cell.titlelabel.alpha = 1
                    cell.selectedimage.alpha = 1
                    
                } else {
                    
                    cell.titlelabel.alpha = 0.25
                    cell.selectedimage.alpha = 0
                    
                }
                
            }
            
            
            if selectedindex == 1000 {
                
                cell.titlelabel.alpha = 0.25
                cell.selectedimage.alpha = 0
            }
            
            return cell
            
        case self.titleCollectionView:
            let book = self.book(atIndexPath: indexPath)
            titleCollectionView.alpha = 1
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Books", for: indexPath) as! TitleCollectionViewCell
            //
            //            if book?.bookID == "Title" {
            //
            //                return cell
            //
            //            } else {
            
            
            
            let name = book?.name
            
            if (name?.contains(":"))! {
                
                var namestring = name?.components(separatedBy: ":")
                
                cell.titlelabel.text = namestring![0]
                
            } else {
                
                cell.titlelabel.text = name
                
            }
            
            cell.titleImage.layer.shadowColor = UIColor.black.cgColor
            cell.titleImage.layer.shadowOffset = CGSize(width: 1, height: 1)
            cell.titleImage.layer.shadowOpacity = 1
            cell.titleImage.layer.shadowRadius = 1.0
            cell.titleImage.layer.cornerRadius = 10.0
            cell.titleImage.clipsToBounds = true
//            cell.titleback.layer.cornerRadius = 10.0
                       cell.titleback.clipsToBounds = true
            
            cell.layer.cornerRadius = 10.0
            cell.layer.cornerRadius = 10.0

            
            //                cell.tapup.tag = indexPath.row
            //
            //                cell.tapup.addTarget(self, action: #selector(DiscoverViewController.tapWishlist), for: .touchUpInside)
            
          
            if let imageURLString = book?.imageURL, let imageUrl = URL(string: imageURLString) {
                
                                            cell.titleImage.kf.setImage(with: imageUrl)
                
                
                cell.titleback.kf.setImage(with: imageUrl)

                
                let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
                                    let blurEffectView = UIVisualEffectView(effect: blurEffect)
                          blurEffectView.frame = cell.titleback.bounds
                                    blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                          
                          cell.titleback.addSubview(blurEffectView)
                          
                
                //                    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
                //                    let blurEffectView = UIVisualEffectView(effect: blurEffect)
                //                    blurEffectView.frame = cell.titleback.bounds
                //                    blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                //                    cell.titleback.addSubview(blurEffectView)
                
                
            }
            
            let isWished = Bool()
            
            if wishlistids.contains(book!.bookID) {
                
                
            } else {
                
            }
            
            cell.layer.cornerRadius = 5.0
            cell.layer.masksToBounds = true
            
            cell.titlelabel.alpha = 1
            cell.titlelabel.alpha = 1
            
            if let viewsnum = book?.views {
                
                cell.viewslabel.text = "\(book!.views!)M views"
                
            } else {
                
                cell.viewslabel.text = "6M views"

            }
            
            
            
            
            return cell
            
            //            }
            
        default:
            
            return UICollectionViewCell()
        }
        
    }
    
    @IBOutlet weak var backimage2: UIImageView!
    @IBOutlet weak var depression: UIImageView!
    var selectedindex = Int()
    @IBOutlet weak var genreCollectionView: UICollectionView!
    @IBOutlet weak var titleCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
                  let blurEffectView = UIVisualEffectView(effect: blurEffect)
                  blurEffectView.frame = backimage.bounds
                  blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                  backimage.addSubview(blurEffectView)
        
        let blurEffect2 = UIBlurEffect(style: UIBlurEffect.Style.dark)
                  let blurEffectView2 = UIVisualEffectView(effect: blurEffect)
                  blurEffectView2.frame = backimage2.bounds
                  blurEffectView2.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                  backimage2.addSubview(blurEffectView2)
        
        genres.removeAll()
        genres.append("All")
        genres.append("Love")
        genres.append("Success")
        genres.append("Happiness")
        genres.append("Depression")
        genres.append("Addiction")
        genres.append("Focus")
        genres.append("Anger")
        
        ref = Database.database().reference()
        
        queryforinfo()
        
        selectedgenre = "All"
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        let result = dateFormatter.string(from: date)
        
        dateformat = result
        


        
        
        if selectedgenre == "" || selectedgenre == "None" {
            
            selectedgenre = "Money"
            
            selectedindex = genres.firstIndex(of: selectedgenre)!
            
            genreCollectionView.reloadData()
            
        } else {
            
            print(selectedindex)
            
            selectedindex = genres.firstIndex(of: selectedgenre)!
            
            genreCollectionView.reloadData()
            
        }
        
        titleCollectionView.reloadData()
        
        //        addstaticbooks()
        
        
        
        //        dayofmonth = "15"
        
        musictimer?.invalidate()
        
        updater?.invalidate()
        player?.pause()
        
        var screenSize = titleCollectionView.bounds
        var screenWidth = screenSize.width
        var screenHeight = screenSize.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 2, bottom: 10, right: 2)
        layout.itemSize = CGSize(width: screenWidth/2.3, height: screenWidth/1.4)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        titleCollectionView!.collectionViewLayout = layout
        
        
        queryforids { () -> Void in
            
        }
        
        // Do any additional setup after loading the view.
    }
        
        func queryforids(completed: @escaping (() -> Void) ) {

                   titleCollectionView.alpha = 0

                   var functioncounter = 0

        

                   ref?.child("AllBooks1").child(selectedgenre).observeSingleEvent(of: .value, with: { (snapshot) in

                       var value = snapshot.value as? NSDictionary

                       print (value)

                       if let snapDict = snapshot.value as? [String: AnyObject] {

                           let genre = Genre(withJSON: snapDict)

                           if let newbooks = genre.books {

                               self.books = newbooks

                               self.books = self.books.sorted(by: { $0.popularity ?? 0  > $1.popularity ?? 0 })

                           }

           //                                for each in snapDict {
           //
           //                                    functioncounter += 1
           //
           //                                    let ids = each.key
           //
           //                                    seemoreids.append(ids)
           //
           //
           //                                    if functioncounter == snapDict.count {
           //
           //                                        self.updateaudiostructure()
           //
           //                                    }
           //                                }

                       }

                   })
               }
        
        func queryforinfo() {
                    
            ref?.child("Users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
                
                let value = snapshot.value as? NSDictionary
                
                if let purchased = value?["Purchased"] as? String {
                    
                    if purchased == "True" {
                        
                        didpurchase = true
                        
                    } else {
                                     
                        didpurchase = false
                        self.performSegue(withIdentifier: "DiscoverToSale2", sender: self)
                        
                    }
                    
                } else {
                    
                    didpurchase = false
                    self.performSegue(withIdentifier: "DiscoverToSale2", sender: self)
                }
         
            })
            
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DepressionViewController {
    func book(atIndex index: Int) -> Book? {
        if index > books.count - 1 {
            return nil
        }

        return books[index]
    }

    func book(atIndexPath indexPath: IndexPath) -> Book? {
        return self.book(atIndex: indexPath.row)
    }
}