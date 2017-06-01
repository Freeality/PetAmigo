//
//  PetRescueUITests.m
//  PetRescueUITests
//
//  Created by Pedro Brandão on 21/02/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface PetRescueUITests : XCTestCase

@property (nonatomic, retain)XCUIApplication *app;
@property (nonatomic, retain)XCUIElement *nomeTextField;
@property (nonatomic, retain)XCUIElement *senhaTextField;
@property (nonatomic, retain)XCUIElement *emailTextField;

@end

@implementation PetRescueUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    self.app = [[XCUIApplication alloc] init];
    
    self.nomeTextField = self.app.textFields[@"Nome"];
    self.emailTextField = self.app.textFields[@"Email"];
    self.senhaTextField = self.app.textFields[@"Senha"];
    
    [self.app launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUsuarioESenhaValidaDeveEntrarNoPost {
    
    [self.nomeTextField tap];
    [self.nomeTextField typeText:@"nome1"];
    
    [self.senhaTextField tap];
    [self.senhaTextField typeText:@"000001"];
    
    [self.emailTextField tap];
    [self.emailTextField typeText:@"email1@email.com"];
    
    [self.app.buttons[@"Return"] tap];
    [self.app.buttons[@"Entrar"] tap];
    
    NSString *titulo = @"Últimos posts";
    
    XCUIElement *tituloPost = [[XCUIApplication alloc] init].staticTexts[titulo];
    XCTAssert([titulo isEqualToString:tituloPost.label]);
}

- (void)testUsuarioEmBrancoNaoDeveEntrarNoPost {
    
    [self.app.buttons[@"Entrar"] tap];
    
    XCUIElement *button = self.app.alerts[@"Tente outra vez"].buttons[@"OK"];
    XCTAssert([button.label isEqualToString:@"OK"]);
}

- (void)testUsuarioPequenoNaoDeveEntrarNoPost {
    [self.nomeTextField tap];
    [self.nomeTextField typeText:@"no"];
    
    [self.app.buttons[@"Return"] tap];
    [self.app.buttons[@"Entrar"] tap];
    
    XCUIElement *button = self.app.alerts[@"Tente outra vez"].buttons[@"OK"];
    XCTAssert([button.label isEqualToString:@"OK"]);
}
@end
