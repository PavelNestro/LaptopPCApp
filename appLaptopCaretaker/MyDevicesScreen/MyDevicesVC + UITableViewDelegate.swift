import UIKit

extension MyDevicesVC: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        deviceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyDeviceViewCell.identificator, for: indexPath) as? MyDeviceViewCell else {
            return UITableViewCell()
        }
        
        let device = deviceArray[indexPath.row]
        
        cell.configure(with: device)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let device = deviceArray[indexPath.row]
        presenter.toDeviceScreen(with: device)
    }
}

