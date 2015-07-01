//
//  Computer.h
//  Assignment1
//
//  Created by Lauren Koulias on 6/6/15.
//  COP 4656
//

#import <Foundation/Foundation.h>

@interface Compute: NSObject

@property (nonatomic, strong) NSMutableArray *programStack;

-(void) pushOperand: (float) operand;
-(float) performOperation: (NSString *) operation;
-(float) popOperand;

@end