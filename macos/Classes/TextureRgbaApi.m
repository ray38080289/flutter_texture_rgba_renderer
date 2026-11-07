//
//  TextureRgbaApi.m
//  texture_rgba_renderer
//
//  Created by kingtous on 2023/2/19.
//

#import <Foundation/Foundation.h>
#import <CoreVideo/CoreVideo.h>
#import "texture_rgba_renderer/texture_rgba_renderer-Swift.h"

#if __cplusplus
extern "C" {
#endif
    
/// Keep the same name with Windows.
void FlutterRgbaRendererPluginOnRgba(void* texture_rgba_ptr, const uint8_t* buffer, int len, int width, int height, int stride_align) {
    TextRgba* texture_rgba = (__bridge TextRgba *)(texture_rgba_ptr);
    [texture_rgba markFrameAvaliableRawWithBuffer:buffer len:len width:width height:height stride_align: stride_align];
}

/// macOS only: show a CVPixelBuffer (retained here for as long as the texture shows it) without copying it.
/// Returns 1 if the texture took it.
int FlutterRgbaRendererPluginOnPixelBuffer(void* texture_rgba_ptr, CVPixelBufferRef pixel_buffer) {
    if (!texture_rgba_ptr || !pixel_buffer) return 0;
    TextRgba* texture_rgba = (__bridge TextRgba *)(texture_rgba_ptr);
    return [texture_rgba markPixelBufferAvaliable:pixel_buffer] ? 1 : 0;
}

#if __cplusplus
} //Extern C
#endif
