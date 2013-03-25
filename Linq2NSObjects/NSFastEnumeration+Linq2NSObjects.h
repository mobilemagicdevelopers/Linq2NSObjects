//
//  NSEnumerator+Linq2NSObjects.h
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/24/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Iterator.h"
#import "Linq2NSObjectsTypes.h"

@interface NSFastEnumeration (Linq2NSObjects)
-(Iterator *)where:(Predicate)predicate;

-(Iterator *)skip:(int)count;
-(Iterator *)take:(int)count;

-(id)first:(Predicate)predicate;
@end
