
//          Copyright 2019 - 2022 Michael D. Parker
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.freeimage.binddynamic;

version(BindFI_Static) {}
else version = BindFI_Dynamic;

version(BindFI_Dynamic):

import core.stdc.config,
       core.stdc.stddef;

import bindbc.loader;
import bindbc.freeimage.types;

extern(System) @nogc nothrow {
    alias pFreeImage_Initialise = void function(BOOL load_local_plugins_only = FALSE);
    alias pFreeImage_DeInitialise = void function();
    alias pFreeImage_GetVersion = const(char)* function();
    alias pFreeImage_GetCopyrightMessage = const(char)* function();

    alias pFreeImage_SetOutputMessageStdCall = void function(FreeImage_OutputMessageFunctionStdCall);
    alias pFreeImage_SetOutputMessage = void function(FreeImage_OutputMessageFunction);

    alias pFreeImage_OutputMessageProc = void function(int,const(char)* fmt, ...);

    alias pFreeImage_Allocate = FIBITMAP* function(int,int,int,uint red_mask = 0,uint green_mask = 0,uint blue_mask = 0);
    alias pFreeImage_AllocateT = FIBITMAP* function(FREE_IMAGE_TYPE type,int,int,int bpp = 8,uint red_mask = 0,uint green_mask = 0,uint blue_mask = 0);
    alias pFreeImage_Clone = FIBITMAP* function(FIBITMAP*);
    alias pFreeImage_Unload = void function(FIBITMAP*);

    alias pFreeImage_HasPixels = BOOL function(FIBITMAP*);

    alias pFreeImage_Load = FIBITMAP* function(FREE_IMAGE_FORMAT,const(char)*,int flags = 0);
    alias pFreeImage_LoadU = FIBITMAP* function(FREE_IMAGE_FORMAT,const(wchar_t)*,int flags = 0);
    alias pFreeImage_LoadFromHandle = FIBITMAP* function(FREE_IMAGE_FORMAT,FreeImageIO*,fi_handle,int flags = 0);
    alias pFreeImage_Save = BOOL function(FREE_IMAGE_FORMAT,FIBITMAP*,const(char)*,int flags = 0);
    alias pFreeImage_SaveU = BOOL function(FREE_IMAGE_FORMAT,FIBITMAP*,const(wchar_t)*,int flags = 0);
    alias pFreeImage_SaveToHandle = BOOL function(FREE_IMAGE_FORMAT,FIBITMAP*,FreeImageIO*,fi_handle,int flags = 0);

    alias pFreeImage_OpenMemory = FIMEMORY* function(BYTE* data = null,DWORD size_in_bytes = 0);
    alias pFreeImage_CloseMemory = void function(FIMEMORY*);
    alias pFreeImage_LoadFromMemory = FIBITMAP* function(FREE_IMAGE_FORMAT,FIMEMORY*,int flags = 0);
    alias pFreeImage_SaveToMemory = BOOL function(FREE_IMAGE_FORMAT,FIBITMAP*,FIMEMORY*,int flags = 0);
    alias pFreeImage_TellMemory = c_long function(FIMEMORY*);
    alias pFreeImage_SeekMemory = BOOL function(FIMEMORY*,c_long,int);
    alias pFreeImage_AcquireMemory = BOOL function(FIMEMORY*,BYTE**,DWORD*);
    alias pFreeImage_ReadMemory = uint function(void*,uint,uint,FIMEMORY*);
    alias pFreeImage_WriteMemory = uint function(const(void*),uint,uint,FIMEMORY*);

    alias pFreeImage_LoadMultiBitmapFromMemory = FIMULTIBITMAP* function(FREE_IMAGE_FORMAT,FIMEMORY*,int flags = 0);
    alias pFreeImage_SaveMultiBitmapToMemory = BOOL function(FREE_IMAGE_FORMAT,FIMULTIBITMAP*,FIMEMORY*,int flags);

    alias pFreeImage_RegisterLocalPlugin = FREE_IMAGE_FORMAT function(FI_InitProc proc_address,const(char)* format = null,const(char)* description = null,const(char)* extension = null,const(char)* regexpr = null);

    version(Windows) {
        alias  pFreeImage_RegisterExternalPlugin = FREE_IMAGE_FORMAT function(const(char)* path,const(char)* format = null,const(char)* description = null,const(char)* extension = null,const(char)* regexpr = null);
    }

    alias pFreeImage_GetFIFCount = int function();
    alias pFreeImage_SetPluginEnabled = int function(FREE_IMAGE_FORMAT,BOOL);
    alias pFreeImage_IsPluginEnabled = int function(FREE_IMAGE_FORMAT);
    alias pFreeImage_GetFIFFromFormat = FREE_IMAGE_FORMAT function(const(char)*);
    alias pFreeImage_GetFIFFromMime = FREE_IMAGE_FORMAT function(const(char)*);
    alias pFreeImage_GetFormatFromFIF = const(char)* function(FREE_IMAGE_FORMAT);
    alias pFreeImage_GetFIFExtensionList = const(char)* function(FREE_IMAGE_FORMAT);
    alias pFreeImage_GetFIFDescription = const(char)* function(FREE_IMAGE_FORMAT);
    alias pFreeImage_GetFIFRegExpr = const(char)* function(FREE_IMAGE_FORMAT);
    alias pFreeImage_GetFIFMimeType = const(char)* function(FREE_IMAGE_FORMAT);
    alias pFreeImage_GetFIFFromFilename = FREE_IMAGE_FORMAT function(const(char)*);
    alias pFreeImage_GetFIFFromFilenameU = FREE_IMAGE_FORMAT function(const(wchar_t)*);
    alias pFreeImage_FIFSupportsReading = BOOL function(FREE_IMAGE_FORMAT);
    alias pFreeImage_FIFSupportsWriting = BOOL function(FREE_IMAGE_FORMAT);
    alias pFreeImage_FIFSupportsExportBPP = BOOL function(FREE_IMAGE_FORMAT,int);
    alias pFreeImage_FIFSupportsExportType = BOOL function(FREE_IMAGE_FORMAT, FREE_IMAGE_TYPE);
    alias pFreeImage_FIFSupportsICCProfiles = BOOL function(FREE_IMAGE_FORMAT);
    alias pFreeImage_FIFSupportsNoPixels = BOOL function(FREE_IMAGE_FORMAT);

    alias pFreeImage_OpenMultiBitmap = FIMULTIBITMAP* function(FREE_IMAGE_FORMAT,const(char)*,BOOL,BOOL,BOOL keep_cache_in_memory = FALSE,int flags = 0);
    alias pFreeImage_OpenMultiBitmapFromHandle = FIMULTIBITMAP* function(FREE_IMAGE_FORMAT,FreeImageIO*,fi_handle,int flags = 0);
    alias pFreeImage_SaveMultiBitmapToHandle = BOOL function(FREE_IMAGE_FORMAT, FIMULTIBITMAP* bitmap,FreeImageIO*,fi_handle,int flags = 0);
    alias pFreeImage_CloseMultiBitmap = BOOL function(FIMULTIBITMAP*,int flags = 0);
    alias pFreeImage_GetPageCount = int function(FIMULTIBITMAP*);
    alias pFreeImage_AppendPage = void function(FIMULTIBITMAP*,FIBITMAP*);
    alias pFreeImage_InsertPage = void function(FIMULTIBITMAP*,int,FIBITMAP*);
    alias pFreeImage_DeletePage = void function(FIMULTIBITMAP*,int);
    alias pFreeImage_LockPage = FIBITMAP* function(FIMULTIBITMAP*,int);
    alias pFreeImage_UnlockPage = void function(FIMULTIBITMAP*,FIBITMAP*,BOOL);
    alias pFreeImage_MovePage = BOOL function(FIMULTIBITMAP*,int,int);
    alias pFreeImage_GetLockedPageNumbers = BOOL function(FIMULTIBITMAP*,int*,int*);

    alias pFreeImage_GetFileType = FREE_IMAGE_FORMAT function(const(char)*,int size = 0);
    alias pFreeImage_GetFileTypeU = FREE_IMAGE_FORMAT function(const(wchar_t)*,int size = 0);
    alias pFreeImage_GetFileTypeFromHandle = FREE_IMAGE_FORMAT function(FreeImageIO*,fi_handle,int size = 0);
    alias pFreeImage_GetFileTypeFromMemory = FREE_IMAGE_FORMAT function(FIMEMORY*,int size = 0);

    alias pFreeImage_GetImageType = FREE_IMAGE_TYPE function(FIBITMAP*);

    alias pFreeImage_IsLittleEndian = BOOL function();
    alias pFreeImage_LookupX11Color = BOOL function(const(char)*,BYTE*,BYTE*,BYTE*);
    alias pFreeImage_LookupSVGColor = BOOL function(const(char)*,BYTE*,BYTE*,BYTE*);

    alias pFreeImage_GetBits = BYTE* function(FIBITMAP*);
    alias pFreeImage_GetScanLine = BYTE* function(FIBITMAP*,int);

    alias pFreeImage_GetPixelIndex = BOOL function(FIBITMAP*,uint,uint,BYTE*);
    alias pFreeImage_GetPixelColor = BOOL function(FIBITMAP*,uint,uint,RGBQUAD*);
    alias pFreeImage_SetPixelIndex = BOOL function(FIBITMAP*,uint,uint,BYTE*);
    alias pFreeImage_SetPixelColor = BOOL function(FIBITMAP*,uint,uint,RGBQUAD*);

    alias pFreeImage_GetColorsUsed = uint function(FIBITMAP*);
    alias pFreeImage_GetBPP = uint function(FIBITMAP*);
    alias pFreeImage_GetWidth = uint function(FIBITMAP*);
    alias pFreeImage_GetHeight = uint function(FIBITMAP*);
    alias pFreeImage_GetLine = uint function(FIBITMAP*);
    alias pFreeImage_GetPitch = uint function(FIBITMAP*);
    alias pFreeImage_GetDIBSize = uint function(FIBITMAP*);
    alias pFreeImage_GetMemorySize = uint function(FIBITMAP*); // Added in 3.17.0
    alias pFreeImage_GetPalette =RGBQUAD* function(FIBITMAP*);

    alias pFreeImage_GetDotsPerMeterX = uint function(FIBITMAP*);
    alias pFreeImage_GetDotsPerMeterY = uint function(FIBITMAP*);
    alias pFreeImage_SetDotsPerMeterX = void function(FIBITMAP*,uint);
    alias pFreeImage_SetDotsPerMeterY = void function(FIBITMAP*,uint);

    alias pFreeImage_GetInfoHeader = BITMAPINFOHEADER* function(FIBITMAP*);
    alias pFreeImage_GetInfo = BITMAPINFO* function(FIBITMAP*);
    alias pFreeImage_GetColorType = FREE_IMAGE_COLOR_TYPE function(FIBITMAP*);

    alias pFreeImage_GetRedMask = uint function(FIBITMAP*);
    alias pFreeImage_GetGreenMask = uint function(FIBITMAP*);
    alias pFreeImage_GetBlueMask = uint function(FIBITMAP*);

    alias pFreeImage_GetTransparencyCount = uint function(FIBITMAP*);
    alias pFreeImage_GetTransparencyTable = BYTE* function(FIBITMAP*);
    alias pFreeImage_SetTransparent = void function(FIBITMAP*,BOOL);
    alias pFreeImage_SetTransparencyTable = void function(FIBITMAP*,BYTE*,int);
    alias pFreeImage_IsTransparent = BOOL function(FIBITMAP*);
    alias pFreeImage_SetTransparentIndex = void function(FIBITMAP*,int);
    alias pFreeImage_GetTransparentIndex = int function(FIBITMAP*);

    alias pFreeImage_HasBackgroundColor = BOOL function(FIBITMAP*);
    alias pFreeImage_GetBackgroundColor = BOOL function(FIBITMAP*,RGBQUAD*);
    alias pFreeImage_SetBackgroundColor = BOOL function(FIBITMAP*,RGBQUAD*);

    alias pFreeImage_GetThumbnail = FIBITMAP* function(FIBITMAP*);
    alias pFreeImage_SetThumbnail = BOOL function(FIBITMAP*,FIBITMAP*);

    alias pFreeImage_GetICCProfile = FIICCPROFILE* function(FIBITMAP*);
    alias pFreeImage_CreateICCProfile = FIICCPROFILE* function(FIBITMAP*,void*,c_long);
    alias pFreeImage_DestroyICCProfile = void function(FIBITMAP*);

    alias pFreeImage_ConvertLine1To4 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine8To4 = void function(BYTE*,BYTE*,int,RGBQUAD*);
    alias pFreeImage_ConvertLine16To4_555 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine16To4_565 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine24To4 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine32To4 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine1To8 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine4To8 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine16To8_555 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine16To8_565 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine24To8 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine32To8 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine1To16_555 = void function(BYTE*,BYTE*,int,RGBQUAD*);
    alias pFreeImage_ConvertLine4To16_555 = void function(BYTE*,BYTE*,int,RGBQUAD*);
    alias pFreeImage_ConvertLine8To16_555 = void function(BYTE*,BYTE*,int,RGBQUAD*);
    alias pFreeImage_ConvertLine16_565_To16_555 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine24To16_555 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine32To16_555 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine1To16_565 = void function(BYTE*,BYTE*,int,RGBQUAD*);
    alias pFreeImage_ConvertLine4To16_565 = void function(BYTE*,BYTE*,int,RGBQUAD*);
    alias pFreeImage_ConvertLine8To16_565 = void function(BYTE*,BYTE*,int,RGBQUAD*);
    alias pFreeImage_ConvertLine16_555_To16_565 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine24To16_565 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine32To16_565 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine1To24 = void function(BYTE*,BYTE*,int,RGBQUAD*);
    alias pFreeImage_ConvertLine4To24 = void function(BYTE*,BYTE*,int,RGBQUAD*);
    alias pFreeImage_ConvertLine8To24 = void function(BYTE*,BYTE*,int,RGBQUAD*);
    alias pFreeImage_ConvertLine16To24_555 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine16To24_565 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine32To24 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine1To32 = void function(BYTE*,BYTE*,int,RGBQUAD*);
    alias pFreeImage_ConvertLine4To32 = void function(BYTE*,BYTE*,int,RGBQUAD*);
    alias pFreeImage_ConvertLine8To32 = void function(BYTE*,BYTE*,int,RGBQUAD*);
    alias pFreeImage_ConvertLine16To32_555 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine16To32_565 = void function(BYTE*,BYTE*,int);
    alias pFreeImage_ConvertLine24To32 = void function(BYTE*,BYTE*,int);

    alias pFreeImage_ConvertTo4Bits = FIBITMAP* function(FIBITMAP*);
    alias pFreeImage_ConvertTo8Bits = FIBITMAP* function(FIBITMAP*);
    alias pFreeImage_ConvertToGreyscale = FIBITMAP* function(FIBITMAP*);
    alias pFreeImage_ConvertTo16Bits555 = FIBITMAP* function(FIBITMAP*);
    alias pFreeImage_ConvertTo16Bits565 = FIBITMAP* function(FIBITMAP*);
    alias pFreeImage_ConvertTo24Bits = FIBITMAP* function(FIBITMAP*);
    alias pFreeImage_ConvertTo32Bits = FIBITMAP* function(FIBITMAP*);
    alias pFreeImage_ColorQuantize = FIBITMAP* function(FIBITMAP*,FREE_IMAGE_QUANTIZE);
    alias pFreeImage_ColorQuantizeEx = FIBITMAP* function(FIBITMAP*,FREE_IMAGE_QUANTIZE quantize = FIQ_WUQUANT,int PaletteSize = 256,int ReserveSize = 0,RGBQUAD* ReservePalette = null);
    alias pFreeImage_Threshold = FIBITMAP* function(FIBITMAP*,BYTE);
    alias pFreeImage_Dither = FIBITMAP* function(FIBITMAP*,FREE_IMAGE_DITHER);

    alias pFreeImage_ConvertFromRawBits = FIBITMAP* function(BYTE*,int,int,int,uint,uint,uint,uint,BOOL topdown = FALSE);
    alias pFreeImage_ConvertFromRawBitsEx = FIBITMAP* function(BOOL,BYTE*,FREE_IMAGE_TYPE,int,int,int,uint,uint,uint,uint,BOOL topdown=FALSE);    // Added in 3.17.0
    alias pFreeImage_ConvertToRawBits = void function(BYTE*,FIBITMAP*,int,uint,uint,uint,uint,BOOL topdown = FALSE);

    alias pFreeImage_ConvertToFloat = FIBITMAP* function(FIBITMAP*);
    alias pFreeImage_ConvertToRGBF = FIBITMAP* function(FIBITMAP*);
    alias pFreeImage_ConvertToRGBAF = FIBITMAP* function(FIBITMAP*);    // Added in 3.17.0
    alias pFreeImage_ConvertToUINT16 = FIBITMAP* function(FIBITMAP*);
    alias pFreeImage_ConvertToRGB16 = FIBITMAP* function(FIBITMAP*);
    alias pFreeImage_ConvertToRGBA16 = FIBITMAP* function(FIBITMAP*);   // Added in 3.17.0

    alias pFreeImage_ConvertToStandardType = FIBITMAP* function(FIBITMAP*,BOOL scale_linear = TRUE);
    alias pFreeImage_ConvertToType = FIBITMAP* function(FIBITMAP*, FREE_IMAGE_TYPE,BOOL scale_linear = TRUE);

    alias pFreeImage_ToneMapping = FIBITMAP* function(FIBITMAP*, FREE_IMAGE_TMO,double first_param = 0,double second_param = 0);
    alias pFreeImage_TmoDrago03 = FIBITMAP* function(FIBITMAP* src,double gamma = 2.2,double exposure = 0);
    alias pFreeImage_TmoReinhard05 = FIBITMAP* function(FIBITMAP* src,double intensity = 0,double contrast = 0);
    alias pFreeImage_TmoReinhard05Ex = FIBITMAP* function(FIBITMAP* src,double intensity = 0,double contrast = 0,double adaptation = 1,double color_correction = 0);

    alias pFreeImage_TmoFattal02 = FIBITMAP* function(FIBITMAP* src,double color_saturation = 0.5,double attenuation = 0.85);

    alias pFreeImage_ZLibCompress =DWORD function(BYTE*,DWORD,BYTE*,DWORD);
    alias pFreeImage_ZLibUncompress =DWORD function(BYTE*,DWORD,BYTE*,DWORD);
    alias pFreeImage_ZLibGZip =DWORD function(BYTE*,DWORD,BYTE*,DWORD);
    alias pFreeImage_ZLibGUnzip =DWORD function(BYTE*,DWORD,BYTE*,DWORD);
    alias pFreeImage_ZLibCRC32 =DWORD function(DWORD,BYTE*,DWORD);

    alias pFreeImage_CreateTag = FITAG* function();
    alias pFreeImage_DeleteTag = void function(FITAG*);
    alias pFreeImage_CloneTag = FITAG* function(FITAG*);

    alias pFreeImage_GetTagKey = const(char)* function(FITAG*);
    alias pFreeImage_GetTagDescription = const(char)* function(FITAG*);
    alias pFreeImage_GetTagID = WORD function(FITAG*);
    alias pFreeImage_GetTagType = FREE_IMAGE_MDTYPE function(FITAG*);
    alias pFreeImage_GetTagCount =DWORD function(FITAG*);
    alias pFreeImage_GetTagLength =DWORD function(FITAG*);
    alias pFreeImage_GetTagValue = const(void)* function(FITAG*);

    alias pFreeImage_SetTagKey = BOOL function(FITAG*,const(char)*);
    alias pFreeImage_SetTagDescription = BOOL function(FITAG*,const(char)*);
    alias pFreeImage_SetTagID = BOOL function(FITAG*,WORD);
    alias pFreeImage_SetTagType = BOOL function(FITAG*,FREE_IMAGE_MDTYPE);
    alias pFreeImage_SetTagCount = BOOL function(FITAG*,DWORD);
    alias pFreeImage_SetTagLength = BOOL function(FITAG*,DWORD);
    alias pFreeImage_SetTagValue = BOOL function(FITAG*, const(void)*);

    alias pFreeImage_FindFirstMetadata = FIMETADATA* function(FREE_IMAGE_MDMODEL,FIBITMAP*,FITAG**);
    alias pFreeImage_FindNextMetadata = BOOL function(FIMETADATA*,FITAG**);
    alias pFreeImage_FindCloseMetadata = void function(FIMETADATA*);

    alias pFreeImage_SetMetadata = BOOL function(FREE_IMAGE_MDMODEL,FIBITMAP*,const(char)*,FITAG*);
    alias pFreeImage_GetMetadata = BOOL function(FREE_IMAGE_MDMODEL,FIBITMAP*,const(char)*,FITAG**);
    alias pFreeImage_SetMetadataKeyValue = BOOL function(FREE_IMAGE_MDMODEL,FIBITMAP*,const(char)*,const(char)*); // Added in 3.17.0

    alias pFreeImage_GetMetadataCount = uint function(FREE_IMAGE_MDMODEL,FIBITMAP*);
    alias pFreeImage_CloneMetadata = BOOL function(FIBITMAP*,FIBITMAP*);

    alias pFreeImage_TagToString = const(char)* function(FREE_IMAGE_MDMODEL,FITAG*,char* Make = null);

    version(BindFI_JPEGTransform) {
        alias pFreeImage_JPEGTransform = BOOL function(const(char)*,const(char)*, FREE_IMAGE_JPEG_OPERATION,BOOL perfect=TRUE);
        alias pFreeImage_JPEGTransformU = BOOL function(const(wchar_t)*,const(wchar_t)*, FREE_IMAGE_JPEG_OPERATION,BOOL perfect=TRUE);
        alias pFreeImage_JPEGCrop = BOOL function(const(char)*,const(char)*,int,int,int,int);
        alias pFreeImage_JPEGCropU = BOOL function(const(wchar_t)*,const(wchar_t)*,int,int,int,int);

        // FreeImage 3.16.0 -- 4 functions
        alias pFreeImage_JPEGTransformFromHandle = BOOL function(FreeImageIO*,fi_handle,FreeImageIO*,fi_handle,FREE_IMAGE_JPEG_OPERATION,int*,int*,int*,int*,BOOL perfect=TRUE);
        alias pFreeImage_JPEGTransformCombined = BOOL function(const(char)*,const(char)*,FREE_IMAGE_JPEG_OPERATION,int*,int*,int*,int*,BOOL perfect=TRUE);
        alias pFreeImage_JPEGTransformCombinedU = BOOL function(const(wchar_t)*,const(wchar_t)*,FREE_IMAGE_JPEG_OPERATION,int*,int*,int*,int*,BOOL perfect=TRUE);
        alias pFreeImage_JPEGTransformCombinedFromMemory = BOOL function(FIMEMORY*,FIMEMORY*,FREE_IMAGE_JPEG_OPERATION,int*,int*,int*,int*,BOOL perfect=TRUE);
    }

    alias pFreeImage_Rotate = FIBITMAP* function(FIBITMAP*,double, const(void*) = null);
    alias pFreeImage_RotateEx = FIBITMAP* function(FIBITMAP*,double,double,double,double,double,BOOL);
    alias pFreeImage_FlipHorizontal = BOOL function(FIBITMAP*);
    alias pFreeImage_FlipVertical = BOOL function(FIBITMAP*);

    alias pFreeImage_Rescale = FIBITMAP* function(FIBITMAP*,int,int, FREE_IMAGE_FILTER);
    alias pFreeImage_MakeThumbnail = FIBITMAP* function(FIBITMAP*,int,BOOL convert = TRUE);
    alias pFreeImage_RescaleRect = FIBITMAP* function(FIBITMAP*,int,int,int,int,int,int,FREE_IMAGE_FILTER filter = FILTER_CATMULLROM,uint flags = 0); // Added in 3.17.0

    alias pFreeImage_AdjustCurve = BOOL function(FIBITMAP*,BYTE* LUT, FREE_IMAGE_COLOR_CHANNEL);
    alias pFreeImage_AdjustGamma = BOOL function(FIBITMAP*,double);
    alias pFreeImage_AdjustBrightness = BOOL function(FIBITMAP*,double);
    alias pFreeImage_AdjustContrast = BOOL function(FIBITMAP*,double);
    alias pFreeImage_Invert = BOOL function(FIBITMAP*);
    alias pFreeImage_GetHistogram = BOOL function(FIBITMAP*,DWORD*, FREE_IMAGE_COLOR_CHANNEL channel = FICC_BLACK);
    alias pFreeImage_GetAdjustColorsLookupTable = int function(BYTE* LUT,double,double,double,BOOL);
    alias pFreeImage_AdjustColors = BOOL function(FIBITMAP*,double,double,double,BOOL invert = FALSE);
    alias pFreeImage_ApplyColorMapping = uint function(FIBITMAP*,RGBQUAD*,RGBQUAD*,uint,BOOL,BOOL);
    alias pFreeImage_SwapColors = uint function(FIBITMAP*,RGBQUAD*,RGBQUAD*,BOOL);
    alias pFreeImage_ApplyPaletteIndexMapping = uint function(FIBITMAP*,BYTE*,BYTE*,uint,BOOL);
    alias pFreeImage_SwapPaletteIndices = uint function(FIBITMAP*,BYTE*,BYTE*);

    alias pFreeImage_GetChannel = FIBITMAP* function(FIBITMAP*,FREE_IMAGE_COLOR_CHANNEL);
    alias pFreeImage_SetChannel = BOOL function(FIBITMAP*,FIBITMAP*,FREE_IMAGE_COLOR_CHANNEL);
    alias pFreeImage_GetComplexChannel = FIBITMAP* function(FIBITMAP*,FREE_IMAGE_COLOR_CHANNEL);
    alias pFreeImage_SetComplexChannel = BOOL function(FIBITMAP*,FIBITMAP*,FREE_IMAGE_COLOR_CHANNEL);

    alias pFreeImage_Copy = FIBITMAP* function(FIBITMAP*,int,int,int,int);
    alias pFreeImage_Paste = BOOL function(FIBITMAP*,FIBITMAP*,int,int,int);
    alias pFreeImage_CreateView = FIBITMAP* function(FIBITMAP*,uint,uint,uint,uint); // Added in 3.17.0

    alias pFreeImage_Composite = FIBITMAP* function(FIBITMAP*,BOOL useFileBkg = FALSE,RGBQUAD* appBkColor = null,FIBITMAP*bg = null);
    alias pFreeImage_PreMultiplyWithAlpha = BOOL function(FIBITMAP*);

    alias pFreeImage_FillBackground = BOOL function(FIBITMAP*, const(void*),int options = 0);
    alias pFreeImage_EnlargeCanvas = FIBITMAP* function(FIBITMAP*,int,int,int,int,const(void*),int options = 0);
    alias pFreeImage_AllocateEx = FIBITMAP* function(int,int,int,const(RGBQUAD)*,int options = 0,const(RGBQUAD)* palette = null,uint red_mask = 0,uint green_mask = 0,uint blue_mask = 0);
    alias pFreeImage_AllocateExT = FIBITMAP* function(FREE_IMAGE_TYPE,int,int,int,const(void*),int options = 0,const(RGBQUAD)* palette = null,uint red_mask = 0,uint green_mask = 0,uint blue_mask = 0);

    alias pFreeImage_MultigridPoissonSolver = FIBITMAP* function(FIBITMAP*,int ncycle = 3);

    static if(fiSupport >= FISupport.fi318) {
        alias pFreeImage_Validate = BOOL function(FREE_IMAGE_FORMAT,const(char)*);
        alias pFreeImage_ValidateU = BOOL function(FREE_IMAGE_FORMAT,const(wchar_t)*);
        alias pFreeImage_ValidateFromHandle = BOOL function(FREE_IMAGE_FORMAT,FreeImageIO*,fi_handle);
        alias pFreeImage_ValidateFromMemory = BOOL function(FREE_IMAGE_FORMAT,FIMEMORY);
        alias pFreeImage_ConvertLine1To32MapTransparency = void function(BYTE*,BYTE*,int,RGBQUAD*,BYTE*,int);
        alias pFreeImage_ConvertLine4To32MapTransparency = void function(BYTE*,BYTE*,int,RGBQUAD*,BYTE*,int);
        alias pFreeImage_ConvertLine8To32MapTransparency = void function(BYTE*,BYTE*,int,RGBQUAD*,BYTE*,int);
    }
}

__gshared {
    pFreeImage_Initialise FreeImage_Initialise;
    pFreeImage_DeInitialise FreeImage_DeInitialise;
    pFreeImage_GetVersion FreeImage_GetVersion;
    pFreeImage_GetCopyrightMessage FreeImage_GetCopyrightMessage;
    pFreeImage_SetOutputMessageStdCall FreeImage_SetOutputMessageStdCall;
    pFreeImage_SetOutputMessage FreeImage_SetOutputMessage;
    pFreeImage_OutputMessageProc FreeImage_OutputMessageProc;
    pFreeImage_Allocate FreeImage_Allocate;
    pFreeImage_AllocateT FreeImage_AllocateT;
    pFreeImage_Clone FreeImage_Clone;
    pFreeImage_Unload FreeImage_Unload;
    pFreeImage_HasPixels FreeImage_HasPixels;
    pFreeImage_Load FreeImage_Load;
    pFreeImage_LoadU FreeImage_LoadU;
    pFreeImage_LoadFromHandle FreeImage_LoadFromHandle;
    pFreeImage_Save FreeImage_Save;
    pFreeImage_SaveU FreeImage_SaveU;
    pFreeImage_SaveToHandle FreeImage_SaveToHandle;
    pFreeImage_OpenMemory FreeImage_OpenMemory;
    pFreeImage_CloseMemory FreeImage_CloseMemory;
    pFreeImage_LoadFromMemory FreeImage_LoadFromMemory;
    pFreeImage_SaveToMemory FreeImage_SaveToMemory;
    pFreeImage_TellMemory FreeImage_TellMemory;
    pFreeImage_SeekMemory FreeImage_SeekMemory;
    pFreeImage_AcquireMemory FreeImage_AcquireMemory;
    pFreeImage_ReadMemory FreeImage_ReadMemory;
    pFreeImage_WriteMemory FreeImage_WriteMemory;
    pFreeImage_LoadMultiBitmapFromMemory FreeImage_LoadMultiBitmapFromMemory;
    pFreeImage_SaveMultiBitmapToMemory FreeImage_SaveMultiBitmapToMemory;
    pFreeImage_RegisterLocalPlugin FreeImage_RegisterLocalPlugin;

    version(Windows) {
        pFreeImage_RegisterExternalPlugin FreeImage_RegisterExternalPlugin;
    }

    pFreeImage_GetFIFCount FreeImage_GetFIFCount;
    pFreeImage_SetPluginEnabled FreeImage_SetPluginEnabled;
    pFreeImage_IsPluginEnabled FreeImage_IsPluginEnabled;
    pFreeImage_GetFIFFromFormat FreeImage_GetFIFFromFormat;
    pFreeImage_GetFIFFromMime FreeImage_GetFIFFromMime;
    pFreeImage_GetFormatFromFIF FreeImage_GetFormatFromFIF;
    pFreeImage_GetFIFExtensionList FreeImage_GetFIFExtensionList;
    pFreeImage_GetFIFDescription FreeImage_GetFIFDescription;
    pFreeImage_GetFIFRegExpr FreeImage_GetFIFRegExpr;
    pFreeImage_GetFIFMimeType FreeImage_GetFIFMimeType;
    pFreeImage_GetFIFFromFilename FreeImage_GetFIFFromFilename;
    pFreeImage_GetFIFFromFilenameU FreeImage_GetFIFFromFilenameU;
    pFreeImage_FIFSupportsReading FreeImage_FIFSupportsReading;
    pFreeImage_FIFSupportsWriting FreeImage_FIFSupportsWriting;
    pFreeImage_FIFSupportsExportBPP FreeImage_FIFSupportsExportBPP;
    pFreeImage_FIFSupportsExportType FreeImage_FIFSupportsExportType;
    pFreeImage_FIFSupportsICCProfiles FreeImage_FIFSupportsICCProfiles;
    pFreeImage_FIFSupportsNoPixels FreeImage_FIFSupportsNoPixels;
    pFreeImage_OpenMultiBitmap FreeImage_OpenMultiBitmap;
    pFreeImage_OpenMultiBitmapFromHandle FreeImage_OpenMultiBitmapFromHandle;
    pFreeImage_SaveMultiBitmapToHandle FreeImage_SaveMultiBitmapToHandle;
    pFreeImage_CloseMultiBitmap FreeImage_CloseMultiBitmap;
    pFreeImage_GetPageCount FreeImage_GetPageCount;
    pFreeImage_AppendPage FreeImage_AppendPage;
    pFreeImage_InsertPage FreeImage_InsertPage;
    pFreeImage_DeletePage FreeImage_DeletePage;
    pFreeImage_LockPage FreeImage_LockPage;
    pFreeImage_UnlockPage FreeImage_UnlockPage;
    pFreeImage_MovePage FreeImage_MovePage;
    pFreeImage_GetLockedPageNumbers FreeImage_GetLockedPageNumbers;
    pFreeImage_GetFileType FreeImage_GetFileType;
    pFreeImage_GetFileTypeU FreeImage_GetFileTypeU;
    pFreeImage_GetFileTypeFromHandle FreeImage_GetFileTypeFromHandle;
    pFreeImage_GetFileTypeFromMemory FreeImage_GetFileTypeFromMemory;
    pFreeImage_GetImageType FreeImage_GetImageType;
    pFreeImage_IsLittleEndian FreeImage_IsLittleEndian;
    pFreeImage_LookupX11Color FreeImage_LookupX11Color;
    pFreeImage_LookupSVGColor FreeImage_LookupSVGColor;
    pFreeImage_GetBits FreeImage_GetBits;
    pFreeImage_GetScanLine FreeImage_GetScanLine;
    pFreeImage_GetPixelIndex FreeImage_GetPixelIndex;
    pFreeImage_GetPixelColor FreeImage_GetPixelColor;
    pFreeImage_SetPixelIndex FreeImage_SetPixelIndex;
    pFreeImage_SetPixelColor FreeImage_SetPixelColor;
    pFreeImage_GetColorsUsed FreeImage_GetColorsUsed;
    pFreeImage_GetBPP FreeImage_GetBPP;
    pFreeImage_GetWidth FreeImage_GetWidth;
    pFreeImage_GetHeight FreeImage_GetHeight;
    pFreeImage_GetLine FreeImage_GetLine;
    pFreeImage_GetPitch FreeImage_GetPitch;
    pFreeImage_GetDIBSize FreeImage_GetDIBSize;
    pFreeImage_GetMemorySize FreeImage_GetMemorySize;
    pFreeImage_GetPalette FreeImage_GetPalette;
    pFreeImage_GetDotsPerMeterX FreeImage_GetDotsPerMeterX;
    pFreeImage_GetDotsPerMeterY FreeImage_GetDotsPerMeterY;
    pFreeImage_SetDotsPerMeterX FreeImage_SetDotsPerMeterX;
    pFreeImage_SetDotsPerMeterY FreeImage_SetDotsPerMeterY;
    pFreeImage_GetInfoHeader FreeImage_GetInfoHeader;
    pFreeImage_GetInfo FreeImage_GetInfo;
    pFreeImage_GetColorType FreeImage_GetColorType;
    pFreeImage_GetRedMask FreeImage_GetRedMask;
    pFreeImage_GetGreenMask FreeImage_GetGreenMask;
    pFreeImage_GetBlueMask FreeImage_GetBlueMask;
    pFreeImage_GetTransparencyCount FreeImage_GetTransparencyCount;
    pFreeImage_GetTransparencyTable FreeImage_GetTransparencyTable;
    pFreeImage_SetTransparent FreeImage_SetTransparent;
    pFreeImage_SetTransparencyTable FreeImage_SetTransparencyTable;
    pFreeImage_IsTransparent FreeImage_IsTransparent;
    pFreeImage_SetTransparentIndex FreeImage_SetTransparentIndex;
    pFreeImage_GetTransparentIndex FreeImage_GetTransparentIndex;
    pFreeImage_HasBackgroundColor FreeImage_HasBackgroundColor;
    pFreeImage_GetBackgroundColor FreeImage_GetBackgroundColor;
    pFreeImage_SetBackgroundColor FreeImage_SetBackgroundColor;
    pFreeImage_GetThumbnail FreeImage_GetThumbnail;
    pFreeImage_SetThumbnail FreeImage_SetThumbnail;
    pFreeImage_GetICCProfile FreeImage_GetICCProfile;
    pFreeImage_CreateICCProfile FreeImage_CreateICCProfile;
    pFreeImage_DestroyICCProfile FreeImage_DestroyICCProfile;
    pFreeImage_ConvertLine1To4 FreeImage_ConvertLine1To4;
    pFreeImage_ConvertLine8To4 FreeImage_ConvertLine8To4;
    pFreeImage_ConvertLine16To4_555 FreeImage_ConvertLine16To4_555;
    pFreeImage_ConvertLine16To4_565 FreeImage_ConvertLine16To4_565;
    pFreeImage_ConvertLine24To4 FreeImage_ConvertLine24To4;
    pFreeImage_ConvertLine32To4 FreeImage_ConvertLine32To4;
    pFreeImage_ConvertLine1To8 FreeImage_ConvertLine1To8;
    pFreeImage_ConvertLine4To8 FreeImage_ConvertLine4To8;
    pFreeImage_ConvertLine16To8_555 FreeImage_ConvertLine16To8_555;
    pFreeImage_ConvertLine16To8_565 FreeImage_ConvertLine16To8_565;
    pFreeImage_ConvertLine24To8 FreeImage_ConvertLine24To8;
    pFreeImage_ConvertLine32To8 FreeImage_ConvertLine32To8;
    pFreeImage_ConvertLine1To16_555 FreeImage_ConvertLine1To16_555;
    pFreeImage_ConvertLine4To16_555 FreeImage_ConvertLine4To16_555;
    pFreeImage_ConvertLine8To16_555 FreeImage_ConvertLine8To16_555;
    pFreeImage_ConvertLine16_565_To16_555 FreeImage_ConvertLine16_565_To16_555;
    pFreeImage_ConvertLine24To16_555 FreeImage_ConvertLine24To16_555;
    pFreeImage_ConvertLine32To16_555 FreeImage_ConvertLine32To16_555;
    pFreeImage_ConvertLine1To16_565 FreeImage_ConvertLine1To16_565;
    pFreeImage_ConvertLine4To16_565 FreeImage_ConvertLine4To16_565;
    pFreeImage_ConvertLine8To16_565 FreeImage_ConvertLine8To16_565;
    pFreeImage_ConvertLine16_555_To16_565 FreeImage_ConvertLine16_555_To16_565;
    pFreeImage_ConvertLine24To16_565 FreeImage_ConvertLine24To16_565;
    pFreeImage_ConvertLine32To16_565 FreeImage_ConvertLine32To16_565;
    pFreeImage_ConvertLine1To24 FreeImage_ConvertLine1To24;
    pFreeImage_ConvertLine4To24 FreeImage_ConvertLine4To24;
    pFreeImage_ConvertLine8To24 FreeImage_ConvertLine8To24;
    pFreeImage_ConvertLine16To24_555 FreeImage_ConvertLine16To24_555;
    pFreeImage_ConvertLine16To24_565 FreeImage_ConvertLine16To24_565;
    pFreeImage_ConvertLine32To24 FreeImage_ConvertLine32To24;
    pFreeImage_ConvertLine1To32 FreeImage_ConvertLine1To32;
    pFreeImage_ConvertLine4To32 FreeImage_ConvertLine4To32;
    pFreeImage_ConvertLine8To32 FreeImage_ConvertLine8To32;
    pFreeImage_ConvertLine16To32_555 FreeImage_ConvertLine16To32_555;
    pFreeImage_ConvertLine16To32_565 FreeImage_ConvertLine16To32_565;
    pFreeImage_ConvertLine24To32 FreeImage_ConvertLine24To32;
    pFreeImage_ConvertTo4Bits FreeImage_ConvertTo4Bits;
    pFreeImage_ConvertTo8Bits FreeImage_ConvertTo8Bits;
    pFreeImage_ConvertToGreyscale FreeImage_ConvertToGreyscale;
    pFreeImage_ConvertTo16Bits555 FreeImage_ConvertTo16Bits555;
    pFreeImage_ConvertTo16Bits565 FreeImage_ConvertTo16Bits565;
    pFreeImage_ConvertTo24Bits FreeImage_ConvertTo24Bits;
    pFreeImage_ConvertTo32Bits FreeImage_ConvertTo32Bits;
    pFreeImage_ColorQuantize FreeImage_ColorQuantize;
    pFreeImage_ColorQuantizeEx FreeImage_ColorQuantizeEx;
    pFreeImage_Threshold FreeImage_Threshold;
    pFreeImage_Dither FreeImage_Dither;
    pFreeImage_ConvertFromRawBits FreeImage_ConvertFromRawBits;
    pFreeImage_ConvertFromRawBitsEx FreeImage_ConvertFromRawBitsEx;
    pFreeImage_ConvertToRawBits FreeImage_ConvertToRawBits;
    pFreeImage_ConvertToFloat FreeImage_ConvertToFloat;
    pFreeImage_ConvertToRGBF FreeImage_ConvertToRGBF;
    pFreeImage_ConvertToRGBAF FreeImage_ConvertToRGBAF;
    pFreeImage_ConvertToUINT16 FreeImage_ConvertToUINT16;
    pFreeImage_ConvertToRGB16 FreeImage_ConvertToRGB16;
    pFreeImage_ConvertToRGBA16 FreeImage_ConvertToRGBA16;
    pFreeImage_ConvertToStandardType FreeImage_ConvertToStandardType;
    pFreeImage_ConvertToType FreeImage_ConvertToType;
    pFreeImage_ToneMapping FreeImage_ToneMapping;
    pFreeImage_TmoDrago03 FreeImage_TmoDrago03;
    pFreeImage_TmoReinhard05 FreeImage_TmoReinhard05;
    pFreeImage_TmoReinhard05Ex FreeImage_TmoReinhard05Ex;
    pFreeImage_TmoFattal02 FreeImage_TmoFattal02;
    pFreeImage_ZLibCompress FreeImage_ZLibCompress;
    pFreeImage_ZLibUncompress FreeImage_ZLibUncompress;
    pFreeImage_ZLibGZip FreeImage_ZLibGZip;
    pFreeImage_ZLibGUnzip FreeImage_ZLibGUnzip;
    pFreeImage_ZLibCRC32 FreeImage_ZLibCRC32;
    pFreeImage_CreateTag FreeImage_CreateTag;
    pFreeImage_DeleteTag FreeImage_DeleteTag;
    pFreeImage_CloneTag FreeImage_CloneTag;
    pFreeImage_GetTagKey FreeImage_GetTagKey;
    pFreeImage_GetTagDescription FreeImage_GetTagDescription;
    pFreeImage_GetTagID FreeImage_GetTagID;
    pFreeImage_GetTagType FreeImage_GetTagType;
    pFreeImage_GetTagCount FreeImage_GetTagCount;
    pFreeImage_GetTagLength FreeImage_GetTagLength;
    pFreeImage_GetTagValue FreeImage_GetTagValue;
    pFreeImage_SetTagKey FreeImage_SetTagKey;
    pFreeImage_SetTagDescription FreeImage_SetTagDescription;
    pFreeImage_SetTagID FreeImage_SetTagID;
    pFreeImage_SetTagType FreeImage_SetTagType;
    pFreeImage_SetTagCount FreeImage_SetTagCount;
    pFreeImage_SetTagLength FreeImage_SetTagLength;
    pFreeImage_SetTagValue FreeImage_SetTagValue;
    pFreeImage_FindFirstMetadata FreeImage_FindFirstMetadata;
    pFreeImage_FindNextMetadata FreeImage_FindNextMetadata;
    pFreeImage_FindCloseMetadata FreeImage_FindCloseMetadata;
    pFreeImage_SetMetadata FreeImage_SetMetadata;
    pFreeImage_GetMetadata FreeImage_GetMetadata;
    pFreeImage_SetMetadataKeyValue FreeImage_SetMetadataKeyValue;
    pFreeImage_GetMetadataCount FreeImage_GetMetadataCount;
    pFreeImage_CloneMetadata FreeImage_CloneMetadata;
    pFreeImage_TagToString FreeImage_TagToString;
    version(BindFI_JPEGTransform) {
        pFreeImage_JPEGTransform FreeImage_JPEGTransform;
        pFreeImage_JPEGTransformU FreeImage_JPEGTransformU;
        pFreeImage_JPEGCrop FreeImage_JPEGCrop;
        pFreeImage_JPEGCropU FreeImage_JPEGCropU;
        pFreeImage_JPEGTransformFromHandle FreeImage_JPEGTransformFromHandle;
        pFreeImage_JPEGTransformCombined FreeImage_JPEGTransformCombined;
        pFreeImage_JPEGTransformCombinedU FreeImage_JPEGTransformCombinedU;
        pFreeImage_JPEGTransformCombinedFromMemory FreeImage_JPEGTransformCombinedFromMemory;
    }
    pFreeImage_Rotate FreeImage_Rotate;
    pFreeImage_RotateEx FreeImage_RotateEx;
    pFreeImage_FlipHorizontal FreeImage_FlipHorizontal;
    pFreeImage_FlipVertical FreeImage_FlipVertical;
    pFreeImage_Rescale FreeImage_Rescale;
    pFreeImage_MakeThumbnail FreeImage_MakeThumbnail;
    pFreeImage_RescaleRect FreeImage_RescaleRect;
    pFreeImage_AdjustCurve FreeImage_AdjustCurve;
    pFreeImage_AdjustGamma FreeImage_AdjustGamma;
    pFreeImage_AdjustBrightness FreeImage_AdjustBrightness;
    pFreeImage_AdjustContrast FreeImage_AdjustContrast;
    pFreeImage_Invert FreeImage_Invert;
    pFreeImage_GetHistogram FreeImage_GetHistogram;
    pFreeImage_GetAdjustColorsLookupTable FreeImage_GetAdjustColorsLookupTable;
    pFreeImage_AdjustColors FreeImage_AdjustColors;
    pFreeImage_ApplyColorMapping FreeImage_ApplyColorMapping;
    pFreeImage_SwapColors FreeImage_SwapColors;
    pFreeImage_ApplyPaletteIndexMapping FreeImage_ApplyPaletteIndexMapping;
    pFreeImage_SwapPaletteIndices FreeImage_SwapPaletteIndices;
    pFreeImage_GetChannel FreeImage_GetChannel;
    pFreeImage_SetChannel FreeImage_SetChannel;
    pFreeImage_GetComplexChannel FreeImage_GetComplexChannel;
    pFreeImage_SetComplexChannel FreeImage_SetComplexChannel;
    pFreeImage_Copy FreeImage_Copy;
    pFreeImage_Paste FreeImage_Paste;
    pFreeImage_CreateView FreeImage_CreateView;
    pFreeImage_Composite FreeImage_Composite;
    pFreeImage_PreMultiplyWithAlpha FreeImage_PreMultiplyWithAlpha;
    pFreeImage_FillBackground FreeImage_FillBackground;
    pFreeImage_EnlargeCanvas FreeImage_EnlargeCanvas;
    pFreeImage_AllocateEx FreeImage_AllocateEx;
    pFreeImage_AllocateExT FreeImage_AllocateExT;
    pFreeImage_MultigridPoissonSolver FreeImage_MultigridPoissonSolver;

    static if(fiSupport >= FISupport.fi318) {
        pFreeImage_Validate FreeImage_Validate;
        pFreeImage_ValidateU FreeImage_ValidateU;
        pFreeImage_ValidateFromHandle FreeImage_ValidateFromHandle;
        pFreeImage_ValidateFromMemory FreeImage_ValidateFromMemory;
        pFreeImage_ConvertLine1To32MapTransparency FreeImage_ConvertLine1To32MapTransparency;
        pFreeImage_ConvertLine4To32MapTransparency FreeImage_ConvertLine4To32MapTransparency;
        pFreeImage_ConvertLine8To32MapTransparency FreeImage_ConvertLine8To32MapTransparency;
    }

}

private {
    SharedLib lib;
    FISupport loadedVersion;
}

@nogc nothrow:

FISupport loadedFreeImageVersion() { return loadedVersion; }
bool isFreeImageLoaded() { return lib != invalidHandle; }

FISupport loadFreeImage()
{
    version(Windows) {
        const(char)[][1] libNames = [
            "FreeImage.dll"
        ];
    }
    else version(OSX) {
        const(char)[][2] libNames = [
            "libfreeimage.dylib",
            "libfreeimage.dylib.3"
        ];
    }
    else version(Posix) {
        const(char)[][2] libNames = [
            "libfreeimage.so",
            "libfreeimage.so.3"
        ];
    }
    else static assert(0, "bindbc-freeimage is not yet supported on this platform.");

    FISupport ret;
    foreach(name; libNames) {
        ret = loadFreeImage(name.ptr);
        if(ret != FISupport.noLibrary) break;
    }
    return ret;
}

FISupport loadFreeImage(const(char)* libName)
{
    lib = load(libName);
    if(lib == invalidHandle) {
        return FISupport.noLibrary;
    }

    auto errCount = errorCount();
    loadedVersion = FISupport.badLibrary;

    lib.bindSymbol_stdcall(FreeImage_Initialise, "FreeImage_Initialise");
    lib.bindSymbol_stdcall(FreeImage_DeInitialise, "FreeImage_DeInitialise");
    lib.bindSymbol_stdcall(FreeImage_GetVersion, "FreeImage_GetVersion");
    lib.bindSymbol_stdcall(FreeImage_GetCopyrightMessage, "FreeImage_GetCopyrightMessage");
    lib.bindSymbol_stdcall(FreeImage_SetOutputMessageStdCall, "FreeImage_SetOutputMessageStdCall");
    lib.bindSymbol_stdcall(FreeImage_SetOutputMessage, "FreeImage_SetOutputMessage");

    // This one isn't mangled like the rest, likely because of the variable args.
    lib.bindSymbol(cast(void**)&FreeImage_OutputMessageProc, "FreeImage_OutputMessageProc");

    lib.bindSymbol_stdcall(FreeImage_Allocate, "FreeImage_Allocate");
    lib.bindSymbol_stdcall(FreeImage_AllocateT, "FreeImage_AllocateT");
    lib.bindSymbol_stdcall(FreeImage_Clone, "FreeImage_Clone");
    lib.bindSymbol_stdcall(FreeImage_Unload, "FreeImage_Unload");
    lib.bindSymbol_stdcall(FreeImage_HasPixels, "FreeImage_HasPixels");
    lib.bindSymbol_stdcall(FreeImage_Load, "FreeImage_Load");
    lib.bindSymbol_stdcall(FreeImage_LoadU, "FreeImage_LoadU");
    lib.bindSymbol_stdcall(FreeImage_LoadFromHandle, "FreeImage_LoadFromHandle");
    lib.bindSymbol_stdcall(FreeImage_Save, "FreeImage_Save");
    lib.bindSymbol_stdcall(FreeImage_SaveU, "FreeImage_SaveU");
    lib.bindSymbol_stdcall(FreeImage_SaveToHandle, "FreeImage_SaveToHandle");
    lib.bindSymbol_stdcall(FreeImage_OpenMemory, "FreeImage_OpenMemory");
    lib.bindSymbol_stdcall(FreeImage_CloseMemory, "FreeImage_CloseMemory");
    lib.bindSymbol_stdcall(FreeImage_LoadFromMemory, "FreeImage_LoadFromMemory");
    lib.bindSymbol_stdcall(FreeImage_SaveToMemory, "FreeImage_SaveToMemory");
    lib.bindSymbol_stdcall(FreeImage_TellMemory, "FreeImage_TellMemory");
    lib.bindSymbol_stdcall(FreeImage_SeekMemory, "FreeImage_SeekMemory");
    lib.bindSymbol_stdcall(FreeImage_AcquireMemory, "FreeImage_AcquireMemory");
    lib.bindSymbol_stdcall(FreeImage_ReadMemory, "FreeImage_ReadMemory");
    lib.bindSymbol_stdcall(FreeImage_WriteMemory, "FreeImage_WriteMemory");
    lib.bindSymbol_stdcall(FreeImage_LoadMultiBitmapFromMemory, "FreeImage_LoadMultiBitmapFromMemory");
    lib.bindSymbol_stdcall(FreeImage_SaveMultiBitmapToMemory, "FreeImage_SaveMultiBitmapToMemory");
    lib.bindSymbol_stdcall(FreeImage_RegisterLocalPlugin, "FreeImage_RegisterLocalPlugin");

    version(Windows) {
        lib.bindSymbol_stdcall(FreeImage_RegisterExternalPlugin, "FreeImage_RegisterExternalPlugin");
    }

    lib.bindSymbol_stdcall(FreeImage_GetFIFCount, "FreeImage_GetFIFCount");
    lib.bindSymbol_stdcall(FreeImage_SetPluginEnabled, "FreeImage_SetPluginEnabled");
    lib.bindSymbol_stdcall(FreeImage_IsPluginEnabled, "FreeImage_IsPluginEnabled");
    lib.bindSymbol_stdcall(FreeImage_GetFIFFromFormat, "FreeImage_GetFIFFromFormat");
    lib.bindSymbol_stdcall(FreeImage_GetFIFFromMime, "FreeImage_GetFIFFromMime");
    lib.bindSymbol_stdcall(FreeImage_GetFormatFromFIF, "FreeImage_GetFormatFromFIF");
    lib.bindSymbol_stdcall(FreeImage_GetFIFExtensionList, "FreeImage_GetFIFExtensionList");
    lib.bindSymbol_stdcall(FreeImage_GetFIFDescription, "FreeImage_GetFIFDescription");
    lib.bindSymbol_stdcall(FreeImage_GetFIFRegExpr, "FreeImage_GetFIFRegExpr");
    lib.bindSymbol_stdcall(FreeImage_GetFIFMimeType, "FreeImage_GetFIFMimeType");
    lib.bindSymbol_stdcall(FreeImage_GetFIFFromFilename, "FreeImage_GetFIFFromFilename");
    lib.bindSymbol_stdcall(FreeImage_GetFIFFromFilenameU, "FreeImage_GetFIFFromFilenameU");
    lib.bindSymbol_stdcall(FreeImage_FIFSupportsReading, "FreeImage_FIFSupportsReading");
    lib.bindSymbol_stdcall(FreeImage_FIFSupportsWriting, "FreeImage_FIFSupportsWriting");
    lib.bindSymbol_stdcall(FreeImage_FIFSupportsExportBPP, "FreeImage_FIFSupportsExportBPP");
    lib.bindSymbol_stdcall(FreeImage_FIFSupportsExportType, "FreeImage_FIFSupportsExportType");
    lib.bindSymbol_stdcall(FreeImage_FIFSupportsICCProfiles, "FreeImage_FIFSupportsICCProfiles");
    lib.bindSymbol_stdcall(FreeImage_FIFSupportsNoPixels, "FreeImage_FIFSupportsNoPixels");
    lib.bindSymbol_stdcall(FreeImage_OpenMultiBitmap, "FreeImage_OpenMultiBitmap");
    lib.bindSymbol_stdcall(FreeImage_OpenMultiBitmapFromHandle, "FreeImage_OpenMultiBitmapFromHandle");
    lib.bindSymbol_stdcall(FreeImage_SaveMultiBitmapToHandle, "FreeImage_SaveMultiBitmapToHandle");
    lib.bindSymbol_stdcall(FreeImage_CloseMultiBitmap, "FreeImage_CloseMultiBitmap");
    lib.bindSymbol_stdcall(FreeImage_GetPageCount, "FreeImage_GetPageCount");
    lib.bindSymbol_stdcall(FreeImage_AppendPage, "FreeImage_AppendPage");
    lib.bindSymbol_stdcall(FreeImage_InsertPage, "FreeImage_InsertPage");
    lib.bindSymbol_stdcall(FreeImage_DeletePage, "FreeImage_DeletePage");
    lib.bindSymbol_stdcall(FreeImage_LockPage, "FreeImage_LockPage");
    lib.bindSymbol_stdcall(FreeImage_UnlockPage, "FreeImage_UnlockPage");
    lib.bindSymbol_stdcall(FreeImage_MovePage, "FreeImage_MovePage");
    lib.bindSymbol_stdcall(FreeImage_GetLockedPageNumbers, "FreeImage_GetLockedPageNumbers");
    lib.bindSymbol_stdcall(FreeImage_GetFileType, "FreeImage_GetFileType");
    lib.bindSymbol_stdcall(FreeImage_GetFileTypeU, "FreeImage_GetFileTypeU");
    lib.bindSymbol_stdcall(FreeImage_GetFileTypeFromHandle, "FreeImage_GetFileTypeFromHandle");
    lib.bindSymbol_stdcall(FreeImage_GetFileTypeFromMemory, "FreeImage_GetFileTypeFromMemory");
    lib.bindSymbol_stdcall(FreeImage_GetImageType, "FreeImage_GetImageType");
    lib.bindSymbol_stdcall(FreeImage_IsLittleEndian, "FreeImage_IsLittleEndian");
    lib.bindSymbol_stdcall(FreeImage_LookupX11Color, "FreeImage_LookupX11Color");
    lib.bindSymbol_stdcall(FreeImage_LookupSVGColor, "FreeImage_LookupSVGColor");
    lib.bindSymbol_stdcall(FreeImage_GetBits, "FreeImage_GetBits");
    lib.bindSymbol_stdcall(FreeImage_GetScanLine, "FreeImage_GetScanLine");
    lib.bindSymbol_stdcall(FreeImage_GetPixelIndex, "FreeImage_GetPixelIndex");
    lib.bindSymbol_stdcall(FreeImage_GetPixelColor, "FreeImage_GetPixelColor");
    lib.bindSymbol_stdcall(FreeImage_SetPixelIndex, "FreeImage_SetPixelIndex");
    lib.bindSymbol_stdcall(FreeImage_SetPixelColor, "FreeImage_SetPixelColor");
    lib.bindSymbol_stdcall(FreeImage_GetColorsUsed, "FreeImage_GetColorsUsed");
    lib.bindSymbol_stdcall(FreeImage_GetBPP, "FreeImage_GetBPP");
    lib.bindSymbol_stdcall(FreeImage_GetWidth, "FreeImage_GetWidth");
    lib.bindSymbol_stdcall(FreeImage_GetHeight, "FreeImage_GetHeight");
    lib.bindSymbol_stdcall(FreeImage_GetLine, "FreeImage_GetLine");
    lib.bindSymbol_stdcall(FreeImage_GetPitch, "FreeImage_GetPitch");
    lib.bindSymbol_stdcall(FreeImage_GetDIBSize, "FreeImage_GetDIBSize");
    lib.bindSymbol_stdcall(FreeImage_GetMemorySize, "FreeImage_GetMemorySize");
    lib.bindSymbol_stdcall(FreeImage_GetPalette, "FreeImage_GetPalette");
    lib.bindSymbol_stdcall(FreeImage_GetDotsPerMeterX, "FreeImage_GetDotsPerMeterX");
    lib.bindSymbol_stdcall(FreeImage_GetDotsPerMeterY, "FreeImage_GetDotsPerMeterY");
    lib.bindSymbol_stdcall(FreeImage_SetDotsPerMeterX, "FreeImage_SetDotsPerMeterX");
    lib.bindSymbol_stdcall(FreeImage_SetDotsPerMeterY, "FreeImage_SetDotsPerMeterY");
    lib.bindSymbol_stdcall(FreeImage_GetInfoHeader, "FreeImage_GetInfoHeader");
    lib.bindSymbol_stdcall(FreeImage_GetInfo, "FreeImage_GetInfo");
    lib.bindSymbol_stdcall(FreeImage_GetColorType, "FreeImage_GetColorType");
    lib.bindSymbol_stdcall(FreeImage_GetRedMask, "FreeImage_GetRedMask");
    lib.bindSymbol_stdcall(FreeImage_GetGreenMask, "FreeImage_GetGreenMask");
    lib.bindSymbol_stdcall(FreeImage_GetBlueMask, "FreeImage_GetBlueMask");
    lib.bindSymbol_stdcall(FreeImage_GetTransparencyCount, "FreeImage_GetTransparencyCount");
    lib.bindSymbol_stdcall(FreeImage_GetTransparencyTable, "FreeImage_GetTransparencyTable");
    lib.bindSymbol_stdcall(FreeImage_SetTransparent, "FreeImage_SetTransparent");
    lib.bindSymbol_stdcall(FreeImage_SetTransparencyTable, "FreeImage_SetTransparencyTable");
    lib.bindSymbol_stdcall(FreeImage_IsTransparent, "FreeImage_IsTransparent");
    lib.bindSymbol_stdcall(FreeImage_SetTransparentIndex, "FreeImage_SetTransparentIndex");
    lib.bindSymbol_stdcall(FreeImage_GetTransparentIndex, "FreeImage_GetTransparentIndex");
    lib.bindSymbol_stdcall(FreeImage_HasBackgroundColor, "FreeImage_HasBackgroundColor");
    lib.bindSymbol_stdcall(FreeImage_GetBackgroundColor, "FreeImage_GetBackgroundColor");
    lib.bindSymbol_stdcall(FreeImage_SetBackgroundColor, "FreeImage_SetBackgroundColor");
    lib.bindSymbol_stdcall(FreeImage_GetThumbnail, "FreeImage_GetThumbnail");
    lib.bindSymbol_stdcall(FreeImage_SetThumbnail, "FreeImage_SetThumbnail");
    lib.bindSymbol_stdcall(FreeImage_GetICCProfile, "FreeImage_GetICCProfile");
    lib.bindSymbol_stdcall(FreeImage_CreateICCProfile, "FreeImage_CreateICCProfile");
    lib.bindSymbol_stdcall(FreeImage_DestroyICCProfile, "FreeImage_DestroyICCProfile");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine1To4, "FreeImage_ConvertLine1To4");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine8To4, "FreeImage_ConvertLine8To4");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine16To4_555, "FreeImage_ConvertLine16To4_555");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine16To4_565, "FreeImage_ConvertLine16To4_565");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine24To4, "FreeImage_ConvertLine24To4");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine32To4, "FreeImage_ConvertLine32To4");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine1To8, "FreeImage_ConvertLine1To8");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine4To8, "FreeImage_ConvertLine4To8");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine16To8_555, "FreeImage_ConvertLine16To8_555");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine16To8_565, "FreeImage_ConvertLine16To8_565");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine24To8, "FreeImage_ConvertLine24To8");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine32To8, "FreeImage_ConvertLine32To8");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine1To16_555, "FreeImage_ConvertLine1To16_555");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine4To16_555, "FreeImage_ConvertLine4To16_555");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine8To16_555, "FreeImage_ConvertLine8To16_555");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine16_565_To16_555, "FreeImage_ConvertLine16_565_To16_555");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine24To16_555, "FreeImage_ConvertLine24To16_555");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine32To16_555, "FreeImage_ConvertLine32To16_555");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine1To16_565, "FreeImage_ConvertLine1To16_565");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine4To16_565, "FreeImage_ConvertLine4To16_565");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine8To16_565, "FreeImage_ConvertLine8To16_565");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine16_555_To16_565, "FreeImage_ConvertLine16_555_To16_565");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine24To16_565, "FreeImage_ConvertLine24To16_565");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine32To16_565, "FreeImage_ConvertLine32To16_565");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine1To24, "FreeImage_ConvertLine1To24");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine4To24, "FreeImage_ConvertLine4To24");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine8To24, "FreeImage_ConvertLine8To24");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine16To24_555, "FreeImage_ConvertLine16To24_555");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine16To24_565, "FreeImage_ConvertLine16To24_565");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine32To24, "FreeImage_ConvertLine32To24");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine1To32, "FreeImage_ConvertLine1To32");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine4To32, "FreeImage_ConvertLine4To32");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine8To32, "FreeImage_ConvertLine8To32");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine16To32_555, "FreeImage_ConvertLine16To32_555");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine16To32_565, "FreeImage_ConvertLine16To32_565");
    lib.bindSymbol_stdcall(FreeImage_ConvertLine24To32, "FreeImage_ConvertLine24To32");
    lib.bindSymbol_stdcall(FreeImage_ConvertTo4Bits, "FreeImage_ConvertTo4Bits");
    lib.bindSymbol_stdcall(FreeImage_ConvertTo8Bits, "FreeImage_ConvertTo8Bits");
    lib.bindSymbol_stdcall(FreeImage_ConvertToGreyscale, "FreeImage_ConvertToGreyscale");
    lib.bindSymbol_stdcall(FreeImage_ConvertTo16Bits555, "FreeImage_ConvertTo16Bits555");
    lib.bindSymbol_stdcall(FreeImage_ConvertTo16Bits565, "FreeImage_ConvertTo16Bits565");
    lib.bindSymbol_stdcall(FreeImage_ConvertTo24Bits, "FreeImage_ConvertTo24Bits");
    lib.bindSymbol_stdcall(FreeImage_ConvertTo32Bits, "FreeImage_ConvertTo32Bits");
    lib.bindSymbol_stdcall(FreeImage_ColorQuantize, "FreeImage_ColorQuantize");
    lib.bindSymbol_stdcall(FreeImage_ColorQuantizeEx, "FreeImage_ColorQuantizeEx");
    lib.bindSymbol_stdcall(FreeImage_Threshold, "FreeImage_Threshold");
    lib.bindSymbol_stdcall(FreeImage_Dither, "FreeImage_Dither");
    lib.bindSymbol_stdcall(FreeImage_ConvertFromRawBits, "FreeImage_ConvertFromRawBits");
    lib.bindSymbol_stdcall(FreeImage_ConvertFromRawBitsEx, "FreeImage_ConvertFromRawBitsEx");
    lib.bindSymbol_stdcall(FreeImage_ConvertToRawBits, "FreeImage_ConvertToRawBits");
    lib.bindSymbol_stdcall(FreeImage_ConvertToFloat, "FreeImage_ConvertToFloat");
    lib.bindSymbol_stdcall(FreeImage_ConvertToRGBF, "FreeImage_ConvertToRGBF");
    lib.bindSymbol_stdcall(FreeImage_ConvertToRGBAF, "FreeImage_ConvertToRGBAF");
    lib.bindSymbol_stdcall(FreeImage_ConvertToUINT16, "FreeImage_ConvertToUINT16");
    lib.bindSymbol_stdcall(FreeImage_ConvertToRGB16, "FreeImage_ConvertToRGB16");
    lib.bindSymbol_stdcall(FreeImage_ConvertToRGBA16, "FreeImage_ConvertToRGBA16");
    lib.bindSymbol_stdcall(FreeImage_ConvertToStandardType, "FreeImage_ConvertToStandardType");
    lib.bindSymbol_stdcall(FreeImage_ConvertToType, "FreeImage_ConvertToType");
    lib.bindSymbol_stdcall(FreeImage_ToneMapping, "FreeImage_ToneMapping");
    lib.bindSymbol_stdcall(FreeImage_TmoDrago03, "FreeImage_TmoDrago03");
    lib.bindSymbol_stdcall(FreeImage_TmoReinhard05, "FreeImage_TmoReinhard05");
    lib.bindSymbol_stdcall(FreeImage_TmoReinhard05Ex, "FreeImage_TmoReinhard05Ex");
    lib.bindSymbol_stdcall(FreeImage_TmoFattal02, "FreeImage_TmoFattal02");
    lib.bindSymbol_stdcall(FreeImage_ZLibCompress, "FreeImage_ZLibCompress");
    lib.bindSymbol_stdcall(FreeImage_ZLibUncompress, "FreeImage_ZLibUncompress");
    lib.bindSymbol_stdcall(FreeImage_ZLibGZip, "FreeImage_ZLibGZip");
    lib.bindSymbol_stdcall(FreeImage_ZLibGUnzip, "FreeImage_ZLibGUnzip");
    lib.bindSymbol_stdcall(FreeImage_ZLibCRC32, "FreeImage_ZLibCRC32");

    lib.bindSymbol_stdcall(FreeImage_CreateTag, "FreeImage_CreateTag");
    lib.bindSymbol_stdcall(FreeImage_DeleteTag, "FreeImage_DeleteTag");
    lib.bindSymbol_stdcall(FreeImage_CloneTag, "FreeImage_CloneTag");
    lib.bindSymbol_stdcall(FreeImage_GetTagKey, "FreeImage_GetTagKey");
    lib.bindSymbol_stdcall(FreeImage_GetTagDescription, "FreeImage_GetTagDescription");
    lib.bindSymbol_stdcall(FreeImage_GetTagID, "FreeImage_GetTagID");
    lib.bindSymbol_stdcall(FreeImage_GetTagType, "FreeImage_GetTagType");
    lib.bindSymbol_stdcall(FreeImage_GetTagCount, "FreeImage_GetTagCount");
    lib.bindSymbol_stdcall(FreeImage_GetTagLength, "FreeImage_GetTagLength");
    lib.bindSymbol_stdcall(FreeImage_GetTagValue, "FreeImage_GetTagValue");
    lib.bindSymbol_stdcall(FreeImage_SetTagKey, "FreeImage_SetTagKey");
    lib.bindSymbol_stdcall(FreeImage_SetTagDescription, "FreeImage_SetTagDescription");
    lib.bindSymbol_stdcall(FreeImage_SetTagID, "FreeImage_SetTagID");
    lib.bindSymbol_stdcall(FreeImage_SetTagType, "FreeImage_SetTagType");
    lib.bindSymbol_stdcall(FreeImage_SetTagCount, "FreeImage_SetTagCount");
    lib.bindSymbol_stdcall(FreeImage_SetTagLength, "FreeImage_SetTagLength");
    lib.bindSymbol_stdcall(FreeImage_SetTagValue, "FreeImage_SetTagValue");
    lib.bindSymbol_stdcall(FreeImage_FindFirstMetadata, "FreeImage_FindFirstMetadata");
    lib.bindSymbol_stdcall(FreeImage_FindNextMetadata, "FreeImage_FindNextMetadata");
    lib.bindSymbol_stdcall(FreeImage_FindCloseMetadata, "FreeImage_FindCloseMetadata");
    lib.bindSymbol_stdcall(FreeImage_SetMetadata, "FreeImage_SetMetadata");
    lib.bindSymbol_stdcall(FreeImage_GetMetadata, "FreeImage_GetMetadata");
    lib.bindSymbol_stdcall(FreeImage_SetMetadataKeyValue, "FreeImage_SetMetadataKeyValue");
    lib.bindSymbol_stdcall(FreeImage_GetMetadataCount, "FreeImage_GetMetadataCount");
    lib.bindSymbol_stdcall(FreeImage_CloneMetadata, "FreeImage_CloneMetadata");
    lib.bindSymbol_stdcall(FreeImage_TagToString, "FreeImage_TagToString");

    version(BindFI_JPEGTransform) {
        lib.bindSymbol_stdcall(FreeImage_JPEGTransform, "FreeImage_JPEGTransform");
        lib.bindSymbol_stdcall(FreeImage_JPEGTransformU, "FreeImage_JPEGTransformU");
        lib.bindSymbol_stdcall(FreeImage_JPEGCrop, "FreeImage_JPEGCrop");
        lib.bindSymbol_stdcall(FreeImage_JPEGCropU, "FreeImage_JPEGCropU");
        lib.bindSymbol_stdcall(FreeImage_JPEGTransformFromHandle, "FreeImage_JPEGTransformFromHandle");
        lib.bindSymbol_stdcall(FreeImage_JPEGTransformCombined, "FreeImage_JPEGTransformCombined");
        lib.bindSymbol_stdcall(FreeImage_JPEGTransformCombinedU, "FreeImage_JPEGTransformCombinedU");
        lib.bindSymbol_stdcall(FreeImage_JPEGTransformCombinedFromMemory, "FreeImage_JPEGTransformCombinedFromMemory");
    }
    lib.bindSymbol_stdcall(FreeImage_Rotate, "FreeImage_Rotate");
    lib.bindSymbol_stdcall(FreeImage_RotateEx, "FreeImage_RotateEx");
    lib.bindSymbol_stdcall(FreeImage_FlipHorizontal, "FreeImage_FlipHorizontal");
    lib.bindSymbol_stdcall(FreeImage_FlipVertical, "FreeImage_FlipVertical");
    lib.bindSymbol_stdcall(FreeImage_Rescale, "FreeImage_Rescale");
    lib.bindSymbol_stdcall(FreeImage_MakeThumbnail, "FreeImage_MakeThumbnail");
    lib.bindSymbol_stdcall(FreeImage_RescaleRect, "FreeImage_RescaleRect");
    lib.bindSymbol_stdcall(FreeImage_AdjustCurve, "FreeImage_AdjustCurve");
    lib.bindSymbol_stdcall(FreeImage_AdjustGamma, "FreeImage_AdjustGamma");
    lib.bindSymbol_stdcall(FreeImage_AdjustBrightness, "FreeImage_AdjustBrightness");
    lib.bindSymbol_stdcall(FreeImage_AdjustContrast, "FreeImage_AdjustContrast");
    lib.bindSymbol_stdcall(FreeImage_Invert, "FreeImage_Invert");
    lib.bindSymbol_stdcall(FreeImage_GetHistogram, "FreeImage_GetHistogram");
    lib.bindSymbol_stdcall(FreeImage_GetAdjustColorsLookupTable, "FreeImage_GetAdjustColorsLookupTable");
    lib.bindSymbol_stdcall(FreeImage_AdjustColors, "FreeImage_AdjustColors");
    lib.bindSymbol_stdcall(FreeImage_ApplyColorMapping, "FreeImage_ApplyColorMapping");
    lib.bindSymbol_stdcall(FreeImage_SwapColors, "FreeImage_SwapColors");
    lib.bindSymbol_stdcall(FreeImage_ApplyPaletteIndexMapping, "FreeImage_ApplyPaletteIndexMapping");
    lib.bindSymbol_stdcall(FreeImage_SwapPaletteIndices, "FreeImage_SwapPaletteIndices");
    lib.bindSymbol_stdcall(FreeImage_GetChannel, "FreeImage_GetChannel");
    lib.bindSymbol_stdcall(FreeImage_SetChannel, "FreeImage_SetChannel");
    lib.bindSymbol_stdcall(FreeImage_GetComplexChannel, "FreeImage_GetComplexChannel");
    lib.bindSymbol_stdcall(FreeImage_SetComplexChannel, "FreeImage_SetComplexChannel");
    lib.bindSymbol_stdcall(FreeImage_Copy, "FreeImage_Copy");
    lib.bindSymbol_stdcall(FreeImage_Paste, "FreeImage_Paste");
    lib.bindSymbol_stdcall(FreeImage_CreateView, "FreeImage_CreateView");
    lib.bindSymbol_stdcall(FreeImage_Composite, "FreeImage_Composite");
    lib.bindSymbol_stdcall(FreeImage_PreMultiplyWithAlpha, "FreeImage_PreMultiplyWithAlpha");
    lib.bindSymbol_stdcall(FreeImage_FillBackground, "FreeImage_FillBackground");
    lib.bindSymbol_stdcall(FreeImage_EnlargeCanvas, "FreeImage_EnlargeCanvas");
    lib.bindSymbol_stdcall(FreeImage_AllocateEx, "FreeImage_AllocateEx");
    lib.bindSymbol_stdcall(FreeImage_AllocateExT, "FreeImage_AllocateExT");
    lib.bindSymbol_stdcall(FreeImage_MultigridPoissonSolver, "FreeImage_MultigridPoissonSolver");

    if(errorCount() != errCount) return FISupport.badLibrary;
    else loadedVersion = FISupport.fi317;

    static if(fiSupport >= FISupport.fi318) {
        lib.bindSymbol_stdcall(FreeImage_Validate, "FreeImage_Validate");
        lib.bindSymbol_stdcall(FreeImage_ValidateU, "FreeImage_ValidateU");
        lib.bindSymbol_stdcall(FreeImage_ValidateFromHandle, "FreeImage_ValidateFromHandle");
        lib.bindSymbol_stdcall(FreeImage_ValidateFromMemory, "FreeImage_ValidateFromMemory");
        lib.bindSymbol_stdcall(FreeImage_ConvertLine1To32MapTransparency, "FreeImage_ConvertLine1To32MapTransparency");
        lib.bindSymbol_stdcall(FreeImage_ConvertLine4To32MapTransparency, "FreeImage_ConvertLine4To32MapTransparency");
        lib.bindSymbol_stdcall(FreeImage_ConvertLine8To32MapTransparency, "FreeImage_ConvertLine8To32MapTransparency");

        if(errorCount() != errCount) return FISupport.badLibrary;
        else loadedVersion = FISupport.fi318;
    }

    return loadedVersion;
}
