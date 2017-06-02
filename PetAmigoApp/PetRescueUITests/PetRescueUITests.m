//
//  PetRescueUITests.m
//  PetRescueUITests
//
//  Created by Pedro Brandão on 21/02/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Constantes.h"

@interface PetRescueUITests : XCTestCase

@property (nonatomic, retain)XCUIApplication *app;
@property (nonatomic, retain)XCUIElement *nomeTextField;
@property (nonatomic, retain)XCUIElement *senhaTextField;
@property (nonatomic, retain)XCUIElement *emailTextField;

@end

@implementation PetRescueUITests

- (void)setUp {
    [super setUp];
    
    // self.control = [ContaController sharedController];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    self.app = [[XCUIApplication alloc] init];
    
    self.nomeTextField = self.app.textFields[NOME_FIELD];
    self.emailTextField = self.app.textFields[EMAIL_FIELD];
    self.senhaTextField = self.app.textFields[SENHA_FIELD];
    
    [self.app launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - Auxiliares

- (void)digitaNome:(NSString *)nome Senha:(NSString *)senha Email:(NSString *)email {
    [self.nomeTextField tap];
    [self.nomeTextField typeText:nome];
    
    [self.senhaTextField tap];
    [self.senhaTextField typeText:senha];
    
    [self.emailTextField tap];
    [self.emailTextField typeText:email];
    
    [self.app.buttons[RETURN_BUTTON] tap];
}

#pragma mark - Entrar

static NSString *titulo = @"Últimos posts";

- (void)testUsuarioESenhaValidaDeveEntrarNoPost {
    
    [self digitaNome:NOME_TEXT1 Senha:SENHA_TEXT1 Email:EMAIL_TEXT1];
    [self.app.buttons[ENTRAR_BUTTON] tap];
    
    XCUIElement *tituloPost = self.app.staticTexts[titulo];
    XCTAssert([titulo isEqualToString:tituloPost.label]);
}

- (void)testUsuarioEmBrancoNaoDeveEntrarNoPost {
    
    [self.app.buttons[ENTRAR_BUTTON] tap];
    
    XCUIElement *button = self.app.alerts[TENTE_TEXT].buttons[OK_BUTTON];
    XCTAssert([button.label isEqualToString:OK_BUTTON]);
}

- (void)testUsuarioPequenoNaoDeveEntrarNoPost {
    
    [self digitaNome:@"no" Senha:SENHA_TEXT1 Email:EMAIL_TEXT1];
    [self.app.buttons[ENTRAR_BUTTON] tap];
    
    XCUIElement *button = self.app.alerts[TENTE_TEXT].buttons[OK_BUTTON];
    XCTAssert([button.label isEqualToString:OK_BUTTON]);
}

- (void)testUsuarioValidoMasInesistenteNaoDeveEntrarNoPost {
    
    [self digitaNome:NOME_PEDRO Senha:SENHA_TEXT1 Email:EMAIL_TEXT1];
    [self.app.buttons[ENTRAR_BUTTON] tap];
    
    XCUIElement *button = self.app.alerts[TENTE_TEXT].buttons[OK_BUTTON];
    XCTAssert([button.label isEqualToString:OK_BUTTON]);
}

#pragma mark - Criar

// Testa [ContaController adicionarContaComNome...]
- (void)testDepoisDeCriarDeveExibirMensagemComNome {
    NSString *nome = NOME_PEDRO;
    [self digitaNome:nome Senha:SENHA_TEXT1 Email:EMAIL_PEDRO];
    [self.app.buttons[CRIAR_BUTTON] tap];
    
    NSString *mensagem = [NSString stringWithFormat:@"%@ %@", CONTA_CRIADA, nome];
    XCUIElement *alertaMensagem = self.app.staticTexts[mensagem];
    
    XCTAssert([alertaMensagem.label isEqualToString:mensagem]);
}

- (void)testDepoisDeCriarUsuarioDeveAbrirPost {
    NSString *nome = NOME_PEDRO;
    [self digitaNome:nome Senha:SENHA_TEXT1 Email:EMAIL_PEDRO];
    [self.app.buttons[CRIAR_BUTTON] tap];
    
    [self.app.buttons[OK_BUTTON] tap];
    XCUIElement *tituloText = self.app.staticTexts[titulo];
    
    XCTAssert([tituloText.label isEqualToString:titulo]);
}

- (void)testEmailExistenteNaoPodeSerCriado{
    NSString *nome = NOME_PEDRO;
    [self digitaNome:nome Senha:SENHA_TEXT1 Email:EMAIL_TEXT1];
    [self.app.buttons[CRIAR_BUTTON] tap];
    
    XCUIElement *alerta = self.app.alerts[TENTE_TEXT];
    XCTAssert([alerta.label isEqualToString:TENTE_TEXT]);
}

@end
