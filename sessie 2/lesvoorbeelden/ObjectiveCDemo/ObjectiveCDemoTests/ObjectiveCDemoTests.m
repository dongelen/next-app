//
//  ObjectiveCDemoTests.m
//  ObjectiveCDemoTests
//
//  Created by Raymond Van Dongelen on 9/17/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "ObjectiveCDemoTests.h"

@implementation ObjectiveCDemoTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testOptellen
{
    uint x = 1;
    uint y = 1;
    
    
    NSNumber * xn = @1;

    // NSNumber * xn = [NSNumber numberWithInt:1];
    NSNumber * yn = @1;
    
    
    
    STAssertTrue(x == y, @"X en y moeten gelijk zijn");
    STAssertEqualObjects(xn, yn, @"Xn en yn moeten gelijk zijn");
    
    STAssertTrue (xn == yn, @"Bla");

}


- (void)testArray
{
    NSArray * titels = @[@"Big nerd ranch", @"Core animation", @"Opa brom"];
    
    STAssertTrue([titels count] == 3, @"Er moeten 3 titels zijn");

    NSMutableArray * langereBoekenLijst =
        [NSMutableArray arrayWithObjects:@"Eerste boek", nil];
    
    
//    NSMutableArray * langereBoekenLijst = [[NSMutableArray alloc] init];
    [langereBoekenLijst addObject:@"Start small stay small"];
    [langereBoekenLijst addObject:@"Dora"];
    [langereBoekenLijst addObject:@"Dino's"];
    
    STAssertTrue ([langereBoekenLijst count] == 4, @"Vier lang");
    
    
    for (id current in langereBoekenLijst)
    {
        NSLog (@"Een element %@", current);
    }
    
    [langereBoekenLijst enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog (@"Een element %@", obj);
    }];
    
    
    // While lus hoe werkt die?
    uint current = 0;
    while (current != [langereBoekenLijst count])
    {
        // Doe iets
        current ++;
    }
    
    // Element verwijderen
    
    [langereBoekenLijst removeObjectAtIndex:0];
    [STAssertTrue([langereBoekenLijst count] == 3, @"One object should be removed")];
}










@end
