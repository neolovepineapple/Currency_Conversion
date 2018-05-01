//
//  ViewController.m
//  Currency_Conversion
//
//  Created by 人民路旗舰店 on 2018/4/30.
//  Copyright © 2018年 人民路旗舰店. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"


@interface ViewController () <CRCurrencyRequestDelegate>
@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currencyA;
@property (weak, nonatomic) IBOutlet UILabel *currencyB;
@property (weak, nonatomic) IBOutlet UILabel *currencyC;

@end

@implementation ViewController
- (IBAction)buttonTapped:(id)sender {

    self.convertButton.enabled=NO;
    self.req=[[CRCurrencyRequest alloc]init];
    self.req.delegate=self;
    [self.req start];
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    double inputValue=[self.inputField.text floatValue];
    
    double euroValue=inputValue * currencies.EUR;
    NSString *eurotext = [NSString stringWithFormat:@"%.2f", euroValue];
    self.currencyA.text = eurotext;
    
    double jpyValue=inputValue * currencies.JPY;
    NSString *jpytext = [NSString stringWithFormat:@"%.2f", jpyValue];
    self.currencyB.text = jpytext;
    
    double gbpValue=inputValue * currencies.GBP;
    NSString *gbptext = [NSString stringWithFormat:@"%.2f", gbpValue];
    self.currencyC.text = gbptext;
    
    self.convertButton.enabled=YES;
    
}



@end
