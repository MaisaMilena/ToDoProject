//
//  HomeViewController.swift
//  ToDoProject
//
//  Created by Maisa Milena on 26/06/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var inserirButton: UIButton!
    @IBOutlet weak var listarTarefas: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inserirButton.layer.cornerRadius = inserirButton.bounds.height/2
        listarTarefas.layer.cornerRadius = listarTarefas.bounds.height/2
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func inserirTarefa(_ sender: Any) {
        performSegue(withIdentifier: "homeCadastrarSegue", sender: nil)
    }


    @IBAction func listarTarefas(_ sender: Any) {
        performSegue(withIdentifier: "homeListarSegue", sender: nil)
    }
    
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "homeCadastrarSegue" {
            let _: CadastrarViewController = segue.destination as! CadastrarViewController
        } else {
            let _: ListarTableViewController = segue.destination as! ListarTableViewController
        }
    }


}






























