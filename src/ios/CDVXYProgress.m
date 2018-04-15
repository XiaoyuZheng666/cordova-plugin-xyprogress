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

    NSNumber*transparentBackColor=[command.arguments objectAtIndex:0];

    NSString*info=[command.arguments objectAtIndex:1];

    if (transparentBackColor.boolValue) {
        [SVProgressHUD setBackgroundColor:[UIColor clearColor]];
    }
    [SVProgressHUD showWithStatus:info];

    if (command.arguments.count>2) {
        NSNumber* deleyTime=[command.arguments objectAtIndex:2];
        if (deleyTime) {
            // 延迟delayTime秒后消失
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(deleyTime.doubleValue/10000 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
        }
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
