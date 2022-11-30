//
//  LinkAccountViewController.swift
//  Spotifly
//
//  Created by David Barcenas on 11/30/22.
//

import UIKit
import SafariServices

class LinkAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var linkButton: UIButton! {
        didSet{
            linkButton.layer.cornerRadius = linkButton.bounds.height/2
        }
    }
    
    
    @IBAction func linkAccount(_ sender: Any) {
        guard let url = URL(string: "https://accounts.spotify.com/authorize?client_id=b934184dcb7a49998b363e237074d04a&response_type=code&redirect_uri=https%3A%2F%2Fwww.google.com%2F&scope=user-top-read") else { return }
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredBarTintColor = .black
        safariVC.preferredControlTintColor = .systemGreen
        safariVC.delegate = self
        present(safariVC, animated: true)
        
    }
    
    private func authorizeUser(with urlString: String){
        let index = urlString.index(urlString.startIndex, offsetBy: 29)
        let code = String(urlString.suffix(from: index))
        
        print("code is ", code)
        
        NetworkManager.shared.authorizeUser(with: code) { result in
            guard let token = result else { return }
            DispatchQueue.main.async{
                guard let listVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier:TopArtistsTableViewController.reuseID) as?
                        TopArtistsTableViewController else { return }
                listVC.token = token
                self.navigationController?.pushViewController(listVC, animated: true)
            }
        }
    }
    
    
    
    private func closeSafari(){
        navigationController?.popViewController(animated: true)
        dismiss(animated: false)
    }

}

extension LinkAccountViewController: SFSafariViewControllerDelegate {
    
    func safariViewController(_ controller: SFSafariViewController, initialLoadDidRedirectTo URL: URL) {
        let currentURL = URL.absoluteURL
        guard currentURL.absoluteString.contains("https://www.google.com/?code=") else { return }
        authorizeUser(with: currentURL.absoluteString)
        closeSafari()
    }
}
