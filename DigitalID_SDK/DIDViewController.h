//
//  DIDViewController.h
//  DigitalID_SDK
//
//  Created by BTSD on 10/7/20.
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVViewController.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DIDViewController;

@protocol DIDViewControllerDelegate<NSObject>
    - (void)didViewController:(DIDViewController *)viewController didTriggerRedirectUrl:(NSString *)redirectUrl;
@end

@interface DIDViewController : CDVViewController

@property (nonatomic, weak) id <DIDViewControllerDelegate> didDelegate;

@property(nonatomic, copy) NSString *redirectURL;
@property(weak, nonatomic) WKWebView *wkWebView;

- (id)initWithUrl:(NSString * _Nonnull)url redirectUrl:(NSString *_Nonnull)redirectUrl;

@end

NS_ASSUME_NONNULL_END
