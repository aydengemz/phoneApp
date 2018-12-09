

import UIKit

class AllVoicemailsDataSource: NSObject {
    let calls: [Call]
    
    init(calls: [Call]) {
        self.calls = calls
    }
}

extension AllVoicemailsDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VoicemailCell.self)) as! VoicemailCell
        let call = calls[indexPath.row]
        //print(contact)
        
        cell.voicemailFrom = call.from
   
        return cell
    }
}
