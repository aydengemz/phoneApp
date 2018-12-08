

import UIKit

class AllCallsDataSource: NSObject {
    let calls: [Call]
    
    init(calls: [Call]) {
        self.calls = calls
    }
}

extension AllCallsDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AllCallsCell.self)) as! AllCallsCell
        let call = calls[indexPath.row]
        //print(contact)
        
        cell.from = call.from
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: call.when)
      
        cell.when = myString
        return cell
    }
}
