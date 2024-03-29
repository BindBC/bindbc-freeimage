
//          Copyright 2019 - 2022 Michael D. Parker
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.freeimage.types;

import core.stdc.config,
       core.stdc.stddef;

enum FISupport {
    noLibrary,
    badLibrary,
    fi317 = 317,
    fi318 = 318,
}

enum FREEIMAGE_MAJOR_VERSION = 3;

version(FI_318) {
    enum FREEIMAGE_MINOR_VERSION = 18;
    enum FREEIMAGE_RELEASE_SERIAL = 0;
    enum fiSupport = FISupport.fi318;
}
else {
    enum FREEIMAGE_MINOR_VERSION = 17;
    enum FREEIMAGE_RELEASE_SERIAL = 0;
    enum fiSupport = FISupport.fi317;
}

enum FREEIMAGE_COLORORDER_BGR = 0,
     FREEIMAGE_COLORORDER_RGB = 1;

version(LittleEndian) {
    version = FREEIMAGE_COLORORDER_BGR;
}
else {
    version = FREEIMAGE_COLORORDER_RGB;
}

struct FIBITMAP {
    void *data;
}

struct FIMULTIBITMAP {
    void *data;
}

enum {
    FALSE = 0,
    TRUE = 1,
    NULL = 0,
    SEEK_SET = 0,
    SEEK_CUR = 1,
    SEEK_END = 2
}

alias BOOL = uint;
alias BYTE = ubyte;
alias WORD = ushort;
alias DWORD = c_ulong;
alias LONG = int;

// Renamed from FIINT64 and FIUINT64 in 3.15.4
alias INT64 = long;
alias UINT64 = ulong;

// Added in 3.15.3
alias FIINT64 = INT64;
alias FIUINT64 = UINT64;

align(1) struct RGBQUAD {
    version(FREEIMAGE_COLORORDER_BGR) {
        BYTE rgbBlue;
        BYTE rgbGreen;
        BYTE rgbRed;
    } else {
        BYTE rgbRed;
        BYTE rgbGreen;
        BYTE rgbBlue;
    }
    BYTE rgbReserved;
}

align(1) struct RGBTRIPLE {
    version(FREEIMAGE_COLORORDER_BGR) {
        BYTE rgbtBlue;
        BYTE rgbtGreen;
        BYTE rgbtRed;
    } else {
        BYTE rgbtRed;
        BYTE rgbtGreen;
        BYTE rgbtBlue;
    }
}

align(1) struct BITMAPINFOHEADER {
    DWORD biSize;
    LONG  biWidth;
    LONG  biHeight;
    WORD  biPlanes;
    WORD  biBitCount;
    DWORD biCompression;
    DWORD biSizeImage;
    LONG  biXPelsPerMeter;
    LONG  biYPelsPerMeter;
    DWORD biClrUsed;
    DWORD biClrImportant;
}

alias PBITMAPINFOHEADER = BITMAPINFOHEADER*;

align(1) struct BITMAPINFO {
    BITMAPINFOHEADER bmiHeader;
    RGBQUAD[1] bmiColors;
}

alias PBITMAPINFO = BITMAPINFO*;

align(1) struct FIRGB16 {
    WORD red;
    WORD green;
    WORD blue;
}

align(1) struct FIRGBA16 {
    WORD red;
    WORD green;
    WORD blue;
    WORD alpha;
}

align(1) struct FIRGBF {
    float red;
    float green;
    float blue;
}

align(1) struct FIRGBAF {
    float red;
    float green;
    float blue;
    float alpha;
}

align(1) struct FICOMPLEX {
    double r;
    double i;
}

struct FIMETADATA {
    void* data;
}

struct FITAG {
    void* data;
}

version(LittleEndian) {
    version(FREEIMAGE_COLORORDER_BGR) {
        enum {
            FI_RGBA_RED           = 2,
            FI_RGBA_GREEN         = 1,
            FI_RGBA_BLUE          = 0,
            FI_RGBA_ALPHA         = 3,
            FI_RGBA_RED_MASK      = 0x00FF0000,
            FI_RGBA_GREEN_MASK    = 0x0000FF00,
            FI_RGBA_BLUE_MASK     = 0x000000FF,
            FI_RGBA_ALPHA_MASK    = 0xFF000000,
            FI_RGBA_RED_SHIFT     = 16,
            FI_RGBA_GREEN_SHIFT   = 8,
            FI_RGBA_BLUE_SHIFT    = 0,
            FI_RGBA_ALPHA_SHIFT   = 24
        }
    } else {
        enum
        {
            FI_RGBA_RED           = 0,
            FI_RGBA_GREEN         = 1,
            FI_RGBA_BLUE          = 2,
            FI_RGBA_ALPHA         = 3,
            FI_RGBA_RED_MASK      = 0x000000FF,
            FI_RGBA_GREEN_MASK    = 0x0000FF00,
            FI_RGBA_BLUE_MASK     = 0x00FF0000,
            FI_RGBA_ALPHA_MASK    = 0xFF000000,
            FI_RGBA_RED_SHIFT     = 0,
            FI_RGBA_GREEN_SHIFT   = 8,
            FI_RGBA_BLUE_SHIFT    = 16,
            FI_RGBA_ALPHA_SHIFT   = 24
        }
    }
}
else {
    version(FREEIMAGE_COLORORDER_BGR) {
        enum {
            FI_RGBA_RED           = 2,
            FI_RGBA_GREEN         = 1,
            FI_RGBA_BLUE          = 0,
            FI_RGBA_ALPHA         = 3,
            FI_RGBA_RED_MASK      = 0x0000FF00,
            FI_RGBA_GREEN_MASK    = 0x00FF0000,
            FI_RGBA_BLUE_MASK     = 0xFF000000,
            FI_RGBA_ALPHA_MASK    = 0x000000FF,
            FI_RGBA_RED_SHIFT     = 8,
            FI_RGBA_GREEN_SHIFT   = 16,
            FI_RGBA_BLUE_SHIFT    = 24,
            FI_RGBA_ALPHA_SHIFT   = 0
        }
    }
    else {
        enum {
            FI_RGBA_RED           = 0,
            FI_RGBA_GREEN         = 1,
            FI_RGBA_BLUE          = 2,
            FI_RGBA_ALPHA         = 3,
            FI_RGBA_RED_MASK      = 0xFF000000,
            FI_RGBA_GREEN_MASK    = 0x00FF0000,
            FI_RGBA_BLUE_MASK     = 0x0000FF00,
            FI_RGBA_ALPHA_MASK    = 0x000000FF,
            FI_RGBA_RED_SHIFT     = 24,
            FI_RGBA_GREEN_SHIFT   = 16,
            FI_RGBA_BLUE_SHIFT    = 8,
            FI_RGBA_ALPHA_SHIFT   = 0
        }
    }
}

enum FI_RGBA_RGB_MASK = FI_RGBA_RED_MASK | FI_RGBA_GREEN_MASK | FI_RGBA_BLUE_MASK;

enum {
    FI16_555_RED_MASK     = 0x7C00,
    FI16_555_GREEN_MASK   = 0x03E0,
    FI16_555_BLUE_MASK    = 0x001F,
    FI16_555_RED_SHIFT    = 10,
    FI16_555_GREEN_SHIFT  = 5,
    FI16_555_BLUE_SHIFT   = 0,
    FI16_565_RED_MASK     = 0xF800,
    FI16_565_GREEN_MASK   = 0x07E0,
    FI16_565_BLUE_MASK    = 0x001F,
    FI16_565_RED_SHIFT    = 11,
    FI16_565_GREEN_SHIFT  = 5,
    FI16_565_BLUE_SHIFT   = 0
}

enum {
    FIICC_DEFAULT       = 0x00,
    FIICC_COLOR_IS_CMYK = 0x01
}

struct FIICCPROFILE {
    WORD  flags;    // info flag
    DWORD  size;    // profile's size measured in bytes
    void  *data;    // points to a block of contiguous memory containing the profile
}

enum FREE_IMAGE_FORMAT {
    FIF_UNKNOWN = -1,
    FIF_BMP     = 0,
    FIF_ICO     = 1,
    FIF_JPEG    = 2,
    FIF_JNG     = 3,
    FIF_KOALA   = 4,
    FIF_LBM     = 5,
    FIF_IFF     = FIF_LBM,
    FIF_MNG     = 6,
    FIF_PBM     = 7,
    FIF_PBMRAW  = 8,
    FIF_PCD     = 9,
    FIF_PCX     = 10,
    FIF_PGM     = 11,
    FIF_PGMRAW  = 12,
    FIF_PNG     = 13,
    FIF_PPM     = 14,
    FIF_PPMRAW  = 15,
    FIF_RAS     = 16,
    FIF_TARGA   = 17,
    FIF_TIFF    = 18,
    FIF_WBMP    = 19,
    FIF_PSD     = 20,
    FIF_CUT     = 21,
    FIF_XBM     = 22,
    FIF_XPM     = 23,
    FIF_DDS     = 24,
    FIF_GIF     = 25,
    FIF_HDR     = 26,
    FIF_FAXG3   = 27,
    FIF_SGI     = 28,
    FIF_EXR     = 29,
    FIF_J2K     = 30,
    FIF_JP2     = 31,
    FIF_PFM     = 32,
    FIF_PICT    = 33,
    FIF_RAW     = 34,
    // FreeImage 3.16.0
    FIF_WEBP    = 35,
    FFI_JXR     = 36,
}
mixin(expandEnum!FREE_IMAGE_FORMAT);

enum FREE_IMAGE_TYPE {
    FIT_UNKNOWN = 0,
    FIT_BITMAP  = 1,
    FIT_UINT16  = 2,
    FIT_INT16   = 3,
    FIT_UINT32  = 4,
    FIT_INT32   = 5,
    FIT_FLOAT   = 6,
    FIT_DOUBLE  = 7,
    FIT_COMPLEX = 8,
    FIT_RGB16   = 9,
    FIT_RGBA16  = 10,
    FIT_RGBF    = 11,
    FIT_RGBAF   = 12
}
mixin(expandEnum!FREE_IMAGE_TYPE);

enum FREE_IMAGE_COLOR_TYPE {
    FIC_MINISWHITE = 0,
    FIC_MINISBLACK = 1,
    FIC_RGB        = 2,
    FIC_PALETTE    = 3,
    FIC_RGBALPHA   = 4,
    FIC_CMYK       = 5
}
mixin(expandEnum!FREE_IMAGE_COLOR_TYPE);

enum FREE_IMAGE_QUANTIZE {
    FIQ_WUQUANT = 0,
    FIQ_NNQUANT = 1
}
mixin(expandEnum!FREE_IMAGE_QUANTIZE);

enum FREE_IMAGE_DITHER {
    FID_FS          = 0,
    FID_BAYER4x4    = 1,
    FID_BAYER8x8    = 2,
    FID_CLUSTER6x6  = 3,
    FID_CLUSTER8x8  = 4,
    FID_CLUSTER16x16= 5,
    FID_BAYER16x16  = 6
}
mixin(expandEnum!FREE_IMAGE_DITHER);

enum FREE_IMAGE_JPEG_OPERATION {
    FIJPEG_OP_NONE          = 0,
    FIJPEG_OP_FLIP_H        = 1,
    FIJPEG_OP_FLIP_V        = 2,
    FIJPEG_OP_TRANSPOSE     = 3,
    FIJPEG_OP_TRANSVERSE    = 4,
    FIJPEG_OP_ROTATE_90     = 5,
    FIJPEG_OP_ROTATE_180    = 6,
    FIJPEG_OP_ROTATE_270    = 7
}
mixin(expandEnum!FREE_IMAGE_JPEG_OPERATION);

enum FREE_IMAGE_TMO {
    FITMO_DRAGO03    = 0,
    FITMO_REINHARD05 = 1,
    FITMO_FATTAL02   = 2
}
mixin(expandEnum!FREE_IMAGE_TMO);

enum FREE_IMAGE_FILTER {
    FILTER_BOX        = 0,
    FILTER_BICUBIC    = 1,
    FILTER_BILINEAR   = 2,
    FILTER_BSPLINE    = 3,
    FILTER_CATMULLROM = 4,
    FILTER_LANCZOS3   = 5
}
mixin(expandEnum!FREE_IMAGE_FILTER);

enum FREE_IMAGE_COLOR_CHANNEL
{
    FICC_RGB    = 0,
    FICC_RED    = 1,
    FICC_GREEN  = 2,
    FICC_BLUE   = 3,
    FICC_ALPHA  = 4,
    FICC_BLACK  = 5,
    FICC_REAL   = 6,
    FICC_IMAG   = 7,
    FICC_MAG    = 8,
    FICC_PHASE  = 9
}
mixin(expandEnum!FREE_IMAGE_COLOR_CHANNEL);

enum FREE_IMAGE_MDTYPE {
    FIDT_NOTYPE     = 0,
    FIDT_BYTE       = 1,
    FIDT_ASCII      = 2,
    FIDT_SHORT      = 3,
    FIDT_LONG       = 4,
    FIDT_RATIONAL   = 5,
    FIDT_SBYTE      = 6,
    FIDT_UNDEFINED  = 7,
    FIDT_SSHORT     = 8,
    FIDT_SLONG      = 9,
    FIDT_SRATIONAL  = 10,
    FIDT_FLOAT      = 11,
    FIDT_DOUBLE     = 12,
    FIDT_IFD        = 13,
    FIDT_PALETTE    = 14,
    // Added in 3.15.3
    FIDT_LONG8      = 16,
    FIDT_SLONG8     = 17,
    FIDT_IFD8       = 18
}
mixin(expandEnum!FREE_IMAGE_MDTYPE);

enum FREE_IMAGE_MDMODEL {
    FIMD_NODATA         = -1,
    FIMD_COMMENTS       = 0,
    FIMD_EXIF_MAIN      = 1,
    FIMD_EXIF_EXIF      = 2,
    FIMD_EXIF_GPS       = 3,
    FIMD_EXIF_MAKERNOTE = 4,
    FIMD_EXIF_INTEROP   = 5,
    FIMD_IPTC           = 6,
    FIMD_XMP            = 7,
    FIMD_GEOTIFF        = 8,
    FIMD_ANIMATION      = 9,
    FIMD_CUSTOM         = 10,
    FIMD_EXIF_RAW       = 11
}
mixin(expandEnum!FREE_IMAGE_MDMODEL);

alias fi_handle =  void*;
extern(System) nothrow {
    alias FI_ReadProc = uint function(void *buffer, uint size, uint count, fi_handle handle);
    alias FI_WriteProc = uint function(void *buffer, uint size, uint count, fi_handle handle);
    alias FI_SeekProc = int function(fi_handle handle, c_long offset, int origin);
    alias FI_TellProc = c_long function(fi_handle handle);
}

align(1) struct FreeImageIO {
    FI_ReadProc  read_proc;
    FI_WriteProc write_proc;
    FI_SeekProc  seek_proc;
    FI_TellProc  tell_proc;
}

struct FIMEMORY {
    void *data;
}

extern(C) nothrow {
    alias FI_FormatProc = const(char)* function(char)* function();
    alias FI_DescriptionProc = const(char)* function(char)* function();
    alias FI_ExtensionListProc = const(char)* function(char)* function();
    alias FI_RegExprProc = const(char)* function(char)* function();
    alias FI_OpenProc = void* function(FreeImageIO *io, fi_handle handle, BOOL read);
    alias FI_CloseProc = void function(FreeImageIO *io, fi_handle handle, void *data);
    alias FI_PageCountProc = int function(FreeImageIO *io, fi_handle handle, void *data);
    alias FI_PageCapabilityProc = int function(FreeImageIO *io, fi_handle handle, void *data);
    alias FI_LoadProc = FIBITMAP* function(FreeImageIO *io, fi_handle handle, int page, int flags, void *data);
    alias FI_SaveProc = BOOL function(FreeImageIO *io, FIBITMAP *dib, fi_handle handle, int page, int flags, void *data);
    alias FI_ValidateProc = BOOL function(FreeImageIO *io, fi_handle handle);
    alias FI_MimeProc = const(char) function(char) function();
    alias FI_SupportsExportBPPProc = BOOL function(int bpp);
    alias FI_SupportsExportTypeProc = BOOL function(FREE_IMAGE_TYPE type);
    alias FI_SupportsICCProfilesProc = BOOL function();
    alias FI_SupportsNoPixelsProc = BOOL function();
}

struct Plugin {
    FI_FormatProc format_proc;
    FI_DescriptionProc description_proc;
    FI_ExtensionListProc extension_proc;
    FI_RegExprProc regexpr_proc;
    FI_OpenProc open_proc;
    FI_CloseProc close_proc;
    FI_PageCountProc pagecount_proc;
    FI_PageCapabilityProc pagecapability_proc;
    FI_LoadProc load_proc;
    FI_SaveProc save_proc;
    FI_ValidateProc validate_proc;
    FI_MimeProc mime_proc;
    FI_SupportsExportBPPProc supports_export_bpp_proc;
    FI_SupportsExportTypeProc supports_export_type_proc;
    FI_SupportsICCProfilesProc supports_icc_profiles_proc;
    FI_SupportsNoPixelsProc supports_no_pixels_proc;
}


extern(C) nothrow alias FI_InitProc =void function(Plugin *plugin, int format_id);


// Load / Save flag constants -----------------------------------------------

enum {
     FIF_LOAD_NOPIXELS   = 0x8000,
     BMP_DEFAULT         = 0,
     BMP_SAVE_RLE        = 1,
     CUT_DEFAULT         = 0,
     DDS_DEFAULT         = 0,
     EXR_DEFAULT         = 0,
     EXR_FLOAT           = 0x0001,
     EXR_NONE            = 0x0002,
     EXR_ZIP             = 0x0004,
     EXR_PIZ             = 0x0008,
     EXR_PXR24           = 0x0010,
     EXR_B44             = 0x0020,
     EXR_LC              = 0x0040,
     FAXG3_DEFAULT       = 0,
     GIF_DEFAULT         = 0,
     GIF_LOAD256         = 1,
     GIF_PLAYBACK        = 2,
     HDR_DEFAULT         = 0,
     ICO_DEFAULT         = 0,
     ICO_MAKEALPHA       = 1,
     IFF_DEFAULT         = 0,
     J2K_DEFAULT         = 0,
     JP2_DEFAULT         = 0,
     JPEG_DEFAULT        = 0,
     JPEG_FAST           = 0x0001,
     JPEG_ACCURATE       = 0x0002,
     JPEG_CMYK           = 0x0004,
     JPEG_EXIFROTATE     = 0x0008,
     JPEG_GRAYSCALE      = 0x0010, // Added in 3.15.4
     JPEG_QUALITYSUPERB  = 0x80,
     JPEG_QUALITYGOOD    = 0x0100,
     JPEG_QUALITYNORMAL  = 0x0200,
     JPEG_QUALITYAVERAGE = 0x0400,
     JPEG_QUALITYBAD     = 0x0800,
     JPEG_PROGRESSIVE    = 0x2000,

     JPEG_SUBSAMPLING_411 = 0x1000,
     JPEG_SUBSAMPLING_420 = 0x4000,
     JPEG_SUBSAMPLING_422 = 0x8000,
     JPEG_SUBSAMPLING_444 = 0x10000,
     JPEG_OPTIMIZE        = 0x20000,
     JPEG_BASELINE       = 0x40000,
     KOALA_DEFAULT       = 0,
     LBM_DEFAULT         = 0,
     MNG_DEFAULT         = 0,
     PCD_DEFAULT         = 0,
     PCD_BASE            = 1,
     PCD_BASEDIV4        = 2,
     PCD_BASEDIV16       = 3,
     PCX_DEFAULT         = 0,
     PFM_DEFAULT         = 0,
     PICT_DEFAULT        = 0,
     PNG_DEFAULT         = 0,
     PNG_IGNOREGAMMA     = 1,
     PNG_Z_BEST_SPEED    = 0x0001,
     PNG_Z_DEFAULT_COMPRESSION = 0x0006,
     PNG_Z_BEST_COMPRESSION    = 0x0009,
     PNG_Z_NO_COMPRESSION      = 0x0100,
     PNG_INTERLACED            = 0x0200,
     PNM_DEFAULT         = 0,
     PNM_SAVE_RAW        = 0,
     PNM_SAVE_ASCII      = 1,
     PSD_DEFAULT         = 0,
     PSD_CMYK            = 1,
     PSD_LAB             = 2,
     PSD_NONE            = 0x0100,      // Added in 3.18.0
     PSD_RLE             = 0x0200,      // ditto
     PSD_PSB             = 0x2000,      // ditto
     RAS_DEFAULT         = 0,
     RAW_DEFAULT         = 0,
     RAW_PREVIEW         = 1,
     RAW_DISPLAY         = 2,
     RAW_HALFSIZE        = 4, // Added in 3.15.1
     RAW_UNPROCESSED     = 8, // Added in 3.17.0
     SGI_DEFAULT         = 0,
     TARGA_DEFAULT       = 0,
     TARGA_LOAD_RGB888   = 1,
     TARGA_SAVE_RLE      = 2,
     TIFF_DEFAULT        = 0,
     TIFF_CMYK           = 0x0001,
     TIFF_PACKBITS       = 0x0100,
     TIFF_DEFLATE        = 0x0200,
     TIFF_ADOBE_DEFLATE  = 0x0400,
     TIFF_NONE           = 0x0800,
     TIFF_CCITTFAX3      = 0x1000,
     TIFF_CCITTFAX4      = 0x2000,
     TIFF_LZW            = 0x4000,
     TIFF_JPEG           = 0x8000,
     TIFF_LOGLUV         = 0x10000,
     WBMP_DEFAULT        = 0,
     XBM_DEFAULT         = 0,
     XPM_DEFAULT         = 0,
     // FreeImage 3.16.0
     WEBP_DEFAULT        = 0,
     WEBP_LOSSLESS       = 0x100,
     JXR_DEFAULT         = 0,
     JXR_LOSSLESS        = 0x0064,
     JXR_PROGRESSIVE     = 0x2000,
 }

enum {
    FI_COLOR_IS_RGB_COLOR        = 0x00,
    FI_COLOR_IS_RGBA_COLOR       = 0x01,
    FI_COLOR_FIND_EQUAL_COLOR    = 0x02,
    FI_COLOR_ALPHA_IS_INDEX      = 0x04,
    FI_COLOR_PALETTE_SEARCH_MASK = (FI_COLOR_FIND_EQUAL_COLOR | FI_COLOR_ALPHA_IS_INDEX)
}

// FreeImage 3.17.0
enum {
    FI_RESCALE_DEFAULT          = 0x00,
    FI_RESCALE_TRUE_COLOR       = 0x01,
    FI_RESCALE_OMIT_METADATA    = 0x02,
}

extern(C) nothrow alias FreeImage_OutputMessageFunction = void function(FREE_IMAGE_FORMAT fif, const(char)* msg);
extern(Windows) nothrow alias FreeImage_OutputMessageFunctionStdCall = void function(FREE_IMAGE_FORMAT fif, const(char)* msg);

private:
enum expandEnum(EnumType, string fqnEnumType = EnumType.stringof) = (){
    string expandEnum = "enum {";
    foreach(m;__traits(allMembers, EnumType)) {
        expandEnum ~= m ~ " = " ~ fqnEnumType ~ "." ~ m ~ ",";
    }
    expandEnum  ~= "}";
    return expandEnum;
}();