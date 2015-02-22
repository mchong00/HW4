//
//  ViewController.m
//  mchong00_hw4_2
//
//  Created by Michael Chong on 2/14/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import "ViewController.h"
#import "TodoList.h"
#import "TodoItem.h"



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.theTableView.delegate = self;
    self.theTableView.dataSource = self;
    self.inputTextField.delegate = self;
    self.addButton.enabled = YES;
    self.removeButton.enabled = YES;
    self.inputTextField.enabled = NO;
    self.list = [TodoList todoList];
    self.row = 0;
}

-(void)viewDidAppear{
    [super viewDidAppear];
  //  [self.theTableView reloadData];
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView *cell = [tableView makeViewWithIdentifier:@"Cell" owner:nil];
    cell.textField.stringValue = [self.list itemTitles][row];
    return cell;
    
}


-(void)tableViewSelectionDidChange:(NSNotification *)notification
{
    self.inputTextField.enabled = YES;
    
}



-(void)controlTextDidChange:(NSNotification *)obj
{
    NSString *input = self.inputTextField.stringValue;
   // NSUInteger row = self.theTableView.selectedRow;
    
    if(self.theTableView.selectedRow >= 0){
        self.row = (NSUInteger)self.theTableView.selectedRow;
   }
    
    [self.list changeItem:input atPosition:self.row];

[self.theTableView reloadData];
}


-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [self.list itemCount];
}


- (IBAction)addButtonClicked:(id)sender {
   
    [self.list addItemWithTitle:@"New Item"];
    [self.theTableView reloadData];
}


- (IBAction)removeButtonClicked:(id)sender {
    NSString *input = self.inputTextField.stringValue;
    
    if ([[self.list itemTitles] containsObject:input])
    {
        NSUInteger index = [[self.list itemTitles] indexOfObject:input];
        [self.list.array removeObjectAtIndex:index];
    }
    
    [self.theTableView reloadData];
    
}


- (IBAction)tableViewSelected:(id)sender {
    
    self.row = [sender selectedRow];
    NSLog(@"The user clicked on row: %lu", (unsigned long)self.row);
    NSLog(@"array size is %lu", (unsigned long)[self.list itemCount]);
    if (self.row < [self.list itemCount])
    self.inputTextField.stringValue = [self.list getObjectTitleAtPosition:self.row];
}










@end
