//
//  GTLocation.m
//  SampleApp
//
//  Created by 南继云 on 2021/1/31.
//

#import "GTLocation.h"
#import <CoreLocation/CoreLocation.h>

@interface GTLocation()<CLLocationManagerDelegate>

@property(nonatomic,strong,readwrite) CLLocationManager *manager;

@end

@implementation GTLocation

+(GTLocation *) locationManager{
    static GTLocation *location;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        location = [[GTLocation alloc] init];
    });
    return location;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        self.manager = [[CLLocationManager alloc] init];
        self.manager.delegate = self;
    }
    return self;
}

-(void)checkLocationAutherization{
    
    //判断系统是否开启
    if (![CLLocationManager locationServicesEnabled]) {
        //引导弹窗
        
    }
    if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined){
        
        [self.manager requestWhenInUseAuthorization];
    }
}

#pragma - delegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.manager startUpdatingLocation];
        NSLog(@"");
    }else if(status == kCLAuthorizationStatusDenied){
        NSLog(@"");
    }
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations{
    //地理信息
    CLLocation *location = [locations lastObject];
    if (location.horizontalAccuracy > 0) {
        double longitude = location.coordinate.longitude;
        double latitude = location.coordinate.latitude;

    }
    
    CLGeocoder *coder = [[CLGeocoder alloc] init];
    [coder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            //地标信息
        NSLog(@"");
    }];
    [self.manager stopUpdatingLocation];
}


@end
