//
//  DIDViewController.h
//  DigitalID_SDK
//
//  Created by BTSD on 10/7/20.
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVViewController.h>
#import <WebKit/WebKit.h>
#import "DigitalIDOptions.h"

NS_ASSUME_NONNULL_BEGIN

@class DIDViewController;

@protocol DIDViewControllerDelegate<NSObject>
    - (void)didViewController:(DIDViewController *)viewController didTriggerRedirectUrl:(NSString *)redirectUrl;
@end

@interface DIDViewController : CDVViewController

@property (nonatomic, weak) id <DIDViewControllerDelegate> didDelegate;

@property(nonatomic, copy) NSString *redirectURL;
@property(weak, nonatomic) WKWebView *wkWebView;
@property(nonatomic, strong, nullable) DigitalIDOptions *options;

- (id)initWithUrl:(NSString *)url redirectUrl:(NSString *)redirectUrl __deprecated_msg("use initWithUrl:redirectUrl:options instead.");

- (id)initWithUrl:(NSString *)url
      redirectUrl:(NSString *)redirectUrl
          options:(DigitalIDOptions *_Nullable)options;

@end

NS_ASSUME_NONNULL_END
