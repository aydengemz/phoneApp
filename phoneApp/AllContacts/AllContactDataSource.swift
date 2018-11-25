

import UIKit

class AllContactDataSource: NSObject {
    let contacts: [Contact]
    
    init(contacts: [Contact]) {
        self.contacts = contacts
    }
}

extension AllContactDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AllContactCell.self)) as! AllContactCell
        let contact = contacts[indexPath.row]
        //print(contact)
        cell.firstName = contact.firstName
        cell.lastName = contact.lastName
        return cell
    }
}
