.class public Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;
.super Lcom/android/launcher3/a;
.source "TransformFolderIconResizeFrame.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame$a;
    }
.end annotation


# static fields
.field private static final c0:Landroid/graphics/Rect;

.field private static final d0:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame$a;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private A:Z

.field private B:Z

.field private C:Z

.field private D:I

.field private E:I

.field private F:I

.field private G:I

.field private H:I

.field private I:I

.field private J:I

.field private K:I

.field private L:I

.field private M:I

.field private N:I

.field private O:I

.field private P:I

.field private Q:I

.field private final R:I

.field private final S:I

.field private final T:I

.field private final U:I

.field private V:I

.field private W:I

.field private a0:I

.field private b0:I

.field private final g:Lcom/android/launcher3/C2;

.field private final h:LO0/e;

.field private final i:Lcom/android/launcher3/w0;

.field private final j:[Landroid/view/View;

.field private final k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field

.field private l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

.field private m:Lcom/android/launcher3/CellLayout;

.field private n:Lcom/android/launcher3/dragndrop/DragLayer;

.field private o:Landroid/graphics/Rect;

.field private final p:I

.field private final q:I

.field private final r:[I

.field private final s:[I

.field private final t:Lcom/android/launcher3/AppWidgetResizeFrame$b;

.field private final u:Lcom/android/launcher3/AppWidgetResizeFrame$b;

.field private final v:Lcom/android/launcher3/AppWidgetResizeFrame$b;

.field private final w:Lcom/android/launcher3/AppWidgetResizeFrame$b;

.field private final x:Lcom/android/launcher3/AppWidgetResizeFrame$b;

.field private final y:Lcom/android/launcher3/AppWidgetResizeFrame$b;

.field private z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->c0:Landroid/graphics/Rect;

    .line 7
    .line 8
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 9
    .line 10
    new-instance v1, LU1/l;

    .line 11
    .line 12
    invoke-direct {v1}, LU1/l;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 16
    .line 17
    .line 18
    sput-object v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->d0:Lcom/android/launcher3/util/I;

    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x4

    .line 3
    new-array p3, p2, [Landroid/view/View;

    iput-object p3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->j:[Landroid/view/View;

    .line 4
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3, p2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->k:Ljava/util/List;

    const/4 p3, 0x2

    .line 5
    new-array v0, p3, [I

    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->r:[I

    .line 6
    new-array v0, p3, [I

    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->s:[I

    .line 7
    new-instance v0, Lcom/android/launcher3/AppWidgetResizeFrame$b;

    invoke-direct {v0}, Lcom/android/launcher3/AppWidgetResizeFrame$b;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->t:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 8
    new-instance v0, Lcom/android/launcher3/AppWidgetResizeFrame$b;

    invoke-direct {v0}, Lcom/android/launcher3/AppWidgetResizeFrame$b;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->u:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 9
    new-instance v0, Lcom/android/launcher3/AppWidgetResizeFrame$b;

    invoke-direct {v0}, Lcom/android/launcher3/AppWidgetResizeFrame$b;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->v:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 10
    new-instance v0, Lcom/android/launcher3/AppWidgetResizeFrame$b;

    invoke-direct {v0}, Lcom/android/launcher3/AppWidgetResizeFrame$b;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->w:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 11
    new-instance v0, Lcom/android/launcher3/AppWidgetResizeFrame$b;

    invoke-direct {v0}, Lcom/android/launcher3/AppWidgetResizeFrame$b;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->x:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 12
    new-instance v0, Lcom/android/launcher3/AppWidgetResizeFrame$b;

    invoke-direct {v0}, Lcom/android/launcher3/AppWidgetResizeFrame$b;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->y:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    const/4 v0, 0x1

    .line 13
    iput v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->F:I

    .line 14
    iput v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->G:I

    .line 15
    iput v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->H:I

    .line 16
    iput v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->I:I

    const/4 v0, 0x0

    .line 17
    iput v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->N:I

    .line 18
    iput v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->O:I

    .line 19
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 20
    invoke-static {p0}, LO0/e;->d(Landroid/view/View;)LO0/e;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->h:LO0/e;

    .line 21
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070351

    .line 22
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->p:I

    mul-int/2addr v1, p3

    .line 23
    iput v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->q:I

    .line 24
    new-instance v1, Lcom/android/launcher3/w0;

    invoke-direct {v1, p0}, Lcom/android/launcher3/w0;-><init>(Landroid/view/View;)V

    iput-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->i:Lcom/android/launcher3/w0;

    :goto_0
    if-ge v0, p2, :cond_0

    .line 25
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->k:Ljava/util/List;

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 26
    :cond_0
    invoke-static {p1}, Lx1/O;->z1(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 27
    const-string v1, "folder_icon_resize_arrow_left_top_dark"

    goto :goto_1

    :cond_1
    const-string v1, "folder_icon_resize_arrow_left_top"

    :goto_1
    invoke-static {p1, v1}, Lf1/d;->f(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->R:I

    if-eqz v0, :cond_2

    .line 28
    const-string v1, "folder_icon_resize_arrow_right_top_dark"

    goto :goto_2

    :cond_2
    const-string v1, "folder_icon_resize_arrow_right_top"

    :goto_2
    invoke-static {p1, v1}, Lf1/d;->f(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->S:I

    if-eqz v0, :cond_3

    .line 29
    const-string v1, "folder_icon_resize_arrow_left_bottom_dark"

    goto :goto_3

    :cond_3
    const-string v1, "folder_icon_resize_arrow_left_bottom"

    :goto_3
    invoke-static {p1, v1}, Lf1/d;->f(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->T:I

    if-eqz v0, :cond_4

    .line 30
    const-string v0, "folder_icon_resize_arrow_right_bottom_dark"

    goto :goto_4

    :cond_4
    const-string v0, "folder_icon_resize_arrow_right_bottom"

    :goto_4
    invoke-static {p1, v0}, Lf1/d;->f(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->U:I

    .line 31
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    move-result p1

    if-eqz p1, :cond_5

    move p2, p3

    :cond_5
    iput p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->H:I

    .line 32
    iput p3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->I:I

    return-void
.end method

.method public static synthetic N(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->Y(Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O(Lg1/c;)Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame$a;
    .locals 4

    .line 1
    invoke-interface {p0}, Lcom/android/quickstep/dagger/QuickstepBaseAppComponent;->getIDP()Lcom/android/launcher3/F1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Landroid/graphics/Point;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/graphics/Point;

    .line 11
    .line 12
    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/F1;->I1:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lcom/android/launcher3/h0;

    .line 32
    .line 33
    iget-boolean v3, v2, Lcom/android/launcher3/h0;->N0:Z

    .line 34
    .line 35
    if-eqz v3, :cond_0

    .line 36
    .line 37
    invoke-virtual {v2}, Lcom/android/launcher3/h0;->k0()Landroid/graphics/Point;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-virtual {v2}, Lcom/android/launcher3/h0;->k0()Landroid/graphics/Point;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    new-instance p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame$a;

    .line 48
    .line 49
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame$a;-><init>(Landroid/graphics/Point;Landroid/graphics/Point;)V

    .line 50
    .line 51
    .line 52
    return-object p0
.end method

.method public static synthetic Q(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->X()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static S(Landroid/content/Context;IILandroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 4

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    new-instance p3, Landroid/graphics/Rect;

    .line 4
    .line 5
    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 17
    .line 18
    sget-object v1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->d0:Lcom/android/launcher3/util/I;

    .line 19
    .line 20
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame$a;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame$a;->b()Landroid/graphics/Point;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 31
    .line 32
    mul-int/2addr v1, p1

    .line 33
    int-to-float v1, v1

    .line 34
    div-float/2addr v1, v0

    .line 35
    float-to-int v1, v1

    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame$a;->b()Landroid/graphics/Point;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget v2, v2, Landroid/graphics/Point;->y:I

    .line 41
    .line 42
    mul-int/2addr v2, p2

    .line 43
    int-to-float v2, v2

    .line 44
    div-float/2addr v2, v0

    .line 45
    float-to-int v2, v2

    .line 46
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame$a;->c()Landroid/graphics/Point;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    iget v3, v3, Landroid/graphics/Point;->x:I

    .line 51
    .line 52
    mul-int/2addr p1, v3

    .line 53
    int-to-float p1, p1

    .line 54
    div-float/2addr p1, v0

    .line 55
    float-to-int p1, p1

    .line 56
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame$a;->c()Landroid/graphics/Point;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 61
    .line 62
    mul-int/2addr p2, p0

    .line 63
    int-to-float p0, p2

    .line 64
    div-float/2addr p0, v0

    .line 65
    float-to-int p0, p0

    .line 66
    invoke-virtual {p3, p1, v2, v1, p0}, Landroid/graphics/Rect;->set(IIII)V

    .line 67
    .line 68
    .line 69
    return-object p3
.end method

.method private T(Landroid/graphics/Rect;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->n:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 4
    .line 5
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/views/BaseDragLayer;->getViewRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->p:I

    .line 9
    .line 10
    mul-int/lit8 v0, v0, 0x2

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->o:Landroid/graphics/Rect;

    .line 17
    .line 18
    iget v3, v2, Landroid/graphics/Rect;->left:I

    .line 19
    .line 20
    sub-int/2addr v1, v3

    .line 21
    iget v2, v2, Landroid/graphics/Rect;->right:I

    .line 22
    .line 23
    sub-int/2addr v1, v2

    .line 24
    int-to-float v1, v1

    .line 25
    const/high16 v2, 0x3f800000    # 1.0f

    .line 26
    .line 27
    mul-float/2addr v1, v2

    .line 28
    float-to-int v1, v1

    .line 29
    add-int/2addr v0, v1

    .line 30
    iget v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->p:I

    .line 31
    .line 32
    mul-int/lit8 v1, v1, 0x2

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    iget-object v4, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->o:Landroid/graphics/Rect;

    .line 39
    .line 40
    iget v5, v4, Landroid/graphics/Rect;->top:I

    .line 41
    .line 42
    sub-int/2addr v3, v5

    .line 43
    iget v6, v4, Landroid/graphics/Rect;->bottom:I

    .line 44
    .line 45
    sub-int/2addr v3, v6

    .line 46
    int-to-float v3, v3

    .line 47
    mul-float/2addr v3, v2

    .line 48
    float-to-int v3, v3

    .line 49
    add-int/2addr v1, v3

    .line 50
    iget v3, p1, Landroid/graphics/Rect;->left:I

    .line 51
    .line 52
    iget p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->p:I

    .line 53
    .line 54
    sub-int/2addr v3, p0

    .line 55
    int-to-float v3, v3

    .line 56
    iget v4, v4, Landroid/graphics/Rect;->left:I

    .line 57
    .line 58
    int-to-float v4, v4

    .line 59
    mul-float/2addr v4, v2

    .line 60
    add-float/2addr v3, v4

    .line 61
    float-to-int v3, v3

    .line 62
    iget v4, p1, Landroid/graphics/Rect;->top:I

    .line 63
    .line 64
    sub-int/2addr v4, p0

    .line 65
    int-to-float p0, v4

    .line 66
    int-to-float v4, v5

    .line 67
    mul-float/2addr v4, v2

    .line 68
    add-float/2addr p0, v4

    .line 69
    float-to-int p0, p0

    .line 70
    iput v3, p1, Landroid/graphics/Rect;->left:I

    .line 71
    .line 72
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 73
    .line 74
    add-int/2addr v3, v0

    .line 75
    iput v3, p1, Landroid/graphics/Rect;->right:I

    .line 76
    .line 77
    add-int/2addr p0, v1

    .line 78
    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 79
    .line 80
    return-void
.end method

.method private static U(F)I
    .locals 2

    .line 1
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0x3f28f5c3    # 0.66f

    .line 6
    .line 7
    .line 8
    cmpl-float v0, v0, v1

    .line 9
    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method private V(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    float-to-int v1, v1

    .line 11
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    float-to-int p1, p1

    .line 16
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getHitRect(Landroid/graphics/Rect;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1, p1}, Landroid/graphics/Rect;->contains(II)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 26
    .line 27
    const/4 v2, 0x2

    .line 28
    const/4 v3, 0x1

    .line 29
    invoke-static {v0, v3, v2}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLeft()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    sub-int v0, v1, v0

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTop()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    sub-int v2, p1, v2

    .line 43
    .line 44
    invoke-virtual {p0, v0, v2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->R(II)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    iput v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->P:I

    .line 51
    .line 52
    iput p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->Q:I

    .line 53
    .line 54
    return v3

    .line 55
    :cond_0
    const/4 p0, 0x0

    .line 56
    return p0
.end method

.method private W(ZII)Z
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_6

    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-boolean p1, p1, Lcom/android/launcher3/X3;->B0:Z

    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    goto/16 :goto_1

    .line 15
    .line 16
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/4 v1, 0x1

    .line 21
    if-lez p1, :cond_5

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-lez p1, :cond_5

    .line 28
    .line 29
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Lc1/b;

    .line 36
    .line 37
    iget v2, p1, Lc1/b;->f:I

    .line 38
    .line 39
    iget p1, p1, Lc1/b;->g:I

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    int-to-float v3, v3

    .line 46
    const/high16 v4, 0x3f800000    # 1.0f

    .line 47
    .line 48
    mul-float/2addr v3, v4

    .line 49
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    int-to-float v5, v5

    .line 54
    div-float/2addr v3, v5

    .line 55
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    int-to-float v5, v5

    .line 60
    mul-float/2addr v5, v4

    .line 61
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    int-to-float v4, v4

    .line 66
    div-float/2addr v5, v4

    .line 67
    invoke-static {v3, v5}, Ljava/lang/Math;->min(FF)F

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    const v6, 0x3f333333    # 0.7f

    .line 72
    .line 73
    .line 74
    cmpl-float v4, v4, v6

    .line 75
    .line 76
    if-lez v4, :cond_1

    .line 77
    .line 78
    invoke-static {v3, v5}, Ljava/lang/Math;->max(FF)F

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    const v4, 0x3fa66666    # 1.3f

    .line 83
    .line 84
    .line 85
    cmpg-float v3, v3, v4

    .line 86
    .line 87
    if-gez v3, :cond_1

    .line 88
    .line 89
    move v3, v1

    .line 90
    goto :goto_0

    .line 91
    :cond_1
    move v3, v0

    .line 92
    :goto_0
    if-ne v2, v1, :cond_2

    .line 93
    .line 94
    if-eq p1, v1, :cond_3

    .line 95
    .line 96
    :cond_2
    const/4 v4, 0x2

    .line 97
    if-ne v2, v4, :cond_5

    .line 98
    .line 99
    if-ne p1, v4, :cond_5

    .line 100
    .line 101
    :cond_3
    if-eqz p2, :cond_4

    .line 102
    .line 103
    if-nez p3, :cond_5

    .line 104
    .line 105
    :cond_4
    if-eqz v3, :cond_5

    .line 106
    .line 107
    return v1

    .line 108
    :cond_5
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 109
    .line 110
    const p1, 0x7f0b0422

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->getTag(I)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    instance-of p1, p0, Ljava/lang/Boolean;

    .line 118
    .line 119
    if-eqz p1, :cond_6

    .line 120
    .line 121
    check-cast p0, Ljava/lang/Boolean;

    .line 122
    .line 123
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    if-eqz p0, :cond_6

    .line 128
    .line 129
    return v1

    .line 130
    :cond_6
    :goto_1
    return v0
.end method

.method private synthetic X()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->f0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic Y(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private Z()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->D:I

    .line 14
    .line 15
    mul-int/2addr v2, v0

    .line 16
    iput v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->L:I

    .line 17
    .line 18
    iget v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->E:I

    .line 19
    .line 20
    mul-int/2addr v0, v1

    .line 21
    iput v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->M:I

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->J:I

    .line 25
    .line 26
    iput v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->K:I

    .line 27
    .line 28
    new-instance v0, LU1/k;

    .line 29
    .line 30
    invoke-direct {v0, p0}, LU1/k;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->x()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private a0(Z)V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v8, p1

    .line 4
    .line 5
    iget-object v1, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    int-to-float v1, v1

    .line 12
    iget-object v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 13
    .line 14
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    int-to-float v2, v2

    .line 19
    iget v3, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->J:I

    .line 20
    .line 21
    iget v4, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->L:I

    .line 22
    .line 23
    add-int/2addr v3, v4

    .line 24
    int-to-float v3, v3

    .line 25
    div-float/2addr v3, v1

    .line 26
    iget v1, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->D:I

    .line 27
    .line 28
    int-to-float v1, v1

    .line 29
    sub-float/2addr v3, v1

    .line 30
    invoke-static {v3}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->U(F)I

    .line 31
    .line 32
    .line 33
    move-result v12

    .line 34
    iget v1, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->K:I

    .line 35
    .line 36
    iget v3, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->M:I

    .line 37
    .line 38
    add-int/2addr v1, v3

    .line 39
    int-to-float v1, v1

    .line 40
    div-float/2addr v1, v2

    .line 41
    iget v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->E:I

    .line 42
    .line 43
    int-to-float v2, v2

    .line 44
    sub-float/2addr v1, v2

    .line 45
    invoke-static {v1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->U(F)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-nez v8, :cond_0

    .line 50
    .line 51
    if-nez v12, :cond_0

    .line 52
    .line 53
    if-nez v1, :cond_0

    .line 54
    .line 55
    goto/16 :goto_6

    .line 56
    .line 57
    :cond_0
    iget-object v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 58
    .line 59
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    iget-boolean v2, v2, Lcom/android/launcher3/X3;->B0:Z

    .line 64
    .line 65
    if-eqz v2, :cond_1

    .line 66
    .line 67
    invoke-direct {v0, v8, v12, v1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->W(ZII)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-eqz v2, :cond_1

    .line 72
    .line 73
    goto/16 :goto_6

    .line 74
    .line 75
    :cond_1
    iget-object v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 76
    .line 77
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    check-cast v2, Lc1/b;

    .line 82
    .line 83
    iget v3, v2, Lc1/b;->f:I

    .line 84
    .line 85
    iget v4, v2, Lc1/b;->g:I

    .line 86
    .line 87
    iget-boolean v5, v2, Lc1/b;->e:Z

    .line 88
    .line 89
    if-eqz v5, :cond_2

    .line 90
    .line 91
    invoke-virtual {v2}, Lc1/b;->c()I

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    goto :goto_0

    .line 96
    :cond_2
    invoke-virtual {v2}, Lc1/b;->a()I

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    :goto_0
    iget-boolean v6, v2, Lc1/b;->e:Z

    .line 101
    .line 102
    if-eqz v6, :cond_3

    .line 103
    .line 104
    invoke-virtual {v2}, Lc1/b;->d()I

    .line 105
    .line 106
    .line 107
    move-result v6

    .line 108
    goto :goto_1

    .line 109
    :cond_3
    invoke-virtual {v2}, Lc1/b;->b()I

    .line 110
    .line 111
    .line 112
    move-result v6

    .line 113
    :goto_1
    iget-object v7, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 114
    .line 115
    iget-object v7, v7, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 116
    .line 117
    invoke-virtual {v7}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 118
    .line 119
    .line 120
    move-result-object v7

    .line 121
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 122
    .line 123
    .line 124
    move-result v7

    .line 125
    int-to-float v7, v7

    .line 126
    const/high16 v9, 0x3f800000    # 1.0f

    .line 127
    .line 128
    mul-float/2addr v7, v9

    .line 129
    int-to-float v10, v3

    .line 130
    div-float/2addr v7, v10

    .line 131
    float-to-double v10, v7

    .line 132
    invoke-static {v10, v11}, Ljava/lang/Math;->ceil(D)D

    .line 133
    .line 134
    .line 135
    move-result-wide v10

    .line 136
    double-to-int v7, v10

    .line 137
    iget-object v10, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 138
    .line 139
    iget-object v10, v10, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 140
    .line 141
    invoke-virtual {v10}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 142
    .line 143
    .line 144
    move-result-object v10

    .line 145
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    .line 146
    .line 147
    .line 148
    move-result v10

    .line 149
    const/4 v11, 0x2

    .line 150
    const/4 v13, 0x1

    .line 151
    if-ne v10, v13, :cond_4

    .line 152
    .line 153
    if-ne v3, v13, :cond_4

    .line 154
    .line 155
    iget-object v10, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 156
    .line 157
    iget-object v10, v10, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 158
    .line 159
    const/16 v14, 0x20

    .line 160
    .line 161
    invoke-virtual {v10, v14}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 162
    .line 163
    .line 164
    move-result v10

    .line 165
    if-eqz v10, :cond_4

    .line 166
    .line 167
    move v7, v11

    .line 168
    :cond_4
    if-le v3, v13, :cond_5

    .line 169
    .line 170
    iget-object v7, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 171
    .line 172
    iget-object v7, v7, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 173
    .line 174
    invoke-virtual {v7}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 175
    .line 176
    .line 177
    move-result-object v7

    .line 178
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 179
    .line 180
    .line 181
    move-result v7

    .line 182
    int-to-float v7, v7

    .line 183
    mul-float/2addr v7, v9

    .line 184
    iget-object v10, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 185
    .line 186
    iget-object v10, v10, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 187
    .line 188
    iget v10, v10, Lcom/android/launcher3/model/data/p;->m:I

    .line 189
    .line 190
    int-to-float v10, v10

    .line 191
    div-float/2addr v7, v10

    .line 192
    float-to-double v14, v7

    .line 193
    invoke-static {v14, v15}, Ljava/lang/Math;->ceil(D)D

    .line 194
    .line 195
    .line 196
    move-result-wide v14

    .line 197
    double-to-int v7, v14

    .line 198
    :cond_5
    iget-boolean v10, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->z:Z

    .line 199
    .line 200
    const/16 v21, 0x0

    .line 201
    .line 202
    if-eqz v10, :cond_6

    .line 203
    .line 204
    if-gtz v12, :cond_7

    .line 205
    .line 206
    :cond_6
    iget-boolean v14, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->A:Z

    .line 207
    .line 208
    if-eqz v14, :cond_8

    .line 209
    .line 210
    if-gez v12, :cond_8

    .line 211
    .line 212
    :cond_7
    move v14, v13

    .line 213
    goto :goto_2

    .line 214
    :cond_8
    move/from16 v14, v21

    .line 215
    .line 216
    :goto_2
    const/16 v22, -0x1

    .line 217
    .line 218
    if-lt v4, v7, :cond_e

    .line 219
    .line 220
    iget-boolean v7, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->B:Z

    .line 221
    .line 222
    if-eqz v7, :cond_9

    .line 223
    .line 224
    if-gez v1, :cond_9

    .line 225
    .line 226
    if-nez v14, :cond_9

    .line 227
    .line 228
    goto/16 :goto_6

    .line 229
    .line 230
    :cond_9
    iget-boolean v7, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->C:Z

    .line 231
    .line 232
    if-eqz v7, :cond_a

    .line 233
    .line 234
    if-lez v1, :cond_a

    .line 235
    .line 236
    if-nez v14, :cond_a

    .line 237
    .line 238
    goto/16 :goto_6

    .line 239
    .line 240
    :cond_a
    if-eqz v10, :cond_b

    .line 241
    .line 242
    if-ltz v12, :cond_c

    .line 243
    .line 244
    :cond_b
    iget-boolean v7, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->A:Z

    .line 245
    .line 246
    if-eqz v7, :cond_e

    .line 247
    .line 248
    if-lez v12, :cond_e

    .line 249
    .line 250
    :cond_c
    if-ne v4, v13, :cond_d

    .line 251
    .line 252
    goto/16 :goto_6

    .line 253
    .line 254
    :cond_d
    iget-object v7, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 255
    .line 256
    iget-object v7, v7, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 257
    .line 258
    invoke-virtual {v7}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 259
    .line 260
    .line 261
    move-result-object v7

    .line 262
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 263
    .line 264
    .line 265
    move-result v7

    .line 266
    int-to-float v7, v7

    .line 267
    mul-float/2addr v7, v9

    .line 268
    invoke-static {v12}, Ljava/lang/Math;->abs(I)I

    .line 269
    .line 270
    .line 271
    move-result v10

    .line 272
    add-int/2addr v10, v3

    .line 273
    int-to-float v10, v10

    .line 274
    div-float/2addr v7, v10

    .line 275
    float-to-double v14, v7

    .line 276
    invoke-static {v14, v15}, Ljava/lang/Math;->ceil(D)D

    .line 277
    .line 278
    .line 279
    move-result-wide v14

    .line 280
    double-to-int v7, v14

    .line 281
    invoke-static {v12}, Ljava/lang/Math;->abs(I)I

    .line 282
    .line 283
    .line 284
    move-result v10

    .line 285
    add-int/2addr v10, v3

    .line 286
    if-le v10, v13, :cond_f

    .line 287
    .line 288
    invoke-static {v12}, Ljava/lang/Math;->abs(I)I

    .line 289
    .line 290
    .line 291
    move-result v7

    .line 292
    add-int/2addr v7, v3

    .line 293
    div-int/2addr v7, v11

    .line 294
    iget-object v10, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 295
    .line 296
    iget-object v10, v10, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 297
    .line 298
    iget v14, v10, Lcom/android/launcher3/model/data/p;->m:I

    .line 299
    .line 300
    mul-int/2addr v7, v14

    .line 301
    invoke-virtual {v10}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 302
    .line 303
    .line 304
    move-result-object v10

    .line 305
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    .line 306
    .line 307
    .line 308
    move-result v10

    .line 309
    int-to-float v10, v10

    .line 310
    mul-float/2addr v10, v9

    .line 311
    int-to-float v7, v7

    .line 312
    div-float/2addr v10, v7

    .line 313
    float-to-double v9, v10

    .line 314
    invoke-static {v9, v10}, Ljava/lang/Math;->ceil(D)D

    .line 315
    .line 316
    .line 317
    move-result-wide v9

    .line 318
    double-to-int v7, v9

    .line 319
    goto :goto_3

    .line 320
    :cond_e
    move/from16 v7, v22

    .line 321
    .line 322
    :cond_f
    :goto_3
    iget-object v9, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->r:[I

    .line 323
    .line 324
    aput v21, v9, v21

    .line 325
    .line 326
    aput v21, v9, v13

    .line 327
    .line 328
    iget-object v9, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->t:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 329
    .line 330
    add-int/2addr v3, v5

    .line 331
    invoke-virtual {v9, v5, v3}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 332
    .line 333
    .line 334
    iget-object v9, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->t:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 335
    .line 336
    iget-boolean v10, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->z:Z

    .line 337
    .line 338
    move v3, v11

    .line 339
    iget-boolean v11, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->A:Z

    .line 340
    .line 341
    move v5, v13

    .line 342
    iget v13, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->F:I

    .line 343
    .line 344
    iget v14, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->H:I

    .line 345
    .line 346
    iget-object v15, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 347
    .line 348
    invoke-virtual {v15}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 349
    .line 350
    .line 351
    move-result v15

    .line 352
    iget-object v3, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->u:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 353
    .line 354
    move-object/from16 v16, v3

    .line 355
    .line 356
    const/4 v3, 0x2

    .line 357
    invoke-virtual/range {v9 .. v16}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->b(ZZIIIILcom/android/launcher3/AppWidgetResizeFrame$b;)I

    .line 358
    .line 359
    .line 360
    move-result v9

    .line 361
    iget-object v10, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->u:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 362
    .line 363
    iget v11, v10, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a:I

    .line 364
    .line 365
    invoke-virtual {v10}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->e()I

    .line 366
    .line 367
    .line 368
    move-result v10

    .line 369
    const/4 v12, 0x3

    .line 370
    if-ne v10, v12, :cond_10

    .line 371
    .line 372
    goto :goto_6

    .line 373
    :cond_10
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 374
    .line 375
    .line 376
    move-result v12

    .line 377
    if-eqz v12, :cond_11

    .line 378
    .line 379
    if-le v10, v3, :cond_11

    .line 380
    .line 381
    goto :goto_6

    .line 382
    :cond_11
    if-eqz v9, :cond_13

    .line 383
    .line 384
    iget-object v3, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->r:[I

    .line 385
    .line 386
    iget-boolean v12, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->z:Z

    .line 387
    .line 388
    if-eqz v12, :cond_12

    .line 389
    .line 390
    move/from16 v13, v22

    .line 391
    .line 392
    goto :goto_4

    .line 393
    :cond_12
    move v13, v5

    .line 394
    :goto_4
    aput v13, v3, v21

    .line 395
    .line 396
    :cond_13
    iget-object v3, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->t:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 397
    .line 398
    add-int/2addr v4, v6

    .line 399
    invoke-virtual {v3, v6, v4}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 400
    .line 401
    .line 402
    iget-object v13, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->t:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 403
    .line 404
    iget-boolean v14, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->B:Z

    .line 405
    .line 406
    iget-boolean v15, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->C:Z

    .line 407
    .line 408
    iget v3, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->G:I

    .line 409
    .line 410
    iget v4, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->I:I

    .line 411
    .line 412
    iget-object v6, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 413
    .line 414
    invoke-virtual {v6}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 415
    .line 416
    .line 417
    move-result v19

    .line 418
    iget-object v6, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->u:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 419
    .line 420
    move/from16 v16, v1

    .line 421
    .line 422
    move/from16 v17, v3

    .line 423
    .line 424
    move/from16 v18, v4

    .line 425
    .line 426
    move-object/from16 v20, v6

    .line 427
    .line 428
    invoke-virtual/range {v13 .. v20}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->b(ZZIIIILcom/android/launcher3/AppWidgetResizeFrame$b;)I

    .line 429
    .line 430
    .line 431
    move-result v12

    .line 432
    iget-object v1, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->u:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 433
    .line 434
    iget v14, v1, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a:I

    .line 435
    .line 436
    invoke-virtual {v1}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->e()I

    .line 437
    .line 438
    .line 439
    move-result v1

    .line 440
    const/4 v3, 0x4

    .line 441
    if-ne v1, v5, :cond_14

    .line 442
    .line 443
    if-ne v10, v3, :cond_14

    .line 444
    .line 445
    goto :goto_6

    .line 446
    :cond_14
    if-eqz v12, :cond_16

    .line 447
    .line 448
    iget-object v4, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->r:[I

    .line 449
    .line 450
    iget-boolean v6, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->B:Z

    .line 451
    .line 452
    if-eqz v6, :cond_15

    .line 453
    .line 454
    move/from16 v13, v22

    .line 455
    .line 456
    goto :goto_5

    .line 457
    :cond_15
    move v13, v5

    .line 458
    :goto_5
    aput v13, v4, v5

    .line 459
    .line 460
    :cond_16
    if-nez v8, :cond_17

    .line 461
    .line 462
    if-nez v12, :cond_17

    .line 463
    .line 464
    if-nez v9, :cond_17

    .line 465
    .line 466
    :goto_6
    return-void

    .line 467
    :cond_17
    if-eqz v8, :cond_18

    .line 468
    .line 469
    iget-object v4, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->r:[I

    .line 470
    .line 471
    iget-object v6, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->s:[I

    .line 472
    .line 473
    aget v13, v6, v21

    .line 474
    .line 475
    aput v13, v4, v21

    .line 476
    .line 477
    aget v6, v6, v5

    .line 478
    .line 479
    aput v6, v4, v5

    .line 480
    .line 481
    goto :goto_7

    .line 482
    :cond_18
    iget-object v4, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->s:[I

    .line 483
    .line 484
    iget-object v6, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->r:[I

    .line 485
    .line 486
    aget v13, v6, v21

    .line 487
    .line 488
    aput v13, v4, v21

    .line 489
    .line 490
    aget v6, v6, v5

    .line 491
    .line 492
    aput v6, v4, v5

    .line 493
    .line 494
    :goto_7
    if-lez v7, :cond_1a

    .line 495
    .line 496
    if-ne v7, v5, :cond_19

    .line 497
    .line 498
    if-eq v10, v3, :cond_1a

    .line 499
    .line 500
    :cond_19
    move/from16 v16, v7

    .line 501
    .line 502
    goto :goto_8

    .line 503
    :cond_1a
    move/from16 v16, v1

    .line 504
    .line 505
    :goto_8
    const-string v1, "TransformFolderIconResizeFrame"

    .line 506
    .line 507
    if-eqz v8, :cond_1b

    .line 508
    .line 509
    iget-boolean v3, v2, Lc1/b;->e:Z

    .line 510
    .line 511
    if-nez v3, :cond_1b

    .line 512
    .line 513
    const-string v3, "resizeFolderIfNeeded: onDismiss and not use TmpCoords, set TmpCellX and TmpCellY"

    .line 514
    .line 515
    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 516
    .line 517
    .line 518
    invoke-virtual {v2, v11}, Lc1/b;->h(I)V

    .line 519
    .line 520
    .line 521
    invoke-virtual {v2, v14}, Lc1/b;->i(I)V

    .line 522
    .line 523
    .line 524
    goto :goto_9

    .line 525
    :cond_1b
    const-string v3, "resizeFolderIfNeeded: not set TmpCellX and TmpCellY"

    .line 526
    .line 527
    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 528
    .line 529
    .line 530
    :goto_9
    iget-object v1, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 531
    .line 532
    iget-object v6, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 533
    .line 534
    iget-object v7, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->r:[I

    .line 535
    .line 536
    move v4, v10

    .line 537
    move v3, v14

    .line 538
    move/from16 v5, v16

    .line 539
    .line 540
    move-object v10, v2

    .line 541
    move v2, v11

    .line 542
    invoke-virtual/range {v1 .. v8}, Lcom/android/launcher3/CellLayout;->A(IIIILandroid/view/View;[IZ)Z

    .line 543
    .line 544
    .line 545
    move-result v1

    .line 546
    move v15, v4

    .line 547
    if-eqz v1, :cond_1e

    .line 548
    .line 549
    iget-object v1, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->h:LO0/e;

    .line 550
    .line 551
    if-eqz v1, :cond_1d

    .line 552
    .line 553
    iget v3, v10, Lc1/b;->f:I

    .line 554
    .line 555
    if-ne v3, v15, :cond_1c

    .line 556
    .line 557
    iget v3, v10, Lc1/b;->g:I

    .line 558
    .line 559
    if-eq v3, v5, :cond_1d

    .line 560
    .line 561
    :cond_1c
    iget-object v3, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 562
    .line 563
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 564
    .line 565
    .line 566
    move-result-object v4

    .line 567
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 568
    .line 569
    .line 570
    move-result-object v6

    .line 571
    filled-new-array {v4, v6}, [Ljava/lang/Object;

    .line 572
    .line 573
    .line 574
    move-result-object v4

    .line 575
    const v6, 0x7f14048c

    .line 576
    .line 577
    .line 578
    invoke-virtual {v3, v6, v4}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 579
    .line 580
    .line 581
    move-result-object v3

    .line 582
    invoke-virtual {v1, v3}, LO0/e;->a(Ljava/lang/CharSequence;)V

    .line 583
    .line 584
    .line 585
    :cond_1d
    invoke-virtual {v10, v2}, Lc1/b;->h(I)V

    .line 586
    .line 587
    .line 588
    invoke-virtual {v10, v14}, Lc1/b;->i(I)V

    .line 589
    .line 590
    .line 591
    iput v15, v10, Lc1/b;->f:I

    .line 592
    .line 593
    iput v5, v10, Lc1/b;->g:I

    .line 594
    .line 595
    iget v1, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->E:I

    .line 596
    .line 597
    add-int/2addr v1, v12

    .line 598
    iput v1, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->E:I

    .line 599
    .line 600
    iget v1, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->D:I

    .line 601
    .line 602
    add-int/2addr v1, v9

    .line 603
    iput v1, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->D:I

    .line 604
    .line 605
    if-nez p1, :cond_1e

    .line 606
    .line 607
    iget-object v11, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 608
    .line 609
    iget-object v12, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 610
    .line 611
    const/16 v17, 0x1

    .line 612
    .line 613
    move v13, v2

    .line 614
    move/from16 v16, v5

    .line 615
    .line 616
    invoke-static/range {v11 .. v17}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->h0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/C2;IIIIZ)V

    .line 617
    .line 618
    .line 619
    :cond_1e
    iget-object v0, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 620
    .line 621
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->requestLayout()V

    .line 622
    .line 623
    .line 624
    return-void
.end method

.method private b0()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean v0, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    mul-int/lit8 v0, v0, 0x4

    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    mul-int/lit8 v1, v1, 0x2

    .line 27
    .line 28
    iget v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->p:I

    .line 29
    .line 30
    mul-int/lit8 v3, v2, 0x2

    .line 31
    .line 32
    iget-object v4, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->o:Landroid/graphics/Rect;

    .line 33
    .line 34
    iget v5, v4, Landroid/graphics/Rect;->left:I

    .line 35
    .line 36
    sub-int/2addr v0, v5

    .line 37
    iget v5, v4, Landroid/graphics/Rect;->right:I

    .line 38
    .line 39
    sub-int/2addr v0, v5

    .line 40
    int-to-float v0, v0

    .line 41
    const/high16 v5, 0x3f800000    # 1.0f

    .line 42
    .line 43
    mul-float/2addr v0, v5

    .line 44
    float-to-int v0, v0

    .line 45
    add-int/2addr v3, v0

    .line 46
    mul-int/lit8 v2, v2, 0x2

    .line 47
    .line 48
    iget v0, v4, Landroid/graphics/Rect;->top:I

    .line 49
    .line 50
    sub-int/2addr v1, v0

    .line 51
    iget v0, v4, Landroid/graphics/Rect;->bottom:I

    .line 52
    .line 53
    sub-int/2addr v1, v0

    .line 54
    int-to-float v0, v1

    .line 55
    mul-float/2addr v0, v5

    .line 56
    float-to-int v0, v0

    .line 57
    add-int/2addr v2, v0

    .line 58
    iput v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->V:I

    .line 59
    .line 60
    iput v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->W:I

    .line 61
    .line 62
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 69
    .line 70
    invoke-virtual {v1}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    iget v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->p:I

    .line 75
    .line 76
    mul-int/lit8 v3, v2, 0x2

    .line 77
    .line 78
    iget-object v4, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->o:Landroid/graphics/Rect;

    .line 79
    .line 80
    iget v6, v4, Landroid/graphics/Rect;->left:I

    .line 81
    .line 82
    sub-int/2addr v0, v6

    .line 83
    iget v6, v4, Landroid/graphics/Rect;->right:I

    .line 84
    .line 85
    sub-int/2addr v0, v6

    .line 86
    int-to-float v0, v0

    .line 87
    mul-float/2addr v0, v5

    .line 88
    float-to-int v0, v0

    .line 89
    add-int/2addr v3, v0

    .line 90
    iput v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->a0:I

    .line 91
    .line 92
    mul-int/lit8 v2, v2, 0x2

    .line 93
    .line 94
    iget v0, v4, Landroid/graphics/Rect;->top:I

    .line 95
    .line 96
    sub-int/2addr v1, v0

    .line 97
    iget v0, v4, Landroid/graphics/Rect;->bottom:I

    .line 98
    .line 99
    sub-int/2addr v1, v0

    .line 100
    int-to-float v0, v1

    .line 101
    mul-float/2addr v0, v5

    .line 102
    float-to-int v0, v0

    .line 103
    add-int/2addr v2, v0

    .line 104
    iput v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->b0:I

    .line 105
    .line 106
    return-void
.end method

.method private c0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/dragndrop/DragLayer;)V
    .locals 4

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->n:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-static {p2}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    iget-boolean p3, p2, Lcom/android/launcher3/X3;->B0:Z

    .line 20
    .line 21
    if-eqz p3, :cond_0

    .line 22
    .line 23
    new-instance p3, Landroid/graphics/Rect;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget v1, p2, Lcom/android/launcher3/X3;->r0:I

    .line 32
    .line 33
    add-int/2addr v0, v1

    .line 34
    iget v1, p2, Lcom/android/launcher3/X3;->q0:I

    .line 35
    .line 36
    add-int/2addr v0, v1

    .line 37
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 38
    .line 39
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 44
    .line 45
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getPaddingRight()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    iget v3, p2, Lcom/android/launcher3/X3;->r0:I

    .line 50
    .line 51
    add-int/2addr v2, v3

    .line 52
    iget v3, p2, Lcom/android/launcher3/X3;->q0:I

    .line 53
    .line 54
    add-int/2addr v2, v3

    .line 55
    iget p2, p2, Lcom/android/launcher3/X3;->t0:I

    .line 56
    .line 57
    invoke-direct {p3, v0, v1, v2, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 58
    .line 59
    .line 60
    iput-object p3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->o:Landroid/graphics/Rect;

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    new-instance p2, Landroid/graphics/Rect;

    .line 64
    .line 65
    iget-object p3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 66
    .line 67
    invoke-virtual {p3}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 68
    .line 69
    .line 70
    move-result p3

    .line 71
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 72
    .line 73
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 78
    .line 79
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getPaddingRight()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 84
    .line 85
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getPaddingBottom()I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    invoke-direct {p2, p3, v0, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 90
    .line 91
    .line 92
    iput-object p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->o:Landroid/graphics/Rect;

    .line 93
    .line 94
    :goto_0
    invoke-direct {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->b0()V

    .line 95
    .line 96
    .line 97
    iget-object p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 98
    .line 99
    invoke-virtual {p2, p1}, Lcom/android/launcher3/CellLayout;->g0(Landroid/view/View;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, p0}, Landroid/widget/LinearLayout;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 103
    .line 104
    .line 105
    const p1, 0x7f0b0285

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    check-cast p1, Landroid/widget/ImageView;

    .line 113
    .line 114
    const p2, 0x7f0b0287

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    check-cast p2, Landroid/widget/ImageView;

    .line 122
    .line 123
    const p3, 0x7f0b0284

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0, p3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object p3

    .line 130
    check-cast p3, Landroid/widget/ImageView;

    .line 131
    .line 132
    const v0, 0x7f0b0286

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    check-cast v0, Landroid/widget/ImageView;

    .line 140
    .line 141
    iget v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->R:I

    .line 142
    .line 143
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 144
    .line 145
    .line 146
    iget p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->S:I

    .line 147
    .line 148
    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 149
    .line 150
    .line 151
    iget p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->T:I

    .line 152
    .line 153
    invoke-virtual {p3, p1}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 154
    .line 155
    .line 156
    iget p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->U:I

    .line 157
    .line 158
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public static d0(I)Z
    .locals 1

    .line 1
    const/16 v0, 0x15

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    const/16 v0, 0x16

    .line 6
    .line 7
    if-eq p0, v0, :cond_1

    .line 8
    .line 9
    const/16 v0, 0x13

    .line 10
    .line 11
    if-eq p0, v0, :cond_1

    .line 12
    .line 13
    const/16 v0, 0x14

    .line 14
    .line 15
    if-eq p0, v0, :cond_1

    .line 16
    .line 17
    const/16 v0, 0x7a

    .line 18
    .line 19
    if-eq p0, v0, :cond_1

    .line 20
    .line 21
    const/16 v0, 0x7b

    .line 22
    .line 23
    if-eq p0, v0, :cond_1

    .line 24
    .line 25
    const/16 v0, 0x5c

    .line 26
    .line 27
    if-eq p0, v0, :cond_1

    .line 28
    .line 29
    const/16 v0, 0x5d

    .line 30
    .line 31
    if-ne p0, v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public static e0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/CellLayout;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const v3, 0x7f0e024b

    .line 18
    .line 19
    .line 20
    const/4 v4, 0x0

    .line 21
    invoke-virtual {v2, v3, v1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;

    .line 26
    .line 27
    invoke-direct {v2, p0, p1, v1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->c0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/dragndrop/DragLayer;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 35
    .line 36
    const/4 p1, 0x1

    .line 37
    iput-boolean p1, p0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->d:Z

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v0}, Lx1/O;->z1(Landroid/content/Context;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    const-string v0, "transform_icon_resize_frame_dark"

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    const-string v0, "transform_icon_resize_frame"

    .line 57
    .line 58
    :goto_0
    invoke-static {p0, v0}, Lf1/d;->f(Landroid/content/Context;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    invoke-virtual {v2, p0}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 66
    .line 67
    .line 68
    iput-boolean p1, v2, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 69
    .line 70
    invoke-virtual {v2, v4}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->f0(Z)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method private g0(Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean v0, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    if-nez p1, :cond_1

    .line 13
    .line 14
    new-instance p1, Landroid/graphics/drawable/ColorDrawable;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-direct {p1, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "transform_icon_resize_frame_normal"

    .line 32
    .line 33
    invoke-static {v0, v1}, Lf1/d;->f(Landroid/content/Context;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    :goto_0
    new-instance v0, Landroid/graphics/Rect;

    .line 42
    .line 43
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->T(Landroid/graphics/Rect;)V

    .line 47
    .line 48
    .line 49
    new-instance v1, Landroid/graphics/Rect;

    .line 50
    .line 51
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 52
    .line 53
    .line 54
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->n:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 55
    .line 56
    iget-object v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 57
    .line 58
    invoke-virtual {v2, v3, v1}, Lcom/android/launcher3/views/BaseDragLayer;->getViewRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    iget-object v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->o:Landroid/graphics/Rect;

    .line 66
    .line 67
    iget v4, v3, Landroid/graphics/Rect;->left:I

    .line 68
    .line 69
    sub-int/2addr v2, v4

    .line 70
    iget v3, v3, Landroid/graphics/Rect;->right:I

    .line 71
    .line 72
    sub-int/2addr v2, v3

    .line 73
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    iget-object v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->o:Landroid/graphics/Rect;

    .line 78
    .line 79
    iget v4, v3, Landroid/graphics/Rect;->top:I

    .line 80
    .line 81
    sub-int/2addr v1, v4

    .line 82
    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    .line 83
    .line 84
    sub-int/2addr v1, v3

    .line 85
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    sub-int/2addr v3, v2

    .line 90
    int-to-float v2, v3

    .line 91
    const/high16 v3, 0x40000000    # 2.0f

    .line 92
    .line 93
    div-float/2addr v2, v3

    .line 94
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    sub-int/2addr v0, v1

    .line 103
    int-to-float v0, v0

    .line 104
    div-float/2addr v0, v3

    .line 105
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    new-instance v1, LU1/a;

    .line 110
    .line 111
    invoke-direct {v1, p1}, LU1/a;-><init>(Landroid/graphics/drawable/Drawable;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1, v0, v2, v0, v2}, LU1/a;->e(IIII)LU1/a;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public static h0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/C2;IIIIZ)V
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move/from16 v0, p5

    .line 4
    .line 5
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    const/4 v2, 0x4

    .line 12
    move/from16 v3, p4

    .line 13
    .line 14
    if-ne v3, v2, :cond_1

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move/from16 v3, p4

    .line 19
    .line 20
    :cond_1
    move v2, v3

    .line 21
    :goto_0
    iget-object v3, v1, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 22
    .line 23
    iget v6, v3, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 24
    .line 25
    iget v7, v3, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v8

    .line 31
    iget-object v13, v1, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 32
    .line 33
    iget v9, v13, Lcom/android/launcher3/model/data/p;->k:I

    .line 34
    .line 35
    iget v10, v13, Lcom/android/launcher3/model/data/p;->l:I

    .line 36
    .line 37
    iget v11, v13, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 38
    .line 39
    iget v12, v13, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 40
    .line 41
    invoke-static/range {v8 .. v13}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->d1(Landroid/content/Context;IIIILcom/android/launcher3/model/data/p;)Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getAllChildBubbleTextViewDrawableList()Ljava/util/ArrayList;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    sget-object v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->c0:Landroid/graphics/Rect;

    .line 50
    .line 51
    move-object/from16 v10, p1

    .line 52
    .line 53
    invoke-static {v10, v2, v0, v5}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->S(Landroid/content/Context;IILandroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1, v2, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->C1(II)V

    .line 57
    .line 58
    .line 59
    iget-object v11, v1, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 60
    .line 61
    if-eqz p6, :cond_2

    .line 62
    .line 63
    invoke-virtual {v10}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget-boolean v0, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 68
    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    move/from16 v8, p2

    .line 72
    .line 73
    iput v8, v11, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 74
    .line 75
    move/from16 v9, p3

    .line 76
    .line 77
    iput v9, v11, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 78
    .line 79
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 80
    .line 81
    .line 82
    move-result-object v12

    .line 83
    iget-object v0, v1, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 84
    .line 85
    iget v13, v0, Lcom/android/launcher3/model/data/p;->k:I

    .line 86
    .line 87
    iget v14, v0, Lcom/android/launcher3/model/data/p;->l:I

    .line 88
    .line 89
    iget v15, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 90
    .line 91
    iget v2, v0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 92
    .line 93
    move-object/from16 v17, v0

    .line 94
    .line 95
    move/from16 v16, v2

    .line 96
    .line 97
    invoke-static/range {v12 .. v17}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->d1(Landroid/content/Context;IIIILcom/android/launcher3/model/data/p;)Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getAllChildBubbleTextViewDrawableList()Ljava/util/ArrayList;

    .line 102
    .line 103
    .line 104
    move-result-object v5

    .line 105
    move-object v2, v3

    .line 106
    move-object v3, v0

    .line 107
    iget-object v0, v1, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 108
    .line 109
    invoke-virtual/range {v0 .. v9}, Lcom/android/launcher3/folder/u0;->p0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;Ljava/util/ArrayList;Ljava/util/ArrayList;IIII)V

    .line 110
    .line 111
    .line 112
    :cond_2
    invoke-virtual {v10}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 113
    .line 114
    .line 115
    move-result-object v8

    .line 116
    iget v10, v11, Lcom/android/launcher3/model/data/y;->container:I

    .line 117
    .line 118
    iget v0, v11, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 119
    .line 120
    iget v12, v11, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 121
    .line 122
    iget v13, v11, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 123
    .line 124
    iget v14, v11, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 125
    .line 126
    iget v15, v11, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 127
    .line 128
    move-object v9, v11

    .line 129
    move v11, v0

    .line 130
    invoke-virtual/range {v8 .. v15}, Lz1/J3;->R(Lcom/android/launcher3/model/data/y;IIIIII)V

    .line 131
    .line 132
    .line 133
    return-void
.end method


# virtual methods
.method public R(II)Z
    .locals 11

    .line 1
    iget v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->q:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-ge p1, v0, :cond_0

    .line 6
    .line 7
    move v0, v1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v0, v2

    .line 10
    :goto_0
    iput-boolean v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->z:Z

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->q:I

    .line 17
    .line 18
    sub-int/2addr v0, v3

    .line 19
    if-le p1, v0, :cond_1

    .line 20
    .line 21
    move p1, v1

    .line 22
    goto :goto_1

    .line 23
    :cond_1
    move p1, v2

    .line 24
    :goto_1
    iput-boolean p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->A:Z

    .line 25
    .line 26
    iget p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->N:I

    .line 27
    .line 28
    add-int/2addr v3, p1

    .line 29
    if-ge p2, v3, :cond_2

    .line 30
    .line 31
    move p1, v1

    .line 32
    goto :goto_2

    .line 33
    :cond_2
    move p1, v2

    .line 34
    :goto_2
    iput-boolean p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->B:Z

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iget v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->q:I

    .line 41
    .line 42
    sub-int/2addr p1, v0

    .line 43
    iget v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->O:I

    .line 44
    .line 45
    add-int/2addr p1, v0

    .line 46
    if-le p2, p1, :cond_3

    .line 47
    .line 48
    move p1, v1

    .line 49
    goto :goto_3

    .line 50
    :cond_3
    move p1, v2

    .line 51
    :goto_3
    iput-boolean p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->C:Z

    .line 52
    .line 53
    iget-boolean p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->z:Z

    .line 54
    .line 55
    if-nez p2, :cond_5

    .line 56
    .line 57
    iget-boolean v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->A:Z

    .line 58
    .line 59
    if-nez v0, :cond_5

    .line 60
    .line 61
    iget-boolean v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->B:Z

    .line 62
    .line 63
    if-nez v0, :cond_5

    .line 64
    .line 65
    if-eqz p1, :cond_4

    .line 66
    .line 67
    goto :goto_4

    .line 68
    :cond_4
    move v0, v2

    .line 69
    goto :goto_5

    .line 70
    :cond_5
    :goto_4
    move v0, v1

    .line 71
    :goto_5
    const/4 v3, 0x3

    .line 72
    if-eqz v0, :cond_1a

    .line 73
    .line 74
    if-eqz p2, :cond_6

    .line 75
    .line 76
    iget-boolean v4, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->A:Z

    .line 77
    .line 78
    if-nez v4, :cond_6

    .line 79
    .line 80
    iget-boolean v4, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->B:Z

    .line 81
    .line 82
    if-nez v4, :cond_6

    .line 83
    .line 84
    if-nez p1, :cond_6

    .line 85
    .line 86
    move v4, v1

    .line 87
    goto :goto_6

    .line 88
    :cond_6
    move v4, v2

    .line 89
    :goto_6
    if-nez p2, :cond_7

    .line 90
    .line 91
    iget-boolean v5, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->A:Z

    .line 92
    .line 93
    if-eqz v5, :cond_7

    .line 94
    .line 95
    iget-boolean v5, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->B:Z

    .line 96
    .line 97
    if-nez v5, :cond_7

    .line 98
    .line 99
    if-nez p1, :cond_7

    .line 100
    .line 101
    move v5, v1

    .line 102
    goto :goto_7

    .line 103
    :cond_7
    move v5, v2

    .line 104
    :goto_7
    if-nez p2, :cond_8

    .line 105
    .line 106
    iget-boolean v6, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->A:Z

    .line 107
    .line 108
    if-nez v6, :cond_8

    .line 109
    .line 110
    iget-boolean v6, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->B:Z

    .line 111
    .line 112
    if-eqz v6, :cond_8

    .line 113
    .line 114
    if-nez p1, :cond_8

    .line 115
    .line 116
    move v6, v1

    .line 117
    goto :goto_8

    .line 118
    :cond_8
    move v6, v2

    .line 119
    :goto_8
    if-nez p2, :cond_9

    .line 120
    .line 121
    iget-boolean v7, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->A:Z

    .line 122
    .line 123
    if-nez v7, :cond_9

    .line 124
    .line 125
    iget-boolean v7, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->B:Z

    .line 126
    .line 127
    if-nez v7, :cond_9

    .line 128
    .line 129
    if-eqz p1, :cond_9

    .line 130
    .line 131
    move v7, v1

    .line 132
    goto :goto_9

    .line 133
    :cond_9
    move v7, v2

    .line 134
    :goto_9
    if-eqz p2, :cond_a

    .line 135
    .line 136
    iget-boolean v8, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->A:Z

    .line 137
    .line 138
    if-nez v8, :cond_a

    .line 139
    .line 140
    iget-boolean v8, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->B:Z

    .line 141
    .line 142
    if-eqz v8, :cond_a

    .line 143
    .line 144
    if-nez p1, :cond_a

    .line 145
    .line 146
    move v8, v1

    .line 147
    goto :goto_a

    .line 148
    :cond_a
    move v8, v2

    .line 149
    :goto_a
    if-nez p2, :cond_b

    .line 150
    .line 151
    iget-boolean v9, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->A:Z

    .line 152
    .line 153
    if-eqz v9, :cond_b

    .line 154
    .line 155
    iget-boolean v9, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->B:Z

    .line 156
    .line 157
    if-eqz v9, :cond_b

    .line 158
    .line 159
    if-nez p1, :cond_b

    .line 160
    .line 161
    move v9, v1

    .line 162
    goto :goto_b

    .line 163
    :cond_b
    move v9, v2

    .line 164
    :goto_b
    if-nez p2, :cond_c

    .line 165
    .line 166
    iget-boolean v10, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->A:Z

    .line 167
    .line 168
    if-eqz v10, :cond_c

    .line 169
    .line 170
    iget-boolean v10, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->B:Z

    .line 171
    .line 172
    if-nez v10, :cond_c

    .line 173
    .line 174
    if-eqz p1, :cond_c

    .line 175
    .line 176
    move v10, v1

    .line 177
    goto :goto_c

    .line 178
    :cond_c
    move v10, v2

    .line 179
    :goto_c
    if-eqz p2, :cond_d

    .line 180
    .line 181
    iget-boolean p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->A:Z

    .line 182
    .line 183
    if-nez p2, :cond_d

    .line 184
    .line 185
    iget-boolean p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->B:Z

    .line 186
    .line 187
    if-nez p2, :cond_d

    .line 188
    .line 189
    if-eqz p1, :cond_d

    .line 190
    .line 191
    move p1, v1

    .line 192
    goto :goto_d

    .line 193
    :cond_d
    move p1, v2

    .line 194
    :goto_d
    if-nez v4, :cond_f

    .line 195
    .line 196
    if-nez v6, :cond_f

    .line 197
    .line 198
    if-eqz v8, :cond_e

    .line 199
    .line 200
    goto :goto_e

    .line 201
    :cond_e
    move p2, v2

    .line 202
    goto :goto_f

    .line 203
    :cond_f
    :goto_e
    move p2, v1

    .line 204
    :goto_f
    if-nez v5, :cond_11

    .line 205
    .line 206
    if-nez v6, :cond_11

    .line 207
    .line 208
    if-eqz v9, :cond_10

    .line 209
    .line 210
    goto :goto_10

    .line 211
    :cond_10
    move v6, v2

    .line 212
    goto :goto_11

    .line 213
    :cond_11
    :goto_10
    move v6, v1

    .line 214
    :goto_11
    if-nez v5, :cond_13

    .line 215
    .line 216
    if-nez v7, :cond_13

    .line 217
    .line 218
    if-eqz v10, :cond_12

    .line 219
    .line 220
    goto :goto_12

    .line 221
    :cond_12
    move v5, v2

    .line 222
    goto :goto_13

    .line 223
    :cond_13
    :goto_12
    move v5, v1

    .line 224
    :goto_13
    if-nez v4, :cond_15

    .line 225
    .line 226
    if-nez v7, :cond_15

    .line 227
    .line 228
    if-eqz p1, :cond_14

    .line 229
    .line 230
    goto :goto_14

    .line 231
    :cond_14
    move p1, v2

    .line 232
    goto :goto_15

    .line 233
    :cond_15
    :goto_14
    move p1, v1

    .line 234
    :goto_15
    iget-object v4, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->j:[Landroid/view/View;

    .line 235
    .line 236
    aget-object v4, v4, v2

    .line 237
    .line 238
    const/4 v7, 0x0

    .line 239
    const/high16 v8, 0x3f800000    # 1.0f

    .line 240
    .line 241
    if-eqz p2, :cond_16

    .line 242
    .line 243
    move p2, v8

    .line 244
    goto :goto_16

    .line 245
    :cond_16
    move p2, v7

    .line 246
    :goto_16
    invoke-virtual {v4, p2}, Landroid/view/View;->setAlpha(F)V

    .line 247
    .line 248
    .line 249
    iget-object p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->j:[Landroid/view/View;

    .line 250
    .line 251
    aget-object p2, p2, v1

    .line 252
    .line 253
    if-eqz v6, :cond_17

    .line 254
    .line 255
    move v4, v8

    .line 256
    goto :goto_17

    .line 257
    :cond_17
    move v4, v7

    .line 258
    :goto_17
    invoke-virtual {p2, v4}, Landroid/view/View;->setAlpha(F)V

    .line 259
    .line 260
    .line 261
    iget-object p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->j:[Landroid/view/View;

    .line 262
    .line 263
    const/4 v4, 0x2

    .line 264
    aget-object p2, p2, v4

    .line 265
    .line 266
    if-eqz v5, :cond_18

    .line 267
    .line 268
    move v4, v8

    .line 269
    goto :goto_18

    .line 270
    :cond_18
    move v4, v7

    .line 271
    :goto_18
    invoke-virtual {p2, v4}, Landroid/view/View;->setAlpha(F)V

    .line 272
    .line 273
    .line 274
    iget-object p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->j:[Landroid/view/View;

    .line 275
    .line 276
    aget-object p2, p2, v3

    .line 277
    .line 278
    if-eqz p1, :cond_19

    .line 279
    .line 280
    move v7, v8

    .line 281
    :cond_19
    invoke-virtual {p2, v7}, Landroid/view/View;->setAlpha(F)V

    .line 282
    .line 283
    .line 284
    invoke-direct {p0, v1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->g0(Z)V

    .line 285
    .line 286
    .line 287
    :cond_1a
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 288
    .line 289
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 290
    .line 291
    .line 292
    move-result-object p1

    .line 293
    iget-boolean p1, p1, Lcom/android/launcher3/X3;->B0:Z

    .line 294
    .line 295
    if-eqz p1, :cond_1f

    .line 296
    .line 297
    iget-boolean p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->z:Z

    .line 298
    .line 299
    if-eqz p1, :cond_1b

    .line 300
    .line 301
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->v:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 302
    .line 303
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    .line 304
    .line 305
    .line 306
    move-result p2

    .line 307
    iget v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->V:I

    .line 308
    .line 309
    sub-int/2addr p2, v1

    .line 310
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    .line 311
    .line 312
    .line 313
    move-result v1

    .line 314
    iget v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->a0:I

    .line 315
    .line 316
    sub-int/2addr v1, v3

    .line 317
    invoke-virtual {p1, p2, v1}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 318
    .line 319
    .line 320
    goto :goto_19

    .line 321
    :cond_1b
    iget-boolean p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->A:Z

    .line 322
    .line 323
    if-eqz p1, :cond_1c

    .line 324
    .line 325
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->v:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 326
    .line 327
    iget p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->a0:I

    .line 328
    .line 329
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    .line 330
    .line 331
    .line 332
    move-result v1

    .line 333
    sub-int/2addr p2, v1

    .line 334
    iget v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->V:I

    .line 335
    .line 336
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    .line 337
    .line 338
    .line 339
    move-result v3

    .line 340
    sub-int/2addr v1, v3

    .line 341
    invoke-virtual {p1, p2, v1}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 342
    .line 343
    .line 344
    goto :goto_19

    .line 345
    :cond_1c
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->v:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 346
    .line 347
    invoke-virtual {p1, v2, v2}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 348
    .line 349
    .line 350
    :goto_19
    iget-boolean p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->B:Z

    .line 351
    .line 352
    if-eqz p1, :cond_1d

    .line 353
    .line 354
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->x:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 355
    .line 356
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    .line 357
    .line 358
    .line 359
    move-result p2

    .line 360
    iget v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->W:I

    .line 361
    .line 362
    sub-int/2addr p2, v1

    .line 363
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    .line 364
    .line 365
    .line 366
    move-result v1

    .line 367
    iget v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->b0:I

    .line 368
    .line 369
    sub-int/2addr v1, v2

    .line 370
    invoke-virtual {p1, p2, v1}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 371
    .line 372
    .line 373
    goto/16 :goto_1b

    .line 374
    .line 375
    :cond_1d
    iget-boolean p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->C:Z

    .line 376
    .line 377
    if-eqz p1, :cond_1e

    .line 378
    .line 379
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->x:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 380
    .line 381
    iget p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->b0:I

    .line 382
    .line 383
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    .line 384
    .line 385
    .line 386
    move-result v1

    .line 387
    sub-int/2addr p2, v1

    .line 388
    iget v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->W:I

    .line 389
    .line 390
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    .line 391
    .line 392
    .line 393
    move-result v2

    .line 394
    sub-int/2addr v1, v2

    .line 395
    invoke-virtual {p1, p2, v1}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 396
    .line 397
    .line 398
    goto/16 :goto_1b

    .line 399
    .line 400
    :cond_1e
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->x:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 401
    .line 402
    invoke-virtual {p1, v2, v2}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 403
    .line 404
    .line 405
    goto/16 :goto_1b

    .line 406
    .line 407
    :cond_1f
    iget-boolean p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->z:Z

    .line 408
    .line 409
    if-eqz p1, :cond_20

    .line 410
    .line 411
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->v:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 412
    .line 413
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLeft()I

    .line 414
    .line 415
    .line 416
    move-result p2

    .line 417
    neg-int p2, p2

    .line 418
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    .line 419
    .line 420
    .line 421
    move-result v1

    .line 422
    iget v4, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->q:I

    .line 423
    .line 424
    mul-int/2addr v4, v3

    .line 425
    sub-int/2addr v1, v4

    .line 426
    invoke-virtual {p1, p2, v1}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 427
    .line 428
    .line 429
    goto :goto_1a

    .line 430
    :cond_20
    iget-boolean p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->A:Z

    .line 431
    .line 432
    if-eqz p1, :cond_21

    .line 433
    .line 434
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->v:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 435
    .line 436
    iget p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->q:I

    .line 437
    .line 438
    mul-int/2addr p2, v3

    .line 439
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    .line 440
    .line 441
    .line 442
    move-result v1

    .line 443
    sub-int/2addr p2, v1

    .line 444
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->n:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 445
    .line 446
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getWidth()I

    .line 447
    .line 448
    .line 449
    move-result v1

    .line 450
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getRight()I

    .line 451
    .line 452
    .line 453
    move-result v4

    .line 454
    sub-int/2addr v1, v4

    .line 455
    invoke-virtual {p1, p2, v1}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 456
    .line 457
    .line 458
    goto :goto_1a

    .line 459
    :cond_21
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->v:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 460
    .line 461
    invoke-virtual {p1, v2, v2}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 462
    .line 463
    .line 464
    :goto_1a
    iget-boolean p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->B:Z

    .line 465
    .line 466
    if-eqz p1, :cond_22

    .line 467
    .line 468
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->x:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 469
    .line 470
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTop()I

    .line 471
    .line 472
    .line 473
    move-result p2

    .line 474
    neg-int p2, p2

    .line 475
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    .line 476
    .line 477
    .line 478
    move-result v1

    .line 479
    iget v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->q:I

    .line 480
    .line 481
    mul-int/2addr v2, v3

    .line 482
    sub-int/2addr v1, v2

    .line 483
    invoke-virtual {p1, p2, v1}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 484
    .line 485
    .line 486
    goto :goto_1b

    .line 487
    :cond_22
    iget-boolean p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->C:Z

    .line 488
    .line 489
    if-eqz p1, :cond_23

    .line 490
    .line 491
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->x:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 492
    .line 493
    iget p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->q:I

    .line 494
    .line 495
    mul-int/2addr p2, v3

    .line 496
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    .line 497
    .line 498
    .line 499
    move-result v1

    .line 500
    sub-int/2addr p2, v1

    .line 501
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->n:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 502
    .line 503
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getHeight()I

    .line 504
    .line 505
    .line 506
    move-result v1

    .line 507
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBottom()I

    .line 508
    .line 509
    .line 510
    move-result v2

    .line 511
    sub-int/2addr v1, v2

    .line 512
    invoke-virtual {p1, p2, v1}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 513
    .line 514
    .line 515
    goto :goto_1b

    .line 516
    :cond_23
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->x:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 517
    .line 518
    invoke-virtual {p1, v2, v2}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 519
    .line 520
    .line 521
    :goto_1b
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->w:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 522
    .line 523
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLeft()I

    .line 524
    .line 525
    .line 526
    move-result p2

    .line 527
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getRight()I

    .line 528
    .line 529
    .line 530
    move-result v1

    .line 531
    invoke-virtual {p1, p2, v1}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 532
    .line 533
    .line 534
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->y:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 535
    .line 536
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTop()I

    .line 537
    .line 538
    .line 539
    move-result p2

    .line 540
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBottom()I

    .line 541
    .line 542
    .line 543
    move-result p0

    .line 544
    invoke-virtual {p1, p2, p0}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 545
    .line 546
    .line 547
    return v0
.end method

.method public f0(Z)V
    .locals 10

    .line 1
    const/4 v0, 0x1

    .line 2
    sget-object v1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->c0:Landroid/graphics/Rect;

    .line 3
    .line 4
    invoke-direct {p0, v1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->T(Landroid/graphics/Rect;)V

    .line 5
    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v3, "snapToFolder: uuysd, resize frame rect: "

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v3, ", folder icon padding: "

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget-object v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->o:Landroid/graphics/Rect;

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v3, ", background padding: "

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->p:I

    .line 36
    .line 37
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    const-string v3, "TransformFolderIconResizeFrame"

    .line 45
    .line 46
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    iget v4, v1, Landroid/graphics/Rect;->left:I

    .line 58
    .line 59
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 60
    .line 61
    const/4 v5, 0x0

    .line 62
    if-gez v1, :cond_0

    .line 63
    .line 64
    neg-int v6, v1

    .line 65
    iput v6, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->N:I

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    iput v5, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->N:I

    .line 69
    .line 70
    :goto_0
    add-int v6, v1, v3

    .line 71
    .line 72
    iget-object v7, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->n:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 73
    .line 74
    invoke-virtual {v7}, Landroid/widget/FrameLayout;->getHeight()I

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    if-le v6, v7, :cond_1

    .line 79
    .line 80
    iget-object v7, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->n:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 81
    .line 82
    invoke-virtual {v7}, Landroid/widget/FrameLayout;->getHeight()I

    .line 83
    .line 84
    .line 85
    move-result v7

    .line 86
    sub-int/2addr v6, v7

    .line 87
    neg-int v6, v6

    .line 88
    iput v6, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->O:I

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_1
    iput v5, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->O:I

    .line 92
    .line 93
    :goto_1
    iget-object v6, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 94
    .line 95
    invoke-virtual {v6}, Lcom/android/launcher3/v;->getThemeRes()I

    .line 96
    .line 97
    .line 98
    move-result v6

    .line 99
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 100
    .line 101
    .line 102
    move-result-object v7

    .line 103
    const v8, 0x7f040781

    .line 104
    .line 105
    .line 106
    invoke-static {v7, v8, v6}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 107
    .line 108
    .line 109
    move-result v6

    .line 110
    invoke-static {v6}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 114
    .line 115
    .line 116
    move-result-object v6

    .line 117
    check-cast v6, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 118
    .line 119
    const/high16 v7, 0x3f800000    # 1.0f

    .line 120
    .line 121
    const/4 v8, 0x4

    .line 122
    if-nez p1, :cond_3

    .line 123
    .line 124
    iput v2, v6, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 125
    .line 126
    iput v3, v6, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 127
    .line 128
    iput v4, v6, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 129
    .line 130
    iput v1, v6, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 131
    .line 132
    move p1, v5

    .line 133
    :goto_2
    if-ge p1, v8, :cond_2

    .line 134
    .line 135
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->j:[Landroid/view/View;

    .line 136
    .line 137
    aget-object v1, v1, p1

    .line 138
    .line 139
    invoke-virtual {v1, v7}, Landroid/view/View;->setAlpha(F)V

    .line 140
    .line 141
    .line 142
    add-int/2addr p1, v0

    .line 143
    goto :goto_2

    .line 144
    :cond_2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 145
    .line 146
    .line 147
    goto/16 :goto_4

    .line 148
    .line 149
    :cond_3
    sget-object p1, Lcom/android/launcher3/G2;->e:Landroid/util/IntProperty;

    .line 150
    .line 151
    iget v9, v6, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 152
    .line 153
    filled-new-array {v9, v2}, [I

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    invoke-static {p1, v2}, Landroid/animation/PropertyValuesHolder;->ofInt(Landroid/util/Property;[I)Landroid/animation/PropertyValuesHolder;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    sget-object v2, Lcom/android/launcher3/G2;->f:Landroid/util/IntProperty;

    .line 162
    .line 163
    iget v9, v6, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 164
    .line 165
    filled-new-array {v9, v3}, [I

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    invoke-static {v2, v3}, Landroid/animation/PropertyValuesHolder;->ofInt(Landroid/util/Property;[I)Landroid/animation/PropertyValuesHolder;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    sget-object v3, Lcom/android/launcher3/views/BaseDragLayer;->LAYOUT_X:Landroid/util/Property;

    .line 174
    .line 175
    iget v9, v6, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 176
    .line 177
    filled-new-array {v9, v4}, [I

    .line 178
    .line 179
    .line 180
    move-result-object v4

    .line 181
    invoke-static {v3, v4}, Landroid/animation/PropertyValuesHolder;->ofInt(Landroid/util/Property;[I)Landroid/animation/PropertyValuesHolder;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    sget-object v4, Lcom/android/launcher3/views/BaseDragLayer;->LAYOUT_Y:Landroid/util/Property;

    .line 186
    .line 187
    iget v9, v6, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 188
    .line 189
    filled-new-array {v9, v1}, [I

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    invoke-static {v4, v1}, Landroid/animation/PropertyValuesHolder;->ofInt(Landroid/util/Property;[I)Landroid/animation/PropertyValuesHolder;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    filled-new-array {p1, v2, v3, v1}, [Landroid/animation/PropertyValuesHolder;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    invoke-static {v6, p1}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->i:Lcom/android/launcher3/w0;

    .line 206
    .line 207
    invoke-virtual {v1, p1}, Lcom/android/launcher3/w0;->c(Landroid/animation/ValueAnimator;)Landroid/animation/ValueAnimator;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    check-cast v1, Landroid/animation/ObjectAnimator;

    .line 212
    .line 213
    new-instance v2, LU1/m;

    .line 214
    .line 215
    invoke-direct {v2, p0}, LU1/m;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 219
    .line 220
    .line 221
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 222
    .line 223
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 224
    .line 225
    .line 226
    invoke-virtual {v1, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 227
    .line 228
    .line 229
    move p1, v5

    .line 230
    :goto_3
    if-ge p1, v8, :cond_4

    .line 231
    .line 232
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->j:[Landroid/view/View;

    .line 233
    .line 234
    aget-object v2, v2, p1

    .line 235
    .line 236
    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 237
    .line 238
    .line 239
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->i:Lcom/android/launcher3/w0;

    .line 240
    .line 241
    iget-object v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->j:[Landroid/view/View;

    .line 242
    .line 243
    aget-object v3, v3, p1

    .line 244
    .line 245
    sget-object v4, Landroid/widget/LinearLayout;->ALPHA:Landroid/util/Property;

    .line 246
    .line 247
    new-array v6, v0, [F

    .line 248
    .line 249
    aput v7, v6, v5

    .line 250
    .line 251
    invoke-static {v3, v4, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 252
    .line 253
    .line 254
    move-result-object v3

    .line 255
    invoke-virtual {v2, v3}, Lcom/android/launcher3/w0;->c(Landroid/animation/ValueAnimator;)Landroid/animation/ValueAnimator;

    .line 256
    .line 257
    .line 258
    move-result-object v2

    .line 259
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 260
    .line 261
    .line 262
    add-int/2addr p1, v0

    .line 263
    goto :goto_3

    .line 264
    :cond_4
    const-wide/16 v2, 0x96

    .line 265
    .line 266
    invoke-virtual {v1, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 267
    .line 268
    .line 269
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 270
    .line 271
    .line 272
    :goto_4
    invoke-direct {p0, v5}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->g0(Z)V

    .line 273
    .line 274
    .line 275
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setFocusableInTouchMode(Z)V

    .line 276
    .line 277
    .line 278
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestFocus()Z

    .line 279
    .line 280
    .line 281
    return-void
.end method

.method protected handleClose(Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->n:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i0(II)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->v:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 8
    .line 9
    invoke-virtual {v1, p1}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->c(I)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iput p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->J:I

    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->w:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 16
    .line 17
    iget-boolean v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->z:Z

    .line 18
    .line 19
    iget-boolean v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->A:Z

    .line 20
    .line 21
    iget-object v4, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->t:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 22
    .line 23
    invoke-virtual {v1, v2, v3, p1, v4}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a(ZZILcom/android/launcher3/AppWidgetResizeFrame$b;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->t:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 27
    .line 28
    iget v1, p1, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a:I

    .line 29
    .line 30
    iput v1, v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->e()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 37
    .line 38
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->x:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->c(I)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    iput p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->K:I

    .line 45
    .line 46
    iget-object p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->y:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 47
    .line 48
    iget-boolean v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->B:Z

    .line 49
    .line 50
    iget-boolean v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->C:Z

    .line 51
    .line 52
    iget-object v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->t:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 53
    .line 54
    invoke-virtual {p2, v1, v2, p1, v3}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a(ZZILcom/android/launcher3/AppWidgetResizeFrame$b;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->t:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 58
    .line 59
    iget p2, p1, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a:I

    .line 60
    .line 61
    iput p2, v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->e()I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 68
    .line 69
    const/4 p1, 0x0

    .line 70
    invoke-direct {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->a0(Z)V

    .line 71
    .line 72
    .line 73
    sget-object p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->c0:Landroid/graphics/Rect;

    .line 74
    .line 75
    invoke-direct {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->T(Landroid/graphics/Rect;)V

    .line 76
    .line 77
    .line 78
    iget-boolean p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->z:Z

    .line 79
    .line 80
    if-eqz p2, :cond_0

    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    iget v1, p1, Landroid/graphics/Rect;->left:I

    .line 87
    .line 88
    add-int/2addr p2, v1

    .line 89
    iget v1, v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 90
    .line 91
    sub-int/2addr p2, v1

    .line 92
    iput p2, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 93
    .line 94
    :cond_0
    iget-boolean p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->B:Z

    .line 95
    .line 96
    if-eqz p2, :cond_1

    .line 97
    .line 98
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    iget v1, p1, Landroid/graphics/Rect;->top:I

    .line 103
    .line 104
    add-int/2addr p2, v1

    .line 105
    iget v1, v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 106
    .line 107
    sub-int/2addr p2, v1

    .line 108
    iput p2, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 109
    .line 110
    :cond_1
    iget-boolean p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->A:Z

    .line 111
    .line 112
    if-eqz p2, :cond_2

    .line 113
    .line 114
    iget p2, p1, Landroid/graphics/Rect;->left:I

    .line 115
    .line 116
    iput p2, v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 117
    .line 118
    :cond_2
    iget-boolean p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->C:Z

    .line 119
    .line 120
    if-eqz p2, :cond_3

    .line 121
    .line 122
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 123
    .line 124
    iput p1, v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 125
    .line 126
    :cond_3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    and-int/lit8 p0, p1, 0x8

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->V(Landroid/view/MotionEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p1, 0x0

    .line 16
    invoke-virtual {p0, p1}, Lcom/android/launcher3/a;->close(Z)V

    .line 17
    .line 18
    .line 19
    return p1
.end method

.method public onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    float-to-int v1, v1

    .line 10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    float-to-int v2, v2

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    if-eq v0, p1, :cond_1

    .line 19
    .line 20
    const/4 v3, 0x2

    .line 21
    if-eq v0, v3, :cond_0

    .line 22
    .line 23
    const/4 v3, 0x3

    .line 24
    if-eq v0, v3, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->P:I

    .line 28
    .line 29
    sub-int/2addr v1, v0

    .line 30
    iget v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->Q:I

    .line 31
    .line 32
    sub-int/2addr v2, v0

    .line 33
    invoke-virtual {p0, v1, v2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->i0(II)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->P:I

    .line 38
    .line 39
    sub-int/2addr v1, v0

    .line 40
    iget v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->Q:I

    .line 41
    .line 42
    sub-int/2addr v2, v0

    .line 43
    invoke-virtual {p0, v1, v2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->i0(II)V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->Z()V

    .line 47
    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    iput v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->Q:I

    .line 51
    .line 52
    iput v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->P:I

    .line 53
    .line 54
    :goto_0
    return p1

    .line 55
    :cond_2
    invoke-direct {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->V(Landroid/view/MotionEvent;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    return p0
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-direct {p0, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->a0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method protected onFinishInflate()V
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getThemeRes()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const v2, 0x7f040781

    .line 15
    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setForegroundTintList(Landroid/content/res/ColorStateList;)V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Landroid/view/ViewGroup;

    .line 34
    .line 35
    :goto_0
    const/4 v2, 0x4

    .line 36
    if-ge v0, v2, :cond_0

    .line 37
    .line 38
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->j:[Landroid/view/View;

    .line 39
    .line 40
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    aput-object v3, v2, v0

    .line 45
    .line 46
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->j:[Landroid/view/View;

    .line 47
    .line 48
    aget-object v2, v2, v0

    .line 49
    .line 50
    add-int/lit8 v0, v0, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    return-void
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-static {p2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->d0(I)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, 0x0

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Lcom/android/launcher3/a;->close(Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->requestFocus()Z

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    return p2
.end method

.method protected onLayout(ZIIII)V
    .locals 1

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    sget-boolean p1, Lcom/android/launcher3/N5;->e:Z

    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    :goto_0
    const/4 p2, 0x4

    .line 10
    if-ge p1, p2, :cond_0

    .line 11
    .line 12
    iget-object p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->j:[Landroid/view/View;

    .line 13
    .line 14
    aget-object p2, p2, p1

    .line 15
    .line 16
    iget-object p3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->k:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p3

    .line 22
    check-cast p3, Landroid/graphics/Rect;

    .line 23
    .line 24
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    .line 25
    .line 26
    .line 27
    move-result p4

    .line 28
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    .line 29
    .line 30
    .line 31
    move-result p5

    .line 32
    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    invoke-virtual {p3, p4, p5, v0, p2}, Landroid/graphics/Rect;->set(IIII)V

    .line 41
    .line 42
    .line 43
    add-int/lit8 p1, p1, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->k:Ljava/util/List;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setSystemGestureExclusionRects(Ljava/util/List;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method
