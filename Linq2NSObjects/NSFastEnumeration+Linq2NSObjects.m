//
//  NSEnumerator+Linq2NSObjects.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/24/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "NSFastEnumeration+Linq2NSObjects.h"
#import "WhereIterator.h"
#import "SkipIterator.h"
#import "TakeIterator.h"

@implementation NSObject (Linq2NSObjects)

-(Iterator *)where:(Predicate)predicate
{
    return [[WhereIterator alloc] initWithSource:self andPredicate:predicate];
}

-(Iterator *)skip:(int)count
{
    return [[SkipIterator alloc] initWithSource:self andCount:count];
}

-(Iterator *)take:(int)count
{
    return [[TakeIterator alloc] initWithSource:self andCount:count];
}

-(id)first:(Predicate)predicate
{
    id result = [self nextObject];;
    while (result && !predicate(result))
        result = [self nextObject];
    
    return result;
}

@end
