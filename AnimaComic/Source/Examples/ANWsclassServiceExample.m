/*
	ANWsclassServiceExample.m
	Provides example and test runs the service's proxy methods.
	Generated by SudzC.com
*/
#import "ANWsclassServiceExample.h"
#import "ANWsclassService.h"

@implementation ANWsclassServiceExample

- (void)run {
	// Create the service
	ANWsclassService* service = [ANWsclassService service];
	service.logging = YES;
	// service.username = @"username";
	// service.password = @"password";
	

	// Returns ANActividadWS*
	/*  */
	[service getActividadById:self action:@selector(getActividadByIdHandler:) idActividad: 0];

	// Returns ANArrayOfActividad*
	/*  */
	[service getAllActividad:self action:@selector(getAllActividadHandler:) lastId: 0 offset: 0 limit: 0 fechaUltComp: @""];

	// Returns ANArrayOfExpositor*
	/*  */
	[service getAllExpositor:self action:@selector(getAllExpositorHandler:) lastId: 0 offset: 0 limit: 0 fechaUltComp: @""];

	// Returns NSString*
	/*  */
	[service getEntrada:self action:@selector(getEntradaHandler:) nombre: @"" dni: @""];

	// Returns ANExpositorWS*
	/*  */
	[service getExpositorById:self action:@selector(getExpositorByIdHandler:) idExpositor: 0];

	// Returns int
	/* Datos necesarios para enviar notificacion */
	[service registrarNotificacion:self action:@selector(registrarNotificacionHandler:) deviceId: @"" sistema: @"" idioma: @"" version: @""];
}

	

// Handle the response from getActividadById.
		
- (void) getActividadByIdHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the ANActividadWS* result
		ANActividadWS* result = (ANActividadWS*)value;
	NSLog(@"getActividadById returned the value: %@", result);
			
}
	

// Handle the response from getAllActividad.
		
- (void) getAllActividadHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the ANArrayOfActividad* result
		ANArrayOfActividad* result = (ANArrayOfActividad*)value;
	NSLog(@"getAllActividad returned the value: %@", result);
			
}
	

// Handle the response from getAllExpositor.
		
- (void) getAllExpositorHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the ANArrayOfExpositor* result
		ANArrayOfExpositor* result = (ANArrayOfExpositor*)value;
	NSLog(@"getAllExpositor returned the value: %@", result);
			
}
	

// Handle the response from getEntrada.
		
- (void) getEntradaHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the NSString* result
		NSString* result = (NSString*)value;
	NSLog(@"getEntrada returned the value: %@", result);
			
}
	

// Handle the response from getExpositorById.
		
- (void) getExpositorByIdHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the ANExpositorWS* result
		ANExpositorWS* result = (ANExpositorWS*)value;
	NSLog(@"getExpositorById returned the value: %@", result);
			
}
	

// Handle the response from registrarNotificacion.
		
- (void) registrarNotificacionHandler: (int) value {
			

	// Do something with the int result
		
	NSLog(@"registrarNotificacion returned the value: %@", [NSNumber numberWithInt:value]);
			
}
	

@end
		