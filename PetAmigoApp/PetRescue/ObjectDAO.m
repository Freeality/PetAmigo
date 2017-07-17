//
//  Controller.m
//  PetRescue
//
//  Created by Pedro Brandão on 16/06/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "ObjectDAO.h"
#import "UIUtils.h"
#import <AFNetworking.h>

@implementation ObjectDAO

-(id)initWithClass:(Class)classe Path:(NSString *)path andViewController:(UIViewController<AtualizaProtocol> *)viewController {
    
    self = [super self];
    if (self) {
        self.classe = classe;
        self.viewController = viewController;
        self.path = path;
    }
    return self;
}

- (NSMutableArray *)array {
    if (!_array) {
        _array = [[NSMutableArray alloc] init];
        [self downloadArray];
    }
    return _array;
}

- (void)downloadArray {
    
    UIAlertController *espere = [UIUtils espere];
    [self.viewController presentViewController:espere animated:YES completion:nil];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:self.path
            parameters:nil
            progress:nil
            success:^(NSURLSessionDataTask *task, id response) {
                self.array = [UIUtils converteResponse:response comJSONModelClass:self.classe];
                [self.viewController atualiza];
                [espere dismissViewControllerAnimated:YES completion:nil];
            }
            failure:^(NSURLSessionDataTask *task, NSError *err) {
                NSLog(@"\n\nErro no download... %@\n\n", err.localizedDescription);
            }];
}

@end
