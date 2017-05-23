//
//  FSQSignificantLocationManager.h
//  FSQLocationBroker
//
//  Created by Eric Bueno on 5/23/17.
//  Copyright © 2017 Foursquare. All rights reserved.
//

#import <Foundation/Foundation.h>

@import CoreLocation;

@class FSQSignificantLocationManager;

NS_ASSUME_NONNULL_BEGIN

@protocol FSQSignificantLocationManagerDelegate <NSObject>

- (void)significantLocationManager:(FSQSignificantLocationManager *)significantLocationManager didUpdateSignificantLocations:(NSArray<CLLocation *> *)significantLocations;

- (void)significantLocationManager:(FSQSignificantLocationManager *)significantLocationManager didFailWithError:(NSError *)error;

@end

@interface FSQSignificantLocationManager : NSObject

@property (nonatomic, weak, readwrite) id<FSQSignificantLocationManagerDelegate> delegate;

- (void)startMonitoringSignificantLocationChanges;

- (void)stopMonitoringSignificantLocationChanges;

@end
                         
NS_ASSUME_NONNULL_END
