//
//  ViewController.m
//  mySafari
//
//  Created by gule on 1/9/2014.
//  Copyright (c) 2014 gule. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate, UITextFieldDelegate, UIScrollViewDelegate>

{

    __weak IBOutlet UIWebView *myWebView;
    __weak IBOutlet UITextField *myURLTextField;

    
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    myWebView.scrollView.delegate = self;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSURL *myURL = [NSURL URLWithString:myURLTextField.text];
    
    if ([myURLTextField.text hasPrefix:@"http://"]){
   
    }
    else{
        NSString *http = [NSString stringWithFormat:@"http://%@", myURLTextField.text];
        
         myURL = [NSURL URLWithString:http];
    }
        
    NSURLRequest *rq = [NSURLRequest requestWithURL:myURL];
    [myWebView loadRequest:rq];
    
    
    [myURLTextField resignFirstResponder];
    
    return YES;
}
- (IBAction)onBackButtonPressed:(id)sender
{
    [myWebView goBack];
    
}
- (IBAction)onReloadButtonPressed:(id)sender
{
    [myWebView reload];
}


- (IBAction)onStopLoadingButtonPressed:(id)sender
{
    [myWebView stopLoading];
    
}


- (IBAction)onForwardButtonPressed:(id)sender
{
    [myWebView goForward];
    
}
- (IBAction)onTeaserButtonPressed:(id)sender
{
    UIAlertView *myAlert = [[UIAlertView alloc]initWithTitle:@"Coming Soon" message:@"Sorry for the Inconvenience" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [myAlert show];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint translation = [scrollView.panGestureRecognizer translationInView:scrollView.superview];
    
    if(translation.y > 0)
    {
        myURLTextField.alpha += .05;
        // react to dragging up
    } else
    {
        myURLTextField.alpha -= .05;
        // react to dragging down
    }
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
