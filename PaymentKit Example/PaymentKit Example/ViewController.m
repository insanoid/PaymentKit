//
//  ViewController.m
//  PTKPayment Example
//
//  Created by Alex MacCaw on 2/5/13.
//  Copyright (c) 2013 Stripe. All rights reserved.
//

#import "ViewController.h"
#import "PaymentViewController.h"

@implementation ViewController

@synthesize paymentCell;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Settings";
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) return self.paymentCell;
    if (indexPath.row == 1) return self.preloadedPaymentCell;
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PaymentViewController *viewController = [[PaymentViewController alloc] initWithNibName:@"PaymentViewController" bundle:nil];
    
    if(indexPath.row == 1){
        [viewController setPreloadCard:YES];
    }
    [self.navigationController pushViewController:viewController animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
