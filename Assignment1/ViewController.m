//
//  ViewController.m
//  Assignment1
//
//  Created by Lauren Koulias on 6/5/15.
//  Copyright (c) 2015 LaurenKoulias. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



@implementation Compute

-(void) pushOperand: (float) operand
{
    [self.programStack addObject: [NSNumber numberWithDouble: operand]];
}

-(float) performOperation: (NSString *) operation
{
    float operand1=0, operand2=0, result=0;
    
    //Addition
    if ( [operation isEqualToString:@"+"])
    {
        operand1 = [self popOperand];
        operand2 = [self popOperand];
        result = operand1 + operand2;
    }
    
    //Subtraction
    if ( [operation isEqualToString: @"-"])
    {
        operand1 = [self popOperand];
        operand2 = [self popOperand];
        result = operand1 - operand2;
    }
    
    //Division
    if ( [operation isEqualToString:@"/"])
    {
        operand1 = [self popOperand];
        operand2 = [self popOperand];
        result = operand1 / operand2;
    }
    
    //Multiplication
    if ( [operation isEqualToString:@"*"])
    {
        operand1 = [self popOperand];
        operand2 = [self popOperand];
        result = operand1 * operand2;
    }
    
    //Negate
    if ( [operation isEqualToString:@"+/-"])
    {
        operand1 = [self popOperand];
        result = -(operand1);
    }
    
    return result;

}

-(float) popOperand
{
    return 9;
}

@end



@implementation Calculator

-(IBAction) digitPressed: (UIButton *) sender
{
    //obtain number entered by user
    NSString *numberEntered = sender.currentTitle;
}

-(IBAction) operationPressed: (UIButton *) sender
{
    //obtain operation entered by user
    self.operationUserHasPressed = sender.currentTitle;
    
    
}

-(IBAction) equalToSignPresed: (UIButton *) sender
{
    //obtain results of computaion
    float result = 0;
    //[self.comp pushOperand: []];
    result = [self.comp performOperation: self.operationUserHasPressed];
    
    
}

@end


