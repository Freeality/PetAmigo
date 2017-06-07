//
//  ContaTest.m
//  PetRescue
//
//  Created by Pedro Brandão on 06/06/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Conta.h"
#import "Constantes.h"

@interface ContaTest : XCTestCase

@end

@implementation ContaTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNomeValidoDeveRetornarNil {
    
    Conta *conta = [[Conta alloc] initWithNome:NOME_PEDRO Email:EMAIL_PEDRO eSenha:SENHA_TEXT1];
    
    XCTAssert([conta.Nome isEqualToString:NOME_PEDRO]);
}

- (void)testNomeInvalidoNaoPassa {
    Conta *conta = [[Conta alloc] initWithNome:@"no" Email:EMAIL_PEDRO eSenha:SENHA_TEXT1];
    
    XCTAssert(![conta.Nome isEqualToString:@"no"]);
}

- (void)testNomeComEspacoNaoPassa {
    NSString *nome = @"Um nome";
    Conta *conta = [[Conta alloc] initWithNome:nome Email:EMAIL_PEDRO eSenha:SENHA_TEXT1];
    
    XCTAssert(![conta.Nome isEqualToString:nome]);
}

@end
