//
//  AppDelegate.h
//  JobsBitsMonitor
//
//  Created by Jobs on 2020/12/13.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentCloudKitContainer *persistentContainer;

- (void)saveContext;

@end

#pragma clang diagnostic pop
