//
//  DoarTableViewController.m
//  PetRescue
//
//  Created by Pedro Brandão on 23/05/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "DoarTableViewController.h"

@interface DoarTableViewController ()

@end

@implementation DoarTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section > 0) {
        return 1;
    }
    return 4;
}

- (IBAction)goBack:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)doneButtomAction:(id)sender {
    [self goBack:sender];
}
@end
