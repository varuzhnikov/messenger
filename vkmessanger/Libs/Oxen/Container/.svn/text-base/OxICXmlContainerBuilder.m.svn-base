//
//  OxICXmlContainerBuilder.m
//  Otra
//
//  Created by Lautaro Brasseur on 09/05/10.
//  Copyright 2010 Oxen Software Studio. All rights reserved.
//

#import "OxICXmlContainerBuilder.h"

#define CONTAINER_TAG "contanier"
#define OBJECT_TAG "object"
#define OBJECT_NAME_PROPERTY "id"
#define OBJECT_CLASSNAME_PROPERTY "class"
#define OBJECT_LAZY_PROPERTY "lazy"
#define OBJECT_SINGLETON_PROPERTY "singleton"
#define PROPERTY_TAG "property"
#define PROPERTY_NAME_PROPERTY "name"
#define PROPERTY_REF_PROPERTY "ref"

#define MAX_CHARS_TO_COMPARE_TAGS 100

// Forward reference. The structure is defined in full at the end of the file.
static xmlSAXHandler simpleSAXHandlerStruct;

@interface OxICXmlContainerBuilder()
@property (nonatomic, retain) OxICContainer *container;
@property (nonatomic, retain) OxICObjectDefinition *objectDefinition;
@property (nonatomic, retain) NSURLConnection *connection;
@property (nonatomic, retain) id<OxICContainerBuilderDelegate> delegate;
@end


@implementation OxICXmlContainerBuilder
@synthesize container;
@synthesize objectDefinition;
@synthesize connection;
@synthesize delegate;

#pragma mark Interface emthods
- (void) buildContainer: (NSURL*) xmlUrl
		   withDelegate: (id<OxICContainerBuilderDelegate>) aDelegate
	  andWrapperFactory:(id<OxICWrapperFactory>)wrapperFactory {

	self.delegate = aDelegate;
	
	self.container = [[OxICContainer alloc] initWithWrapperFactory:wrapperFactory];
	
	NSURLRequest *theRequest=[NSURLRequest requestWithURL:xmlUrl
											  cachePolicy:NSURLRequestUseProtocolCachePolicy
										  timeoutInterval:60.0];
	// create the connection with the request
	// and start loading the data
	NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
	self.connection = theConnection;
	[theConnection release];
	
	if (!self.connection) {
		[self.delegate containerBuildingError];
	}
}

#pragma mark init and dealloc
- (void) dealloc {
	self.container = nil;
	self.objectDefinition = nil;
	self.delegate = nil;
	self.connection = nil;
	[super dealloc];
}


#pragma mark connection delegate methods
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    context = xmlCreatePushParserCtxt(&simpleSAXHandlerStruct, self, NULL, 0, NULL);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    xmlParseChunk(context, (const char *)[data bytes], [data length], 0);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)aConnection {
    [aConnection release];
    xmlFreeParserCtxt(context);
	xmlCleanupParser();
	
	[self.delegate containerBuildingFinished:self.container];
	[self.container release];
}

- (void)connection:(NSURLConnection *)aConnection didFailWithError:(NSError *)error {
    [aConnection release];
    xmlFreeParserCtxt(context);
	xmlCleanupParser();

	[self.delegate containerBuildingError];
}

@end

#pragma mark Private C methods
static BOOL compareTag(const xmlChar *localname, const char *tagname) {
	return 0 == strncmp((const char *)localname, tagname, MAX_CHARS_TO_COMPARE_TAGS);
}

static CFStringRef createAttributeValue(const char *attributename, int nb_attributes, const xmlChar ** attributes) {
	unsigned int index = 0;
	for (int indexAttribute = 0; 
		 indexAttribute < nb_attributes; 
		 ++indexAttribute, index += 5 ) {
		const xmlChar *localname = attributes[index];
		
		if (compareTag(localname, attributename)) {
			const xmlChar *valueBegin = attributes[index+3];
			const xmlChar *valueEnd = attributes[index+4];
			
			return CFStringCreateWithBytes(NULL, valueBegin, valueEnd - valueBegin, kCFStringEncodingUTF8, NO);
		}
	}
	
	return NULL;
}

#pragma mark SAX methods
static void startElementSAX(void *ctx, const xmlChar *localname, const xmlChar *prefix, const xmlChar *URI, 
                            int nb_namespaces, const xmlChar **namespaces, int nb_attributes, int nb_defaulted, const xmlChar **attributes) {
    OxICXmlContainerBuilder *builder = (OxICXmlContainerBuilder *)ctx;
	
	if (compareTag(localname, CONTAINER_TAG)) {
		// nothing to do
	} else if (compareTag(localname, OBJECT_TAG)) {
		builder.objectDefinition = [[OxICObjectDefinition alloc] init];
		
		CFStringRef name = createAttributeValue(OBJECT_NAME_PROPERTY, nb_attributes, attributes);
		if (name) {
			builder.objectDefinition.name = (NSString*)name;
			CFRelease(name);
		}
		
		CFStringRef className = createAttributeValue(OBJECT_CLASSNAME_PROPERTY, nb_attributes, attributes);
		if (className) {
			builder.objectDefinition.className = (NSString*)className;
			CFRelease(className);
		}
		
		CFStringRef lazy = createAttributeValue(OBJECT_LAZY_PROPERTY, nb_attributes, attributes);
		if (lazy) {
			builder.objectDefinition.lazy = [(NSString*)lazy isEqualToString:@"true"];
			CFRelease(lazy);
		}
		
		CFStringRef singleton = createAttributeValue(OBJECT_SINGLETON_PROPERTY, nb_attributes, attributes);
		if (singleton) {
			builder.objectDefinition.singleton = [(NSString*)singleton isEqualToString:@"true"];
			CFRelease(singleton);
		}
		
	} else if (compareTag(localname, PROPERTY_TAG)) {
		CFStringRef name = createAttributeValue(PROPERTY_NAME_PROPERTY, nb_attributes, attributes);

		if (name) {
			CFStringRef ref = createAttributeValue(PROPERTY_REF_PROPERTY, nb_attributes, attributes);
			if (ref) {
				[builder.objectDefinition addPropertyReference:(NSString*)name toObjectName:(NSString*)ref];
				CFRelease(ref);
			}
			CFRelease(name);
		}
	}
	
}

static void	endElementSAX(void *ctx, const xmlChar *localname, const xmlChar *prefix, const xmlChar *URI) {    
    OxICXmlContainerBuilder *builder = (OxICXmlContainerBuilder *)ctx;
	if (compareTag(localname, OBJECT_TAG)) {
		[builder.container addDefinition:builder.objectDefinition];
		[builder.objectDefinition release];
	}
	
}

static void errorEncounteredSAX(void *ctx, const char *msg, ...) {
    OxICXmlContainerBuilder *builder = (OxICXmlContainerBuilder *)ctx;
	[builder.delegate containerBuildingError];
}

static xmlSAXHandler simpleSAXHandlerStruct = {
    NULL,                       /* internalSubset */
    NULL,                       /* isStandalone   */
    NULL,                       /* hasInternalSubset */
    NULL,                       /* hasExternalSubset */
    NULL,                       /* resolveEntity */
    NULL,                       /* getEntity */
    NULL,                       /* entityDecl */
    NULL,                       /* notationDecl */
    NULL,                       /* attributeDecl */
    NULL,                       /* elementDecl */
    NULL,                       /* unparsedEntityDecl */
    NULL,                       /* setDocumentLocator */
    NULL,                       /* startDocument */
    NULL,                       /* endDocument */
    NULL,                       /* startElement*/
    NULL,                       /* endElement */
    NULL,                       /* reference */
    NULL,						/* characters */
    NULL,                       /* ignorableWhitespace */
    NULL,                       /* processingInstruction */
    NULL,                       /* comment */
    NULL,                       /* warning */
    errorEncounteredSAX,        /* error */
    NULL,                       /* fatalError //: unused error() get all the errors */
    NULL,                       /* getParameterEntity */
    NULL,                       /* cdataBlock */
    NULL,                       /* externalSubset */
    XML_SAX2_MAGIC,             //
    NULL,
    startElementSAX,            /* startElementNs */
    endElementSAX,              /* endElementNs */
    NULL,                       /* serror */
};
