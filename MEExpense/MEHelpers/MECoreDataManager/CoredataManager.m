//
//  CoredataManager.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 20/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "CoredataManager.h"

@interface CoredataManager ()
@property (readonly, strong) NSPersistentContainer *persistentContainer;
@end

@implementation CoredataManager
static CoredataManager* dataManager;

+ (CoredataManager *)sharedManager {
    if (!dataManager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            dataManager = [[self alloc] init];
        });
    }
    return dataManager;
}

#pragma mark - setup
- (id)init {
    self = [super init];
    if (self) { }
    return self;
}

#pragma mark - Core Data stack
@synthesize persistentContainer = _persistentContainer;
- (NSPersistentContainer *)persistentContainer {
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:CORE_DATABASE];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    return _persistentContainer;
}

#pragma mark - Core Data Saving support
- (NSManagedObjectContext* )getContext {
    return (NSManagedObjectContext*)self.persistentContainer.viewContext;
}

- (void)saveContext {
    NSManagedObjectContext *context = [self getContext];
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

- (void)fetchWithEntity:(NSString* )name completionHandler:(MEFetchDataWithError)completion {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:name];
    NSManagedObjectContext* context = [self getContext];
    NSError *fetchError = nil;
    NSArray *results = [context executeFetchRequest:request error:&fetchError];
    completion(results, fetchError);
}

- (void)insertEntityObject:(NSManagedObject* )managedObject completionHandler:(MESucccess)completion {
    NSManagedObjectContext* context = [self getContext];
    NSError *error = nil;
    completion(([context hasChanges] && ![context save:&error]) ? NO : YES);
}

- (void)searchByManagedId:(NSManagedObjectID* )managedID completionHandler:(MEManagedObject)completion {
    NSManagedObjectContext* context = [self getContext];
    NSManagedObject *result = [context objectRegisteredForID: managedID];
    completion(!result ? nil : result);
}

- (void)updateWithManagedId:(NSManagedObjectID* )managedID completionHandler:(MESucccess)completion {
    NSManagedObjectContext* context = [self getContext];
    NSManagedObject *existenceOne = [context objectWithID: managedID];
    // Need workaround as saving in thread issues;
    [context deleteObject:existenceOne];
    NSError *error = nil;
    completion(([context hasChanges] && ![context save:&error]) ? NO : YES);
}

@end
