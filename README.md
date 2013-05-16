Linq2NSObjects
==============

One of the biggest things we missed when switching from the .net framework to Objective-C was the collection of Linq to Objects extension methods in [System.Linq.Enumerable](http://msdn.microsoft.com/en-us/library/system.linq.enumerable.aspx).

When we were working on [This2That](http://mobilemagicdevelopers.com/games/this2that), we found we were dealing with a lot of collections like we once did in .net.  In Objective-C it was much more cumbersome.

We decided we'd implement some of the basic operations from Linq to Objects to spike the usefulness.  So far, it's made a lot of work a lot easier in This2That so we're releasing it here and we'll keep it updated as we add more features.

Lazy Evaluation
---------------

One benefit we were looking for is lazy evaluation.  The similar libraries we were able to find generally translate objects from one array into another and return it.  For example:

```objective-c
- (NSArray *)select:(Selector)selector
{
    NSMutableArray* result = [[NSMutableArray alloc] initWithCapacity:self.count];
    for(id item in self) {
        [result addObject:selector(item)];
    }
    return result;
}
```

Thus, if you had an array of NSNumbers which you wanted to be an array of NSStrings instead, you could:
```objective-c
id strings = [rangeIterator select:^id(NSNumber *item) {
    return item.stringValue;
}];
```

This is fine and the array implementation does the trick quite nicely; however, a lot of times you want something like this:
```objective-c
id strings = [RangeIterator withStart:start andCount:count];
strings = [strings skip:10];
strings = [strings take:10];
strings = [strings select:^id(NSNumber *item) { return item.stringValue; }];
```

The benefit of working with NSEnumerator is that the selector is only applied to the 10 items you take and none of the others, no matter how many are in your array.

NSArray Methods
---------------

Because we had an immediate need for these features, we haven't fully fleshed this out yet.  There are some operations when performed on an array could be more performant if you're already starting with an array.  For example, looping through an existing array with skip and take could be better by simply shifting the active index in nextObject.

We plan to get there, but the NSEnumerator option was a solid starting point.
