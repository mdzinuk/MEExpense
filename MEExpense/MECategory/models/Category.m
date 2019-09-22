#import "Category.h"
#import "Budget.h"

@interface Category ()
@end

@implementation Category
+ (instancetype)initWithName:(NSString* )name
                    andColor:(NSNumber* )color
                      amount:(double )amount
                    currency:(NSString* )currency
                     context:(NSManagedObjectContext* )context {
    Budget *budget = (Budget*)[Budget initWithAmount:amount currency:currency context:context];
    Category *category = (Category*)[Category insertInManagedObjectContext:context];
    category.color = color;
    category.name = name;
    category.budget = budget;
    return category;
}
@end
