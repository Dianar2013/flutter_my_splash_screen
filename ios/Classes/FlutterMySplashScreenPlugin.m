#import "FlutterMySplashScreenPlugin.h"
 
@interface MyLaunchWindow : NSObject

+ (void)show;

+ (void)hide;

@end


@implementation FlutterMySplashScreenPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
   FlutterMethodChannel* channel = [FlutterMethodChannel
       methodChannelWithName:@"flutter_my_splash_screen"
             binaryMessenger:[registrar messenger]];
   FlutterMySplashScreenPlugin* instance = [[FlutterMySplashScreenPlugin alloc] init];
   [registrar addMethodCallDelegate:instance channel:channel];
    
   [MyLaunchWindow show];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"show" isEqualToString:call.method]) {
  } else if ([@"hide" isEqualToString:call.method]) {
      [MyLaunchWindow hide];
  } else {
    result(FlutterMethodNotImplemented);
  }
}
@end


static UIView *_myLaunchiWindow = nil;

@implementation MyLaunchWindow

+ (void)show
{
    CGRect windowFrame = [UIScreen mainScreen].bounds;
    if (UIInterfaceOrientationIsLandscape(
            [UIApplication sharedApplication].statusBarOrientation)) {
        windowFrame.size.width = [UIScreen mainScreen].bounds.size.height;
        windowFrame.size.height = [UIScreen mainScreen].bounds.size.width;
    }

    UIWindow *lauchWindow = [[UIWindow alloc] initWithFrame:windowFrame];
    lauchWindow.backgroundColor = [UIColor whiteColor];
   
    UIImageView *middleImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qidongtu_pic_nvrentong.png"]];
    middleImgView.center = CGPointMake(CGRectGetWidth(windowFrame)/2.0, CGRectGetHeight(windowFrame)/2.0);
    [lauchWindow addSubview:middleImgView];
     
    UIImageView *bottomImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qidongtu_pic_meiyou.png"]];
    bottomImgView.center = CGPointMake(CGRectGetWidth(windowFrame)/2.0, CGRectGetHeight(windowFrame) - CGRectGetHeight(bottomImgView.bounds)/2.0 - 28);
    [lauchWindow addSubview:bottomImgView];
     
    
    [UIView animateWithDuration:0.001 animations:^{
        
    } completion:^(BOOL finished) {
        lauchWindow.hidden = NO;
    }];
     
    _myLaunchiWindow = lauchWindow;
}
    

+ (void)hide
{
    if (_myLaunchiWindow != nil) {
        [_myLaunchiWindow removeFromSuperview];
        _myLaunchiWindow = nil;
    }
}
 

@end
