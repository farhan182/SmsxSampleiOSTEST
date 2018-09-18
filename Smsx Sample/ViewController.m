//
//  ViewController.m
//  Smsx Sample
//
//  Created by MY-COM-0089 on 05/03/2018.
//  Copyright © 2018 MY-COM-0089. All rights reserved.
//

#import "ViewController.h"
#import "DTTJailbreakDetection.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   

    
}
-(void)viewDidAppear:(BOOL)animated{

    if([DTTJailbreakDetection isJailbroken]){
        [self performSegueWithIdentifier:@"toJailbroken" sender:self];
    }else{
        self.view.hidden = NO;
    }
}

- (IBAction)loginAction:(id)sender {
    NSMutableArray * accoounts = [NSMutableArray arrayWithCapacity:3];
    [accoounts addObject:@"sample@smsx.com:secure1234"];
    [accoounts addObject:@"eric@smsx.com:secure1234"];
    [accoounts addObject:@"matt@smsx.com:secure1234"];
    
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Error"
                                 message:@"Invalid email or password"
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   //Handle your yes please button action here
                               }];
    
    
    [alert addAction:okButton];
    
 
    for(NSString * account in accoounts){
        NSArray<NSString *> * accountData  = [account componentsSeparatedByString:@":"];
        if([_emailTxt.text isEqualToString:accountData[0]]){
            if([_passwordTxt.text isEqualToString:accountData[1]]){
                [self performSegueWithIdentifier:@"toProfile" sender:self];
                return;
            }else{
                [self presentViewController:alert animated:YES completion:nil];
                return;
            }
        }
    }
    [self presentViewController:alert animated:YES completion:nil];
    return;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
