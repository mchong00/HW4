//
//  TodoItem.m
//  NSTableView
//
//  Created by Michael Chong on 2/6/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import "TodoItem.h"

@interface TodoItem ()

@end

@implementation TodoItem


+(instancetype)todoItemWithTitle:(NSString*)title withBody:(NSString*)body;
{
    TodoItem *object = [[self alloc] init];
    object.title = title;
    object.body = body;
    return object;
}

//called when saving
-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.title forKey:@"titleKey"];
    [aCoder encodeObject:self.body forKey:@"bodyKey"];
}

//called when loading
-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    
    if(self) {
        self.title = [aDecoder decodeObjectForKey:@"titleKey"];
        self.body = [aDecoder decodeObjectForKey:@"bodyKey"];
    }
    
    return self;
}


@end
