/*
 * BSD LICENSE
 * Copyright (c) 2012, Mobile Unit of G+J Electronic Media Sales GmbH, Hamburg All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer .
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.
 * IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * The source code is just allowed for private use, not for commercial use.
 *
 */

#import "GUJAdViewContext.h"
#import <CoreLocation/CoreLocation.h>
#import <AVFoundation/AVFoundation.h>
#import <ifaddrs.h>
#import <arpa/inet.h>

@interface GUJAdView ()
@end

@implementation GUJAdView
- (void)show {

}

- (void)showInterstitialView {

}

- (void)hide {

}

- (NSString *)adSpaceId {
    return nil;
}

@end


@interface GUJAdViewContext ()

@end

@implementation GUJAdViewContext{
}

+ (GUJAdViewContext *)instanceForAdspaceId:(NSString *)adSpaceId {
    GUJAdViewContext *adViewContext = [[self alloc] init];
    adViewContext._adSpaceId = adSpaceId;
    return adViewContext;
}

+ (GUJAdViewContext *)instanceForAdspaceId:(NSString *)adSpaceId delegate:(id <GUJAdViewControllerDelegate>)delegate {
    GUJAdViewContext *adViewContext = [self instanceForAdspaceId:adSpaceId];
    adViewContext.delegate = delegate;
    return adViewContext;
}

+ (GUJAdViewContext *)instanceForAdspaceId:(NSString *)adSpaceId adUnit:(NSString *)adUnitId {
    return nil;
}

+ (GUJAdViewContext *)instanceForAdspaceId:(NSString *)adSpaceId adUnit:(NSString *)adUnitId delegate:(id <GUJAdViewControllerDelegate>)delegate {
    return nil;
}

+ (GUJAdViewContext *)instanceForAdspaceId:(NSString *)adSpaceId site:(NSInteger)siteId zone:(NSInteger)zoneId {
    return nil;
}

+ (GUJAdViewContext *)instanceForAdspaceId:(NSString *)adSpaceId adUnit:(NSString *)adUnitId site:(NSInteger)siteId zone:(NSInteger)zoneId delegate:(id <GUJAdViewControllerDelegate>)delegate {
    return nil;
}

- (void)setReloadInterval:(NSTimeInterval)reloadInterval {

}

- (BOOL)disableLocationService {
    return NO;
}

- (void)shouldAutoShowIntestitialView:(BOOL)show {

}

- (GUJAdView *)adView {


    return nil;
}

- (void)adView:(adViewCompletion)completion {

}

- (GUJAdView *)adViewWithOrigin:(CGPoint)origin {

    GUJAdView *bannerView = [[GUJAdView alloc] initWithFrame:CGRectMake(origin.x, origin.y, 320, 50)];

    bannerView.adUnitID = @"/6032/sdktest";
    bannerView.rootViewController = self.rootViewController;
    bannerView.backgroundColor = [UIColor yellowColor];

    DFPRequest *request = [DFPRequest request];
    request.customTargeting = @{@"pos" : @1 };

    if ([CLLocationManager locationServicesEnabled]) {

        CLLocationManager * locationManager_ = [[CLLocationManager alloc] init];
        [request setLocationWithLatitude:locationManager_.location.coordinate.latitude
                               longitude:locationManager_.location.coordinate.longitude
                                accuracy:locationManager_.location.horizontalAccuracy];
    }



    [bannerView loadRequest:request];
    return bannerView;
}

- (void)adViewWithOrigin:(CGPoint)origin completion:(adViewCompletion)completion {

}

- (GUJAdView *)adViewForKeywords:(NSArray *)keywords {
    return nil;
}

- (void)adViewForKeywords:(NSArray *)keywords completion:(adViewCompletion)completion {

}

- (GUJAdView *)adViewForKeywords:(NSArray *)keywords origin:(CGPoint)origin {
    return nil;
}

- (void)adViewForKeywords:(NSArray *)keywords origin:(CGPoint)origin completion:(adViewCompletion)completion {

}

- (void)interstitialAdView {

}

- (void)interstitialAdViewWithCompletionHandler:(adViewCompletion)completion {

}

- (void)interstitialAdViewForKeywords:(NSArray *)keywords {

}

- (void)interstitialAdViewForKeywords:(NSArray *)keywords completion:(adViewCompletion)completion {

}

- (void)addAdServerRequestHeaderField:(NSString *)name value:(NSString *)value {

}

- (void)addAdServerRequestHeaderFields:(NSDictionary *)headerFields {

}

- (void)addAdServerRequestParameter:(NSString *)name value:(NSString *)value {

}

- (void)addAdServerRequestParameters:(NSDictionary *)requestParameters {

}

- (void)initalizationAttempts:(NSUInteger)attempts {

}

- (void)freeInstance {

}


-(void)printDeviceInfo {
    NSLog(@"Google Mobile Ads SDK version: %@", [DFPRequest sdkVersion]);

    NSLog(@"isOtherAudioPlaying: %@", [self isOtherAudioPlaying] ? @"YES" : @"NO");
    NSLog(@"isHeadsetPluggedIn: %@", [self isHeadsetPluggedIn] ? @"YES" : @"NO");
    NSLog(@"getBatteryLevel: %d", [self getBatteryLevel]);
    NSLog(@"getIPAddress: %@", [self getIPAddress]);
    NSLog(@"getAltitude: %f", [self getAltitude]);
}

-(BOOL) isOtherAudioPlaying {
    BOOL isOtherAudioPlaying = [[AVAudioSession sharedInstance] isOtherAudioPlaying];

    return isOtherAudioPlaying;
}

- (BOOL)isHeadsetPluggedIn {
    AVAudioSessionRouteDescription* route = [[AVAudioSession sharedInstance] currentRoute];
    for (AVAudioSessionPortDescription* desc in [route outputs]) {
        if ([[desc portType] isEqualToString:AVAudioSessionPortHeadphones])
            return YES;
    }
    return NO;
}

-(NSInteger) getBatteryLevel {
    [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];

    //This will give us the battery between 0.0 (empty) and 1.0 (100% charged)
    float batteryLevel = [[UIDevice currentDevice] batteryLevel];

    // convert to percent
    batteryLevel *= 100;

    return (NSInteger) batteryLevel;
}


- (NSString *)getIPAddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;

}

-(CLLocationDistance) getAltitude {
    CLLocationManager * locationManager_ = [[CLLocationManager alloc] init];
    return locationManager_.location.altitude;
}

@end
