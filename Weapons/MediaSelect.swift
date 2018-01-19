import UIKit
import MobileCoreServices
import AVFoundation

extension NewWeaponController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! String

        if mediaType == (kUTTypeMovie as String) {
            videoUrl = info[UIImagePickerControllerMediaURL] as! URL

            let asset = AVAsset(url: videoUrl)
            
            let gen = AVAssetImageGenerator(asset: asset)
            let time = CMTime(seconds: 0, preferredTimescale: 2)
            let image = try! gen.copyCGImage(at: time, actualTime: nil)
            bgImage.image = UIImage(cgImage: image)
            
            playBtn.isHidden = false
        } else {
            bgImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        }
        
        picker.dismiss(animated: true)
    }
}

extension NewWeaponController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let photoAction = UIAlertAction(title: "Photo", style: .default, handler: { (_) in
                guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
                    return
                }
                
                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                picker.delegate = self
                self.present(picker, animated: true)
                
            })
            
            let takePhotoAction = UIAlertAction(title: "Take a photo", style: .default, handler: { (_) in
                guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                    return
                }
                
                let picker = UIImagePickerController()
                picker.sourceType = .camera
                picker.delegate = self
                self.present(picker, animated: true)
            })
            
            let videoAction = UIAlertAction(title: "Video", style: .default, handler: { (_) in
                guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
                    return
                }
                
                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                picker.mediaTypes = [kUTTypeMovie as String]
                picker.delegate = self
                self.present(picker, animated: true)
            })
            
            let recordAction = UIAlertAction(title: "Record a video", style: .default, handler: { (_) in
                guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                    return
                }
                
                let picker = UIImagePickerController()
                picker.sourceType = .camera
                
                picker.mediaTypes = [kUTTypeMovie as String]
                picker.videoQuality = .typeHigh
                picker.videoMaximumDuration = 10

                picker.delegate = self
                self.present(picker, animated: true)
            })
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(photoAction)
            actionSheet.addAction(takePhotoAction)
            actionSheet.addAction(videoAction)
            actionSheet.addAction(recordAction)
            actionSheet.addAction(cancelAction)
            
            present(actionSheet, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
