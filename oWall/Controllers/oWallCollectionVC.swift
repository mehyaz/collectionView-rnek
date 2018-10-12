//
//  oWallCollectionVC.swift
//  oWall
//
//  Created by Mehmet Yazık on 7.10.2018.
//  Copyright © 2018 Mehmet Yazık. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

//private let reuseIdentifier = "Cell"

class oWallCollectionVC: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDelegateFlowLayout  {
    
    @IBOutlet var owallCollectionView: UICollectionView!
    let kaynakUrl = "https://simplifiedcoding.net/demos/marvel/"
    var bilgiler = [Bilgiler]()
    
    
    var imagesArray = [UIImage(named:"1")!,UIImage(named:"2")!,UIImage(named:"3")!,UIImage(named:"4")!,UIImage(named:"5")!,UIImage(named:"6")!,UIImage(named:"7")!,UIImage(named:"8")!,UIImage(named:"1")!,UIImage(named:"2")!,UIImage(named:"3")!,UIImage(named:"4")!,UIImage(named:"5")!,UIImage(named:"6")!,UIImage(named:"7")!,UIImage(named:"8")!]
    
    var namesArray = ["Resim1", "Resim2", "Resim3", "Resim4", "Resim5", "Resim6", "Resim7", "Resim8", "Resim1", "Resim2", "Resim3", "Resim4","Resim5", "Resim6", "Resim7", "Resim8"]


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  //      veriYukle()
//        self.owallCollectionView.reloadData()
    }

 
    /*
    func veriYukle()
    {
        Alamofire.request(kaynakUrl).responseJSON { response in
            
            if let json = response.result.value {
                
                let bilgiArray : NSArray = json as! NSArray
                
                for i in 0..<bilgiArray.count{
                    self.bilgiler.append(Bilgiler(
                        _resimUrl: (bilgiArray[i] as AnyObject).value(forKey: "imageurl") as? String,
                        _resimAdi: (bilgiArray[i] as AnyObject).value(forKey: "name") as? String))
                }
                for i in 0..<bilgiArray.count{
                    let b: Bilgiler
                    b = self.bilgiler[i]
                print(b.resimAdi!)
                }
            }
        }
        
    }
    
    
    */
    
    @IBAction func openCamera(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.allowsEditing = true
            picker.delegate = self
            
            present(picker,animated: true)
        }
        else{
            let alert = UIAlertController(title: "Camera Unavaible!", message: "You dont have a camera on your device.", preferredStyle: .alert )
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler:nil  )
            alert.addAction(okAction)
            
            let deleteAction = UIAlertAction(title: "Delete?", style: .destructive) { (action) in
                print("Deleted.")
            }
            alert.addAction(deleteAction)
            
            present(alert,animated: true  )
        }
        
    }
    
    
    
    
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
   
        return namesArray.count
      // return  bilgiler.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hucre", for: indexPath) as! oWallCell
    
        cell.isimLabel.text = namesArray[indexPath.row]
        cell.resimImgView.image = imagesArray[indexPath.row]
    /*
        let bilgi: Bilgiler
        bilgi = bilgiler[indexPath.row]
        
        cell.isimLabel.text = bilgi.resimAdi
        
        Alamofire.request(bilgi.resimUrl!).responseImage { response in
            
            if let image = response.result.value {
                  cell.resimImgView.image = image
            }
        }
        
      */
        
        return cell
    }
    
    
   

    // Ekrandaki hücrenin değişken boyutta görünmesini sağlıyor.
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.size.width/2)-10, height: (collectionView.frame.size.width/2))
    }
    
    @IBAction func close(segue: UIStoryboardSegue)
    {

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let hedefVC = segue.destination as! FullImageVC
        
        if let indexPathArray = collectionView?.indexPathsForSelectedItems
        {
            let selectedIndex = indexPathArray[0]
            let selectedImage = imagesArray[selectedIndex.row]
            
            hedefVC.fullImage = selectedImage
        }
        
        
    }
    
    
}
