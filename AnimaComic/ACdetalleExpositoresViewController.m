//
//  ACdetalleExpositoresViewController.m
//  AnimaComic
//
//  Created by Jose Maria on 22/04/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//

#import "ACdetalleExpositoresViewController.h"
#import "ACexpositoresViewController.h"
#import "MBProgressHUD.h"
#import "ANWsclassService.h"
#import "ACAppDelegate.h"
#import "Expositor.h"
#import "MBProgressHUD.h"
#import <Social/Social.h>



#define EXPOSITOR @"http://animacomic.kometasoft.com/public/images/expositor/"
#define ACTIVIDAD @"http://animacomic.kometasoft.com/public/images/actividad"

@interface ACdetalleExpositoresViewController (){
    UIImage *img;
}

@end

@implementation ACdetalleExpositoresViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
[self.navigationItem setHidesBackButton:YES animated:YES];
    self.textoExpositor.textAlignment=NSTextAlignmentJustified;
    if(self.expositor!=nil){
        self.textoExpositor.text=self.expositor.descripcion;
        self.nombreExpositor.text=self.expositor.nombre;
        self.webExpositor.text=self.expositor.web;
        NSString *urlString = [NSString stringWithFormat:@"%@%@",EXPOSITOR,self.expositor.rutaLogo];
        NSURL *url = [NSURL URLWithString:urlString];
        img = [[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:url]];
        if(img==nil)
        {
            img = [UIImage imageNamed:@"noImage.png"];
        }
            self.imagenExpositor.image = img;
    
    }

}

-(void)viewDidDisappear:(BOOL)animated{


[self.navigationController popViewControllerAnimated:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)callButton:(id)sender {
    NSString * telefono = [NSString stringWithFormat:@"telprompt://%@",self.expositor.telefono];
    NSURL *phoneNumber = [NSURL URLWithString:telefono];
    [[UIApplication sharedApplication] openURL:phoneNumber];
}

- (IBAction)mailButton:(id)sender {
    
    
    NSString * email = [NSString stringWithFormat:@"mailto:%@",self.expositor.correo];
    
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

- (IBAction)facebookButton:(id)sender {
    
//    NSArray *activityItems;
//    
//    if (self.imagenExpositor.image != nil) {
//        activityItems = @[self.nombreExpositor.text, self.imagenExpositor.image, self.textoExpositor.text,self.webExpositor.text];
//    } else {
//        activityItems = @[self.nombreExpositor.text];
//    }
//    
//    UIActivityViewController *activityController =
//    [[UIActivityViewController alloc]
//     initWithActivityItems:activityItems
//     applicationActivities:nil];
//    
//    activityController.excludedActivityTypes = @[UIActivityTypePostToWeibo,
//                                         UIActivityTypeMessage,
//                                         UIActivityTypeMail,
//                                         UIActivityTypePrint,
//                                         UIActivityTypeCopyToPasteboard,
//                                         UIActivityTypeAssignToContact,
//                                         UIActivityTypeSaveToCameraRoll,
//                                         UIActivityTypeAddToReadingList,
//                                         UIActivityTypePostToFlickr,
//                                         UIActivityTypePostToVimeo,
//                                         UIActivityTypePostToTencentWeibo,
//                                         UIActivityTypeAirDrop,
//                                                 UIActivityTypePostToTwitter];
//    
//    [self presentViewController:activityController
//                       animated:YES completion:nil];
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController * fbSheetOBJ = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        NSString * titulo = [NSString stringWithFormat:@"%@\n%@", self.nombreExpositor.text,self.textoExpositor.text];
        [fbSheetOBJ setInitialText:titulo];
        [fbSheetOBJ addURL:[NSURL URLWithString:self.webExpositor.text]];
        [fbSheetOBJ addImage:img];
        
        [self presentViewController:fbSheetOBJ animated:YES completion:Nil];
    }
    
}

- (IBAction)twitterButton:(id)sender {
    
//    NSArray *activityItems;
//    
//    if (self.imagenExpositor.image != nil) {
//        activityItems = @[@"Visita a ",self.nombreExpositor.text,@" en ANIMACOMIC"];
//    } else {
//        activityItems = @[self.nombreExpositor.text];
//    }
//    
//    UIActivityViewController *activityController =
//    [[UIActivityViewController alloc]
//     initWithActivityItems:activityItems
//     applicationActivities:nil];
//    
//    activityController.excludedActivityTypes = @[UIActivityTypePostToWeibo,
//                                                 UIActivityTypeMessage,
//                                                 UIActivityTypeMail,
//                                                 UIActivityTypePrint,
//                                                 UIActivityTypeCopyToPasteboard,
//                                                 UIActivityTypeAssignToContact,
//                                                 UIActivityTypeSaveToCameraRoll,
//                                                 UIActivityTypeAddToReadingList,
//                                                 UIActivityTypePostToFlickr,
//                                                 UIActivityTypePostToVimeo,
//                                                 UIActivityTypePostToTencentWeibo,
//                                                 UIActivityTypeAirDrop,
//                                                 UIActivityTypePostToFacebook];
//    
//    [self presentViewController:activityController
//                       animated:YES completion:nil];
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheetOBJ = [SLComposeViewController
                                                  composeViewControllerForServiceType:SLServiceTypeTwitter];
        NSString * titulo = [NSString stringWithFormat:@"Visita a %@ en Animacomic", self.nombreExpositor.text];
        [tweetSheetOBJ setInitialText:titulo];
        [self presentViewController:tweetSheetOBJ animated:YES completion:nil];
    }
    
}

@end
