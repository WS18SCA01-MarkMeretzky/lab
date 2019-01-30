//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Mark Meretzky on 1/29/19.
//

import UIKit;

class AthleteFormViewController: UIViewController {
    var athlete: Athlete? = nil;

    @IBOutlet weak var   nameTextField: UITextField!;
    @IBOutlet weak var    ageTextField: UITextField!;
    @IBOutlet weak var leagueTextField: UITextField!;
    @IBOutlet weak var   teamTextField: UITextField!;
    
    override func viewDidLoad() {
        super.viewDidLoad();

        // Do any additional setup after loading the view.
        updateView();
    }
    
    func updateView() {
        if let athlete: Athlete = athlete {
            nameTextField.text = athlete.name;
            ageTextField.text = athlete.age;
            leagueTextField.text = athlete.league;
            teamTextField.text = athlete.team;
        }
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let name: String = nameTextField.text,
            let age: String = ageTextField.text,
            let league: String = leagueTextField.text,
            let team: String = teamTextField.text else {
            return;
        }

        athlete = Athlete(name: name, age: age, league: league, team: team);
        performSegue(withIdentifier: "unwindSegue", sender: self);
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
