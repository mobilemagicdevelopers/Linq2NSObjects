//
//  ConcatIterator.h
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/27/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "Iterator.h"

@interface ConcatIterator : Iterator
-(id)initWithSource:(NSEnumerator *)source andEnumerators:(NSArray *)enumerators;
@end
