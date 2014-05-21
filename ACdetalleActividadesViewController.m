//
//  ACdetalleActividadesViewController.m
//  AnimaComic
//
//  Created by Jose Maria on 23/04/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//


#import <Social/Social.h>
#import "Actividad.h"
#import "ACdetalleActividadesViewController.h"
#define ACTIVIDAD @"http://animacomic.kometasoft.com/public/images/actividad/"
@interface ACdetalleActividadesViewController (){
    UIImage *img;

}

@end

@implementation ACdetalleActividadesViewController

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
    self.textoActividad.textAlignment=NSTextAlignmentJustified;

    if(self.actividad!=nil){
        self.textoActividad.text=self.actividad.descripcion;
        self.tituloActividad.text=self.actividad.titulo;
        self.subtituloActividad.text=self.actividad.subtitulo;
        self.horaActividad.text=self.actividad.horaInicio;
        self.horaFActividad.text=self.actividad.horaFin;
        self.webActividad.text=self.actividad.web;
        self.lugarActividad.text=self.actividad.lugar;
        self.horaFActividad.text=self.actividad.horaFin;
        self.fechaActividad.text=self.actividad.dia;
        NSString *urlString = [NSString stringWithFormat:@"%@%@",ACTIVIDAD,self.actividad.rutaFoto];
        NSURL *url = [NSURL URLWithString:urlString];
        img = [[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:url]];
        if(img==nil)
        {
            img = [UIImage imageNamed:@"noImage.png"];
        }
        self.imagenActividad.image = img;
        
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

- (IBAction)facebookButton:(id)sender {
    
//    NSArray *activityItems;
//    
//    if (self.imagenActividad.image != nil) {
//        activityItems = @[self.tituloActividad.text, self.imagenActividad.image,self.fechaActividad,self.horaActividad,self.horaFActividad,  self.textoActividad.text,self.webActividad.text];
//    } else {
//        activityItems = @[self.tituloActividad.text];
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
//                                                 UIActivityTypePostToTwitter];
//    
//    [self presentViewController:activityController
//                       animated:YES completion:nil];
    
        
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
            SLComposeViewController * fbSheetOBJ = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            
            NSString * titulo = [NSString stringWithFormat:@"%@\n%@", self.tituloActividad.text,self.textoActividad.text];
            [fbSheetOBJ setInitialText:titulo];
            [fbSheetOBJ addURL:[NSURL URLWithString:self.webActividad.text]];
            [fbSheetOBJ addImage:img];
            
            [self presentViewController:fbSheetOBJ animated:YES completion:Nil];
    }
}

- (IBAction)twitterButton:(id)sender {
    
//    NSArray *activityItems;
//    
//    if (self.imagenActividad.image != nil) {
//        activityItems = @[@"Asiste a ",self.tituloActividad.text,@" en ANIMACOMIC"];
//    } else {
//        activityItems = @[self.tituloActividad.text];
//    }
//    
//    UIActivityViewController *activityController =
//    [[UIActivityViewController alloc]
//     initWithActivityItems:activityItems
//     applicationActivities:nil];
//    
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
        NSString * titulo = [NSString stringWithFormat:@"Asiste a %@ en Animacomic", self.tituloActividad.text];
        [tweetSheetOBJ setInitialText:titulo];
        [self presentViewController:tweetSheetOBJ animated:YES completion:nil];
    }
    
}


@end
