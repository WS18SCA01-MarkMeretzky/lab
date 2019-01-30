import UIKit;

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell";
        static let editAthleteSegue = "EditAthlete";
    }
    
    var athletes: [Athlete] = [Athlete]();
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        tableView.reloadData();
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete: Athlete = athletes[indexPath.row];
        cell.textLabel?.text = athlete.name;
        cell.detailTextLabel?.text = athlete.description;
        return cell;
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let athleteFormViewController: AthleteFormViewController = segue.destination as? AthleteFormViewController else {
            print("prepare(for:sender:) destination was not AthleteFormViewController");
            return;
        }
        
        guard let indexPath: IndexPath = tableView.indexPathForSelectedRow else {
            print("prepare(for:sender:) could not get IndexPath");
            return;
        }
        
        guard segue.identifier == PropertyKeys.editAthleteSegue else {
            print("prepare(for:sender:) segue.identifier was not editAthleteSegue");
            return;
        }
        
        athleteFormViewController.athlete = athletes[indexPath.row];
    }
    
    @IBAction func unwind(unwindSegue: UIStoryboardSegue) {
        guard let athleteFormViewController: AthleteFormViewController = unwindSegue.source as? AthleteFormViewController else {
            print("unwind: source was not AthleteFormViewController");
            return;
        }
        
        guard let athlete: Athlete = athleteFormViewController.athlete else {
            print("unwind did not receive athlete");
            return;
        }
        
        if let indexPath: IndexPath = tableView.indexPathForSelectedRow {
            athletes.remove(at: indexPath.row);
            athletes.insert(athlete, at: indexPath.row);
            tableView.deselectRow(at: indexPath, animated: true);
        } else {
            athletes.append(athlete);
        }

    }

}
