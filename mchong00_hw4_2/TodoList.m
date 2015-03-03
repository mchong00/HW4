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

+(instancetype)groceryList {
    TodoList *object = [[self alloc] init];
    [object.array addObject:@"Beer"];
    [object.array addObject:@"Wine"];
    [object.array addObject:@"Vodka"];
    return object;
}

+(instancetype)airplaneLandingChecking {
    TodoList *object = [[self alloc] init];

    [object.array addObject:@"Seatbelt"];
    [object.array addObject:@"TrayTable"];
    [object.array addObject:@"Seatposition"];
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


-(void)addItemWithTitle:(NSString*)title withBody:(NSString*)body
{
    [self.array addObject:[TodoItem todoItemWithTitle:title withBody:(NSString*)body]];
}

-(BOOL)canAddItemWithTitle:(NSString *)item
{
 
    if ([[self.array valueForKey:@"title" ] containsObject:item])
    {
        return false;
    }
    else return true;
}

-(void)changeItem:(NSString *)title withBody:(NSString *)body atPosition:(NSUInteger)row
{
    TodoItem *newItem = [TodoItem new];
    newItem.title = title;
    newItem.body = body;
    [self.array replaceObjectAtIndex:row withObject:newItem];
    //[self itemTitles];
}


-(NSString *)getObjectTitleAtPosition:(NSUInteger)row
{
    NSString *titleAtPosition = [[self.array objectAtIndex:row] valueForKey:@"title"];
    return titleAtPosition;
}

-(NSString *)getObjectBodyAtPosition:(NSUInteger)row
{
    NSString *bodyAtPosition = [[self.array objectAtIndex:row] valueForKey:@"body"];
    return bodyAtPosition;
}

//called when saving
-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.array forKey:@"itemsArray"];
    [aCoder encodeObject:self.title forKey:@"titleKey"];
  //  [aCoder encodeObject:self.body forKey:@"bodyKey"];
}

//called when loading
-(id)initWithCoder:(NSCoder *)aDecoder
{
    
    self = [super init];
    
    if(self){
        self.array = [aDecoder decodeObjectForKey:@"itemsArray"];
        self.title = [aDecoder decodeObjectForKey:@"titleKey"];
      //  self.body = [aDecoder decodeObjectForKey:@"bodyKey"];
    }
    
    return self;
}




@end
