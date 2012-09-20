//
//  ShowObjectiveCTests.m
//  ShowObjectiveCTests
//
//  Created by Raymond Van Dongelen on 9/20/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "ShowObjectiveCTests.h"

@implementation ShowObjectiveCTests

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

- (void)testExample
{
    NSUInteger getal1 =10;
    NSUInteger getal2=10;
//    NSUInteger getal3 = getal1 + getal2;
    
    STAssertTrue(getal1 == getal2, @"Getal 1 en 2 zijn gelijk");
    
    NSNumber * getalNumber1 = @10;
    NSNumber * getalNumber2 = @10;
    
//    NSNumber * getalNumber3 = [NSNumber numberWithInt:3];
    

    
//    STAssertTrue(getalNumber1 == getalNumber2, @" Getal 1 en 2 zijn gelijk"); <== FOut!
    
    STAssertEqualObjects(getalNumber1, getalNumber2, @"Getallen moeten gelijk zijn");
}


- (void) testArray
{
    NSArray * boekTitels = @[@"Big nerd ranch", @"Jip & Janneke", @"Start small stay small"];
    

    for (id boek in boekTitels)
    {
        NSLog (@"Titel is %@", boek);
    }
    
    STAssertTrue ([boekTitels count] == 3, @"Drie boeken zouden er moeten zijn");
    
    NSMutableArray * mutableBoekTitels = [[NSMutableArray alloc]init];
    
    [mutableBoekTitels addObject:@"Eerste boek"];
    [mutableBoekTitels addObject:@"Tweede boek"];
    [mutableBoekTitels addObject:@"Derde boek"];
    STAssertTrue ([mutableBoekTitels count] == 3, @"Drie boeken zouden er moeten zijn");
}

//- (float) berekenOppervlakteCirkel(float straal){

- (float) berekenOppervlakteCirkel:(float) straal{
    return 2 * 3.14156 * straal;
}


- (void)testFor
{
    for (int i=0; i < 10; i++) {
        NSLog (@"Een irritante melding");
    }
    
    int getal = 0;

    // Wat doet ++getal en wat doet getal++
    NSLog (@"Getal heeft de waarde %d", ++getal);

    getal =0;
    NSLog (@"Getal heeft de waarde %d", getal++);

    // Dit ook 10 keer
    getal = 0;
    while (getal < 10 )
    {
        NSLog (@"Een andere melding");
        getal++;
    }

    int leeftijd =17;
    if (leeftijd >= 18){
            NSLog(@"Je mag stemmen");
            NSLog(@"En auto rijden");
    
    }
    else{
        
    }

    
    float oppervlakte = [self berekenOppervlakteCirkel:1.0f];

    NSLog (@"De oppervlakte is %f", oppervlakte);
}






 













@end
