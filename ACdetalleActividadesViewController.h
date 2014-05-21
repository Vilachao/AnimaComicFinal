//
//  ACdetalleActividadesViewController.h
//  AnimaComic
//
//  Created by Jose Maria on 23/04/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Actividad, ACactividadesViewController;


@interface ACdetalleActividadesViewController : UIViewController


@property (nonatomic, strong) Actividad *actividad;

@property (weak, nonatomic) IBOutlet UIImageView *imagenActividad;
@property (weak, nonatomic) IBOutlet UILabel *fechaActividad;
@property (weak, nonatomic) IBOutlet UILabel *horaActividad;
@property (weak, nonatomic) IBOutlet UILabel *horaFActividad;
@property (weak, nonatomic) IBOutlet UILabel *lugarActividad;

@property (weak, nonatomic) IBOutlet UILabel *tituloActividad;
@property (weak, nonatomic) IBOutlet UILabel *subtituloActividad;
@property (weak, nonatomic) IBOutlet UITextView *textoActividad;
@property (weak, nonatomic) IBOutlet UILabel *webActividad;

- (IBAction)twitterButton:(id)sender;
- (IBAction)facebookButton:(id)sender;


@end
