//
//  ViewController.m
//  PTKPayment Example
//
//  Created by Alex MacCaw on 1/21/13.
//  Copyright (c) 2013 Stripe. All rights reserved.
//

#import "PaymentViewController.h"

@interface PaymentViewController()

@property IBOutlet PTKView* paymentView;

@end


#pragma mark -

@implementation PaymentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.title = @"Change Card";
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(save:)];
    saveButton.enabled = NO;
    self.navigationItem.rightBarButtonItem = saveButton;
    
    
    self.paymentView = [[PTKView alloc] initWithFrame:CGRectMake(15, 25, 290, 50)];
    
    
    if(self.preloadCard){
        PTKCard *card = [[PTKCard alloc] init];
        card.number = @"4111111111111111";
        card.expMonth = 06;
        card.expYear = 16;
        card.cvc = @"737";
        [self.paymentView setCard:card];
    }
    
    [self.paymentView setLineHighlightTintColor:[UIColor redColor]];
    [self.paymentView setLineNormalTintColor:[UIColor darkGrayColor]];
    self.paymentView.delegate = self;
    
    [self.view addSubview:self.paymentView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view resignFirstResponder];
    
}


- (void) paymentView:(PTKView *)paymentView withCard:(PTKCard *)card isValid:(BOOL)valid
{
    self.navigationItem.rightBarButtonItem.enabled = valid;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender
{
    PTKCard* card = self.paymentView.card;
    
    NSLog(@"Card last4: %@", card.last4);
    NSLog(@"Card expiry: %lu/%lu", (unsigned long)card.expMonth, (unsigned long)card.expYear);
    NSLog(@"Card cvc: %@", card.cvc);
    
    [[NSUserDefaults standardUserDefaults] setValue:card.last4 forKey:@"card.last4"];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
