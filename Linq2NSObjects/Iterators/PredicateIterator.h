//
//  PredicateIterator.h
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/24/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "Iterator.h"

@interface PredicateIterator : Iterator {
    @protected
    Predicate _predicate;
}

-initWithSource:(NSEnumerator *)source andPredicate:(Predicate)predicate;
@end
