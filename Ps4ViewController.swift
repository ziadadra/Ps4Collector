//
//  Ps4ViewController.swift
//  Ps4Collector
//
//  Created by ziad adra on 1/22/17.
//  Copyright © 2017 ziad adra. All rights reserved.
//

import UIKit

class Ps4ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var ps4Imageview: UIImageView!

    @IBOutlet weak var titleTextfield: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
imagePicker.delegate = self
        
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
    }

    @IBAction func addTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
       let game = Game(context: context)
        game.title = titleTextfield.text
        
        game.image = UIImagePNGRepresentation(ps4Imageview.image!) as NSData?
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
        navigationController!.popViewController(animated: true)
        
    }
}
