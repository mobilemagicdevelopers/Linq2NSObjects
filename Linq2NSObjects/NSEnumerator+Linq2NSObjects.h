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

@interface NSEnumerator (Linq2NSObjects)
#pragma mark Iterators
-(Iterator *)where:(Predicate)predicate;
-(Iterator *)skipWhile:(Predicate)predicate;
-(Iterator *)takeWhile:(Predicate)predicate;

-(Iterator *)skip:(int)count;
-(Iterator *)take:(int)count;

-(Iterator *)select:(Selector)selector;

-(Iterator *)concat:(NSEnumerator *)enumerator, ... NS_REQUIRES_NIL_TERMINATION;

#pragma mark Selections
-(id)first;
-(id)first:(Predicate)predicate;

-(id)last;
-(id)last:(Predicate)predicate;

-(BOOL)any;
-(BOOL)any:(Predicate)predicate;

-(BOOL)contains:(id)item;

-(id)aggregateWithSeed:(id)seed andAccumulator:(Accumulator)accumulator;

-(NSDictionary *)toDictionaryWithKeySelector:(KeyObjectSelector)keySelector andValueSelector:(Selector)valueSelector;
-(NSDictionary *)toDictionaryWithKeySelector:(KeyObjectSelector)keySelector;
-(NSArray *)toArray;
@end
