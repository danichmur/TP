//
//  OpenGLView.h
//  HelloOpenGL
//
//  Created by Daniel Muraveyko on 26/04/2017.
//  Copyright © 2017 Daniel Muraveyko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OpenGLView : UIView {
    CAEAGLLayer* _eaglLayer;
    EAGLContext* _context;
    GLuint _colorRenderBuffer;
    
    
}

@end
