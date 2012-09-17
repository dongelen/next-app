//
//  BookShopTests.m
//  BookShopTests
//
//  Created by Raymond Van Dongelen on 9/17/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "BookShopTests.h"
#import "book.h"
#import "books.h"

@implementation BookShopTests

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

- (void)testBook
{
    Book * book = [[Book alloc] init];
    book.author = @"Rob Waling";
//    [book setAuthor:@"Bla"];
    
    book.title = @"Start small stay small";
    
    STAssertEqualObjects(book.author, @"Rob Waling", @"Auteur moet hetzelfde zijn");
 
    [book showDetailsInLog];

    
    // Book book = new Book();
    // book = Book.new
}

- (void) testBooks {
    Book * book = [[Book alloc] init];
    book.author = @"Rob Waling";
    book.title = @"Start small stay small";
    
    Books * books = [[Books alloc] init];
    [books addBook: book];
    
    [books addBook: [Book bookWithAuthor:@"Rob" andTitle:@"Start"]];
    [books addBook: [Book bookWithAuthor:@"Annie MG" andTitle:@"Jip and Janneke"]];
    
    STAssertTrue([books count] == 3, @"Er zijn drie boeken");

}


















@end
