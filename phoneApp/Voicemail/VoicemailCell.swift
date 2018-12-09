
import UIKit
import AVFoundation

class VoicemailCell: UITableViewCell {
    
    
    @IBOutlet weak var fromLabel: UILabel!
    
    
    var voicemailFrom: String? {
        didSet {
            fromLabel.text = voicemailFrom
        }
    }
    
}
