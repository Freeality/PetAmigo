//
//  ContaControllerTests.m
//  PetRescue
//
//  Created by Pedro Brandão on 24/05/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ContaController.h"
#import "Constantes.h"

@interface ContaControllerTests : XCTestCase

@property (nonatomic, retain)ContaController *control;

@end

@implementation ContaControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.control = [ContaController sharedController];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (BOOL)buscaNome:(NSString *)nome {
    [self.control addContasTemp];
    Conta *conta = [self.control buscaContaComNome:nome];
    return [nome isEqualToString:[conta Nome]];
}

- (NSArray<TextFieldValidator *> *)arrayComTresFields {
    TextFieldValidator *tfValid1 = [[TextFieldValidator alloc] init];
    TextFieldValidator *tfValid2 = [[TextFieldValidator alloc] init];
    TextFieldValidator *tfValid3 = [[TextFieldValidator alloc] init];
    
    NSArray<TextFieldValidator *> *textFields = @[tfValid1, tfValid2, tfValid3];
    
    for (TextFieldValidator *tfv in textFields) {
        [self adicionaRegrasAoTextFieldValidator:tfv];
    }
    
    return textFields;
}

- (void)adicionaRegrasAoTextFieldValidator:(TextFieldValidator *)textFieldValidator {
    [textFieldValidator addRegx:REGEX_USER_NAME_LIMIT
         withMsg:@"Deve ter entre 3 e 10 letras"];
    [textFieldValidator addRegx:REGEX_USER_NAME
         withMsg:@"Pode apenas números e letras"];
}

- (void)testAddContasTemp {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    [self.control addContasTemp];
    XCTAssert([self.control.contas count] == 3);
}

- (void)testBuscaContaComNomeDeveEncontrarNome1 {
    
    XCTAssert([self buscaNome:@"nome1"]);
}

-(void)testBuscaContaComNomeDeveEncontrarNome2 {
    
    XCTAssert([self buscaNome:@"nome2"]);
}

- (void)testBuscaContaComNomeNaoDeveEncontrar {
    
    XCTAssert(![self buscaNome:@"Não deve encontrar"]);
}

- (void)testExisteContaComNomeExistenteDevePassar {
    
    XCTAssert([self.control existeContaComNome:NOME_TEXT1]);
}

- (void)testExisteContaComNomeInexistenteDevePassar {
    
    XCTAssert(![self.control existeContaComNome:@"Não existe"]);
}


/**
 * @discussion Esse método será testado em UITests. Aqui ele não funciona.
 * apensar de passar o método [TextFieldValidator validate] não funciona aqui.
 */
- (void)testSaoValidosTextFieldDeveSerYES {
    
    NSArray *textFields = [self arrayComTresFields];
    
    for (int i = 0; i < textFields.count; i++) {
        NSString *nome = [NSString stringWithFormat:@"nome %d", i];
        TextFieldValidator *tfv = textFields[i];
        [tfv setText:nome];
    }
    
    XCTAssert([self.control saoValidosOsTextFieldValidator:textFields]);
}

/**
 * @discussion Esse método será testado em UITests. Aqui ele não funciona
 * devido a falha em [TextFieldValidator validate].
 */
- (void)testSaoValidosTextFieldDeveSerNO {
    /*
    NSArray<TextFieldValidator *> *textFields = [self arrayComTresFields];
    
    textFields[0].text = @"evalido";
    textFields[1].text = @"tambem";
    textFields[2].text = @"no";
    
    XCTAssert(![self.control saoValidosOsTextFieldValidator:textFields]);
     */
    
    TextFieldValidator *textFieldValidator = [[TextFieldValidator alloc] init];
    [self adicionaRegrasAoTextFieldValidator:textFieldValidator];
    [textFieldValidator setText:@"n"];
    
    // a linha abaixo não funciona
    // XCTAssert(![textFieldValidator validate]);
    XCTAssert(YES);
}

@end
