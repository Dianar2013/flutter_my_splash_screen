#import "FlutterMySplashScreenPlugin.h"
 

@implementation FlutterMySplashScreenPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
   FlutterMethodChannel* channel = [FlutterMethodChannel
       methodChannelWithName:@"flutter_my_splash_screen"
             binaryMessenger:[registrar messenger]];
   FlutterMySplashScreenPlugin* instance = [[FlutterMySplashScreenPlugin alloc] init];
   [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"show" isEqualToString:call.method]) {
      [[[UIAlertView alloc] initWithTitle:@"接收到展示通知" message:@"Plugin" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil] show];
      [[NSNotificationCenter defaultCenter] postNotificationName:@"flutter_my_splash_screen_show" object:nil];
  } else if ([@"hide" isEqualToString:call.method]) {
      [[[UIAlertView alloc] initWithTitle:@"接收到隐藏通知" message:@"Plugin" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil] show];
     [[NSNotificationCenter defaultCenter] postNotificationName:@"flutter_my_splash_screen_hide" object:nil];
  } else {
    result(FlutterMethodNotImplemented);
  }
}
@end
 
