//
//  PostViewController.m
//  facebookPost
//
//  Created by Erica Morse on 6/21/14.
//  Copyright (c) 2014 YouTube. All rights reserved.
//

#import "PostViewController.h"
#import <TTTAttributedLabel/TTTAttributedLabel.h>

@interface PostViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *postText;
@property (weak, nonatomic) IBOutlet UIView *text;
@property (weak, nonatomic) IBOutlet UIView *textLink;
@property (weak, nonatomic) IBOutlet UIView *textLink2;
- (IBAction)onTap:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *textContainer;

@property (weak, nonatomic) IBOutlet UITextField *UITextField;

@end

@implementation PostViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
         self.title = @"Post";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.containerView.layer.cornerRadius = 2;
    
    // TTTAttributeLabel to make link
//      TTTAttributedLabel *postText = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
//    self.postText.enabledTextCheckingTypes = NSTextCheckingTypeLink;
//    self.postText.delegate = self;
//    self.postText.text = @"http://www.google.com";
//    
//    
//
//    self.postText
    TTTAttributedLabel *label = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(15,30,280,100)];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor darkGrayColor];
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0;
    
    NSString *text = @"Great live photos from our show with Lilac Daze and Teen Liver at The Pinch in DC.  http://happyfangsmusic.com/";
    label.enabledTextCheckingTypes = NSTextCheckingTypeLink; // Automatically detect links when the label text is subsequently changed
    label.delegate = self; // Delegate methods are called when the user taps on a link (see `TTTAttributedLabelDelegate` protocol)
    
    label.text = @"Fork me on GitHub! (http://github.com/mattt/TTTAttributedLabel/)"; // Repository URL will be automatically detected and linked
    
    NSRange range = [label.text rangeOfString:@"me"];
    [label addLinkToURL:[NSURL URLWithString:@"http://github.com/mattt/"] withRange:range]; // Embedding a custom link in a substring
    [label setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^ NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        NSRange boldRange = [[mutableAttributedString string] rangeOfString:@"ipsum dolar" options:NSCaseInsensitiveSearch];
        NSRange strikeRange = [[mutableAttributedString string] rangeOfString:@"sit amet" options:NSCaseInsensitiveSearch];
        
        // Core Text APIs use C functions without a direct bridge to UIFont. See Apple's "Core Text Programming Guide" to learn how to configure string attributes.
        UIFont *boldSystemFont = [UIFont boldSystemFontOfSize:14];
        CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)boldSystemFont.fontName, boldSystemFont.pointSize, NULL);
        if (font) {
            [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)font range:boldRange];
            [mutableAttributedString addAttribute:kTTTStrikeOutAttributeName value:[NSNumber numberWithBool:YES] range:strikeRange];
            CFRelease(font);
        }
        
        return mutableAttributedString;
    }];

    [self.textLink2 addSubview:label];
    
    
    
    self.UITextField .delegate = self;
    
    
    
}

//- (void)textFieldDidBeginEditing:(UITextField *) UITextField{
//    if (UITextField == self.UITextField) {
//        [UIView beginAnimations:nil context:NULL];
//        [UIView setAnimationDelegate:self];
//        [UIView setAnimationDuration:0.5];
//        [UIView setAnimationBeginsFromCurrentState:YES];
//        UITextField.frame = CGRectMake(UITextField.frame.origin.x, (UITextField.frame.origin.y - 200.0), UITextField.frame.size.width, UITextField.frame.size.height);
//        [UIView commitAnimations];
//    }
//}
//
//- (void)textFieldDidEndEditing:(UITextField *)UITextField{
//    if (UITextField == self.UITextField) {
//        [UIView beginAnimations:nil context:NULL];
//        [UIView setAnimationDelegate:self];
//        [UIView setAnimationDuration:0.5];
//        [UIView setAnimationBeginsFromCurrentState:YES];
//        UITextField.frame = CGRectMake(UITextField.frame.origin.x, (UITextField.frame.origin.y + 200.0), UITextField.frame.size.width, UITextField.frame.size.height);
//        [UIView commitAnimations];
//    }
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
     [self.view endEditing:YES];
}

- (IBAction)textField:(id)sender {
}
@end
