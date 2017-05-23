//
//  FSQSignificantLocationManager.m
//  FSQLocationBroker
//
//  Created by Eric Bueno on 5/23/17.
//  Copyright © 2017 Foursquare. All rights reserved.
//

#import "FSQSignificantLocationManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface FSQSignificantLocationManager () <CLLocationManagerDelegate>

@property (nonatomic, strong, readwrite) CLLocationManager *locationManager;

@end

@implementation FSQSignificantLocationManager

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _locationManager = [[CLLocationManager alloc] init];
        
        _locationManager.delegate = self;
    }
    
    return self;
}

- (void)startMonitoringSignificantLocationChanges {
    [self.locationManager startMonitoringSignificantLocationChanges];
}

- (void)stopMonitoringSignificantLocationChanges {
    [self.locationManager stopMonitoringSignificantLocationChanges];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    if (self.delegate && [self.delegate respondsToSelector:@selector(significantLocationManager:didUpdateSignificantLocations:)]) {
        [self.delegate significantLocationManager:self didUpdateSignificantLocations:locations];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if (self.delegate && [self.delegate respondsToSelector:@selector(significantLocationManager:didFailWithError:)]) {
        [self.delegate significantLocationManager:self didFailWithError:error];
    }
}

@end

NS_ASSUME_NONNULL_END
