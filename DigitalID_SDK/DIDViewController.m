//
//  DIDViewController.m
//  DigitalID_SDK
//
//  Created by BTSD on 10/7/20.
//

#import <Foundation/Foundation.h>
#import "DIDViewController.h"

@implementation DIDViewController {
    NSTimer *timer;
}

- (id)initWithUrl:(NSString *_Nonnull)url redirectUrl:(NSString *_Nonnull)redirectUrl {
    self.startPage = url;
    self.redirectURL = redirectUrl;
    return [super initWithNibName:nil bundle:nil];
}

- (id)initWithUrl:(NSString *_Nonnull)url
      redirectUrl:(NSString *_Nonnull)redirectUrl
          options:(DigitalIDOptions *_Nullable)options {
    self.startPage = url;
    self.redirectURL = redirectUrl;
    self.options = options;
    return [super initWithNibName:nil bundle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSUserDefaults standardUserDefaults] setValue:self.options.language forKey:@"did-language"];
    
    self.wkWebView = (WKWebView *)self.webView;
    [self evaluateSetIsSDK];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    timer = [NSTimer scheduledTimerWithTimeInterval:1
                                             target:self
                                           selector:@selector(tiktak)
                                           userInfo:nil
                                            repeats:YES];
    [timer fire];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [timer invalidate];
}

- (void)tiktak {
    NSString *urlString = self.wkWebView.URL.absoluteString;
    if ([urlString containsString:self.redirectURL] && ![urlString containsString:@"redirect_uri"]) {
        [timer invalidate];
        [self.didDelegate didViewController:self didTriggerRedirectUrl:urlString];
    }
}

- (void)evaluateSetIsSDK {
    NSString *script = @"window.isDidSDK = true;";
    [self.wkWebView evaluateJavaScript:script completionHandler:nil];
}

- (void)dealloc {
    [timer invalidate];
}


@end
