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


+(instancetype)todoItemWithTitle:(NSString*)title
{
    TodoItem *object = [[self alloc] init];
    object.title = title;
   
    return object;
}

//called when saving
-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.title forKey:@"titleKey"];
}

//called when loading
-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    
    if(self) {
        self.title = [aDecoder decodeObjectForKey:@"titleKey"];
    }
    
    return self;
}


@end
