/*
	ANExpositorWS.h
	The implementation of properties and methods for the ANExpositorWS object.
	Generated by SudzC.com
*/
#import "ANExpositorWS.h"

@implementation ANExpositorWS
	@synthesize _id = __id;
	@synthesize nombre = _nombre;
	@synthesize descripcion = _descripcion;
	@synthesize rutalogo = _rutalogo;
	@synthesize web = _web;
	@synthesize facebook = _facebook;
	@synthesize twitter = _twitter;
	@synthesize telefono = _telefono;
	@synthesize correo = _correo;
	@synthesize fechaultcomp = _fechaultcomp;

	- (id) init
	{
		if(self = [super init])
		{
			self.nombre = nil;
			self.descripcion = nil;
			self.rutalogo = nil;
			self.web = nil;
			self.facebook = nil;
			self.twitter = nil;
			self.telefono = nil;
			self.correo = nil;
			self.fechaultcomp = nil;

		}
		return self;
	}

	+ (ANExpositorWS*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return [[self alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self._id = [[Soap getNodeValue: node withName: @"id"] intValue];
			self.nombre = [Soap getNodeValue: node withName: @"nombre"];
			self.descripcion = [Soap getNodeValue: node withName: @"descripcion"];
			self.rutalogo = [Soap getNodeValue: node withName: @"rutalogo"];
			self.web = [Soap getNodeValue: node withName: @"web"];
			self.facebook = [Soap getNodeValue: node withName: @"facebook"];
			self.twitter = [Soap getNodeValue: node withName: @"twitter"];
			self.telefono = [Soap getNodeValue: node withName: @"telefono"];
			self.correo = [Soap getNodeValue: node withName: @"correo"];
			self.fechaultcomp = [Soap getNodeValue: node withName: @"fechaultcomp"];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"ExpositorWS"];
	}
  
	- (NSMutableString*) serialize: (NSString*) nodeName
	{
		NSMutableString* s = [NSMutableString string];
		[s appendFormat: @"<%@", nodeName];
		[s appendString: [self serializeAttributes]];
		[s appendString: @">"];
		[s appendString: [self serializeElements]];
		[s appendFormat: @"</%@>", nodeName];
		return s;
	}
	
	- (NSMutableString*) serializeElements
	{
		NSMutableString* s = [super serializeElements];
		[s appendFormat: @"<id>%@</id>", [NSString stringWithFormat: @"%i", self._id]];
		if (self.nombre != nil) [s appendFormat: @"<nombre>%@</nombre>", [[self.nombre stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.descripcion != nil) [s appendFormat: @"<descripcion>%@</descripcion>", [[self.descripcion stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.rutalogo != nil) [s appendFormat: @"<rutalogo>%@</rutalogo>", [[self.rutalogo stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.web != nil) [s appendFormat: @"<web>%@</web>", [[self.web stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.facebook != nil) [s appendFormat: @"<facebook>%@</facebook>", [[self.facebook stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.twitter != nil) [s appendFormat: @"<twitter>%@</twitter>", [[self.twitter stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.telefono != nil) [s appendFormat: @"<telefono>%@</telefono>", [[self.telefono stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.correo != nil) [s appendFormat: @"<correo>%@</correo>", [[self.correo stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.fechaultcomp != nil) [s appendFormat: @"<fechaultcomp>%@</fechaultcomp>", [[self.fechaultcomp stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[ANExpositorWS class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
