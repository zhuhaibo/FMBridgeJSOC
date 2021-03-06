//
//  ViewController.m
//  FMBridgeJSOC
//
//  Created by Fantasy on 16/8/28.
//  Copyright © 2016年 fantasy. All rights reserved.
//

#import "ViewController.h"
#import "UIWebView+JSBridge.h"

@interface ViewController ()
<
    UIWebViewDelegate
>
@property (nonatomic, strong, readonly) UIWebView *webView;
@end

@implementation ViewController

@synthesize webView=_webView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    [self.webView registerJSCallSelector:@selector(hello:welcome:)
                              withTarget:self];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"]]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *(^)(BOOL isLocal)) hello:(NSString *)hello welcome:(NSString *)welcome {
    return ^NSString *(BOOL isLocal){
        return [NSString stringWithFormat:@"%@",isLocal ? welcome : hello];
    };
}

- (UIWebView *)webView {
    if (_webView == nil) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_webView];
    }
    return _webView;
}

- (void) webViewDidFinishLoad:(UIWebView *)webView {
}

- (void) webViewDidStartLoad:(UIWebView *)webView {
}

@end
