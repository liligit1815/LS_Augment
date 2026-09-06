.class public Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;
.super Landroid/view/View;
.source "TaskThumbnailViewDeprecated.java"

# interfaces
.implements Lcom/android/launcher3/util/b3$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final BACKGROUND_PAINT_COLOR:Landroid/util/IntProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/IntProperty<",
            "Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;",
            ">;"
        }
    .end annotation
.end field

.field public static final DIM_ALPHA:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public static final SPLASH_ALPHA:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "TaskThumbnailViewDeprecated"

.field private static final THUMBNAIL_NEED_CENTERED_THRESHOLD:F = 1.25f


# instance fields
.field private final mBackgroundPaint:Landroid/graphics/Paint;

.field protected mBitmapShader:Landroid/graphics/BitmapShader;

.field private final mClearPaint:Landroid/graphics/Paint;

.field private final mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

.field private mDimAlpha:F

.field private final mDimColor:I

.field private final mDimmingPaintAfterClearing:Landroid/graphics/Paint;

.field private mFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

.field private mOverlay:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay<",
            "*>;"
        }
    .end annotation
.end field

.field private mOverlayEnabled:Z

.field private final mPaint:Landroid/graphics/Paint;

.field private final mPreviewPositionHelper:Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;

.field private final mPreviewRect:Landroid/graphics/Rect;

.field private mPrivateLockedBitmap:Landroid/graphics/Bitmap;

.field private mShowSplashForSplitSelection:Z

.field private mSplashAlpha:I

.field private final mSplashBackgroundPaint:Landroid/graphics/Paint;

.field private mSplashView:Landroid/widget/ImageView;

.field private mSplashViewDrawable:Landroid/graphics/drawable/Drawable;

.field private mTask:Lcom/android/systemui/shared/recents/model/Task;

.field private mTaskView:Lcom/android/quickstep/views/TaskView;

.field private mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$1;

    .line 2
    .line 3
    const-string v1, "dimAlpha"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$1;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->DIM_ALPHA:Landroid/util/Property;

    .line 9
    .line 10
    new-instance v0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$2;

    .line 11
    .line 12
    const-string v1, "splashAlpha"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$2;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->SPLASH_ALPHA:Landroid/util/Property;

    .line 18
    .line 19
    new-instance v0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$3;

    .line 20
    .line 21
    const-string v1, "backgroundPaintColor"

    .line 22
    .line 23
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$3;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->BACKGROUND_PAINT_COLOR:Landroid/util/IntProperty;

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance p2, Landroid/graphics/Paint;

    const/4 p3, 0x1

    invoke-direct {p2, p3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p2, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPaint:Landroid/graphics/Paint;

    .line 5
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, p3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 6
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, p3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mSplashBackgroundPaint:Landroid/graphics/Paint;

    .line 7
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iput-object v2, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mClearPaint:Landroid/graphics/Paint;

    .line 8
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mDimmingPaintAfterClearing:Landroid/graphics/Paint;

    .line 9
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    iput-object v4, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPreviewRect:Landroid/graphics/Rect;

    .line 10
    new-instance v4, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;

    invoke-direct {v4}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;-><init>()V

    iput-object v4, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPreviewPositionHelper:Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;

    const/4 v4, 0x0

    .line 11
    iput v4, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mDimAlpha:F

    const/4 v4, 0x0

    .line 12
    iput v4, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mSplashAlpha:I

    const/4 v4, 0x0

    .line 13
    iput-object v4, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPrivateLockedBitmap:Landroid/graphics/Bitmap;

    .line 14
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    const/4 p2, -0x1

    .line 15
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 16
    invoke-virtual {v1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 17
    new-instance p2, Landroid/graphics/PorterDuffXfermode;

    sget-object p3, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p2, p3}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v2, p2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 18
    invoke-static {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->containerFromContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/android/quickstep/views/RecentsViewContainer;

    iput-object p2, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 19
    new-instance p2, Lcom/android/quickstep/FullscreenDrawParams;

    new-instance p3, Lcom/android/quickstep/views/X1;

    invoke-direct {p3}, Lcom/android/quickstep/views/X1;-><init>()V

    new-instance v0, Lcom/android/quickstep/views/Y1;

    invoke-direct {v0}, Lcom/android/quickstep/views/Y1;-><init>()V

    invoke-direct {p2, p1, p3, v0}, Lcom/android/quickstep/FullscreenDrawParams;-><init>(Landroid/content/Context;Lu4/l;Lu4/l;)V

    iput-object p2, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    .line 20
    invoke-static {p1}, Lcom/android/quickstep/views/RecentsView;->getForegroundScrimDimColor(Landroid/content/Context;)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mDimColor:I

    .line 21
    invoke-virtual {v3, p1}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method

.method public static synthetic a(Landroid/content/Context;)Ljava/lang/Float;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static synthetic b(Landroid/content/Context;)Ljava/lang/Float;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;)Landroid/graphics/Paint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mDimAlpha:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mSplashAlpha:I

    .line 2
    .line 3
    return p0
.end method

.method private getColorFilter(F)Landroid/graphics/ColorFilter;
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mDimColor:I

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/launcher3/N5;->I(IF)Landroid/graphics/ColorFilter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private getPrivateAppBitmap()Landroid/graphics/Bitmap;
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->X()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v2, "setThumbnail: privateTask = "

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v2, ", task = "

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 32
    .line 33
    iget-object v2, v2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getComponent()Landroid/content/ComponentName;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const-string v2, "TaskThumbnailViewDeprecated"

    .line 47
    .line 48
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 52
    .line 53
    invoke-static {v0, v1}, Lx1/O;->d4(Ljava/lang/String;Lcom/android/systemui/shared/recents/model/Task;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_0

    .line 58
    .line 59
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getComponent()Landroid/content/ComponentName;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 68
    .line 69
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 70
    .line 71
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 72
    .line 73
    invoke-static {v1}, Lcom/android/launcher3/resource/h1;->a0(I)Landroid/os/UserHandle;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/resource/h1;->e0(Landroid/content/ComponentName;Landroid/os/UserHandle;Landroid/content/Context;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_1

    .line 86
    .line 87
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    const v1, 0x7f0807bf

    .line 92
    .line 93
    .line 94
    invoke-static {v0, v1}, Lz/a;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    if-eqz v0, :cond_1

    .line 99
    .line 100
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    const v2, 0x7f0607e0

    .line 105
    .line 106
    .line 107
    invoke-static {v1, v2}, Lz/a;->c(Landroid/content/Context;I)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    const v1, 0x7f070b60

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 130
    .line 131
    invoke-static {p0, p0, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    new-instance v1, Landroid/graphics/Canvas;

    .line 136
    .line 137
    invoke-direct {v1, p0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    const/4 v4, 0x0

    .line 149
    invoke-virtual {v0, v4, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 153
    .line 154
    .line 155
    return-object p0

    .line 156
    :cond_1
    const/4 p0, 0x0

    .line 157
    return-object p0
.end method

.method private isThumbnailAspectRatioDifferentFromThumbnailData()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    int-to-float v0, v0

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    int-to-float v1, v1

    .line 22
    div-float/2addr v0, v1

    .line 23
    iget-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    int-to-float v1, v1

    .line 34
    iget-object p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    int-to-float p0, p0

    .line 45
    div-float/2addr v1, p0

    .line 46
    const p0, 0x3dcccccd    # 0.1f

    .line 47
    .line 48
    .line 49
    invoke-static {v0, v1, p0}, Lcom/android/systemui/shared/recents/utilities/Utilities;->isRelativePercentDifferenceGreaterThan(FFF)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0

    .line 54
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 55
    return p0
.end method

.method private refresh(Z)V
    .locals 3

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 3
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    invoke-virtual {v0}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->getPrivateAppBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPrivateLockedBitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_0

    move-object v0, v1

    .line 5
    :cond_0
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->prepareToDraw()V

    .line 6
    invoke-static {}, Lx1/O;->i3()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 7
    new-instance v1, Landroid/graphics/BitmapShader;

    sget-object v2, Landroid/graphics/Shader$TileMode;->DECAL:Landroid/graphics/Shader$TileMode;

    invoke-direct {v1, v0, v2, v2}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    iput-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mBitmapShader:Landroid/graphics/BitmapShader;

    goto :goto_0

    .line 8
    :cond_1
    new-instance v1, Landroid/graphics/BitmapShader;

    sget-object v2, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v1, v0, v2, v2}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    iput-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mBitmapShader:Landroid/graphics/BitmapShader;

    .line 9
    :goto_0
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPrivateLockedBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_2

    .line 10
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f06072a

    invoke-virtual {v1, v2}, Landroid/content/Context;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_1

    .line 11
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mBitmapShader:Landroid/graphics/BitmapShader;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 12
    :goto_1
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->updateThumbnailMatrix()V

    if-eqz p1, :cond_4

    .line 13
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->refreshOverlay()V

    goto :goto_2

    :cond_3
    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mBitmapShader:Landroid/graphics/BitmapShader;

    .line 15
    iput-object p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 16
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 17
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mOverlay:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    invoke-virtual {v0}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->reset()V

    .line 18
    iput-object p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPrivateLockedBitmap:Landroid/graphics/Bitmap;

    .line 19
    :cond_4
    :goto_2
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->updateThumbnailPaintFilter()V

    return-void
.end method

.method private refreshOverlay()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mOverlayEnabled:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mOverlay:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    invoke-virtual {v2}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v2, 0x0

    .line 19
    :goto_0
    iget-object v3, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPreviewPositionHelper:Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;

    .line 20
    .line 21
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->getMatrix()Landroid/graphics/Matrix;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    iget-object p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPreviewPositionHelper:Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->isOrientationChanged()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    invoke-virtual {v0, v1, v2, v3, p0}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->initOverlay(Lcom/android/systemui/shared/recents/model/Task;Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Z)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mOverlay:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->reset()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private updateSplashView(Landroid/graphics/drawable/Drawable;)V
    .locals 9

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mSplashViewDrawable:Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    iget v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mSplashAlpha:I

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mSplashView:Landroid/widget/ImageView;

    .line 31
    .line 32
    if-nez p1, :cond_1

    .line 33
    .line 34
    new-instance p1, Landroid/widget/ImageView;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-direct {p1, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mSplashViewDrawable:Landroid/graphics/drawable/Drawable;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 46
    .line 47
    .line 48
    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 51
    .line 52
    .line 53
    new-instance v0, Landroid/graphics/Matrix;

    .line 54
    .line 55
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mSplashViewDrawable:Landroid/graphics/drawable/Drawable;

    .line 59
    .line 60
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    int-to-float v1, v1

    .line 65
    iget-object v2, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mSplashViewDrawable:Landroid/graphics/drawable/Drawable;

    .line 66
    .line 67
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    int-to-float v2, v2

    .line 72
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    int-to-float v3, v3

    .line 77
    const/high16 v4, 0x40000000    # 2.0f

    .line 78
    .line 79
    div-float v5, v3, v4

    .line 80
    .line 81
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 82
    .line 83
    .line 84
    move-result v6

    .line 85
    int-to-float v6, v6

    .line 86
    div-float v7, v6, v4

    .line 87
    .line 88
    sub-float/2addr v3, v1

    .line 89
    div-float/2addr v3, v4

    .line 90
    sub-float/2addr v6, v2

    .line 91
    div-float/2addr v6, v4

    .line 92
    iget-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 93
    .line 94
    const/high16 v2, 0x3f800000    # 1.0f

    .line 95
    .line 96
    if-nez v1, :cond_2

    .line 97
    .line 98
    move v1, v2

    .line 99
    goto :goto_0

    .line 100
    :cond_2
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskView;->getNonGridScale()F

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    div-float v1, v2, v1

    .line 105
    .line 106
    :goto_0
    iget-object v4, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 107
    .line 108
    if-eqz v4, :cond_4

    .line 109
    .line 110
    invoke-virtual {v4}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    if-nez v4, :cond_3

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_3
    iget-object v4, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 118
    .line 119
    invoke-virtual {v4}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    invoke-virtual {v4}, Lcom/android/quickstep/views/RecentsView;->getMaxScaleForFullScreen()F

    .line 124
    .line 125
    .line 126
    move-result v4

    .line 127
    div-float v4, v2, v4

    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_4
    :goto_1
    move v4, v2

    .line 131
    :goto_2
    mul-float/2addr v1, v4

    .line 132
    invoke-virtual {p0}, Landroid/view/View;->getScaleX()F

    .line 133
    .line 134
    .line 135
    move-result v4

    .line 136
    div-float v4, v2, v4

    .line 137
    .line 138
    mul-float/2addr v4, v1

    .line 139
    invoke-virtual {p0}, Landroid/view/View;->getScaleY()F

    .line 140
    .line 141
    .line 142
    move-result v8

    .line 143
    div-float/2addr v2, v8

    .line 144
    mul-float/2addr v1, v2

    .line 145
    invoke-virtual {v0, v3, v6}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0, v4, v1, v5, v7}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 149
    .line 150
    .line 151
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 152
    .line 153
    .line 154
    iput-object p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mSplashView:Landroid/widget/ImageView;

    .line 155
    .line 156
    return-void

    .line 157
    :cond_5
    :goto_3
    const/4 p1, 0x0

    .line 158
    iput-object p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mSplashViewDrawable:Landroid/graphics/drawable/Drawable;

    .line 159
    .line 160
    iput-object p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mSplashView:Landroid/widget/ImageView;

    .line 161
    .line 162
    return-void
.end method

.method private updateThumbnailMatrix()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPreviewPositionHelper:Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v1, v2}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->setOrientationChanged(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mBitmapShader:Landroid/graphics/BitmapShader;

    .line 14
    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 18
    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    iget-object v3, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPreviewRect:Landroid/graphics/Rect;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iget-object v4, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 32
    .line 33
    invoke-virtual {v4}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    invoke-virtual {v3, v2, v2, v1, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskView;->getOrientedState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1}, Lcom/android/quickstep/util/RecentsOrientedState;->getRecentsActivityRotation()I

    .line 51
    .line 52
    .line 53
    move-result v9

    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    const/4 v3, 0x1

    .line 59
    if-ne v1, v3, :cond_0

    .line 60
    .line 61
    move v10, v3

    .line 62
    goto :goto_0

    .line 63
    :cond_0
    move v10, v2

    .line 64
    :goto_0
    iget-object v3, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPreviewPositionHelper:Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;

    .line 65
    .line 66
    iget-object v4, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPreviewRect:Landroid/graphics/Rect;

    .line 67
    .line 68
    iget-object v5, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 71
    .line 72
    .line 73
    move-result v6

    .line 74
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    iget-boolean v8, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 79
    .line 80
    invoke-virtual/range {v3 .. v10}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->updateThumbnailMatrix(Landroid/graphics/Rect;Lcom/android/systemui/shared/recents/model/ThumbnailData;IIZIZ)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mBitmapShader:Landroid/graphics/BitmapShader;

    .line 84
    .line 85
    iget-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPreviewPositionHelper:Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;

    .line 86
    .line 87
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->getMatrix()Landroid/graphics/Matrix;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v0, v1}, Landroid/graphics/BitmapShader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPrivateLockedBitmap:Landroid/graphics/Bitmap;

    .line 95
    .line 96
    if-eqz v0, :cond_1

    .line 97
    .line 98
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPaint:Landroid/graphics/Paint;

    .line 99
    .line 100
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    const v2, 0x7f06072a

    .line 105
    .line 106
    .line 107
    invoke-virtual {v1, v2}, Landroid/content/Context;->getColor(I)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 112
    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPaint:Landroid/graphics/Paint;

    .line 116
    .line 117
    iget-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mBitmapShader:Landroid/graphics/BitmapShader;

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 120
    .line 121
    .line 122
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 123
    .line 124
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->updateFullscreenParams()V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method private updateThumbnailPaintFilter()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mDimAlpha:F

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->getColorFilter(F)Landroid/graphics/ColorFilter;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 10
    .line 11
    .line 12
    iget v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mDimAlpha:F

    .line 13
    .line 14
    const/high16 v2, 0x437f0000    # 255.0f

    .line 15
    .line 16
    mul-float/2addr v1, v2

    .line 17
    float-to-int v1, v1

    .line 18
    iget-object v2, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mDimmingPaintAfterClearing:Landroid/graphics/Paint;

    .line 19
    .line 20
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 21
    .line 22
    .line 23
    iget-object v2, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mBitmapShader:Landroid/graphics/BitmapShader;

    .line 24
    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPaint:Landroid/graphics/Paint;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPaint:Landroid/graphics/Paint;

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPaint:Landroid/graphics/Paint;

    .line 40
    .line 41
    iget v2, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mDimColor:I

    .line 42
    .line 43
    int-to-float v1, v1

    .line 44
    const/high16 v3, -0x1000000

    .line 45
    .line 46
    invoke-static {v3, v2, v1}, LB/a;->e(IIF)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 51
    .line 52
    .line 53
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 54
    .line 55
    .line 56
    return-void
.end method


# virtual methods
.method public bind(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;Lcom/android/quickstep/views/TaskView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/systemui/shared/recents/model/Task;",
            "Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay<",
            "*>;",
            "Lcom/android/quickstep/views/TaskView;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mOverlay:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->reset()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 9
    .line 10
    const/high16 p2, -0x1000000

    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget p1, p1, Lcom/android/systemui/shared/recents/model/Task;->colorBackground:I

    .line 16
    .line 17
    or-int/2addr p2, p1

    .line 18
    :goto_0
    iget-object p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPaint:Landroid/graphics/Paint;

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mSplashBackgroundPaint:Landroid/graphics/Paint;

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->icon:Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->updateSplashView(Landroid/graphics/drawable/Drawable;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public drawOnCanvas(Landroid/graphics/Canvas;FFFFF)V
    .locals 14

    .line 1
    sget-object v1, Lf1/a;->J:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskView;->isRunningTask()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskView;->getShouldShowScreenshot()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    iget-object v8, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mClearPaint:Landroid/graphics/Paint;

    .line 30
    .line 31
    move/from16 v7, p6

    .line 32
    .line 33
    move-object v1, p1

    .line 34
    move/from16 v2, p2

    .line 35
    .line 36
    move/from16 v3, p3

    .line 37
    .line 38
    move/from16 v4, p4

    .line 39
    .line 40
    move/from16 v5, p5

    .line 41
    .line 42
    move/from16 v6, p6

    .line 43
    .line 44
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 45
    .line 46
    .line 47
    iget-object v7, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mDimmingPaintAfterClearing:Landroid/graphics/Paint;

    .line 48
    .line 49
    move-object v0, p1

    .line 50
    move/from16 v1, p2

    .line 51
    .line 52
    move/from16 v2, p3

    .line 53
    .line 54
    move/from16 v3, p4

    .line 55
    .line 56
    move/from16 v4, p5

    .line 57
    .line 58
    move/from16 v5, p6

    .line 59
    .line 60
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_0
    const/high16 v9, 0x3f800000    # 1.0f

    .line 65
    .line 66
    add-float v3, p3, v9

    .line 67
    .line 68
    sub-float v5, p5, v9

    .line 69
    .line 70
    iget-object v8, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 71
    .line 72
    move/from16 v7, p6

    .line 73
    .line 74
    move-object v1, p1

    .line 75
    move/from16 v2, p2

    .line 76
    .line 77
    move/from16 v4, p4

    .line 78
    .line 79
    move/from16 v6, p6

    .line 80
    .line 81
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 82
    .line 83
    .line 84
    move v10, v3

    .line 85
    iget-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 86
    .line 87
    if-eqz v1, :cond_8

    .line 88
    .line 89
    iget-boolean v1, v1, Lcom/android/systemui/shared/recents/model/Task;->isLocked:Z

    .line 90
    .line 91
    if-nez v1, :cond_8

    .line 92
    .line 93
    iget-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mBitmapShader:Landroid/graphics/BitmapShader;

    .line 94
    .line 95
    if-eqz v1, :cond_8

    .line 96
    .line 97
    iget-object v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 98
    .line 99
    if-nez v1, :cond_1

    .line 100
    .line 101
    goto/16 :goto_3

    .line 102
    .line 103
    :cond_1
    iget-object v8, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPaint:Landroid/graphics/Paint;

    .line 104
    .line 105
    move/from16 v7, p6

    .line 106
    .line 107
    move-object v1, p1

    .line 108
    move/from16 v2, p2

    .line 109
    .line 110
    move/from16 v3, p3

    .line 111
    .line 112
    move/from16 v4, p4

    .line 113
    .line 114
    move/from16 v5, p5

    .line 115
    .line 116
    move/from16 v6, p6

    .line 117
    .line 118
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 119
    .line 120
    .line 121
    move v11, v4

    .line 122
    move v12, v5

    .line 123
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->shouldShowSplashView()Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    const/4 v13, 0x1

    .line 128
    if-eqz v1, :cond_3

    .line 129
    .line 130
    iget-boolean v1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mShowSplashForSplitSelection:Z

    .line 131
    .line 132
    if-eqz v1, :cond_2

    .line 133
    .line 134
    invoke-virtual {p0}, Landroid/view/View;->getScaleX()F

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    div-float v1, p6, v1

    .line 139
    .line 140
    invoke-virtual {p0}, Landroid/view/View;->getScaleY()F

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    div-float v2, p6, v2

    .line 145
    .line 146
    move v6, v1

    .line 147
    move v7, v2

    .line 148
    goto :goto_0

    .line 149
    :cond_2
    move/from16 v6, p6

    .line 150
    .line 151
    move v7, v6

    .line 152
    :goto_0
    add-float v4, v11, v9

    .line 153
    .line 154
    add-float v5, v12, v9

    .line 155
    .line 156
    iget-object v8, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mSplashBackgroundPaint:Landroid/graphics/Paint;

    .line 157
    .line 158
    move-object v1, p1

    .line 159
    move/from16 v2, p2

    .line 160
    .line 161
    move/from16 v3, p3

    .line 162
    .line 163
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 164
    .line 165
    .line 166
    iget-object v2, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mSplashView:Landroid/widget/ImageView;

    .line 167
    .line 168
    if-eqz v2, :cond_3

    .line 169
    .line 170
    move/from16 v3, p2

    .line 171
    .line 172
    float-to-int v3, v3

    .line 173
    float-to-int v4, v10

    .line 174
    float-to-int v5, v11

    .line 175
    float-to-int v6, v12

    .line 176
    sub-int/2addr v6, v13

    .line 177
    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/widget/ImageView;->layout(IIII)V

    .line 178
    .line 179
    .line 180
    iget-object v2, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mSplashView:Landroid/widget/ImageView;

    .line 181
    .line 182
    invoke-virtual {v2, p1}, Landroid/widget/ImageView;->draw(Landroid/graphics/Canvas;)V

    .line 183
    .line 184
    .line 185
    :cond_3
    iget-object v2, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPrivateLockedBitmap:Landroid/graphics/Bitmap;

    .line 186
    .line 187
    if-eqz v2, :cond_8

    .line 188
    .line 189
    iget-object v2, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 190
    .line 191
    const/4 v3, 0x0

    .line 192
    if-eqz v2, :cond_4

    .line 193
    .line 194
    invoke-virtual {v2}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    if-eqz v2, :cond_4

    .line 199
    .line 200
    iget-object v2, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 201
    .line 202
    iget v2, v2, Lcom/android/systemui/shared/recents/model/ThumbnailData;->rotation:I

    .line 203
    .line 204
    goto :goto_1

    .line 205
    :cond_4
    move v2, v3

    .line 206
    :goto_1
    const/4 v4, 0x2

    .line 207
    if-eq v2, v13, :cond_7

    .line 208
    .line 209
    if-eq v2, v4, :cond_6

    .line 210
    .line 211
    const/4 v5, 0x3

    .line 212
    if-eq v2, v5, :cond_5

    .line 213
    .line 214
    goto :goto_2

    .line 215
    :cond_5
    const/16 v3, 0x10e

    .line 216
    .line 217
    goto :goto_2

    .line 218
    :cond_6
    const/16 v3, 0xb4

    .line 219
    .line 220
    goto :goto_2

    .line 221
    :cond_7
    const/16 v3, 0x5a

    .line 222
    .line 223
    :goto_2
    iget-object v2, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPrivateLockedBitmap:Landroid/graphics/Bitmap;

    .line 224
    .line 225
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 226
    .line 227
    .line 228
    move-result v2

    .line 229
    int-to-float v2, v2

    .line 230
    sub-float v2, v11, v2

    .line 231
    .line 232
    const/high16 v5, 0x40000000    # 2.0f

    .line 233
    .line 234
    div-float/2addr v2, v5

    .line 235
    iget-object v6, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPrivateLockedBitmap:Landroid/graphics/Bitmap;

    .line 236
    .line 237
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    .line 238
    .line 239
    .line 240
    move-result v6

    .line 241
    int-to-float v6, v6

    .line 242
    sub-float v6, v12, v6

    .line 243
    .line 244
    div-float/2addr v6, v5

    .line 245
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 246
    .line 247
    .line 248
    int-to-float v3, v3

    .line 249
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 250
    .line 251
    .line 252
    move-result v5

    .line 253
    div-int/2addr v5, v4

    .line 254
    int-to-float v5, v5

    .line 255
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 256
    .line 257
    .line 258
    move-result v7

    .line 259
    div-int/2addr v7, v4

    .line 260
    int-to-float v4, v7

    .line 261
    invoke-virtual {p1, v3, v5, v4}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {p1, v2, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 265
    .line 266
    .line 267
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPrivateLockedBitmap:Landroid/graphics/Bitmap;

    .line 268
    .line 269
    new-instance v2, Landroid/graphics/Paint;

    .line 270
    .line 271
    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 272
    .line 273
    .line 274
    const/4 v3, 0x0

    .line 275
    invoke-virtual {p1, v0, v3, v3, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 276
    .line 277
    .line 278
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 279
    .line 280
    .line 281
    :cond_8
    :goto_3
    return-void
.end method

.method public getDimAlpha()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mDimAlpha:F

    .line 2
    .line 3
    return p0
.end method

.method public getPreviewPositionHelper()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPreviewPositionHelper:Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSysUiStatusNavFlags()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 2
    .line 3
    if-eqz p0, :cond_2

    .line 4
    .line 5
    iget p0, p0, Lcom/android/systemui/shared/recents/model/ThumbnailData;->appearance:I

    .line 6
    .line 7
    and-int/lit8 v0, p0, 0x8

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x4

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/16 v0, 0x8

    .line 14
    .line 15
    :goto_0
    and-int/lit8 p0, p0, 0x10

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    const/4 p0, 0x2

    .line 22
    :goto_1
    or-int/2addr p0, v0

    .line 23
    return p0

    .line 24
    :cond_2
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public getTaskOverlay()Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mOverlay:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    .line 2
    .line 3
    return-object p0
.end method

.method public getThumbnail()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getThumbnailMatrix()Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mPreviewPositionHelper:Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->getMatrix()Landroid/graphics/Matrix;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public isRealSnapshot()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-boolean v0, v0, Lcom/android/systemui/shared/recents/model/ThumbnailData;->isRealSnapshot:Z

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/android/systemui/shared/recents/model/Task;->isLocked:Z

    .line 14
    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    return v1
.end method

.method public isThumbnailRotationDifferentFromTask()Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    iget-object v2, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    sget-object v3, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->PORTRAIT:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 20
    .line 21
    const/4 v4, 0x1

    .line 22
    if-ne v2, v3, :cond_2

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedViewOrientedState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/android/quickstep/util/RecentsOrientedState;->getRecentsActivityRotation()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 33
    .line 34
    iget p0, p0, Lcom/android/systemui/shared/recents/model/ThumbnailData;->rotation:I

    .line 35
    .line 36
    sub-int/2addr v0, p0

    .line 37
    rem-int/lit8 v0, v0, 0x2

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    return v4

    .line 42
    :cond_1
    return v1

    .line 43
    :cond_2
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-interface {v0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getRotation()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iget-object p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 52
    .line 53
    iget p0, p0, Lcom/android/systemui/shared/recents/model/ThumbnailData;->rotation:I

    .line 54
    .line 55
    if-eq v0, p0, :cond_3

    .line 56
    .line 57
    return v4

    .line 58
    :cond_3
    :goto_0
    return v1
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    int-to-float v5, v0

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    int-to-float v6, v0

    .line 14
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/quickstep/FullscreenDrawParams;->getCurrentCornerRadius()F

    .line 17
    .line 18
    .line 19
    move-result v7

    .line 20
    const/4 v3, 0x0

    .line 21
    const/4 v4, 0x0

    .line 22
    move-object v1, p0

    .line 23
    move-object v2, p1

    .line 24
    invoke-virtual/range {v1 .. v7}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->drawOnCanvas(Landroid/graphics/Canvas;FFFFF)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2}, Landroid/graphics/Canvas;->restore()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mSplashViewDrawable:Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->updateSplashView(Landroid/graphics/drawable/Drawable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onRecycle()V
    .locals 0

    .line 1
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->updateThumbnailMatrix()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->refreshOverlay()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public refresh()V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->refresh(Z)V

    return-void
.end method

.method protected refreshSplashView()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->icon:Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->updateSplashView(Landroid/graphics/drawable/Drawable;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public setDimAlpha(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mDimAlpha:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->updateThumbnailPaintFilter()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFullscreenParams(Lcom/android/quickstep/FullscreenDrawParams;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOverlayEnabled(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mOverlayEnabled:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mOverlayEnabled:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->refreshOverlay()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setShowSplashForSplitSelection(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mShowSplashForSplitSelection:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSplashAlpha(F)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/high16 v1, 0x3f800000    # 1.0f

    .line 3
    .line 4
    invoke-static {p1, v0, v1}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    const/high16 v0, 0x437f0000    # 255.0f

    .line 9
    .line 10
    mul-float/2addr p1, v0

    .line 11
    float-to-int p1, p1

    .line 12
    iput p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mSplashAlpha:I

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mSplashViewDrawable:Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mSplashBackgroundPaint:Landroid/graphics/Paint;

    .line 22
    .line 23
    iget v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mSplashAlpha:I

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public setThumbnail(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V
    .locals 1

    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->setThumbnail(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/ThumbnailData;Z)V

    return-void
.end method

.method public setThumbnail(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/ThumbnailData;Z)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 2
    iget-object p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    .line 3
    invoke-virtual {p2}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    move-object p2, v0

    .line 4
    :goto_0
    iput-object p2, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 5
    iget-object p2, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mTask:Lcom/android/systemui/shared/recents/model/Task;

    if-eqz p2, :cond_1

    .line 6
    iget-object p2, p2, Lcom/android/systemui/shared/recents/model/Task;->icon:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, p2}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->updateSplashView(Landroid/graphics/drawable/Drawable;)V

    :cond_1
    if-eqz p3, :cond_5

    if-eqz p1, :cond_2

    .line 7
    invoke-virtual {p1}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getSnapshotId()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    goto :goto_1

    :cond_2
    move-object p1, v0

    .line 8
    :goto_1
    iget-object p2, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mThumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    if-eqz p2, :cond_3

    invoke-virtual {p2}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getSnapshotId()J

    move-result-wide p2

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    :cond_3
    if-eqz v0, :cond_4

    .line 9
    invoke-static {p1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    const/4 p1, 0x1

    goto :goto_2

    :cond_4
    const/4 p1, 0x0

    :goto_2
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->refresh(Z)V

    :cond_5
    return-void
.end method

.method public shouldShowSplashView()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->isThumbnailAspectRatioDifferentFromThumbnailData()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->isThumbnailRotationDifferentFromTask()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->mShowSplashForSplitSelection:Z

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method
