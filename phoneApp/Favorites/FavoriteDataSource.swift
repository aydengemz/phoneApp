

import UIKit

class ContactDataSource: NSObject {
    let contacts: [Contact]
 
    init(contacts: [Contact]) {
        self.contacts = contacts
    }
}

extension ContactDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ContactCell.self)) as! ContactCell
        let contact = contacts[indexPath.row]
       //print(contact)
        cell.firstName = contact.firstName
        cell.lastName = contact.lastName
        return cell
    }
}
