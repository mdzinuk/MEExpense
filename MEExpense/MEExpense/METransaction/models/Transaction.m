#import "Transaction.h"
#import "Budget.h"
#import "Category.h"
#import "Amount.h"


@interface Transaction ()
@end

@implementation Transaction
+ (instancetype)initWithDate:(NSDate* )date
                    category: (NSString*)name
                    andColor:(NSNumber* )color
                      amount:(double )value
                    currency:(NSString* )currency
                     context:(NSManagedObjectContext* )context {
    
    Amount *amount = (Amount*)[Amount initWithAmount:value currency:currency context:context];
    Category *category = (Category*)[Category initWithName:name andColor:color amount:value currency:currency context:context];
    Transaction* transaction = [Transaction insertInManagedObjectContext:context];
    transaction.creationDate = date;
    transaction.amount = amount;
    transaction.category = category;
    return transaction;
}

@end
