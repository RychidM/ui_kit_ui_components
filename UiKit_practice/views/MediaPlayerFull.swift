//
//  MediaPlayerFull.swift
//  UiKit_practice
//
//  Created by Rychid on 1/19/25.
//

import UIKit

class MediaPlayerFull: UIView {
    
    
    private var albumArt : UIImageView = {
        let art = UIImageView()
        art.image = UIImage(named: "DaBaby")
        art.contentMode = .scaleAspectFill
        art.translatesAutoresizingMaskIntoConstraints = false
        return art
    }()
    
    private var statusBarStack : UIStackView = {
        
        var leading : UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
            btn.tintColor = .appPrimary
            return btn
        }()
        
        var titleLbl : UILabel = {
            let lbl = UILabel()
            lbl.text = "Daily Mix"
            lbl.font = UIFont(name: "Poppins-Regular", size: 12)
            lbl.textColor = .appPrimary
            return lbl
        }()
        
        var trailingIcon : UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(systemName: "ellipsis"), for: .normal)
            btn.tintColor = .appPrimary
            return btn
        }()
        
        let stack = UIStackView(arrangedSubviews: [leading, titleLbl, trailingIcon])
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var songInfoStack : UIStackView = {
        
        var songTitle : UILabel = {
            let title = UILabel()
            title.text = "Freaky Friday".uppercased()
            title.font = UIFont(name: "Poppins-SemiBold", size: 18)
            title.textColor = .appPrimary
            return title
        }()
        
        var artistName : UILabel = {
            let artist = UILabel()
            artist.text = "DaBaby"
            artist.font = UIFont(name: "Poppins-Regular", size: 12)
            artist.textColor = .appPrimary.withAlphaComponent(0.6)
            return artist
        }()
        
        let stack : UIStackView = UIStackView(arrangedSubviews: [songTitle, artistName])
        stack.spacing = 8
        stack.axis = .vertical
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var trackSlider : UISlider = {
        
        var thumbImg : UIImage = {
            let img = UIImage(systemName: "circle.fill")
            return img!
        }()
        
        
        let slider = UISlider()
        slider.value = 0.4
        slider.tintColor = .primaryPurple
        slider.thumbTintColor = .white
        slider.setThumbImage(thumbImg, for: .normal)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    
    private var durationStack : UIStackView = {
        
        var currentTime : UILabel = {
            let time = UILabel()
            time.text = "1:30"
            time.font = UIFont(name: "Poppins-Regular", size: 12)
            time.textColor = .appPrimary.withAlphaComponent(0.6)
            return time
        }()
        
        var trackDuration : UILabel = {
            let time = UILabel()
            time.text = "4:30"
            time.font = UIFont(name: "Poppins-Regular", size: 12)
            time.textColor = .appPrimary.withAlphaComponent(0.6)
            return time
        }()
        
        let stack = UIStackView(arrangedSubviews: [currentTime, trackDuration])
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var trackControl : UIStackView = {
        
        var playBtn : GradientButton = {
            let btn = GradientButton(btnHeight: 56, btnCornerRadius: 56/2, btnWidth: 56)
            return btn
        }()
         
        var shuffleBtn : UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(systemName: "shuffle"), for: .normal)
            btn.tintColor = .primaryBlue
            return btn
        }()
        
         
        var repeatBtn : UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(systemName: "repeat"), for: .normal)
            btn.tintColor = .primaryBlue
            return btn
        }()
        
        var nextBtn : UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(named: "next"), for: .normal)
            return btn
        }()
        
        var prevBtn : UIButton = {
           let btn = UIButton()
            btn.setImage(UIImage(named: "previous"), for: .normal)
            return btn
        }()
        
        
        
        let stack = UIStackView(arrangedSubviews: [shuffleBtn, prevBtn, playBtn, nextBtn, repeatBtn])
        stack.distribution = .equalCentering
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    private func setupView() {
        
        addSubview(statusBarStack)
        statusBarStack.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40)).isActive = true
        statusBarStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        statusBarStack.topAnchor.constraint(equalTo: topAnchor, constant: 70).isActive = true
        
        addSubview(albumArt)
        albumArt.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30).isActive = true
        albumArt.heightAnchor.constraint(equalToConstant: 300).isActive = true
        albumArt.topAnchor.constraint(equalTo: statusBarStack.bottomAnchor, constant: 80).isActive = true
        albumArt.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(songInfoStack)
        songInfoStack.topAnchor.constraint(equalTo: albumArt.bottomAnchor, constant: 80).isActive = true
        songInfoStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(trackSlider)
        trackSlider.topAnchor.constraint(equalTo: songInfoStack.bottomAnchor, constant: 20).isActive = true
        trackSlider.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        trackSlider.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        trackSlider.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        
        addSubview(durationStack)
        durationStack.topAnchor.constraint(equalTo: trackSlider.bottomAnchor, constant: 10).isActive = true
        durationStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        durationStack.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40)).isActive = true
   
        addSubview(trackControl)
        trackControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -90).isActive = true        
        trackControl.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        trackControl.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        trackControl.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    }

}

#Preview {
    MediaPlayerFull()
}
