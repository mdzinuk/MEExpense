//
//  CoredataManager.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 20/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MEConstants.h"

NS_ASSUME_NONNULL_BEGIN

@interface CoredataManager : NSObject
+ (CoredataManager *)sharedManager;
- (NSManagedObjectContext* )getContext;
- (void)saveContext;
- (void)fetchWithEntity:(NSString* )name completionHandler:(MEFetchDataWithError)completion;
- (void)insertEntityObject:(NSManagedObject* )managedObject completionHandler:(MESucccess)completion;
- (void)updateWithManagedId:(NSManagedObjectID* )managedID completionHandler:(MESucccess)completion;
- (void)searchByManagedId:(NSManagedObjectID* )managedID completionHandler:(MEManagedObject)completion;
@end

NS_ASSUME_NONNULL_END
