//
//  TodoList.m
//  NSTableView
//
//  Created by Michael Chong on 2/6/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import "TodoList.h"
#import "TodoItem.h"

@interface TodoList ()

@end

@implementation TodoList

+(instancetype)todoList
{
    TodoList *object = [[self alloc] init];
    object.array = [[NSMutableArray alloc] init];
    return object;
}

-(NSUInteger)itemCount
{
    return [self.array count];
}

-(NSArray*)itemTitles
{
    return [self.array valueForKey:@"title"];
}


-(void)addItemWithTitle:(NSString*)title
{
    [self.array addObject:[TodoItem todoItemWithTitle:title]];
}

-(BOOL)canAddItemWithTitle:(NSString *)item
{
 
    if ([[self.array valueForKey:@"title" ] containsObject:item])
    {
        return false;
    }
    else return true;
}

-(void)changeItem:(NSString *)string atPosition:(NSUInteger)row
{
    
    TodoItem *newItem = [TodoItem new];
    newItem.title = string;
    [self.array replaceObjectAtIndex:row withObject:newItem];
    [self itemTitles];
}


-(NSString *)getObjectTitleAtPosition:(NSUInteger)row
{
    NSString *titleAtPosition = [[self.array objectAtIndex:row] valueForKey:@"title"];
    return titleAtPosition;
}


//called when saving
-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.array forKey:@"itemsArray"];
   
}

//called when loading
-(id)initWithCoder:(NSCoder *)aDecoder
{
    
    self = [super init];
    
    if(self){
        self.array = [aDecoder decodeObjectForKey:@"itemsArray"];
    
    }
    
    return self;
}




@end
