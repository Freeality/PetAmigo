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

@implementation DeRuaViewController {
    
    NSArray *cellIdentifier;
}

- (void)adicionarCelulas {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    cellIdentifier = @[@"dataCellCaoViver", @"dataCellRockBicho"];
    
    [self adicionarCelulas];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return cellIdentifier.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DataTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:[cellIdentifier objectAtIndex:indexPath.row]];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)goBack:(UIBarButtonItem *)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
