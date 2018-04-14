//
//  CDVXYProgress.m
//  HelloCordova
//
//  Created by MAC005 on 2018/4/13.
//

#import "CDVXYProgress.h"
#import "SVProgressHUD.h"
@implementation CDVXYProgress
- (void)showProgress:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult*pluginResult =nil;
    
    NSString*callbackidStr=  command.callbackId;
    NSString*info=[command.arguments objectAtIndex:0];
    
    NSNumber* deleyTime=[command.arguments objectAtIndex:1];

    [SVProgressHUD showWithStatus:info];

    if (deleyTime) {
        // 延迟delayTime秒后消失
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(deleyTime.doubleValue * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    }

    if (callbackidStr!=nil) {
        pluginResult=[CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackidStr];
    }
}

- (void)dismissProgress:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult*pluginResult =nil;
    
    NSString*callbackidStr=  command.callbackId;
    
    [SVProgressHUD dismiss];
    
    if (callbackidStr!=nil) {
        pluginResult=[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"关闭成功"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackidStr];
    }
}

@end
