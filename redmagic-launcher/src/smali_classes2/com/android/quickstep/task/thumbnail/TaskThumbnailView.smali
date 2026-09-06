.class public final Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;
.super Landroid/widget/FrameLayout;
.source "TaskThumbnailView.kt"

# interfaces
.implements Lcom/android/launcher3/util/b3$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion;
    }
.end annotation


# static fields
.field private static final Companion:Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion;

.field private static final MAX_SCRIM_ALPHA:F = 0.4f

.field public static final TAG:Ljava/lang/String; = "TaskThumbnailView"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# instance fields
.field private final TAG$1:Ljava/lang/String;

.field private final THUMBNAIL_NEED_CENTERED_THRESHOLD:F

.field private final bounds:Landroid/graphics/Rect;

.field private cornerRadius:F

.field private final dimAlpha$delegate:Lh4/e;

.field private final liveTileView$delegate:Lh4/e;

.field private final mAppTransferInfoBgHeight:I

.field private final mAppTransferInfoBgMinHoriPadding:I

.field private final mAppTransferInfoBgRectCornerRadius:I

.field private final mAppTransferInfoBgRectDefaultWidth:I

.field private final mAppTransferInfoText:Ljava/lang/String;

.field private final mAppTransferInfoTxHoriPadding:I

.field private final mIsShowAppTransferInfo:Z

.field private final mPrivateLockedBitmap:Landroid/graphics/Bitmap;

.field private final mTransferAppInfoBgPaint:Landroid/graphics/Paint;

.field private final mTransferAppInfoTextPaint:Landroid/graphics/Paint;

.field private onSizeChanged:Lu4/p;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/p<",
            "-",
            "Ljava/lang/Integer;",
            "-",
            "Ljava/lang/Integer;",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field

.field private outlineBounds:Landroid/graphics/Rect;

.field private final outlinePath:Landroid/graphics/Path;

.field private final scrimView$delegate:Lh4/e;

.field private final splashBackground$delegate:Lh4/e;

.field private final splashIcon$delegate:Lh4/e;

.field private taskThumbnailViewHeader:Lcom/android/quickstep/views/TaskThumbnailViewHeader;

.field private final thumbnailView$delegate:Lh4/e;

.field private uiState:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->Companion:Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    new-instance p1, Lcom/android/quickstep/task/thumbnail/a;

    invoke-direct {p1, p0}, Lcom/android/quickstep/task/thumbnail/a;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->scrimView$delegate:Lh4/e;

    .line 3
    new-instance p1, Lcom/android/quickstep/task/thumbnail/b;

    invoke-direct {p1, p0}, Lcom/android/quickstep/task/thumbnail/b;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->liveTileView$delegate:Lh4/e;

    .line 4
    new-instance p1, Lcom/android/quickstep/task/thumbnail/c;

    invoke-direct {p1, p0}, Lcom/android/quickstep/task/thumbnail/c;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->thumbnailView$delegate:Lh4/e;

    .line 5
    new-instance p1, Lcom/android/quickstep/task/thumbnail/d;

    invoke-direct {p1, p0}, Lcom/android/quickstep/task/thumbnail/d;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->splashBackground$delegate:Lh4/e;

    .line 6
    new-instance p1, Lcom/android/quickstep/task/thumbnail/e;

    invoke-direct {p1, p0}, Lcom/android/quickstep/task/thumbnail/e;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->splashIcon$delegate:Lh4/e;

    .line 7
    new-instance p1, Lcom/android/quickstep/task/thumbnail/f;

    invoke-direct {p1, p0}, Lcom/android/quickstep/task/thumbnail/f;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->dimAlpha$delegate:Lh4/e;

    .line 8
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->outlinePath:Landroid/graphics/Path;

    .line 9
    sget-object p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Uninitialized;->INSTANCE:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Uninitialized;

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->uiState:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;

    .line 10
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->bounds:Landroid/graphics/Rect;

    .line 11
    const-string p1, "TaskThumbnailView"

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->TAG$1:Ljava/lang/String;

    const/high16 p1, 0x3fa00000    # 1.25f

    .line 12
    iput p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->THUMBNAIL_NEED_CENTERED_THRESHOLD:F

    .line 13
    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->mTransferAppInfoTextPaint:Landroid/graphics/Paint;

    .line 14
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->mTransferAppInfoBgPaint:Landroid/graphics/Paint;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    new-instance p1, Lcom/android/quickstep/task/thumbnail/a;

    invoke-direct {p1, p0}, Lcom/android/quickstep/task/thumbnail/a;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->scrimView$delegate:Lh4/e;

    .line 17
    new-instance p1, Lcom/android/quickstep/task/thumbnail/b;

    invoke-direct {p1, p0}, Lcom/android/quickstep/task/thumbnail/b;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->liveTileView$delegate:Lh4/e;

    .line 18
    new-instance p1, Lcom/android/quickstep/task/thumbnail/c;

    invoke-direct {p1, p0}, Lcom/android/quickstep/task/thumbnail/c;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->thumbnailView$delegate:Lh4/e;

    .line 19
    new-instance p1, Lcom/android/quickstep/task/thumbnail/d;

    invoke-direct {p1, p0}, Lcom/android/quickstep/task/thumbnail/d;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->splashBackground$delegate:Lh4/e;

    .line 20
    new-instance p1, Lcom/android/quickstep/task/thumbnail/e;

    invoke-direct {p1, p0}, Lcom/android/quickstep/task/thumbnail/e;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->splashIcon$delegate:Lh4/e;

    .line 21
    new-instance p1, Lcom/android/quickstep/task/thumbnail/f;

    invoke-direct {p1, p0}, Lcom/android/quickstep/task/thumbnail/f;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->dimAlpha$delegate:Lh4/e;

    .line 22
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->outlinePath:Landroid/graphics/Path;

    .line 23
    sget-object p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Uninitialized;->INSTANCE:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Uninitialized;

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->uiState:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;

    .line 24
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->bounds:Landroid/graphics/Rect;

    .line 25
    const-string p1, "TaskThumbnailView"

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->TAG$1:Ljava/lang/String;

    const/high16 p1, 0x3fa00000    # 1.25f

    .line 26
    iput p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->THUMBNAIL_NEED_CENTERED_THRESHOLD:F

    .line 27
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->mTransferAppInfoTextPaint:Landroid/graphics/Paint;

    .line 28
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->mTransferAppInfoBgPaint:Landroid/graphics/Paint;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 30
    new-instance p1, Lcom/android/quickstep/task/thumbnail/a;

    invoke-direct {p1, p0}, Lcom/android/quickstep/task/thumbnail/a;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->scrimView$delegate:Lh4/e;

    .line 31
    new-instance p1, Lcom/android/quickstep/task/thumbnail/b;

    invoke-direct {p1, p0}, Lcom/android/quickstep/task/thumbnail/b;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->liveTileView$delegate:Lh4/e;

    .line 32
    new-instance p1, Lcom/android/quickstep/task/thumbnail/c;

    invoke-direct {p1, p0}, Lcom/android/quickstep/task/thumbnail/c;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->thumbnailView$delegate:Lh4/e;

    .line 33
    new-instance p1, Lcom/android/quickstep/task/thumbnail/d;

    invoke-direct {p1, p0}, Lcom/android/quickstep/task/thumbnail/d;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->splashBackground$delegate:Lh4/e;

    .line 34
    new-instance p1, Lcom/android/quickstep/task/thumbnail/e;

    invoke-direct {p1, p0}, Lcom/android/quickstep/task/thumbnail/e;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->splashIcon$delegate:Lh4/e;

    .line 35
    new-instance p1, Lcom/android/quickstep/task/thumbnail/f;

    invoke-direct {p1, p0}, Lcom/android/quickstep/task/thumbnail/f;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->dimAlpha$delegate:Lh4/e;

    .line 36
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->outlinePath:Landroid/graphics/Path;

    .line 37
    sget-object p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Uninitialized;->INSTANCE:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Uninitialized;

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->uiState:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;

    .line 38
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->bounds:Landroid/graphics/Rect;

    .line 39
    const-string p1, "TaskThumbnailView"

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->TAG$1:Ljava/lang/String;

    const/high16 p1, 0x3fa00000    # 1.25f

    .line 40
    iput p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->THUMBNAIL_NEED_CENTERED_THRESHOLD:F

    .line 41
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->mTransferAppInfoTextPaint:Landroid/graphics/Paint;

    .line 42
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->mTransferAppInfoBgPaint:Landroid/graphics/Paint;

    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)Lcom/android/quickstep/task/thumbnail/LiveTileView;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->liveTileView_delegate$lambda$1(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)Lcom/android/quickstep/task/thumbnail/LiveTileView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic access$getBounds$p(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->bounds:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$getOutlinePath$p(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)Landroid/graphics/Path;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->outlinePath:Landroid/graphics/Path;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->scrimView_delegate$lambda$0(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)Lcom/android/quickstep/views/FixedSizeImageView;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->thumbnailView_delegate$lambda$2(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)Lcom/android/quickstep/views/FixedSizeImageView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)Lcom/android/quickstep/views/FixedSizeImageView;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->splashIcon_delegate$lambda$4(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)Lcom/android/quickstep/views/FixedSizeImageView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final dimAlpha_delegate$lambda$5(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)Lcom/android/launcher3/util/v1;
    .locals 4

    .line 1
    new-instance v0, Lcom/android/launcher3/util/v1;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->getScrimView()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v1, Lcom/android/launcher3/G2;->k:Landroid/util/FloatProperty;

    .line 8
    .line 9
    invoke-static {}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;->getEntries()Ln4/a;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    new-instance v3, Lcom/android/quickstep/task/thumbnail/g;

    .line 18
    .line 19
    invoke-direct {v3}, Lcom/android/quickstep/task/thumbnail/g;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-direct {v0, p0, v1, v2, v3}, Lcom/android/launcher3/util/v1;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;ILcom/android/launcher3/util/v1$b;)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method private static final dimAlpha_delegate$lambda$5$maxOf__proxy(FF)F
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ljava/lang/Math;->max(FF)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private final drawBackground(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final drawLiveWindow(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->getLiveTileView()Lcom/android/quickstep/task/thumbnail/LiveTileView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    instance-of v0, p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->taskThumbnailViewHeader:Lcom/android/quickstep/views/TaskThumbnailViewHeader;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->taskThumbnailViewHeader:Lcom/android/quickstep/views/TaskThumbnailViewHeader;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    check-cast p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;->getHeader()Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/TaskThumbnailViewHeader;->setHeader(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method private final drawSnapshot(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;)V
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->taskThumbnailViewHeader:Lcom/android/quickstep/views/TaskThumbnailViewHeader;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->taskThumbnailViewHeader:Lcom/android/quickstep/views/TaskThumbnailViewHeader;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    move-object v2, p1

    .line 18
    check-cast v2, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;

    .line 19
    .line 20
    invoke-virtual {v2}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->getHeader()Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v0, v2}, Lcom/android/quickstep/views/TaskThumbnailViewHeader;->setHeader(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    invoke-virtual {p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;->getBackgroundColor()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-direct {p0, v0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->drawBackground(I)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->getThumbnailView()Lcom/android/quickstep/views/FixedSizeImageView;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;->getBitmap()Landroid/graphics/Bitmap;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 43
    .line 44
    .line 45
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->getThumbnailView()Lcom/android/quickstep/views/FixedSizeImageView;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method private final drawSnapshotSplash(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;->getSnapshot()Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->drawSnapshot(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->getSplashBackground()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;->getSnapshot()Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;->getBackgroundColor()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;->getSplash()Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    if-nez p1, :cond_1

    .line 46
    .line 47
    :cond_0
    new-instance p1, Landroid/graphics/drawable/ShapeDrawable;

    .line 48
    .line 49
    invoke-direct {p1}, Landroid/graphics/drawable/ShapeDrawable;-><init>()V

    .line 50
    .line 51
    .line 52
    :cond_1
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->getSplashIcon()Lcom/android/quickstep/views/FixedSizeImageView;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public static synthetic e(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->splashBackground_delegate$lambda$3(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f(FF)F
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->dimAlpha_delegate$lambda$5$maxOf__proxy(FF)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic g(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)Lcom/android/launcher3/util/v1;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->dimAlpha_delegate$lambda$5(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)Lcom/android/launcher3/util/v1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final getDimAlpha()Lcom/android/launcher3/util/v1;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/util/v1<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->dimAlpha$delegate:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/util/v1;

    .line 8
    .line 9
    return-object p0
.end method

.method private final getLiveTileView()Lcom/android/quickstep/task/thumbnail/LiveTileView;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->liveTileView$delegate:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "getValue(...)"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    check-cast p0, Lcom/android/quickstep/task/thumbnail/LiveTileView;

    .line 13
    .line 14
    return-object p0
.end method

.method private final getScrimView()Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->scrimView$delegate:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "getValue(...)"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    check-cast p0, Landroid/view/View;

    .line 13
    .line 14
    return-object p0
.end method

.method private final getSplashBackground()Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->splashBackground$delegate:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "getValue(...)"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    check-cast p0, Landroid/view/View;

    .line 13
    .line 14
    return-object p0
.end method

.method private final getSplashIcon()Lcom/android/quickstep/views/FixedSizeImageView;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->splashIcon$delegate:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "getValue(...)"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    check-cast p0, Lcom/android/quickstep/views/FixedSizeImageView;

    .line 13
    .line 14
    return-object p0
.end method

.method private final getThumbnailView()Lcom/android/quickstep/views/FixedSizeImageView;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->thumbnailView$delegate:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "getValue(...)"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    check-cast p0, Lcom/android/quickstep/views/FixedSizeImageView;

    .line 13
    .line 14
    return-object p0
.end method

.method private static final liveTileView_delegate$lambda$1(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)Lcom/android/quickstep/task/thumbnail/LiveTileView;
    .locals 1

    .line 1
    const v0, 0x7f0b05c8

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/android/quickstep/task/thumbnail/LiveTileView;

    .line 9
    .line 10
    return-object p0
.end method

.method private final logDebug(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->TAG$1:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v2, "[TaskThumbnailView@"

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p0, "] "

    .line 25
    .line 26
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private final maybeCreateHeader()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->taskThumbnailViewHeader:Lcom/android/quickstep/views/TaskThumbnailViewHeader;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const v1, 0x7f0e0223

    .line 20
    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "null cannot be cast to non-null type com.android.quickstep.views.TaskThumbnailViewHeader"

    .line 28
    .line 29
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    check-cast v0, Lcom/android/quickstep/views/TaskThumbnailViewHeader;

    .line 33
    .line 34
    iput-object v0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->taskThumbnailViewHeader:Lcom/android/quickstep/views/TaskThumbnailViewHeader;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method private final resetViews()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->getLiveTileView()Lcom/android/quickstep/task/thumbnail/LiveTileView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x4

    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->getThumbnailView()Lcom/android/quickstep/views/FixedSizeImageView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->getThumbnailView()Lcom/android/quickstep/views/FixedSizeImageView;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->getSplashBackground()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v3, 0x0

    .line 29
    invoke-virtual {v0, v3}, Landroid/view/View;->setAlpha(F)V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->getSplashIcon()Lcom/android/quickstep/views/FixedSizeImageView;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->getSplashIcon()Lcom/android/quickstep/views/FixedSizeImageView;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->getScrimView()Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0, v3}, Landroid/view/View;->setAlpha(F)V

    .line 51
    .line 52
    .line 53
    const/high16 v0, -0x1000000

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->taskThumbnailViewHeader:Lcom/android/quickstep/views/TaskThumbnailViewHeader;

    .line 59
    .line 60
    if-eqz p0, :cond_0

    .line 61
    .line 62
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method

.method private static final scrimView_delegate$lambda$0(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)Landroid/view/View;
    .locals 1

    .line 1
    const v0, 0x7f0b05c9

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public static synthetic setState$default(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;Ljava/lang/Integer;ILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->setState(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;Ljava/lang/Integer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static final splashBackground_delegate$lambda$3(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)Landroid/view/View;
    .locals 1

    .line 1
    const v0, 0x7f0b0573

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method private static final splashIcon_delegate$lambda$4(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)Lcom/android/quickstep/views/FixedSizeImageView;
    .locals 1

    .line 1
    const v0, 0x7f0b0574

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/android/quickstep/views/FixedSizeImageView;

    .line 9
    .line 10
    return-object p0
.end method

.method private static final thumbnailView_delegate$lambda$2(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)Lcom/android/quickstep/views/FixedSizeImageView;
    .locals 1

    .line 1
    const v0, 0x7f0b05c7

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/android/quickstep/views/FixedSizeImageView;

    .line 9
    .line 10
    return-object p0
.end method


# virtual methods
.method public final doOnSizeChange(Lu4/p;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/p<",
            "-",
            "Ljava/lang/Integer;",
            "-",
            "Ljava/lang/Integer;",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "action"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->onSizeChanged:Lu4/p;

    .line 7
    .line 8
    return-void
.end method

.method public final getCornerRadius()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->cornerRadius:F

    .line 2
    .line 3
    return p0
.end method

.method public final getOutlineBounds()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->outlineBounds:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setClipToOutline(Z)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$onAttachedToWindow$1;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$onAttachedToWindow$1;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method protected onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->maybeCreateHeader()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onRecycle()V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Uninitialized;->INSTANCE:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Uninitialized;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->uiState:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->onSizeChanged:Lu4/p;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->setOutlineBounds(Landroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->resetViews()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->onSizeChanged:Lu4/p;

    .line 5
    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result p4

    .line 12
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object p4

    .line 16
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {p3, p4, v0}, Lu4/p;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p3, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->bounds:Landroid/graphics/Rect;

    .line 28
    .line 29
    const/4 p4, 0x0

    .line 30
    invoke-virtual {p3, p4, p4, p1, p2}, Landroid/graphics/Rect;->set(IIII)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidateOutline()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final setCornerRadius(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->cornerRadius:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidateOutline()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final setImageMatrix(Landroid/graphics/Matrix;)V
    .locals 1

    .line 1
    const-string v0, "matrix"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->uiState:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;

    .line 7
    .line 8
    instance-of v0, v0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->getThumbnailView()Lcom/android/quickstep/views/FixedSizeImageView;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final setOutlineBounds(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->outlineBounds:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidateOutline()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setScaleX(F)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->getSplashIcon()Lcom/android/quickstep/views/FixedSizeImageView;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/4 v0, 0x1

    .line 9
    int-to-float v0, v0

    .line 10
    div-float/2addr v0, p1

    .line 11
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setScaleX(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setScaleY(F)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->getSplashIcon()Lcom/android/quickstep/views/FixedSizeImageView;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/4 v0, 0x1

    .line 9
    int-to-float v0, v0

    .line 10
    div-float/2addr v0, p1

    .line 11
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setScaleY(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final setState(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;Ljava/lang/Integer;)V
    .locals 3

    .line 1
    const-string v0, "state"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->uiState:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->uiState:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;

    .line 16
    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v2, "taskId: "

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p2, " - uiState changed from: "

    .line 31
    .line 32
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string p2, " to: "

    .line 39
    .line 40
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-direct {p0, p2}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->logDebug(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->uiState:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;

    .line 54
    .line 55
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->resetViews()V

    .line 56
    .line 57
    .line 58
    instance-of p2, p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Uninitialized;

    .line 59
    .line 60
    if-nez p2, :cond_4

    .line 61
    .line 62
    instance-of p2, p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile;

    .line 63
    .line 64
    if-eqz p2, :cond_1

    .line 65
    .line 66
    check-cast p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile;

    .line 67
    .line 68
    invoke-direct {p0, p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->drawLiveWindow(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_1
    instance-of p2, p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;

    .line 73
    .line 74
    if-eqz p2, :cond_2

    .line 75
    .line 76
    check-cast p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;

    .line 77
    .line 78
    invoke-direct {p0, p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->drawSnapshotSplash(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_2
    instance-of p2, p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$BackgroundOnly;

    .line 83
    .line 84
    if-eqz p2, :cond_3

    .line 85
    .line 86
    check-cast p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$BackgroundOnly;

    .line 87
    .line 88
    invoke-virtual {p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$BackgroundOnly;->getBackgroundColor()I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    invoke-direct {p0, p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->drawBackground(I)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_3
    new-instance p0, Lh4/j;

    .line 97
    .line 98
    invoke-direct {p0}, Lh4/j;-><init>()V

    .line 99
    .line 100
    .line 101
    throw p0

    .line 102
    :cond_4
    return-void
.end method

.method public final updateMenuOpenProgress(F)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->getDimAlpha()Lcom/android/launcher3/util/v1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;->MenuProgress:Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const v0, 0x3ecccccd    # 0.4f

    .line 16
    .line 17
    .line 18
    mul-float/2addr p1, v0

    .line 19
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final updateSplashAlpha(F)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->getSplashBackground()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->getSplashIcon()Lcom/android/quickstep/views/FixedSizeImageView;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final updateTintAmount(F)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->getDimAlpha()Lcom/android/launcher3/util/v1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;->TintAmount:Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
