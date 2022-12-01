//
//  WrappedViewController.swift
//  Spotifly
//
//  Created by D Barcenas, W Eltus, S Garcia, M Aguiar on 11/30/22.
//

import UIKit

class WrappedViewController: UIViewController {

    //Links from WrappedViewController
    @IBOutlet weak var AlbumArt: UIImageView!
    
    @IBOutlet weak var TopStreamedArtist: UILabel!
    
    @IBOutlet weak var TotalStreamedMinutes: UILabel!
    
    //End of Links from WrappedViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
