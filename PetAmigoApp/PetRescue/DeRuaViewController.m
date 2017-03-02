//
//  DeRuaViewController.m
//  PetRescue
//
//  Created by Pedro Brandão on 22/02/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "DeRuaViewController.h"
#import "DataTableViewCell.h"

@interface DeRuaViewController ()

@property (retain, nonatomic)NSArray<DataTableViewCell *> *celulas;

@end

@implementation DeRuaViewController

- (void)adicionarCelulas {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self adicionarCelulas];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *dataCellCaoViver = @"dataCellCaoViver";
    static NSString *dataCellRockBicho = @"dataCellRockBicho";
    DataTableViewCell *cellCaoViver = [self.tableView dequeueReusableCellWithIdentifier:dataCellCaoViver];
    DataTableViewCell *cellRockBicho = [self.tableView dequeueReusableCellWithIdentifier:dataCellRockBicho];
    
    if (indexPath.row == 0) {
        return cellCaoViver;
    }
    
    return cellRockBicho;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
