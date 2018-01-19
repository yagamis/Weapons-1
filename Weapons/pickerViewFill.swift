import  UIKit

extension NewWeaponController: UIPickerViewDataSource ,UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView.tag {
        case 10:
            return 1
        case 11:
            return 1
        default:
            return 2
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 10:
            return self.specs.types.count
        case 11:
            return self.specs.bullets.count
        default:
            if component == 0 {
                return self.origin.count
            } else {
                return self.origin[pickerView.selectedRow(inComponent: 0)].countries.count
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 10:
            return self.specs.types[row]
        case 11:
            return self.specs.bullets[row].description
        default:
            if component == 0 {
                return self.origin[row].continent
            } else {
                return self.origin[pickerView.selectedRow(inComponent: 0)].countries[row]
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 12:
            if component == 0 {
                pickerView.reloadComponent(1)
            }
        default:
            break
        }
    }
}
