# DigitalID iOS SDK

**Требования:**

- iOS 11 и выше
- Добавить `NSCameraUsageDescription` в **info.plist**
- (Временно) Добавьте в проект файл `config.xml` (файл в архиве с этой документацией)

**Установка с Cocoapods:**

Podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'

pod ‘DigitalID_SDK’, ‘1.0.6’
```

**Зависимости:**

```javascript
- Cordova iOS
- DigitalIDZoomAuthenticationCordovaPlugin
```

**Пример:**

```swift
import UIKit
import DigitalID_SDK

class ViewController: UIViewController {
    
    private var didController: DIDViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        didController = DIDViewController(url: "https://app.gov.stage.digital-id.kz/oauth?response_type=code&client_id={client_id}&scope=ID_CARD&redirect_uri=https://www.egov.kz/digital-id-callback&state=EGOV", redirectUrl: "site.com/digital-id-callback")
        didController?.didDelegate = self
        self.present(didController!, animated: true, completion: nil)
    }
}

extension ViewController: DIDViewControllerDelegate {
    func didViewController(_ viewController: DIDViewController,
                           didTriggerRedirectUrl redirectUrl: String) {
        didController?.dismiss(animated: true, completion: nil)
        didController = nil
    }
}
```

`url` - адрес запуска DigitalID
`redirectUrl` - адрес клиента, который должен полностью или частично быть частью `redirect_uri` в параметре `url`

Где, 
`func didViewController(_ viewController: DIDViewController, didTriggerRedirectUrl redirectUrl: String)`
вызывается когда DigitalID переходит по переданному `redirect_uri` в параметре `url`


🍂

**DigitalID SDK** - во фреймворке `DigitalIDZoomAuthenticationCordovaPlugin` используем Zoom (iOS SDK) от компании [FaceTec](https://www.facetec.com/)
