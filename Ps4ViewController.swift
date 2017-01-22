//
//  Ps4ViewController.swift
//  Ps4Collector
//
//  Created by ziad adra on 1/22/17.
//  Copyright © 2017 ziad adra. All rights reserved.
//

import UIKit

class Ps4ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var deletebuttom: UIButton!
    
    @IBOutlet weak var addupdatebuttom: UIButton!
    
    @IBOutlet weak var ps4Imageview: UIImageView!

    @IBOutlet weak var titleTextfield: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    var game : Game? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
imagePicker.delegate = self
        
        if game != nil {
           // print("we have a game")
        ps4Imageview.image = UIImage(data: game!.image as! Data)
            titleTextfield.text = game!.title
            addupdatebuttom.setTitle("Update", for: .normal)
            
           
        }
         else {
            //print ("no games")
            deletebuttom.isHidden = true
            
         }
        // Do any additional setup after loading the view.
    }

    
    @IBAction func photosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
      ps4Imageview.image = image
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func addTapped(_ sender: Any) {
       
        if game != nil {
            game!.title = titleTextfield.text
            
            game!.image = UIImagePNGRepresentation(ps4Imageview.image!) as NSData?
            
        } else {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let game = Game(context: context)
            game.title = titleTextfield.text
        
            game.image = UIImagePNGRepresentation(ps4Imageview.image!) as NSData?
        }
        
        
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
        navigationController!.popViewController(animated: true)
        
    }
    @IBAction func deleteTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(game!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
        navigationController!.popViewController(animated: true)
    }
    
}
