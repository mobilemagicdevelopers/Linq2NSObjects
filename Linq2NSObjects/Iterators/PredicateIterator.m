//
//  PredicateIterator.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/24/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "PredicateIterator.h"

@implementation PredicateIterator

-(id)initWithSource:(NSEnumerator *)source andPredicate:(Predicate)predicate
{
    if (self = [super initWithSource:source])
        _predicate = predicate;
    
    return self;
}
@end
