//
//  Computer.m
//  Assignment1
//
//  Created by Lauren Koulias on 6/6/15.
//  COP 4656
//

#import "Compute.h"

@implementation Compute

- (instancetype)init
{
    self = [super init]; //calling initializer for NSObject
    if (self)
    {
        self.programStack = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) pushOperand: (float) operand //pushes onto end of array
{
    [self.programStack addObject: [NSNumber numberWithFloat: operand]];
}

-(float) performOperation: (NSString *) operation
{
    float operand1=0, operand2=0, result=0;
    
    //Addition
    if ( [operation isEqualToString:@"+"])
    {
        operand2 = [self popOperand];
        operand1 = [self popOperand];
        result = operand1 + operand2;
    }
    
    //Subtraction
    else if ( [operation isEqualToString: @"-"])
    {
        operand2 = [self popOperand];
        operand1 = [self popOperand];
        result = operand1 - operand2;
    }
    
    //Division
    else if ( [operation isEqualToString:@"/"])
    {
        operand2 = [self popOperand];
        operand1 = [self popOperand];
        result = operand1 / operand2;
    }
    
    //Multiplication
    else if ( [operation isEqualToString:@"*"])
    {
        operand2 = [self popOperand];
        operand1 = [self popOperand];
        result = operand1 * operand2;
    }
    
    return result;
}

-(float) popOperand //pops off end of array
{
    id poppedVal = [self.programStack lastObject]; //use id because you don't know what type is in the array
    [self.programStack removeLastObject];
    
    return [poppedVal floatValue];
}

@end