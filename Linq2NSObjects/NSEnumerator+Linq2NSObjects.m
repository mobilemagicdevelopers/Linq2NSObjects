//
//  NSEnumerator+Linq2NSObjects.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/24/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "NSEnumerator+Linq2NSObjects.h"
#import "WhereIterator.h"
#import "SkipIterator.h"
#import "TakeIterator.h"
#import "SelectIterator.h"
#import "SkipWhileIterator.h"
#import "TakeWhileIterator.h"
#import "ConcatIterator.h"
#import "DistinctIterator.h"

@implementation NSEnumerator (Linq2NSObjects)

-(Iterator *)where:(Predicate)predicate
{
    return [[WhereIterator alloc] initWithSource:self andPredicate:predicate];
}

-(Iterator *)skipWhile:(Predicate)predicate
{
    return [[SkipWhileIterator alloc] initWithSource:self andPredicate:predicate];
}

-(Iterator *)takeWhile:(Predicate)predicate
{
    return [[TakeWhileIterator alloc] initWithSource:self andPredicate:predicate];
}

-(Iterator *)ofType:(Class)type
{
    return [self where:^BOOL(id item) {
        return [[item class] isSubclassOfClass:type];
    }];
}

-(Iterator *)skip:(int)count
{
    return [[SkipIterator alloc] initWithSource:self andCount:count];
}

-(Iterator *)take:(int)count
{
    return [[TakeIterator alloc] initWithSource:self andCount:count];
}

-(Iterator *)select:(Selector)selector
{
    return [[SelectIterator alloc] initWithSource:self andSelector:selector];
}

-(Iterator *)distinct
{
    return [[DistinctIterator alloc] initWithSource:self];
}

-(Iterator *)concat:(NSEnumerator *)enumerator, ...
{
    NSMutableArray *enumerators = [NSMutableArray array];
    
    va_list args;
    va_start(args, enumerator);
    
    for (NSEnumerator *item = enumerator; item != nil; item = va_arg(args, NSEnumerator*))
        [enumerators addObject:item];
    
    return [[ConcatIterator alloc] initWithSource:self andEnumerators:enumerators];
}

-(id)first
{
    return [self nextObject];
}

-(id)first:(Predicate)predicate
{
    id result = [self nextObject];;
    while (result && !predicate(result))
        result = [self nextObject];
    
    return result;
}

-(id)last
{
    id result, currentItem;

    while (currentItem = [self nextObject])
        result = currentItem;

    return result;
}

-(id)last:(Predicate)predicate
{
    id result, currentItem;
    
    while (currentItem = [self nextObject])
    {
        if (predicate(currentItem))
            result = currentItem;
    }
    
    return result;
}

-(BOOL)any
{
    return [self first] != nil;
}

-(BOOL)any:(Predicate)predicate
{
    return [self first:predicate] != nil;
}

-(BOOL)all:(Predicate)predicate
{
    for (id result = [self nextObject]; result; result = [self nextObject])
        if (!predicate(result))
            return NO;
    
    return YES;
}

-(BOOL)contains:(id)item
{
    id element;
    while (element = [self nextObject])
        if ([element isEqual:item])
            return YES;
    
    return NO;
}

-(id)aggregateWithSeed:(id)seed andAccumulator:(Accumulator)accumulator
{
    id result = seed;
    for (id item in self)
        result = accumulator(result, item);
    
    return result;
}

-(NSDictionary *)toDictionaryWithKeySelector:(KeyObjectSelector)keySelector
{
    static Selector identitySelector = ^id(id item) { return item; };
    return [self toDictionaryWithKeySelector:keySelector andValueSelector:identitySelector];
}

-(NSDictionary *)toDictionaryWithKeySelector:(KeyObjectSelector)keySelector andValueSelector:(Selector)valueSelector
{
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    
    for (id item in self)
        [result setObject:valueSelector(item) forKey:keySelector(item)];
    
    return result;
}

-(NSArray *)toArray
{
    return self.allObjects;
}

@end
