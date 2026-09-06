.class public Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;
.super Lcom/android/launcher3/folder/FolderIcon;
.source "TransformFolderIcon.java"

# interfaces
.implements Lcom/android/launcher3/n0;
.implements Lcom/android/launcher3/m0;
.implements Lcom/android/launcher3/dragndrop/j$b;
.implements Lcom/android/launcher3/blur/c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;,
        Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$n;
    }
.end annotation


# static fields
.field public static final B0:I

.field private static final C0:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static final D0:[I

.field private static final E0:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private A0:Landroid/graphics/Rect;

.field private a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

.field private b0:Lcom/android/launcher3/C2;

.field private c0:Landroid/graphics/drawable/Drawable;

.field private d0:Z

.field private final e0:[F

.field public f0:Lcom/android/launcher3/CellLayout;

.field public g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

.field private h0:Lcom/android/launcher3/Workspace;

.field private i0:Landroid/view/View;

.field private j0:Lcom/android/launcher3/blur/a;

.field public k0:Z

.field private l0:I

.field private m0:I

.field private n0:I

.field private o0:Landroid/view/View;

.field private p0:Z

.field private q0:Z

.field private final r0:Lcom/android/launcher3/c;

.field private final s0:Lcom/android/launcher3/c;

.field private final t0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private u0:Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field v0:Lcom/android/launcher3/L4;

.field w0:Lcom/android/launcher3/L4;

.field x0:Lcom/android/launcher3/L4;

.field private y0:Z

.field private z0:Landroid/graphics/drawable/Drawable;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x4

    .line 10
    :goto_0
    sput v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->B0:I

    .line 11
    .line 12
    new-instance v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$e;

    .line 13
    .line 14
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 15
    .line 16
    const-string v2, "dotScale"

    .line 17
    .line 18
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$e;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    sput-object v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->C0:Landroid/util/Property;

    .line 22
    .line 23
    const/4 v0, 0x2

    .line 24
    new-array v0, v0, [I

    .line 25
    .line 26
    sput-object v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->D0:[I

    .line 27
    .line 28
    new-instance v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$l;

    .line 29
    .line 30
    invoke-direct {v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$l;-><init>()V

    .line 31
    .line 32
    .line 33
    sput-object v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->E0:Ljava/util/Comparator;

    .line 34
    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/folder/FolderIcon;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 5
    .line 6
    invoke-direct {p2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    iput-boolean p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->d0:Z

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    new-array v0, v0, [F

    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->e0:[F

    .line 18
    .line 19
    iput-boolean p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->k0:Z

    .line 20
    .line 21
    iput-boolean p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->q0:Z

    .line 22
    .line 23
    new-instance v0, Lcom/android/launcher3/c;

    .line 24
    .line 25
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, v1}, Lcom/android/launcher3/c;-><init>(Landroid/os/Looper;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->r0:Lcom/android/launcher3/c;

    .line 33
    .line 34
    new-instance v0, Lcom/android/launcher3/c;

    .line 35
    .line 36
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-direct {v0, v1}, Lcom/android/launcher3/c;-><init>(Landroid/os/Looper;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->s0:Lcom/android/launcher3/c;

    .line 44
    .line 45
    new-instance v0, Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->t0:Ljava/util/ArrayList;

    .line 51
    .line 52
    new-instance v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$h;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$h;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->v0:Lcom/android/launcher3/L4;

    .line 58
    .line 59
    new-instance v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$i;

    .line 60
    .line 61
    invoke-direct {v0, p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$i;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V

    .line 62
    .line 63
    .line 64
    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->w0:Lcom/android/launcher3/L4;

    .line 65
    .line 66
    new-instance v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$j;

    .line 67
    .line 68
    invoke-direct {v0, p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$j;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V

    .line 69
    .line 70
    .line 71
    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->x0:Lcom/android/launcher3/L4;

    .line 72
    .line 73
    iput-boolean p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->y0:Z

    .line 74
    .line 75
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iput-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 80
    .line 81
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-static {p1, v0, p2}, Lx1/O;->D(Landroid/content/Context;Landroid/content/res/Resources;Z)V

    .line 90
    .line 91
    .line 92
    invoke-direct {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->e1()V

    .line 93
    .line 94
    .line 95
    invoke-static {}, Lx1/O;->k1()Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-eqz p1, :cond_0

    .line 100
    .line 101
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setDefaultFocusHighlightEnabled(Z)V

    .line 102
    .line 103
    .line 104
    :cond_0
    return-void
.end method

.method public static synthetic A0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->n1(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic B0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->l1(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic C0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->z0:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic D0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->n0:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic E0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->l0:I

    .line 2
    .line 3
    return p0
.end method

.method public static E1(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/p;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    if-eqz p0, :cond_3

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-boolean v0, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 17
    .line 18
    if-eqz v0, :cond_3

    .line 19
    .line 20
    invoke-static {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a1(Lcom/android/launcher3/views/k;)Landroid/graphics/Point;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget v0, v0, Landroid/graphics/Point;->x:I

    .line 25
    .line 26
    invoke-static {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a1(Lcom/android/launcher3/views/k;)Landroid/graphics/Point;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 31
    .line 32
    iget v1, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 33
    .line 34
    const/4 v2, 0x2

    .line 35
    if-ne v1, v2, :cond_1

    .line 36
    .line 37
    iget v1, p1, Lcom/android/launcher3/model/data/p;->k:I

    .line 38
    .line 39
    if-eq v1, v0, :cond_1

    .line 40
    .line 41
    iput v0, p1, Lcom/android/launcher3/model/data/p;->k:I

    .line 42
    .line 43
    :cond_1
    iget v1, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 44
    .line 45
    if-ne v1, v2, :cond_2

    .line 46
    .line 47
    iget v1, p1, Lcom/android/launcher3/model/data/p;->l:I

    .line 48
    .line 49
    if-eq v1, p0, :cond_2

    .line 50
    .line 51
    iput p0, p1, Lcom/android/launcher3/model/data/p;->l:I

    .line 52
    .line 53
    :cond_2
    iput v0, p1, Lcom/android/launcher3/model/data/p;->m:I

    .line 54
    .line 55
    iput p0, p1, Lcom/android/launcher3/model/data/p;->n:I

    .line 56
    .line 57
    :cond_3
    :goto_0
    return-void
.end method

.method static bridge synthetic F0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->z0:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic G0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->n0:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic H0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->T0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic I0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Landroid/animation/Animator;)Landroid/animation/Animator;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/FolderIcon;->A:Landroid/animation/Animator;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic J0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic K0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method private N0()V
    .locals 0

    .line 1
    return-void
.end method

.method private P0()V
    .locals 14

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b1(I)Lcom/android/launcher3/BubbleTextView;

    .line 3
    .line 4
    .line 5
    move-result-object v7

    .line 6
    invoke-virtual {v7}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    check-cast v2, Lcom/android/launcher3/model/data/I;

    .line 11
    .line 12
    new-instance v3, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v4, "doBefore4SmallIconScaleMinAnimWhenDrop title="

    .line 18
    .line 19
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object v2, v2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 23
    .line 24
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    const-string v3, "TransformFolderIcon"

    .line 32
    .line 33
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-interface {v2}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Lcom/android/launcher3/CellLayout;

    .line 45
    .line 46
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    iget-object v4, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 51
    .line 52
    iget v4, v4, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 53
    .line 54
    mul-int/2addr v3, v4

    .line 55
    iget-object v4, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 56
    .line 57
    invoke-virtual {v4}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    iget-object v5, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 62
    .line 63
    iget v5, v5, Lcom/android/launcher3/model/data/p;->k:I

    .line 64
    .line 65
    mul-int/2addr v4, v5

    .line 66
    sub-int/2addr v3, v4

    .line 67
    iget-object v4, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 68
    .line 69
    iget-object v4, v4, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    .line 70
    .line 71
    iget v4, v4, Landroid/graphics/Point;->x:I

    .line 72
    .line 73
    add-int/lit8 v5, v5, -0x1

    .line 74
    .line 75
    mul-int/2addr v4, v5

    .line 76
    sub-int/2addr v3, v4

    .line 77
    int-to-float v3, v3

    .line 78
    const/high16 v4, 0x40000000    # 2.0f

    .line 79
    .line 80
    div-float/2addr v3, v4

    .line 81
    float-to-int v3, v3

    .line 82
    iget-object v5, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 83
    .line 84
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    iget-boolean v5, v5, Lcom/android/launcher3/X3;->B0:Z

    .line 89
    .line 90
    if-eqz v5, :cond_0

    .line 91
    .line 92
    iget-object v5, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 93
    .line 94
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    iget v5, v5, Lcom/android/launcher3/X3;->u0:I

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_0
    move v5, v0

    .line 102
    :goto_0
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    iget-object v6, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 107
    .line 108
    iget v6, v6, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 109
    .line 110
    mul-int/2addr v2, v6

    .line 111
    iget-object v6, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 112
    .line 113
    invoke-virtual {v6}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 114
    .line 115
    .line 116
    move-result v6

    .line 117
    iget-object v8, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 118
    .line 119
    iget v8, v8, Lcom/android/launcher3/model/data/p;->l:I

    .line 120
    .line 121
    mul-int/2addr v6, v8

    .line 122
    sub-int/2addr v2, v6

    .line 123
    iget-object v6, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 124
    .line 125
    iget-object v6, v6, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    .line 126
    .line 127
    iget v6, v6, Landroid/graphics/Point;->y:I

    .line 128
    .line 129
    add-int/lit8 v8, v8, -0x1

    .line 130
    .line 131
    mul-int/2addr v6, v8

    .line 132
    sub-int/2addr v2, v6

    .line 133
    sub-int/2addr v2, v5

    .line 134
    int-to-float v2, v2

    .line 135
    div-float/2addr v2, v4

    .line 136
    float-to-int v2, v2

    .line 137
    iget-object v5, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 138
    .line 139
    invoke-virtual {v5}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 140
    .line 141
    .line 142
    move-result v5

    .line 143
    iget-object v6, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 144
    .line 145
    iget-object v6, v6, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    .line 146
    .line 147
    iget v6, v6, Landroid/graphics/Point;->x:I

    .line 148
    .line 149
    add-int/2addr v5, v6

    .line 150
    iget-object v6, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 151
    .line 152
    iget v6, v6, Lcom/android/launcher3/model/data/p;->k:I

    .line 153
    .line 154
    add-int/lit8 v6, v6, -0x1

    .line 155
    .line 156
    mul-int/2addr v5, v6

    .line 157
    add-int/2addr v3, v5

    .line 158
    iget-object v5, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 159
    .line 160
    invoke-virtual {v5}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 161
    .line 162
    .line 163
    move-result v5

    .line 164
    iget-object v6, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 165
    .line 166
    iget-object v6, v6, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    .line 167
    .line 168
    iget v6, v6, Landroid/graphics/Point;->y:I

    .line 169
    .line 170
    add-int/2addr v5, v6

    .line 171
    iget-object v6, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 172
    .line 173
    iget v6, v6, Lcom/android/launcher3/model/data/p;->l:I

    .line 174
    .line 175
    add-int/lit8 v6, v6, -0x1

    .line 176
    .line 177
    mul-int/2addr v5, v6

    .line 178
    add-int/2addr v2, v5

    .line 179
    iget-object v5, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 180
    .line 181
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 182
    .line 183
    .line 184
    move-result-object v5

    .line 185
    iget-boolean v5, v5, Lcom/android/launcher3/X3;->B0:Z

    .line 186
    .line 187
    if-eqz v5, :cond_1

    .line 188
    .line 189
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getFolderIconSize()I

    .line 190
    .line 191
    .line 192
    move-result v5

    .line 193
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getFinalItemSize()I

    .line 194
    .line 195
    .line 196
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getFolderFinalIconSize()I

    .line 197
    .line 198
    .line 199
    move-result v6

    .line 200
    goto :goto_1

    .line 201
    :cond_1
    iget-object v5, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 202
    .line 203
    invoke-virtual {v5}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 204
    .line 205
    .line 206
    move-result-object v5

    .line 207
    const v6, 0x7f070aa4

    .line 208
    .line 209
    .line 210
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 211
    .line 212
    .line 213
    move-result v5

    .line 214
    iget-object v6, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 215
    .line 216
    invoke-virtual {v6}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 217
    .line 218
    .line 219
    move-result-object v6

    .line 220
    const v8, 0x7f070aad

    .line 221
    .line 222
    .line 223
    invoke-virtual {v6, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 224
    .line 225
    .line 226
    iget-object v6, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 227
    .line 228
    invoke-virtual {v6}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 229
    .line 230
    .line 231
    move-result-object v6

    .line 232
    const v8, 0x7f070aab

    .line 233
    .line 234
    .line 235
    invoke-virtual {v6, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 236
    .line 237
    .line 238
    move-result v6

    .line 239
    :goto_1
    iget-object v8, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 240
    .line 241
    invoke-virtual {v8}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 242
    .line 243
    .line 244
    move-result v8

    .line 245
    sub-int/2addr v8, v5

    .line 246
    int-to-float v8, v8

    .line 247
    div-float/2addr v8, v4

    .line 248
    float-to-int v8, v8

    .line 249
    iget-object v9, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 250
    .line 251
    invoke-virtual {v9}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 252
    .line 253
    .line 254
    move-result v9

    .line 255
    sub-int/2addr v9, v5

    .line 256
    int-to-float v9, v9

    .line 257
    div-float/2addr v9, v4

    .line 258
    float-to-int v4, v9

    .line 259
    iget-object v9, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 260
    .line 261
    invoke-virtual {v9}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 262
    .line 263
    .line 264
    iget-object v9, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 265
    .line 266
    invoke-virtual {v9}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 267
    .line 268
    .line 269
    new-instance v9, Landroid/graphics/Rect;

    .line 270
    .line 271
    invoke-direct {v9}, Landroid/graphics/Rect;-><init>()V

    .line 272
    .line 273
    .line 274
    iget-object v10, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 275
    .line 276
    invoke-virtual {v10}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 277
    .line 278
    .line 279
    move-result-object v10

    .line 280
    invoke-virtual {v10, p0, v9}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 281
    .line 282
    .line 283
    move-result v10

    .line 284
    new-instance v11, Landroid/graphics/Rect;

    .line 285
    .line 286
    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    .line 287
    .line 288
    .line 289
    iget-object v12, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 290
    .line 291
    invoke-virtual {v12}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 292
    .line 293
    .line 294
    move-result-object v12

    .line 295
    invoke-virtual {v12, v7, v11}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 296
    .line 297
    .line 298
    new-instance v12, Landroid/graphics/Rect;

    .line 299
    .line 300
    invoke-direct {v12, v0, v0, v6, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 301
    .line 302
    .line 303
    iget v6, v11, Landroid/graphics/Rect;->left:I

    .line 304
    .line 305
    iget v13, v9, Landroid/graphics/Rect;->left:I

    .line 306
    .line 307
    sub-int/2addr v6, v13

    .line 308
    int-to-float v6, v6

    .line 309
    div-float/2addr v6, v10

    .line 310
    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    .line 311
    .line 312
    .line 313
    move-result v6

    .line 314
    iget v11, v11, Landroid/graphics/Rect;->top:I

    .line 315
    .line 316
    iget v9, v9, Landroid/graphics/Rect;->top:I

    .line 317
    .line 318
    sub-int/2addr v11, v9

    .line 319
    int-to-float v9, v11

    .line 320
    div-float/2addr v9, v10

    .line 321
    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    .line 322
    .line 323
    .line 324
    move-result v9

    .line 325
    invoke-virtual {v12, v6, v9}, Landroid/graphics/Rect;->offset(II)V

    .line 326
    .line 327
    .line 328
    new-instance v6, Landroid/graphics/Rect;

    .line 329
    .line 330
    invoke-direct {v6, v0, v0, v5, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 331
    .line 332
    .line 333
    invoke-virtual {v6, v3, v2}, Landroid/graphics/Rect;->offset(II)V

    .line 334
    .line 335
    .line 336
    invoke-virtual {v6, v8, v4}, Landroid/graphics/Rect;->offset(II)V

    .line 337
    .line 338
    .line 339
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 340
    .line 341
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 342
    .line 343
    .line 344
    move-result-object v0

    .line 345
    iget-boolean v0, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 346
    .line 347
    if-eqz v0, :cond_2

    .line 348
    .line 349
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 350
    .line 351
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 352
    .line 353
    iget-object v3, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 354
    .line 355
    iget v4, v3, Lcom/android/launcher3/model/data/p;->k:I

    .line 356
    .line 357
    iget v3, v3, Lcom/android/launcher3/model/data/p;->l:I

    .line 358
    .line 359
    mul-int/2addr v4, v3

    .line 360
    add-int/lit8 v4, v4, -0x1

    .line 361
    .line 362
    invoke-virtual {v0, p0, v2, v4}, Lcom/android/launcher3/folder/u0;->E0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)Landroid/graphics/Rect;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    invoke-virtual {v6, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 367
    .line 368
    .line 369
    :cond_2
    invoke-virtual {v12}, Landroid/graphics/Rect;->exactCenterX()F

    .line 370
    .line 371
    .line 372
    move-result v0

    .line 373
    invoke-virtual {v6}, Landroid/graphics/Rect;->exactCenterX()F

    .line 374
    .line 375
    .line 376
    move-result v2

    .line 377
    sub-float/2addr v0, v2

    .line 378
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 379
    .line 380
    .line 381
    move-result v3

    .line 382
    invoke-virtual {v12}, Landroid/graphics/Rect;->exactCenterY()F

    .line 383
    .line 384
    .line 385
    move-result v0

    .line 386
    invoke-virtual {v6}, Landroid/graphics/Rect;->exactCenterY()F

    .line 387
    .line 388
    .line 389
    move-result v2

    .line 390
    sub-float/2addr v0, v2

    .line 391
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 392
    .line 393
    .line 394
    move-result v4

    .line 395
    invoke-virtual {v12}, Landroid/graphics/Rect;->width()I

    .line 396
    .line 397
    .line 398
    move-result v0

    .line 399
    int-to-float v0, v0

    .line 400
    const/high16 v2, 0x3f800000    # 1.0f

    .line 401
    .line 402
    mul-float/2addr v0, v2

    .line 403
    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    .line 404
    .line 405
    .line 406
    move-result v2

    .line 407
    int-to-float v2, v2

    .line 408
    div-float/2addr v0, v2

    .line 409
    const/4 v2, 0x2

    .line 410
    new-array v2, v2, [F

    .line 411
    .line 412
    fill-array-data v2, :array_0

    .line 413
    .line 414
    .line 415
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 416
    .line 417
    .line 418
    move-result-object v8

    .line 419
    const-wide/16 v9, 0xc8

    .line 420
    .line 421
    invoke-virtual {v8, v9, v10}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 422
    .line 423
    .line 424
    sget-object v2, Lcom/android/launcher3/folder/u0;->Y:Landroid/view/animation/Interpolator;

    .line 425
    .line 426
    invoke-virtual {v8, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 427
    .line 428
    .line 429
    move-object v2, v6

    .line 430
    move v6, v0

    .line 431
    new-instance v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$a;

    .line 432
    .line 433
    const/high16 v5, 0x3f800000    # 1.0f

    .line 434
    .line 435
    move-object v1, p0

    .line 436
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$a;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Landroid/graphics/Rect;IIFF)V

    .line 437
    .line 438
    .line 439
    invoke-virtual {v8, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 440
    .line 441
    .line 442
    new-instance v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$b;

    .line 443
    .line 444
    invoke-direct {v0, p0, v7}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$b;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/BubbleTextView;)V

    .line 445
    .line 446
    .line 447
    invoke-virtual {v8, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 448
    .line 449
    .line 450
    invoke-virtual {v8}, Landroid/animation/ValueAnimator;->start()V

    .line 451
    .line 452
    .line 453
    return-void

    .line 454
    nop

    .line 455
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private Q0(Lcom/android/launcher3/n0$a;Z)V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    new-instance v3, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v4, "doDropIconToSmallItemsAnim title="

    .line 13
    .line 14
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    iget-object v4, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 18
    .line 19
    iget-object v4, v4, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 20
    .line 21
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v4, " isToStart="

    .line 25
    .line 26
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    const-string v4, "TransformFolderIcon"

    .line 37
    .line 38
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    iget-object v3, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 42
    .line 43
    new-instance v4, Landroid/graphics/Rect;

    .line 44
    .line 45
    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 46
    .line 47
    .line 48
    iget-object v5, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 49
    .line 50
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    iget-boolean v5, v5, Lcom/android/launcher3/X3;->B0:Z

    .line 55
    .line 56
    if-eqz v5, :cond_0

    .line 57
    .line 58
    iget-object v5, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 59
    .line 60
    invoke-virtual {v5}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->c()I

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    iget-object v6, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 65
    .line 66
    iget v6, v6, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    iget-object v5, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 70
    .line 71
    invoke-virtual {v5}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    const v6, 0x7f070aad

    .line 76
    .line 77
    .line 78
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    iget-object v6, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 83
    .line 84
    invoke-virtual {v6}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    const v7, 0x7f070aab

    .line 89
    .line 90
    .line 91
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 92
    .line 93
    .line 94
    move-result v6

    .line 95
    :goto_0
    iget-object v7, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 96
    .line 97
    invoke-virtual {v7}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 98
    .line 99
    .line 100
    move-result-object v7

    .line 101
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 102
    .line 103
    .line 104
    move-result v7

    .line 105
    iget-object v8, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 106
    .line 107
    iget v9, v8, Lcom/android/launcher3/model/data/p;->k:I

    .line 108
    .line 109
    iget v10, v8, Lcom/android/launcher3/model/data/p;->l:I

    .line 110
    .line 111
    mul-int/2addr v9, v10

    .line 112
    sub-int/2addr v7, v9

    .line 113
    add-int/lit8 v7, v7, 0x1

    .line 114
    .line 115
    const/4 v9, 0x0

    .line 116
    if-eqz v2, :cond_1

    .line 117
    .line 118
    move v7, v9

    .line 119
    :cond_1
    invoke-virtual {v8}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    iget-object v8, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 128
    .line 129
    iget v10, v8, Lcom/android/launcher3/model/data/p;->k:I

    .line 130
    .line 131
    iget v8, v8, Lcom/android/launcher3/model/data/p;->l:I

    .line 132
    .line 133
    mul-int/2addr v10, v8

    .line 134
    const/high16 v8, 0x40000000    # 2.0f

    .line 135
    .line 136
    if-le v2, v10, :cond_4

    .line 137
    .line 138
    iget-object v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 139
    .line 140
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    iget-object v5, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->i0:Landroid/view/View;

    .line 145
    .line 146
    invoke-virtual {v2, v5, v4}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 147
    .line 148
    .line 149
    move-result v2

    .line 150
    iget-object v5, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 151
    .line 152
    invoke-virtual {v5}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->k()Z

    .line 153
    .line 154
    .line 155
    move-result v5

    .line 156
    if-eqz v5, :cond_2

    .line 157
    .line 158
    sget v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->B0:I

    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_2
    const/4 v5, 0x2

    .line 162
    :goto_1
    int-to-float v10, v6

    .line 163
    mul-float/2addr v10, v2

    .line 164
    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    .line 165
    .line 166
    .line 167
    move-result v10

    .line 168
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    .line 169
    .line 170
    .line 171
    move-result v11

    .line 172
    mul-int v12, v10, v5

    .line 173
    .line 174
    sub-int/2addr v11, v12

    .line 175
    add-int/lit8 v12, v5, -0x1

    .line 176
    .line 177
    div-int/2addr v11, v12

    .line 178
    mul-int v12, v5, v5

    .line 179
    .line 180
    if-ge v7, v12, :cond_3

    .line 181
    .line 182
    rem-int v12, v7, v5

    .line 183
    .line 184
    add-int/2addr v10, v11

    .line 185
    mul-int/2addr v12, v10

    .line 186
    div-int v5, v7, v5

    .line 187
    .line 188
    mul-int/2addr v5, v10

    .line 189
    goto :goto_2

    .line 190
    :cond_3
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    .line 191
    .line 192
    .line 193
    move-result v5

    .line 194
    sub-int/2addr v5, v10

    .line 195
    int-to-float v5, v5

    .line 196
    div-float/2addr v5, v8

    .line 197
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 198
    .line 199
    .line 200
    move-result v12

    .line 201
    move v5, v12

    .line 202
    :goto_2
    invoke-virtual {v4, v12, v5}, Landroid/graphics/Rect;->offset(II)V

    .line 203
    .line 204
    .line 205
    goto/16 :goto_3

    .line 206
    .line 207
    :cond_4
    iget-object v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 208
    .line 209
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    iget-object v10, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 214
    .line 215
    invoke-virtual {v2, v10, v4}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 216
    .line 217
    .line 218
    move-result v2

    .line 219
    new-instance v10, Landroid/graphics/Rect;

    .line 220
    .line 221
    invoke-direct {v10, v4}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 222
    .line 223
    .line 224
    iget-object v11, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 225
    .line 226
    invoke-virtual {v11}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 227
    .line 228
    .line 229
    move-result v11

    .line 230
    iget-object v12, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 231
    .line 232
    iget-object v12, v12, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    .line 233
    .line 234
    iget v12, v12, Landroid/graphics/Point;->x:I

    .line 235
    .line 236
    add-int/2addr v11, v12

    .line 237
    iget-object v12, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 238
    .line 239
    iget v12, v12, Lcom/android/launcher3/model/data/p;->k:I

    .line 240
    .line 241
    add-int/lit8 v12, v12, -0x1

    .line 242
    .line 243
    mul-int/2addr v11, v12

    .line 244
    iget-object v12, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 245
    .line 246
    invoke-virtual {v12}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 247
    .line 248
    .line 249
    move-result v12

    .line 250
    add-int/2addr v11, v12

    .line 251
    iget-object v12, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 252
    .line 253
    invoke-virtual {v12}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 254
    .line 255
    .line 256
    move-result v12

    .line 257
    iget-object v13, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 258
    .line 259
    iget-object v13, v13, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    .line 260
    .line 261
    iget v13, v13, Landroid/graphics/Point;->y:I

    .line 262
    .line 263
    add-int/2addr v12, v13

    .line 264
    iget-object v13, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 265
    .line 266
    iget v13, v13, Lcom/android/launcher3/model/data/p;->l:I

    .line 267
    .line 268
    add-int/lit8 v13, v13, -0x1

    .line 269
    .line 270
    mul-int/2addr v12, v13

    .line 271
    iget-object v13, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 272
    .line 273
    invoke-virtual {v13}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 274
    .line 275
    .line 276
    move-result v13

    .line 277
    add-int/2addr v12, v13

    .line 278
    invoke-virtual {v4, v11, v12}, Landroid/graphics/Rect;->offset(II)V

    .line 279
    .line 280
    .line 281
    iget-object v11, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 282
    .line 283
    invoke-virtual {v11}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 284
    .line 285
    .line 286
    move-result v11

    .line 287
    sub-int/2addr v11, v5

    .line 288
    int-to-float v11, v11

    .line 289
    div-float/2addr v11, v8

    .line 290
    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    .line 291
    .line 292
    .line 293
    move-result v11

    .line 294
    iget-object v12, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 295
    .line 296
    invoke-virtual {v12}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 297
    .line 298
    .line 299
    move-result v12

    .line 300
    sub-int/2addr v12, v5

    .line 301
    int-to-float v12, v12

    .line 302
    div-float/2addr v12, v8

    .line 303
    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    .line 304
    .line 305
    .line 306
    move-result v12

    .line 307
    invoke-virtual {v4, v11, v12}, Landroid/graphics/Rect;->offset(II)V

    .line 308
    .line 309
    .line 310
    rem-int/lit8 v11, v7, 0x2

    .line 311
    .line 312
    sub-int/2addr v5, v6

    .line 313
    mul-int/2addr v11, v5

    .line 314
    div-int/lit8 v12, v7, 0x2

    .line 315
    .line 316
    mul-int/2addr v12, v5

    .line 317
    invoke-virtual {v4, v11, v12}, Landroid/graphics/Rect;->offset(II)V

    .line 318
    .line 319
    .line 320
    iget-object v5, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 321
    .line 322
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 323
    .line 324
    .line 325
    move-result-object v5

    .line 326
    invoke-virtual {v5}, Lcom/android/launcher3/q4;->a0()Z

    .line 327
    .line 328
    .line 329
    move-result v5

    .line 330
    if-eqz v5, :cond_5

    .line 331
    .line 332
    iget v5, v4, Landroid/graphics/Rect;->left:I

    .line 333
    .line 334
    iget v11, v10, Landroid/graphics/Rect;->left:I

    .line 335
    .line 336
    sub-int/2addr v5, v11

    .line 337
    int-to-float v5, v5

    .line 338
    mul-float/2addr v5, v2

    .line 339
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 340
    .line 341
    .line 342
    move-result v5

    .line 343
    iget v4, v4, Landroid/graphics/Rect;->top:I

    .line 344
    .line 345
    iget v11, v10, Landroid/graphics/Rect;->top:I

    .line 346
    .line 347
    sub-int/2addr v4, v11

    .line 348
    int-to-float v4, v4

    .line 349
    mul-float/2addr v4, v2

    .line 350
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    .line 351
    .line 352
    .line 353
    move-result v4

    .line 354
    invoke-virtual {v10, v5, v4}, Landroid/graphics/Rect;->offset(II)V

    .line 355
    .line 356
    .line 357
    new-instance v4, Landroid/graphics/Rect;

    .line 358
    .line 359
    invoke-direct {v4, v10}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 360
    .line 361
    .line 362
    :cond_5
    :goto_3
    new-instance v5, Landroid/graphics/Rect;

    .line 363
    .line 364
    invoke-direct {v5, v9, v9, v6, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 365
    .line 366
    .line 367
    iget-object v6, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 368
    .line 369
    invoke-virtual {v6}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 370
    .line 371
    .line 372
    move-result-object v6

    .line 373
    invoke-virtual {v6}, Lcom/android/launcher3/q4;->a0()Z

    .line 374
    .line 375
    .line 376
    move-result v6

    .line 377
    if-eqz v6, :cond_6

    .line 378
    .line 379
    new-instance v6, Landroid/graphics/Rect;

    .line 380
    .line 381
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    .line 382
    .line 383
    .line 384
    move-result v10

    .line 385
    int-to-float v10, v10

    .line 386
    mul-float/2addr v10, v2

    .line 387
    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    .line 388
    .line 389
    .line 390
    move-result v10

    .line 391
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 392
    .line 393
    .line 394
    move-result v5

    .line 395
    int-to-float v5, v5

    .line 396
    mul-float/2addr v5, v2

    .line 397
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 398
    .line 399
    .line 400
    move-result v2

    .line 401
    invoke-direct {v6, v9, v9, v10, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 402
    .line 403
    .line 404
    move-object v13, v6

    .line 405
    goto :goto_4

    .line 406
    :cond_6
    move-object v13, v5

    .line 407
    :goto_4
    iget v2, v4, Landroid/graphics/Rect;->left:I

    .line 408
    .line 409
    iget v4, v4, Landroid/graphics/Rect;->top:I

    .line 410
    .line 411
    invoke-virtual {v13, v2, v4}, Landroid/graphics/Rect;->offset(II)V

    .line 412
    .line 413
    .line 414
    invoke-direct {v0, v7}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b1(I)Lcom/android/launcher3/BubbleTextView;

    .line 415
    .line 416
    .line 417
    move-result-object v2

    .line 418
    new-instance v4, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$m;

    .line 419
    .line 420
    invoke-direct {v4, v0, v2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$m;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Landroid/view/View;)V

    .line 421
    .line 422
    .line 423
    if-eqz v2, :cond_7

    .line 424
    .line 425
    const/4 v5, 0x0

    .line 426
    invoke-virtual {v2, v5}, Landroid/view/View;->setAlpha(F)V

    .line 427
    .line 428
    .line 429
    :cond_7
    new-instance v5, Landroid/graphics/Rect;

    .line 430
    .line 431
    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 432
    .line 433
    .line 434
    iget-object v6, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 435
    .line 436
    invoke-virtual {v6}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 437
    .line 438
    .line 439
    move-result-object v6

    .line 440
    invoke-virtual {v6, v3, v5}, Lcom/android/launcher3/views/BaseDragLayer;->getViewRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 441
    .line 442
    .line 443
    invoke-virtual {v13}, Landroid/graphics/Rect;->width()I

    .line 444
    .line 445
    .line 446
    move-result v5

    .line 447
    int-to-float v5, v5

    .line 448
    const/high16 v6, 0x3f800000    # 1.0f

    .line 449
    .line 450
    mul-float/2addr v5, v6

    .line 451
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 452
    .line 453
    .line 454
    move-result v7

    .line 455
    invoke-virtual {v3}, Lcom/android/launcher3/dragndrop/v;->getBlurSizeOutline()I

    .line 456
    .line 457
    .line 458
    move-result v10

    .line 459
    sub-int/2addr v7, v10

    .line 460
    int-to-float v7, v7

    .line 461
    div-float v15, v5, v7

    .line 462
    .line 463
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 464
    .line 465
    .line 466
    move-result v5

    .line 467
    int-to-float v5, v5

    .line 468
    sub-float v7, v6, v15

    .line 469
    .line 470
    mul-float/2addr v5, v7

    .line 471
    div-float/2addr v5, v8

    .line 472
    invoke-virtual {v3}, Lcom/android/launcher3/dragndrop/v;->getBlurSizeOutline()I

    .line 473
    .line 474
    .line 475
    move-result v10

    .line 476
    int-to-float v10, v10

    .line 477
    mul-float/2addr v10, v15

    .line 478
    div-float/2addr v10, v8

    .line 479
    add-float/2addr v5, v10

    .line 480
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 481
    .line 482
    .line 483
    move-result v5

    .line 484
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 485
    .line 486
    .line 487
    move-result v10

    .line 488
    int-to-float v10, v10

    .line 489
    mul-float/2addr v10, v7

    .line 490
    div-float/2addr v10, v8

    .line 491
    invoke-virtual {v3}, Lcom/android/launcher3/dragndrop/v;->getBlurSizeOutline()I

    .line 492
    .line 493
    .line 494
    move-result v3

    .line 495
    int-to-float v3, v3

    .line 496
    mul-float/2addr v3, v15

    .line 497
    div-float/2addr v3, v8

    .line 498
    add-float/2addr v10, v3

    .line 499
    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    .line 500
    .line 501
    .line 502
    move-result v3

    .line 503
    rsub-int/lit8 v5, v5, 0x0

    .line 504
    .line 505
    sub-int/2addr v9, v3

    .line 506
    invoke-virtual {v13, v5, v9}, Landroid/graphics/Rect;->offset(II)V

    .line 507
    .line 508
    .line 509
    if-eqz v2, :cond_8

    .line 510
    .line 511
    :goto_5
    move v14, v6

    .line 512
    goto :goto_6

    .line 513
    :cond_8
    const/high16 v6, 0x3f000000    # 0.5f

    .line 514
    .line 515
    goto :goto_5

    .line 516
    :goto_6
    iget-object v0, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 517
    .line 518
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 519
    .line 520
    .line 521
    move-result-object v11

    .line 522
    iget-object v12, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 523
    .line 524
    const/16 v20, 0x0

    .line 525
    .line 526
    const/16 v21, 0x0

    .line 527
    .line 528
    const/16 v17, 0xc8

    .line 529
    .line 530
    const/16 v18, 0x0

    .line 531
    .line 532
    move/from16 v16, v15

    .line 533
    .line 534
    move-object/from16 v19, v4

    .line 535
    .line 536
    invoke-virtual/range {v11 .. v21}, Lcom/android/launcher3/dragndrop/DragLayer;->f(Lcom/android/launcher3/dragndrop/v;Landroid/graphics/Rect;FFFILandroid/view/animation/Interpolator;Ljava/lang/Runnable;ILandroid/view/View;)V

    .line 537
    .line 538
    .line 539
    return-void
.end method

.method private R0()V
    .locals 14

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b1(I)Lcom/android/launcher3/BubbleTextView;

    .line 3
    .line 4
    .line 5
    move-result-object v2

    .line 6
    invoke-virtual {v2}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v3

    .line 10
    check-cast v3, Lcom/android/launcher3/model/data/I;

    .line 11
    .line 12
    iget-object v4, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 13
    .line 14
    iget v5, v4, Lcom/android/launcher3/model/data/p;->k:I

    .line 15
    .line 16
    iget v4, v4, Lcom/android/launcher3/model/data/p;->l:I

    .line 17
    .line 18
    mul-int/2addr v5, v4

    .line 19
    const/4 v4, 0x2

    .line 20
    sub-int/2addr v5, v4

    .line 21
    invoke-direct {p0, v5}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->W0(I)Landroid/graphics/Point;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    iget-object v6, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 26
    .line 27
    iget v7, v5, Landroid/graphics/Point;->x:I

    .line 28
    .line 29
    iget v8, v5, Landroid/graphics/Point;->y:I

    .line 30
    .line 31
    invoke-virtual {v6, v7, v8}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    move-object v7, v6

    .line 36
    check-cast v7, Lcom/android/launcher3/BubbleTextView;

    .line 37
    .line 38
    new-instance v6, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v8, "doFirst4SmallIconMoveBeforeScaleAnim small.title="

    .line 44
    .line 45
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v3, v3, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 49
    .line 50
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v3, " endView="

    .line 54
    .line 55
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    const-string v6, "TransformFolderIcon"

    .line 70
    .line 71
    invoke-static {v6, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-interface {v3}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    check-cast v3, Lcom/android/launcher3/CellLayout;

    .line 83
    .line 84
    invoke-virtual {v3}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 85
    .line 86
    .line 87
    move-result v6

    .line 88
    iget-object v8, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 89
    .line 90
    iget v8, v8, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 91
    .line 92
    mul-int/2addr v6, v8

    .line 93
    iget-object v8, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 94
    .line 95
    invoke-virtual {v8}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 96
    .line 97
    .line 98
    move-result v8

    .line 99
    iget-object v9, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 100
    .line 101
    iget v9, v9, Lcom/android/launcher3/model/data/p;->k:I

    .line 102
    .line 103
    mul-int/2addr v8, v9

    .line 104
    sub-int/2addr v6, v8

    .line 105
    iget-object v8, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 106
    .line 107
    iget-object v8, v8, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    .line 108
    .line 109
    iget v8, v8, Landroid/graphics/Point;->x:I

    .line 110
    .line 111
    add-int/lit8 v9, v9, -0x1

    .line 112
    .line 113
    mul-int/2addr v8, v9

    .line 114
    sub-int/2addr v6, v8

    .line 115
    int-to-float v6, v6

    .line 116
    const/high16 v8, 0x40000000    # 2.0f

    .line 117
    .line 118
    div-float/2addr v6, v8

    .line 119
    float-to-int v6, v6

    .line 120
    iget-object v9, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 121
    .line 122
    invoke-virtual {v9}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 123
    .line 124
    .line 125
    move-result-object v9

    .line 126
    iget-boolean v9, v9, Lcom/android/launcher3/X3;->B0:Z

    .line 127
    .line 128
    if-eqz v9, :cond_0

    .line 129
    .line 130
    iget-object v9, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 131
    .line 132
    invoke-virtual {v9}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 133
    .line 134
    .line 135
    move-result-object v9

    .line 136
    iget v9, v9, Lcom/android/launcher3/X3;->u0:I

    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_0
    move v9, v0

    .line 140
    :goto_0
    invoke-virtual {v3}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    iget-object v10, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 145
    .line 146
    iget v10, v10, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 147
    .line 148
    mul-int/2addr v3, v10

    .line 149
    iget-object v10, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 150
    .line 151
    invoke-virtual {v10}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 152
    .line 153
    .line 154
    move-result v10

    .line 155
    iget-object v11, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 156
    .line 157
    iget v11, v11, Lcom/android/launcher3/model/data/p;->l:I

    .line 158
    .line 159
    mul-int/2addr v10, v11

    .line 160
    sub-int/2addr v3, v10

    .line 161
    iget-object v10, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 162
    .line 163
    iget-object v10, v10, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    .line 164
    .line 165
    iget v10, v10, Landroid/graphics/Point;->y:I

    .line 166
    .line 167
    add-int/lit8 v11, v11, -0x1

    .line 168
    .line 169
    mul-int/2addr v10, v11

    .line 170
    sub-int/2addr v3, v10

    .line 171
    sub-int/2addr v3, v9

    .line 172
    int-to-float v3, v3

    .line 173
    div-float/2addr v3, v8

    .line 174
    float-to-int v3, v3

    .line 175
    iget-object v9, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 176
    .line 177
    invoke-virtual {v9}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 178
    .line 179
    .line 180
    move-result v9

    .line 181
    iget-object v10, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 182
    .line 183
    iget-object v10, v10, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    .line 184
    .line 185
    iget v10, v10, Landroid/graphics/Point;->x:I

    .line 186
    .line 187
    add-int/2addr v9, v10

    .line 188
    iget v10, v5, Landroid/graphics/Point;->x:I

    .line 189
    .line 190
    mul-int/2addr v9, v10

    .line 191
    add-int/2addr v6, v9

    .line 192
    iget-object v9, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 193
    .line 194
    invoke-virtual {v9}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 195
    .line 196
    .line 197
    move-result v9

    .line 198
    iget-object v10, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 199
    .line 200
    iget-object v10, v10, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    .line 201
    .line 202
    iget v10, v10, Landroid/graphics/Point;->y:I

    .line 203
    .line 204
    add-int/2addr v9, v10

    .line 205
    iget v5, v5, Landroid/graphics/Point;->y:I

    .line 206
    .line 207
    mul-int/2addr v9, v5

    .line 208
    add-int/2addr v3, v9

    .line 209
    iget-object v5, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 210
    .line 211
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 212
    .line 213
    .line 214
    move-result-object v5

    .line 215
    iget-boolean v5, v5, Lcom/android/launcher3/X3;->B0:Z

    .line 216
    .line 217
    if-eqz v5, :cond_1

    .line 218
    .line 219
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getFolderIconSize()I

    .line 220
    .line 221
    .line 222
    move-result v5

    .line 223
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getFinalItemSize()I

    .line 224
    .line 225
    .line 226
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getFolderFinalIconSize()I

    .line 227
    .line 228
    .line 229
    move-result v9

    .line 230
    goto :goto_1

    .line 231
    :cond_1
    iget-object v5, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 232
    .line 233
    invoke-virtual {v5}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 234
    .line 235
    .line 236
    move-result-object v5

    .line 237
    const v9, 0x7f070aa4

    .line 238
    .line 239
    .line 240
    invoke-virtual {v5, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 241
    .line 242
    .line 243
    move-result v5

    .line 244
    iget-object v9, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 245
    .line 246
    invoke-virtual {v9}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 247
    .line 248
    .line 249
    move-result-object v9

    .line 250
    const v10, 0x7f070aad

    .line 251
    .line 252
    .line 253
    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 254
    .line 255
    .line 256
    iget-object v9, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 257
    .line 258
    invoke-virtual {v9}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 259
    .line 260
    .line 261
    move-result-object v9

    .line 262
    const v10, 0x7f070aab

    .line 263
    .line 264
    .line 265
    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 266
    .line 267
    .line 268
    move-result v9

    .line 269
    :goto_1
    iget-object v10, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 270
    .line 271
    invoke-virtual {v10}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 272
    .line 273
    .line 274
    move-result v10

    .line 275
    sub-int/2addr v10, v5

    .line 276
    int-to-float v10, v10

    .line 277
    div-float/2addr v10, v8

    .line 278
    float-to-int v10, v10

    .line 279
    iget-object v11, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 280
    .line 281
    invoke-virtual {v11}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 282
    .line 283
    .line 284
    move-result v11

    .line 285
    sub-int/2addr v11, v5

    .line 286
    int-to-float v11, v11

    .line 287
    div-float/2addr v11, v8

    .line 288
    float-to-int v8, v11

    .line 289
    iget-object v11, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 290
    .line 291
    invoke-virtual {v11}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 292
    .line 293
    .line 294
    iget-object v11, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 295
    .line 296
    invoke-virtual {v11}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 297
    .line 298
    .line 299
    new-instance v11, Landroid/graphics/Rect;

    .line 300
    .line 301
    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    .line 302
    .line 303
    .line 304
    iget-object v12, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 305
    .line 306
    invoke-virtual {v12}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 307
    .line 308
    .line 309
    move-result-object v12

    .line 310
    invoke-virtual {v12, p0, v11}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 311
    .line 312
    .line 313
    new-instance v12, Landroid/graphics/Rect;

    .line 314
    .line 315
    invoke-direct {v12}, Landroid/graphics/Rect;-><init>()V

    .line 316
    .line 317
    .line 318
    iget-object v13, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 319
    .line 320
    invoke-virtual {v13}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 321
    .line 322
    .line 323
    move-result-object v13

    .line 324
    invoke-virtual {v13, v2, v12}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 325
    .line 326
    .line 327
    new-instance v2, Landroid/graphics/Rect;

    .line 328
    .line 329
    invoke-direct {v2, v0, v0, v9, v9}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 330
    .line 331
    .line 332
    iget v9, v12, Landroid/graphics/Rect;->left:I

    .line 333
    .line 334
    iget v13, v11, Landroid/graphics/Rect;->left:I

    .line 335
    .line 336
    sub-int/2addr v9, v13

    .line 337
    iget v12, v12, Landroid/graphics/Rect;->top:I

    .line 338
    .line 339
    iget v11, v11, Landroid/graphics/Rect;->top:I

    .line 340
    .line 341
    sub-int/2addr v12, v11

    .line 342
    invoke-virtual {v2, v9, v12}, Landroid/graphics/Rect;->offset(II)V

    .line 343
    .line 344
    .line 345
    new-instance v9, Landroid/graphics/Rect;

    .line 346
    .line 347
    invoke-direct {v9, v0, v0, v5, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 348
    .line 349
    .line 350
    invoke-virtual {v9, v6, v3}, Landroid/graphics/Rect;->offset(II)V

    .line 351
    .line 352
    .line 353
    invoke-virtual {v9, v10, v8}, Landroid/graphics/Rect;->offset(II)V

    .line 354
    .line 355
    .line 356
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 357
    .line 358
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    iget-boolean v0, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 363
    .line 364
    if-eqz v0, :cond_2

    .line 365
    .line 366
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 367
    .line 368
    iget-object v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 369
    .line 370
    iget-object v5, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 371
    .line 372
    iget v6, v5, Lcom/android/launcher3/model/data/p;->k:I

    .line 373
    .line 374
    iget v5, v5, Lcom/android/launcher3/model/data/p;->l:I

    .line 375
    .line 376
    mul-int/2addr v6, v5

    .line 377
    add-int/lit8 v6, v6, -0x1

    .line 378
    .line 379
    invoke-virtual {v0, p0, v3, v6}, Lcom/android/launcher3/folder/u0;->E0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)Landroid/graphics/Rect;

    .line 380
    .line 381
    .line 382
    move-result-object v0

    .line 383
    invoke-virtual {v2, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 384
    .line 385
    .line 386
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 387
    .line 388
    iget-object v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 389
    .line 390
    iget-object v5, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 391
    .line 392
    iget v6, v5, Lcom/android/launcher3/model/data/p;->k:I

    .line 393
    .line 394
    iget v5, v5, Lcom/android/launcher3/model/data/p;->l:I

    .line 395
    .line 396
    mul-int/2addr v6, v5

    .line 397
    sub-int/2addr v6, v4

    .line 398
    invoke-virtual {v0, p0, v3, v6}, Lcom/android/launcher3/folder/u0;->E0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)Landroid/graphics/Rect;

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    invoke-virtual {v9, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 403
    .line 404
    .line 405
    :cond_2
    invoke-virtual {v9}, Landroid/graphics/Rect;->exactCenterX()F

    .line 406
    .line 407
    .line 408
    move-result v0

    .line 409
    invoke-virtual {v2}, Landroid/graphics/Rect;->exactCenterX()F

    .line 410
    .line 411
    .line 412
    move-result v3

    .line 413
    sub-float/2addr v0, v3

    .line 414
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 415
    .line 416
    .line 417
    move-result v3

    .line 418
    invoke-virtual {v9}, Landroid/graphics/Rect;->exactCenterY()F

    .line 419
    .line 420
    .line 421
    move-result v0

    .line 422
    invoke-virtual {v2}, Landroid/graphics/Rect;->exactCenterY()F

    .line 423
    .line 424
    .line 425
    move-result v5

    .line 426
    sub-float/2addr v0, v5

    .line 427
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 428
    .line 429
    .line 430
    move-result v0

    .line 431
    invoke-virtual {v9}, Landroid/graphics/Rect;->width()I

    .line 432
    .line 433
    .line 434
    move-result v5

    .line 435
    int-to-float v5, v5

    .line 436
    const/high16 v6, 0x3f800000    # 1.0f

    .line 437
    .line 438
    mul-float/2addr v5, v6

    .line 439
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 440
    .line 441
    .line 442
    move-result v6

    .line 443
    int-to-float v6, v6

    .line 444
    div-float v6, v5, v6

    .line 445
    .line 446
    new-array v4, v4, [F

    .line 447
    .line 448
    fill-array-data v4, :array_0

    .line 449
    .line 450
    .line 451
    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 452
    .line 453
    .line 454
    move-result-object v8

    .line 455
    const-wide/16 v4, 0xc8

    .line 456
    .line 457
    invoke-virtual {v8, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 458
    .line 459
    .line 460
    sget-object v4, Lcom/android/launcher3/folder/u0;->Y:Landroid/view/animation/Interpolator;

    .line 461
    .line 462
    invoke-virtual {v8, v4}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 463
    .line 464
    .line 465
    move v4, v0

    .line 466
    new-instance v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$c;

    .line 467
    .line 468
    const/high16 v5, 0x3f800000    # 1.0f

    .line 469
    .line 470
    move-object v1, p0

    .line 471
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$c;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Landroid/graphics/Rect;IIFF)V

    .line 472
    .line 473
    .line 474
    invoke-virtual {v8, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 475
    .line 476
    .line 477
    new-instance v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$d;

    .line 478
    .line 479
    invoke-direct {v0, p0, v7}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$d;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/BubbleTextView;)V

    .line 480
    .line 481
    .line 482
    invoke-virtual {v8, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 483
    .line 484
    .line 485
    invoke-virtual {v8}, Landroid/animation/ValueAnimator;->start()V

    .line 486
    .line 487
    .line 488
    return-void

    .line 489
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private S0(Lcom/android/launcher3/n0$a;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->Z0(Lcom/android/launcher3/n0$a;Ljava/util/ArrayList;)Landroid/util/Pair;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v1, "doFolderBgExpandAnim pair="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "TransformFolderIcon"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->q()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    iput-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->u0:Landroid/util/Pair;

    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 51
    .line 52
    iget-object v1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v1, Ljava/lang/Integer;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 61
    .line 62
    check-cast p1, Ljava/lang/Integer;

    .line 63
    .line 64
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    const/4 v2, 0x0

    .line 69
    invoke-virtual {v0, p0, v1, p1, v2}, Lcom/android/launcher3/folder/u0;->o0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;IIZ)V

    .line 70
    .line 71
    .line 72
    :cond_1
    :goto_0
    return-void
.end method

.method private T0()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v2, "doReplaceFolderWithFinalItem itemCount="

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "TransformFolderIcon"

    .line 29
    .line 30
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    if-le v0, v1, :cond_0

    .line 35
    .line 36
    goto/16 :goto_0

    .line 37
    .line 38
    :cond_0
    const/4 v3, 0x0

    .line 39
    if-ne v0, v1, :cond_3

    .line 40
    .line 41
    iget-object v4, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 42
    .line 43
    invoke-virtual {v4}, Lcom/android/launcher3/a;->isOpen()Z

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    const/4 v5, 0x0

    .line 48
    if-eqz v4, :cond_1

    .line 49
    .line 50
    iget-object v4, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 51
    .line 52
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    check-cast v4, Lcom/android/launcher3/model/data/y;

    .line 61
    .line 62
    invoke-static {v4}, Lcom/android/launcher3/folderbatch/g;->f(Lcom/android/launcher3/model/data/y;)Z

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    if-eqz v4, :cond_1

    .line 67
    .line 68
    goto/16 :goto_0

    .line 69
    .line 70
    :cond_1
    iget-object v4, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 71
    .line 72
    iget-object v6, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 73
    .line 74
    iget v7, v6, Lcom/android/launcher3/model/data/y;->container:I

    .line 75
    .line 76
    iget v6, v6, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 77
    .line 78
    invoke-virtual {v4, v7, v6}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    iget-object v6, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 83
    .line 84
    invoke-virtual {v6}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    move-object v7, v5

    .line 93
    check-cast v7, Lcom/android/launcher3/model/data/y;

    .line 94
    .line 95
    iput v1, v7, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 96
    .line 97
    iput v1, v7, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 98
    .line 99
    if-eqz v4, :cond_2

    .line 100
    .line 101
    iget-object v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 102
    .line 103
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->b()Lcom/android/launcher3/util/B0;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    iget-object v5, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 108
    .line 109
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    invoke-virtual {v3, v7, v5, v4}, Lcom/android/launcher3/util/B0;->d(Lcom/android/launcher3/model/data/y;Lz1/J3;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    :cond_2
    iget-object v4, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 118
    .line 119
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 120
    .line 121
    .line 122
    move-result-object v6

    .line 123
    iget-object v4, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 124
    .line 125
    iget v8, v4, Lcom/android/launcher3/model/data/y;->container:I

    .line 126
    .line 127
    iget v9, v4, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 128
    .line 129
    iget v10, v4, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 130
    .line 131
    iget v11, v4, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 132
    .line 133
    invoke-virtual/range {v6 .. v11}, Lz1/J3;->x(Lcom/android/launcher3/model/data/y;IIII)V

    .line 134
    .line 135
    .line 136
    iget-boolean v4, v7, Lcom/android/launcher3/model/data/y;->isChecked:Z

    .line 137
    .line 138
    if-eqz v4, :cond_3

    .line 139
    .line 140
    instance-of v4, v3, Lcom/android/launcher3/BubbleTextView;

    .line 141
    .line 142
    if-eqz v4, :cond_3

    .line 143
    .line 144
    const-string v4, "doReplaceFolderWithFinalItem refreshDraggingViewIfNecessary"

    .line 145
    .line 146
    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    .line 148
    .line 149
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 150
    .line 151
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    move-object v4, v3

    .line 156
    check-cast v4, Lcom/android/launcher3/BubbleTextView;

    .line 157
    .line 158
    invoke-virtual {v2, v4}, Lcom/android/launcher3/G4;->y(Lcom/android/launcher3/BubbleTextView;)V

    .line 159
    .line 160
    .line 161
    :cond_3
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 162
    .line 163
    iget-object v4, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 164
    .line 165
    invoke-virtual {v2, p0, v4, v1}, Lcom/android/launcher3/C2;->n4(Landroid/view/View;Lcom/android/launcher3/model/data/y;Z)Z

    .line 166
    .line 167
    .line 168
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 169
    .line 170
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    invoke-virtual {v2, p0}, Lcom/android/launcher3/dragndrop/j;->O(Lcom/android/launcher3/n0;)V

    .line 175
    .line 176
    .line 177
    if-eqz v3, :cond_4

    .line 178
    .line 179
    iget-object v2, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 180
    .line 181
    iput v1, v2, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 182
    .line 183
    iput v1, v2, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 184
    .line 185
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 186
    .line 187
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    iget-object v4, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 192
    .line 193
    invoke-interface {v2, v3, v4}, Lcom/android/launcher3/M6;->i(Landroid/view/View;Lcom/android/launcher3/model/data/y;)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {v3}, Landroid/view/View;->requestFocus()Z

    .line 197
    .line 198
    .line 199
    :cond_4
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 200
    .line 201
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    invoke-virtual {v2, v3}, Lcom/android/launcher3/G4;->C(Lcom/android/launcher3/folder/Folder;)V

    .line 210
    .line 211
    .line 212
    if-nez v0, :cond_5

    .line 213
    .line 214
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 215
    .line 216
    const/16 v2, 0x20

    .line 217
    .line 218
    invoke-virtual {v0, v2}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    if-nez v0, :cond_5

    .line 223
    .line 224
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->h0:Lcom/android/launcher3/Workspace;

    .line 225
    .line 226
    invoke-virtual {p0, v1}, Lcom/android/launcher3/Workspace;->F2(Z)V

    .line 227
    .line 228
    .line 229
    :cond_5
    :goto_0
    return-void
.end method

.method private U0(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    invoke-static {}, Lx1/Y;->i()Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "TransformFolderIcon"

    .line 10
    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lx1/Y;->j(Landroid/content/Context;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_3

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->l:Lcom/android/launcher3/BubbleTextView;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    goto/16 :goto_1

    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v2, p0, Lcom/android/launcher3/folder/FolderIcon;->l:Lcom/android/launcher3/BubbleTextView;

    .line 40
    .line 41
    invoke-virtual {v2}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    const/4 v3, 0x0

    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    iget-object v2, p0, Lcom/android/launcher3/folder/FolderIcon;->l:Lcom/android/launcher3/BubbleTextView;

    .line 49
    .line 50
    invoke-virtual {v2}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v2, v3}, Landroid/text/Layout;->getLineWidth(I)F

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    float-to-int v2, v2

    .line 59
    goto :goto_0

    .line 60
    :cond_1
    move v2, v3

    .line 61
    :goto_0
    iget-object v4, p0, Lcom/android/launcher3/folder/FolderIcon;->l:Lcom/android/launcher3/BubbleTextView;

    .line 62
    .line 63
    invoke-virtual {v4}, Landroid/widget/TextView;->getWidth()I

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    sub-int/2addr v4, v2

    .line 68
    div-int/lit8 v4, v4, 0x2

    .line 69
    .line 70
    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollX()I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    int-to-float v6, v4

    .line 83
    int-to-float v7, v5

    .line 84
    invoke-virtual {p1, v6, v7}, Landroid/graphics/Canvas;->translate(FF)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 88
    .line 89
    .line 90
    move-result-object v6

    .line 91
    const v7, 0x7f070363

    .line 92
    .line 93
    .line 94
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimension(I)F

    .line 95
    .line 96
    .line 97
    move-result v6

    .line 98
    float-to-int v6, v6

    .line 99
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 100
    .line 101
    .line 102
    move-result-object v7

    .line 103
    const v8, 0x7f070180

    .line 104
    .line 105
    .line 106
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimension(I)F

    .line 107
    .line 108
    .line 109
    move-result v7

    .line 110
    float-to-int v7, v7

    .line 111
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 112
    .line 113
    .line 114
    move-result v8

    .line 115
    iget v9, v0, Lcom/android/launcher3/X3;->t0:I

    .line 116
    .line 117
    sub-int/2addr v8, v9

    .line 118
    add-int/2addr v8, v6

    .line 119
    int-to-float v8, v8

    .line 120
    iget-object v9, p0, Lcom/android/launcher3/folder/FolderIcon;->l:Lcom/android/launcher3/BubbleTextView;

    .line 121
    .line 122
    invoke-virtual {v9}, Landroid/widget/TextView;->getTextSize()F

    .line 123
    .line 124
    .line 125
    move-result v9

    .line 126
    int-to-float v10, v6

    .line 127
    sub-float/2addr v9, v10

    .line 128
    const/high16 v10, 0x40000000    # 2.0f

    .line 129
    .line 130
    div-float/2addr v9, v10

    .line 131
    sub-float/2addr v8, v9

    .line 132
    float-to-int v8, v8

    .line 133
    iget v0, v0, Lcom/android/launcher3/X3;->q0:I

    .line 134
    .line 135
    add-int/2addr v0, v2

    .line 136
    sub-int/2addr v0, v6

    .line 137
    sub-int/2addr v0, v7

    .line 138
    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    const v3, 0x7f0810ef

    .line 147
    .line 148
    .line 149
    invoke-static {v2, v3}, Lz/a;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-static {p0}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    const v7, 0x7f040781

    .line 166
    .line 167
    .line 168
    invoke-static {v3, v7, p0}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 169
    .line 170
    .line 171
    move-result p0

    .line 172
    if-nez v2, :cond_2

    .line 173
    .line 174
    const-string p0, "drawPrivateFolderIconIfNecessary return because imgAble == null"

    .line 175
    .line 176
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    .line 178
    .line 179
    return-void

    .line 180
    :cond_2
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 181
    .line 182
    invoke-virtual {v2, p0, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 183
    .line 184
    .line 185
    add-int p0, v0, v6

    .line 186
    .line 187
    add-int/2addr v6, v8

    .line 188
    invoke-virtual {v2, v0, v8, p0, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 192
    .line 193
    .line 194
    neg-int p0, v4

    .line 195
    int-to-float p0, p0

    .line 196
    neg-int v0, v5

    .line 197
    int-to-float v0, v0

    .line 198
    invoke-virtual {p1, p0, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 199
    .line 200
    .line 201
    return-void

    .line 202
    :cond_3
    :goto_1
    const-string p0, "drawPrivateFolderIconIfNecessary return"

    .line 203
    .line 204
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    .line 206
    .line 207
    return-void
.end method

.method private W0(I)Landroid/graphics/Point;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    iget v1, v0, Lcom/android/launcher3/model/data/p;->k:I

    .line 4
    .line 5
    iget v0, v0, Lcom/android/launcher3/model/data/p;->l:I

    .line 6
    .line 7
    mul-int/2addr v1, v0

    .line 8
    if-lt p1, v1, :cond_0

    .line 9
    .line 10
    new-instance p1, Landroid/graphics/Point;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 13
    .line 14
    iget v0, p0, Lcom/android/launcher3/model/data/p;->k:I

    .line 15
    .line 16
    add-int/lit8 v0, v0, -0x1

    .line 17
    .line 18
    iget p0, p0, Lcom/android/launcher3/model/data/p;->l:I

    .line 19
    .line 20
    add-int/lit8 p0, p0, -0x1

    .line 21
    .line 22
    invoke-direct {p1, v0, p0}, Landroid/graphics/Point;-><init>(II)V

    .line 23
    .line 24
    .line 25
    return-object p1

    .line 26
    :cond_0
    new-instance v0, Landroid/graphics/Point;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 29
    .line 30
    iget p0, p0, Lcom/android/launcher3/model/data/p;->k:I

    .line 31
    .line 32
    rem-int v1, p1, p0

    .line 33
    .line 34
    div-int/2addr p1, p0

    .line 35
    invoke-direct {v0, v1, p1}, Landroid/graphics/Point;-><init>(II)V

    .line 36
    .line 37
    .line 38
    return-object v0
.end method

.method public static X0(Lcom/android/launcher3/CellLayout;IILcom/android/launcher3/model/data/y;)Landroid/util/Pair;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/CellLayout;",
            "II",
            "Lcom/android/launcher3/model/data/y;",
            ")",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Landroid/util/Pair;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-direct {p0, p1, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public static Y0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)Lcom/android/launcher3/BubbleTextView;
    .locals 2

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0, v0}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    instance-of v1, p0, Lcom/android/launcher3/BubbleTextView;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    check-cast p0, Lcom/android/launcher3/BubbleTextView;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    instance-of v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    check-cast p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->getAllBubbleTextViewChildList()Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Lcom/android/launcher3/BubbleTextView;

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_1
    const/4 p0, 0x0

    .line 41
    return-object p0
.end method

.method public static a1(Lcom/android/launcher3/views/k;)Landroid/graphics/Point;
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x4

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    if-eqz p0, :cond_2

    .line 9
    .line 10
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-boolean v0, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 23
    .line 24
    const/4 v2, 0x3

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    move v0, v1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move v0, v2

    .line 30
    :goto_0
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->N0:Z

    .line 35
    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    move v1, v2

    .line 39
    :cond_1
    new-instance p0, Landroid/graphics/Point;

    .line 40
    .line 41
    invoke-direct {p0, v0, v1}, Landroid/graphics/Point;-><init>(II)V

    .line 42
    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_2
    new-instance p0, Landroid/graphics/Point;

    .line 46
    .line 47
    const/4 v0, 0x2

    .line 48
    invoke-direct {p0, v1, v0}, Landroid/graphics/Point;-><init>(II)V

    .line 49
    .line 50
    .line 51
    return-object p0
.end method

.method private b1(I)Lcom/android/launcher3/BubbleTextView;
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->getAllBubbleTextViewChildList()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    const/4 v1, 0x0

    .line 9
    move-object v2, v1

    .line 10
    move v1, v0

    .line 11
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-ge v0, v3, :cond_2

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    instance-of v3, v3, Lcom/android/launcher3/BubbleTextView;

    .line 22
    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    if-ne v1, p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lcom/android/launcher3/BubbleTextView;

    .line 32
    .line 33
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 34
    .line 35
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    return-object v2
.end method

.method private c1(Lcom/android/launcher3/n0$a;[F)I
    .locals 7

    .line 1
    invoke-virtual {p1, p2}, Lcom/android/launcher3/n0$a;->a([F)[F

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    aget v1, p1, p2

    .line 9
    .line 10
    float-to-int v1, v1

    .line 11
    const/4 v6, 0x1

    .line 12
    aget p1, p1, v6

    .line 13
    .line 14
    float-to-int v2, p1

    .line 15
    sget-object v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->D0:[I

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    const/4 v4, 0x1

    .line 19
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/CellLayout;->G(IIII[I)[I

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->isLayoutRtl()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    aget v0, v5, p2

    .line 39
    .line 40
    sub-int/2addr p1, v0

    .line 41
    sub-int/2addr p1, v6

    .line 42
    aput p1, v5, p2

    .line 43
    .line 44
    :cond_0
    aget p1, v5, v6

    .line 45
    .line 46
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 47
    .line 48
    iget v0, p0, Lcom/android/launcher3/model/data/p;->k:I

    .line 49
    .line 50
    mul-int/2addr p1, v0

    .line 51
    aget p2, v5, p2

    .line 52
    .line 53
    add-int/2addr p1, p2

    .line 54
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    invoke-static {p1, p0}, Ljava/lang/Math;->min(II)I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    return p0
.end method

.method public static d1(Landroid/content/Context;IIIILcom/android/launcher3/model/data/p;)Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;
    .locals 17

    move/from16 v0, p1

    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    move-object/from16 v4, p5

    .line 1
    new-instance v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    invoke-direct {v5}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;-><init>()V

    .line 2
    iput v0, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->a:I

    .line 3
    iput v1, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b:I

    .line 4
    iput v2, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->c:I

    .line 5
    iput v3, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->d:I

    .line 6
    invoke-static/range {p0 .. p0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    move-result-object v6

    if-nez v6, :cond_0

    goto/16 :goto_4

    :cond_0
    if-eqz v0, :cond_23

    if-eqz v1, :cond_23

    if-eqz v2, :cond_23

    if-nez v3, :cond_1

    goto/16 :goto_4

    .line 7
    :cond_1
    invoke-virtual {v6}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v7

    .line 8
    iget-boolean v8, v7, Lcom/android/launcher3/X3;->B0:Z

    if-nez v8, :cond_2

    goto/16 :goto_4

    :cond_2
    const/4 v8, 0x1

    .line 9
    iput-boolean v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->e:Z

    .line 10
    iget-object v9, v7, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    iget v10, v9, Lcom/android/launcher3/F1;->H0:I

    shl-int/lit8 v10, v10, 0x4

    iget v9, v9, Lcom/android/launcher3/F1;->G0:I

    add-int/2addr v10, v9

    shl-int/lit8 v9, v0, 0x4

    add-int/2addr v9, v1

    .line 11
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    move-result v11

    if-eqz v11, :cond_3

    const/high16 v11, 0x10000000

    or-int/2addr v10, v11

    :cond_3
    const/16 v11, 0x46

    const/16 v8, 0x22

    const/16 v12, 0x21

    const/16 v13, 0x12

    const/16 v15, 0x13

    const v14, 0x7f070c14

    if-eq v10, v11, :cond_11

    const/16 v11, 0x56

    if-eq v10, v11, :cond_a

    if-eq v9, v13, :cond_9

    if-eq v9, v15, :cond_8

    if-eq v9, v12, :cond_7

    if-eq v9, v8, :cond_6

    const/16 v8, 0x31

    if-eq v9, v8, :cond_5

    const/16 v8, 0x33

    if-eq v9, v8, :cond_4

    const/16 v8, 0x42

    if-eq v9, v8, :cond_6

    const/16 v8, 0x63

    if-eq v9, v8, :cond_4

    .line 12
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070c13

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 13
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf6

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 14
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bee

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    goto/16 :goto_0

    .line 15
    :cond_4
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v14}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 16
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf7

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 17
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070be9

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Point;->y:I

    .line 18
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070c00

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->right:I

    iput v10, v8, Landroid/graphics/Rect;->left:I

    .line 19
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070c0a

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->bottom:I

    iput v10, v8, Landroid/graphics/Rect;->top:I

    .line 20
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf1

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    goto/16 :goto_0

    .line 21
    :cond_5
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v14}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 22
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf7

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 23
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070bff

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->right:I

    iput v10, v8, Landroid/graphics/Rect;->left:I

    .line 24
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070c09

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->bottom:I

    iput v10, v8, Landroid/graphics/Rect;->top:I

    .line 25
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf1

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    goto/16 :goto_0

    .line 26
    :cond_6
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070c13

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 27
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf6

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 28
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070bfe

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->right:I

    iput v10, v8, Landroid/graphics/Rect;->left:I

    .line 29
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070c08

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->bottom:I

    iput v10, v8, Landroid/graphics/Rect;->top:I

    .line 30
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070be8

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Point;->y:I

    .line 31
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf0

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    goto/16 :goto_0

    .line 32
    :cond_7
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070c12

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 33
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf5

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 34
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070bfc

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->right:I

    iput v10, v8, Landroid/graphics/Rect;->left:I

    .line 35
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070be6

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Point;->x:I

    .line 36
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bef

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    goto/16 :goto_0

    .line 37
    :cond_8
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v14}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 38
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf7

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 39
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070bfd

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->right:I

    iput v10, v8, Landroid/graphics/Rect;->left:I

    .line 40
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070c06

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->bottom:I

    iput v10, v8, Landroid/graphics/Rect;->top:I

    .line 41
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf1

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    goto/16 :goto_0

    .line 42
    :cond_9
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070c12

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 43
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf5

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 44
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070c07

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->bottom:I

    iput v10, v8, Landroid/graphics/Rect;->top:I

    .line 45
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070be7

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Point;->y:I

    .line 46
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bef

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    goto/16 :goto_0

    :cond_a
    if-eq v9, v13, :cond_10

    const v10, 0x7f070bf4

    const v11, 0x7f070bfa

    const v13, 0x7f070c17

    if-eq v9, v15, :cond_f

    if-eq v9, v12, :cond_e

    if-eq v9, v8, :cond_d

    const/16 v8, 0x31

    if-eq v9, v8, :cond_c

    const/16 v8, 0x33

    if-eq v9, v8, :cond_b

    const/16 v8, 0x42

    if-eq v9, v8, :cond_d

    const/16 v8, 0x63

    if-eq v9, v8, :cond_b

    .line 47
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070c13

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 48
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf6

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 49
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bee

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    goto/16 :goto_0

    .line 50
    :cond_b
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v13}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 51
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 52
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f070bed

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    iput v11, v8, Landroid/graphics/Point;->y:I

    .line 53
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f070c05

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    iput v11, v8, Landroid/graphics/Rect;->right:I

    iput v11, v8, Landroid/graphics/Rect;->left:I

    .line 54
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f070c0f

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    iput v11, v8, Landroid/graphics/Rect;->bottom:I

    iput v11, v8, Landroid/graphics/Rect;->top:I

    .line 55
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    goto/16 :goto_0

    .line 56
    :cond_c
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v13}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 57
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 58
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f070c04

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    iput v11, v8, Landroid/graphics/Rect;->right:I

    iput v11, v8, Landroid/graphics/Rect;->left:I

    .line 59
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f070c0e

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    iput v11, v8, Landroid/graphics/Rect;->bottom:I

    iput v11, v8, Landroid/graphics/Rect;->top:I

    .line 60
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    goto/16 :goto_0

    .line 61
    :cond_d
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070c16

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 62
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf9

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 63
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070c03

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->right:I

    iput v10, v8, Landroid/graphics/Rect;->left:I

    .line 64
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070c0d

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->bottom:I

    iput v10, v8, Landroid/graphics/Rect;->top:I

    .line 65
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070bec

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Point;->y:I

    .line 66
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf3

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    goto/16 :goto_0

    .line 67
    :cond_e
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070c15

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 68
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf8

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 69
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070c01

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->right:I

    iput v10, v8, Landroid/graphics/Rect;->left:I

    .line 70
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070bea

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Point;->x:I

    .line 71
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf2

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    goto/16 :goto_0

    .line 72
    :cond_f
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v13}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 73
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 74
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f070c02

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    iput v11, v8, Landroid/graphics/Rect;->right:I

    iput v11, v8, Landroid/graphics/Rect;->left:I

    .line 75
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f070c0b

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    iput v11, v8, Landroid/graphics/Rect;->bottom:I

    iput v11, v8, Landroid/graphics/Rect;->top:I

    .line 76
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    goto/16 :goto_0

    .line 77
    :cond_10
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070c15

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 78
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf8

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 79
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070c0c

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->bottom:I

    iput v10, v8, Landroid/graphics/Rect;->top:I

    .line 80
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070beb

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Point;->y:I

    .line 81
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf2

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    goto/16 :goto_0

    :cond_11
    if-eq v9, v13, :cond_17

    if-eq v9, v15, :cond_16

    if-eq v9, v12, :cond_15

    if-eq v9, v8, :cond_14

    const/16 v8, 0x31

    if-eq v9, v8, :cond_13

    const/16 v8, 0x33

    if-eq v9, v8, :cond_12

    const/16 v8, 0x42

    if-eq v9, v8, :cond_14

    const/16 v8, 0x63

    if-eq v9, v8, :cond_12

    .line 82
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070c13

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 83
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf6

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 84
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bee

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    goto/16 :goto_0

    .line 85
    :cond_12
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v14}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 86
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf7

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 87
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070be9

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Point;->y:I

    .line 88
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070c00

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->right:I

    iput v10, v8, Landroid/graphics/Rect;->left:I

    .line 89
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070c0a

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->bottom:I

    iput v10, v8, Landroid/graphics/Rect;->top:I

    .line 90
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf1

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    goto/16 :goto_0

    .line 91
    :cond_13
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v14}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 92
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf7

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 93
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070bff

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->right:I

    iput v10, v8, Landroid/graphics/Rect;->left:I

    .line 94
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070c09

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->bottom:I

    iput v10, v8, Landroid/graphics/Rect;->top:I

    .line 95
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf1

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    goto/16 :goto_0

    .line 96
    :cond_14
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070c13

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 97
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf6

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 98
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070bfe

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->right:I

    iput v10, v8, Landroid/graphics/Rect;->left:I

    .line 99
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070c08

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->bottom:I

    iput v10, v8, Landroid/graphics/Rect;->top:I

    .line 100
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070be8

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Point;->y:I

    .line 101
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf0

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    goto/16 :goto_0

    .line 102
    :cond_15
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070c12

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 103
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf5

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 104
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070bfc

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->right:I

    iput v10, v8, Landroid/graphics/Rect;->left:I

    .line 105
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070be6

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Point;->x:I

    .line 106
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bef

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    goto/16 :goto_0

    .line 107
    :cond_16
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v14}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 108
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf7

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 109
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070bfd

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->right:I

    iput v10, v8, Landroid/graphics/Rect;->left:I

    .line 110
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070c06

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->bottom:I

    iput v10, v8, Landroid/graphics/Rect;->top:I

    .line 111
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf1

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    goto :goto_0

    .line 112
    :cond_17
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070c12

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 113
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bf5

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 114
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070c07

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Rect;->bottom:I

    iput v10, v8, Landroid/graphics/Rect;->top:I

    .line 115
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070be7

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    iput v10, v8, Landroid/graphics/Point;->y:I

    .line 116
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v10, 0x7f070bef

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    .line 117
    :goto_0
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    move-result v8

    const/4 v10, 0x0

    if-eqz v8, :cond_1e

    .line 118
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v11, 0x7f0709a5

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 119
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v11, 0x7f070999

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 120
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v11, 0x7f070998

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    .line 121
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    iput v10, v8, Landroid/graphics/Rect;->right:I

    iput v10, v8, Landroid/graphics/Rect;->left:I

    .line 122
    iput v10, v8, Landroid/graphics/Rect;->bottom:I

    iput v10, v8, Landroid/graphics/Rect;->top:I

    .line 123
    iget-object v11, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    iput v10, v11, Landroid/graphics/Point;->x:I

    .line 124
    iput v10, v11, Landroid/graphics/Point;->y:I

    if-eq v9, v15, :cond_1d

    const/16 v11, 0x14

    if-eq v9, v11, :cond_1c

    const/16 v11, 0x31

    if-eq v9, v11, :cond_1b

    const/16 v11, 0x34

    if-eq v9, v11, :cond_1a

    const/16 v11, 0x41

    if-eq v9, v11, :cond_19

    const/16 v11, 0x43

    if-eq v9, v11, :cond_18

    goto/16 :goto_1

    .line 125
    :cond_18
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v11, 0x7f07099b

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    iput v9, v8, Landroid/graphics/Rect;->right:I

    iput v9, v8, Landroid/graphics/Rect;->left:I

    .line 126
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v11, 0x7f0709a0

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    iput v9, v8, Landroid/graphics/Rect;->bottom:I

    iput v9, v8, Landroid/graphics/Rect;->top:I

    goto/16 :goto_1

    .line 127
    :cond_19
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v11, 0x7f07099f

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    iput v9, v8, Landroid/graphics/Rect;->right:I

    iput v9, v8, Landroid/graphics/Rect;->left:I

    .line 128
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v11, 0x7f0709a4

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    iput v9, v8, Landroid/graphics/Rect;->bottom:I

    iput v9, v8, Landroid/graphics/Rect;->top:I

    goto/16 :goto_1

    .line 129
    :cond_1a
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v11, 0x7f07099b

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    iput v9, v8, Landroid/graphics/Rect;->right:I

    iput v9, v8, Landroid/graphics/Rect;->left:I

    .line 130
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v11, 0x7f0709a0

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    iput v9, v8, Landroid/graphics/Rect;->bottom:I

    iput v9, v8, Landroid/graphics/Rect;->top:I

    goto :goto_1

    .line 131
    :cond_1b
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v11, 0x7f07099e

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    iput v9, v8, Landroid/graphics/Rect;->right:I

    iput v9, v8, Landroid/graphics/Rect;->left:I

    .line 132
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v11, 0x7f0709a3

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    iput v9, v8, Landroid/graphics/Rect;->bottom:I

    iput v9, v8, Landroid/graphics/Rect;->top:I

    goto :goto_1

    .line 133
    :cond_1c
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v11, 0x7f07099d

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    iput v9, v8, Landroid/graphics/Rect;->right:I

    iput v9, v8, Landroid/graphics/Rect;->left:I

    .line 134
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v11, 0x7f0709a2

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    iput v9, v8, Landroid/graphics/Rect;->bottom:I

    iput v9, v8, Landroid/graphics/Rect;->top:I

    goto :goto_1

    .line 135
    :cond_1d
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v11, 0x7f07099c

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    iput v9, v8, Landroid/graphics/Rect;->right:I

    iput v9, v8, Landroid/graphics/Rect;->left:I

    .line 136
    iget-object v8, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v11, 0x7f0709a1

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    iput v9, v8, Landroid/graphics/Rect;->bottom:I

    iput v9, v8, Landroid/graphics/Rect;->top:I

    .line 137
    :cond_1e
    :goto_1
    iget-object v8, v7, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    iget v8, v8, Lcom/android/launcher3/r4;->o:F

    .line 138
    iget v9, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    int-to-float v9, v9

    mul-float/2addr v9, v8

    float-to-int v9, v9

    iput v9, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 139
    iget v9, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    int-to-float v9, v9

    mul-float/2addr v9, v8

    float-to-int v9, v9

    iput v9, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 140
    invoke-static {v5}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->a(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;)I

    move-result v9

    int-to-float v9, v9

    mul-float/2addr v9, v8

    float-to-int v8, v9

    invoke-static {v5, v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    .line 141
    iput v10, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->l:I

    iput v10, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->k:I

    .line 142
    invoke-virtual {v6}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v8

    if-lez v8, :cond_20

    invoke-virtual {v6}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    move-result-object v8

    invoke-virtual {v8, v10}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    instance-of v8, v8, Lcom/android/launcher3/CellLayout;

    if-eqz v8, :cond_20

    .line 143
    invoke-virtual {v6}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    move-result-object v8

    invoke-virtual {v8, v10}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/android/launcher3/CellLayout;

    if-eqz v4, :cond_1f

    .line 144
    iget v9, v4, Lcom/android/launcher3/model/data/y;->container:I

    const/16 v10, -0x65

    if-ne v9, v10, :cond_1f

    .line 145
    invoke-virtual {v6}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    move-result-object v8

    .line 146
    :cond_1f
    invoke-virtual {v8}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    move-result v9

    if-lez v9, :cond_20

    invoke-virtual {v8}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    move-result v9

    if-lez v9, :cond_20

    .line 147
    invoke-virtual {v8}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    move-result v9

    mul-int/2addr v9, v2

    .line 148
    invoke-virtual {v6}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v2

    iget v2, v2, Lcom/android/launcher3/X3;->r0:I

    invoke-virtual {v6}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v10

    iget v10, v10, Lcom/android/launcher3/X3;->q0:I

    add-int/2addr v2, v10

    mul-int/lit8 v2, v2, 0x2

    sub-int/2addr v9, v2

    iget-object v2, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    iget v10, v2, Landroid/graphics/Rect;->left:I

    sub-int/2addr v9, v10

    iget v2, v2, Landroid/graphics/Rect;->right:I

    sub-int/2addr v9, v2

    iget-object v2, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->x:I

    add-int/lit8 v10, v0, -0x1

    mul-int/2addr v2, v10

    sub-int/2addr v9, v2

    div-int/2addr v9, v0

    int-to-float v2, v9

    .line 149
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iput v2, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->h:I

    .line 150
    invoke-virtual {v8}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    move-result v2

    mul-int/2addr v2, v3

    invoke-virtual {v6}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v3

    iget v3, v3, Lcom/android/launcher3/X3;->s0:I

    sub-int/2addr v2, v3

    .line 151
    invoke-virtual {v6}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v3

    iget v3, v3, Lcom/android/launcher3/X3;->t0:I

    sub-int/2addr v2, v3

    iget-object v3, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    iget v6, v3, Landroid/graphics/Rect;->top:I

    sub-int/2addr v2, v6

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v2, v3

    iget-object v3, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    iget v3, v3, Landroid/graphics/Point;->y:I

    add-int/lit8 v6, v1, -0x1

    mul-int/2addr v3, v6

    sub-int/2addr v2, v3

    div-int/2addr v2, v1

    int-to-float v2, v2

    .line 152
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iput v2, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->i:I

    .line 153
    iget v3, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->h:I

    iget v6, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    sub-int/2addr v3, v6

    int-to-float v3, v3

    const/high16 v8, 0x40000000    # 2.0f

    div-float/2addr v3, v8

    float-to-int v3, v3

    iput v3, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->k:I

    sub-int/2addr v2, v6

    int-to-float v2, v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    float-to-int v2, v2

    .line 154
    iput v2, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->l:I

    .line 155
    :cond_20
    iget v2, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->a:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_21

    iget v6, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b:I

    if-ne v6, v3, :cond_21

    .line 156
    sget v2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->B0:I

    mul-int/2addr v2, v2

    iput v2, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->f:I

    :goto_2
    const/4 v3, 0x1

    goto :goto_3

    .line 157
    :cond_21
    iget v3, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b:I

    mul-int/2addr v2, v3

    add-int/lit8 v2, v2, 0x3

    iput v2, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->f:I

    goto :goto_2

    :goto_3
    if-ne v0, v3, :cond_23

    if-ne v1, v3, :cond_23

    .line 158
    iget v0, v7, Lcom/android/launcher3/h0;->Q1:I

    iput v0, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 159
    invoke-static {}, Lx1/O;->C3()Z

    move-result v0

    if-eqz v0, :cond_22

    iget-boolean v0, v7, Lcom/android/launcher3/h0;->N0:Z

    if-nez v0, :cond_22

    if-eqz v4, :cond_22

    iget v0, v4, Lcom/android/launcher3/model/data/y;->container:I

    const/16 v1, -0x65

    if-ne v0, v1, :cond_22

    .line 160
    invoke-static/range {p0 .. p0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    move-result-object v0

    invoke-static/range {p0 .. p0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    move-result-object v1

    invoke-static {v1}, Lp1/f;->s(Lcom/android/launcher3/C2;)I

    move-result v1

    invoke-static {v0, v1}, Lp1/f;->i(Lcom/android/launcher3/C2;I)I

    move-result v0

    iput v0, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 161
    :cond_22
    iget v0, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    int-to-float v1, v0

    sget v2, Lcom/android/launcher3/folder/i0;->o:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    int-to-float v0, v0

    .line 162
    sget v2, Lcom/android/launcher3/folder/i0;->p:F

    mul-float/2addr v0, v2

    float-to-int v0, v0

    .line 163
    sget v2, Lcom/android/launcher3/folder/i0;->l:I

    mul-int v3, v2, v1

    const/16 v16, 0x1

    add-int/lit8 v2, v2, -0x1

    mul-int/2addr v2, v0

    add-int/2addr v3, v2

    .line 164
    iput v1, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 165
    iget v0, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    sub-int/2addr v0, v3

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-static {v5, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->b(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;I)V

    :cond_23
    :goto_4
    return-object v5
.end method

.method private e1()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->j0:Lcom/android/launcher3/blur/a;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Lcom/android/launcher3/blur/a;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-direct {v0, v1, p0}, Lcom/android/launcher3/blur/a;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->j0:Lcom/android/launcher3/blur/a;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    return-void
.end method

.method private synthetic j1()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->O0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p0:Z

    .line 6
    .line 7
    return-void
.end method

.method private synthetic k1(Lcom/android/launcher3/n0$a;Ljava/util/ArrayList;Lcom/android/launcher3/folder/K;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic l1(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/touch/A;->g(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private synthetic m1(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->callOnClick()Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic n1(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/touch/v;->q(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic o1(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/touch/A;->g(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static q1(Lcom/android/launcher3/model/data/p;Lcom/android/launcher3/CellLayout;IILandroid/view/View;)Landroid/graphics/Point;
    .locals 0

    .line 1
    iget p1, p0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 2
    .line 3
    iput p1, p0, Lcom/android/launcher3/model/data/p;->k:I

    .line 4
    .line 5
    iget p1, p0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 6
    .line 7
    iput p1, p0, Lcom/android/launcher3/model/data/p;->l:I

    .line 8
    .line 9
    instance-of p0, p4, Lcom/android/launcher3/BubbleTextView;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    instance-of p0, p0, Lcom/android/launcher3/model/data/y;

    .line 18
    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance p0, Landroid/graphics/Point;

    .line 23
    .line 24
    invoke-direct {p0, p2, p3}, Landroid/graphics/Point;-><init>(II)V

    .line 25
    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_1
    :goto_0
    new-instance p0, Landroid/graphics/Point;

    .line 29
    .line 30
    invoke-direct {p0, p2, p3}, Landroid/graphics/Point;-><init>(II)V

    .line 31
    .line 32
    .line 33
    return-object p0
.end method

.method public static synthetic t0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/n0$a;Ljava/util/ArrayList;Lcom/android/launcher3/folder/K;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->k1(Lcom/android/launcher3/n0$a;Ljava/util/ArrayList;Lcom/android/launcher3/folder/K;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private t1()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "rearrangeChildren: folder: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "TransformFolderIcon"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->v1()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic u0(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/folderbatch/g;->f(Lcom/android/launcher3/model/data/y;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method private u1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->E1(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/p;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 20
    .line 21
    iget v1, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 22
    .line 23
    iput v1, v0, Lcom/android/launcher3/model/data/y;->minSpanX:I

    .line 24
    .line 25
    iget v1, v0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 26
    .line 27
    iput v1, v0, Lcom/android/launcher3/model/data/y;->minSpanY:I

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->F1()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 35
    .line 36
    iget v2, v1, Lcom/android/launcher3/model/data/p;->k:I

    .line 37
    .line 38
    iget v1, v1, Lcom/android/launcher3/model/data/p;->l:I

    .line 39
    .line 40
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/CellLayout;->C0(II)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->v1()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static synthetic v0(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/folderbatch/g;->f(Lcom/android/launcher3/model/data/y;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public static synthetic w0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->j1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private w1(Ljava/util/ArrayList;)V
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    iget-object v1, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 6
    .line 7
    if-eqz v1, :cond_14

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    goto/16 :goto_9

    .line 16
    .line 17
    :cond_0
    iget-object v1, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    move-object/from16 v1, p1

    .line 25
    .line 26
    :goto_0
    iget-object v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 27
    .line 28
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iget-boolean v2, v2, Lcom/android/launcher3/X3;->B0:Z

    .line 33
    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    new-instance v2, Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 39
    .line 40
    .line 41
    new-instance v1, LU1/e;

    .line 42
    .line 43
    invoke-direct {v1}, LU1/e;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 47
    .line 48
    .line 49
    move-object v1, v2

    .line 50
    :cond_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-eqz v2, :cond_3

    .line 55
    .line 56
    iget-object v0, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->removeAllViews()V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_3
    iget-object v2, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 63
    .line 64
    iget v3, v2, Lcom/android/launcher3/model/data/p;->l:I

    .line 65
    .line 66
    iget v2, v2, Lcom/android/launcher3/model/data/p;->k:I

    .line 67
    .line 68
    iget-object v4, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 69
    .line 70
    invoke-virtual {v4}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    iget-object v5, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 75
    .line 76
    invoke-virtual {v5}, Lcom/android/launcher3/CellLayout;->removeAllViews()V

    .line 77
    .line 78
    .line 79
    sget-object v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->E0:Ljava/util/Comparator;

    .line 80
    .line 81
    invoke-static {v1, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 82
    .line 83
    .line 84
    new-instance v5, Ljava/util/ArrayList;

    .line 85
    .line 86
    invoke-direct {v5, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 87
    .line 88
    .line 89
    new-instance v6, Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 92
    .line 93
    .line 94
    new-instance v7, Ljava/util/ArrayList;

    .line 95
    .line 96
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 97
    .line 98
    .line 99
    mul-int/2addr v3, v2

    .line 100
    iget-boolean v8, v4, Lcom/android/launcher3/X3;->B0:Z

    .line 101
    .line 102
    const/4 v9, 0x0

    .line 103
    const/4 v10, 0x1

    .line 104
    if-eqz v8, :cond_4

    .line 105
    .line 106
    if-ne v3, v10, :cond_4

    .line 107
    .line 108
    move v8, v10

    .line 109
    goto :goto_1

    .line 110
    :cond_4
    move v8, v9

    .line 111
    :goto_1
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 112
    .line 113
    .line 114
    move-result v11

    .line 115
    if-gt v11, v3, :cond_5

    .line 116
    .line 117
    if-nez v8, :cond_5

    .line 118
    .line 119
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 120
    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_5
    sub-int/2addr v3, v10

    .line 124
    invoke-virtual {v5, v9, v3}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    .line 125
    .line 126
    .line 127
    move-result-object v8

    .line 128
    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 129
    .line 130
    .line 131
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 132
    .line 133
    .line 134
    move-result v8

    .line 135
    invoke-virtual {v5, v3, v8}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 140
    .line 141
    .line 142
    :goto_2
    move v3, v9

    .line 143
    :goto_3
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    const-string v8, "TransformFolderIcon"

    .line 148
    .line 149
    if-ge v3, v5, :cond_9

    .line 150
    .line 151
    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v5

    .line 155
    check-cast v5, Lcom/android/launcher3/model/data/y;

    .line 156
    .line 157
    iget-object v11, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 158
    .line 159
    invoke-virtual {v11}, Lcom/android/launcher3/C2;->b()Lcom/android/launcher3/util/B0;

    .line 160
    .line 161
    .line 162
    move-result-object v11

    .line 163
    iget-object v12, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 164
    .line 165
    invoke-virtual {v12}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 166
    .line 167
    .line 168
    move-result-object v12

    .line 169
    invoke-virtual {v11, v5, v12}, Lcom/android/launcher3/util/B0;->c(Lcom/android/launcher3/model/data/y;Lz1/J3;)Landroid/view/View;

    .line 170
    .line 171
    .line 172
    move-result-object v14

    .line 173
    if-nez v14, :cond_6

    .line 174
    .line 175
    const-string v5, "refreshViews: child is null, continue!"

    .line 176
    .line 177
    invoke-static {v8, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    .line 179
    .line 180
    goto :goto_4

    .line 181
    :cond_6
    instance-of v8, v14, Lcom/android/launcher3/BubbleTextView;

    .line 182
    .line 183
    if-eqz v8, :cond_7

    .line 184
    .line 185
    move-object v11, v14

    .line 186
    check-cast v11, Lcom/android/launcher3/BubbleTextView;

    .line 187
    .line 188
    invoke-virtual {v11, v10}, Lcom/android/launcher3/BubbleTextView;->setTransformFolderIconLargeIcon(Z)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v11}, Lcom/android/launcher3/BubbleTextView;->g0()V

    .line 192
    .line 193
    .line 194
    :cond_7
    iget-boolean v11, v4, Lcom/android/launcher3/X3;->B0:Z

    .line 195
    .line 196
    if-eqz v11, :cond_8

    .line 197
    .line 198
    if-eqz v8, :cond_8

    .line 199
    .line 200
    move-object v8, v14

    .line 201
    check-cast v8, Lcom/android/launcher3/BubbleTextView;

    .line 202
    .line 203
    iget-object v11, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 204
    .line 205
    iget v11, v11, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 206
    .line 207
    invoke-virtual {v8, v11}, Lcom/android/launcher3/BubbleTextView;->setIconSize(I)V

    .line 208
    .line 209
    .line 210
    :cond_8
    const v8, 0x7f0b0628

    .line 211
    .line 212
    .line 213
    invoke-virtual {v14, v8, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 214
    .line 215
    .line 216
    rem-int v8, v3, v2

    .line 217
    .line 218
    div-int v11, v3, v2

    .line 219
    .line 220
    new-instance v12, Lc1/b;

    .line 221
    .line 222
    invoke-direct {v12, v8, v11, v10, v10}, Lc1/b;-><init>(IIII)V

    .line 223
    .line 224
    .line 225
    iget-object v13, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 226
    .line 227
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/y;->getViewId()I

    .line 228
    .line 229
    .line 230
    move-result v16

    .line 231
    const/16 v18, 0x1

    .line 232
    .line 233
    const/4 v15, -0x1

    .line 234
    move-object/from16 v17, v12

    .line 235
    .line 236
    invoke-virtual/range {v13 .. v18}, Lcom/android/launcher3/CellLayout;->e(Landroid/view/View;IILc1/b;Z)Z

    .line 237
    .line 238
    .line 239
    invoke-virtual {v14, v9}, Landroid/view/View;->setHapticFeedbackEnabled(Z)V

    .line 240
    .line 241
    .line 242
    sget-object v5, Lcom/android/launcher3/touch/A;->a:Landroid/view/View$OnLongClickListener;

    .line 243
    .line 244
    invoke-virtual {v14, v5}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 245
    .line 246
    .line 247
    :goto_4
    add-int/lit8 v3, v3, 0x1

    .line 248
    .line 249
    goto :goto_3

    .line 250
    :cond_9
    iget-object v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 251
    .line 252
    iget-object v3, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 253
    .line 254
    invoke-virtual {v2, v3}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->m(Lcom/android/launcher3/model/data/p;)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    .line 258
    .line 259
    .line 260
    move-result v2

    .line 261
    if-nez v2, :cond_13

    .line 262
    .line 263
    iget-object v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 264
    .line 265
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->setTag(Ljava/lang/Object;)V

    .line 266
    .line 267
    .line 268
    iget-object v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 269
    .line 270
    invoke-virtual {v2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->getAllBubbleTextViewChildList()Ljava/util/ArrayList;

    .line 271
    .line 272
    .line 273
    move-result-object v2

    .line 274
    iget-object v3, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 275
    .line 276
    invoke-virtual {v3}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->k()Z

    .line 277
    .line 278
    .line 279
    move-result v3

    .line 280
    move v5, v9

    .line 281
    move v6, v5

    .line 282
    :goto_5
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 283
    .line 284
    .line 285
    move-result v11

    .line 286
    if-ge v5, v11, :cond_12

    .line 287
    .line 288
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object v11

    .line 292
    instance-of v11, v11, Lcom/android/launcher3/BubbleTextView;

    .line 293
    .line 294
    if-eqz v11, :cond_11

    .line 295
    .line 296
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 297
    .line 298
    .line 299
    move-result v11

    .line 300
    if-ge v6, v11, :cond_a

    .line 301
    .line 302
    move v11, v10

    .line 303
    goto :goto_6

    .line 304
    :cond_a
    move v11, v9

    .line 305
    :goto_6
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    move-result-object v12

    .line 309
    check-cast v12, Lcom/android/launcher3/BubbleTextView;

    .line 310
    .line 311
    if-eqz v11, :cond_b

    .line 312
    .line 313
    move v13, v9

    .line 314
    goto :goto_7

    .line 315
    :cond_b
    if-eqz v3, :cond_c

    .line 316
    .line 317
    const/4 v13, 0x4

    .line 318
    goto :goto_7

    .line 319
    :cond_c
    const/16 v13, 0x8

    .line 320
    .line 321
    :goto_7
    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setVisibility(I)V

    .line 322
    .line 323
    .line 324
    const/4 v13, 0x0

    .line 325
    if-eqz v11, :cond_f

    .line 326
    .line 327
    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    move-result-object v11

    .line 331
    check-cast v11, Lcom/android/launcher3/model/data/y;

    .line 332
    .line 333
    instance-of v14, v11, Lcom/android/launcher3/model/data/I;

    .line 334
    .line 335
    if-eqz v14, :cond_d

    .line 336
    .line 337
    check-cast v11, Lcom/android/launcher3/model/data/I;

    .line 338
    .line 339
    invoke-virtual {v12, v11}, Lcom/android/launcher3/BubbleTextView;->y(Lcom/android/launcher3/model/data/I;)V

    .line 340
    .line 341
    .line 342
    goto :goto_8

    .line 343
    :cond_d
    new-instance v14, Ljava/lang/StringBuilder;

    .line 344
    .line 345
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 346
    .line 347
    .line 348
    const-string v15, "refreshViews "

    .line 349
    .line 350
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 351
    .line 352
    .line 353
    if-eqz v11, :cond_e

    .line 354
    .line 355
    invoke-virtual {v11}, Lcom/android/launcher3/model/data/y;->toString()Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object v13

    .line 359
    :cond_e
    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    .line 361
    .line 362
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 363
    .line 364
    .line 365
    move-result-object v11

    .line 366
    invoke-static {v8, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 367
    .line 368
    .line 369
    goto :goto_8

    .line 370
    :cond_f
    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 371
    .line 372
    .line 373
    :goto_8
    iget-boolean v11, v4, Lcom/android/launcher3/X3;->B0:Z

    .line 374
    .line 375
    if-eqz v11, :cond_10

    .line 376
    .line 377
    iget-object v11, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 378
    .line 379
    iget v11, v11, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 380
    .line 381
    invoke-virtual {v12, v11}, Lcom/android/launcher3/BubbleTextView;->setIconSize(I)V

    .line 382
    .line 383
    .line 384
    invoke-virtual {v12}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 385
    .line 386
    .line 387
    move-result-object v11

    .line 388
    iget-object v12, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 389
    .line 390
    iget v12, v12, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 391
    .line 392
    iput v12, v11, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 393
    .line 394
    iput v12, v11, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 395
    .line 396
    :cond_10
    add-int/lit8 v6, v6, 0x1

    .line 397
    .line 398
    :cond_11
    add-int/lit8 v5, v5, 0x1

    .line 399
    .line 400
    goto :goto_5

    .line 401
    :cond_12
    new-instance v15, Lc1/b;

    .line 402
    .line 403
    iget-object v2, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 404
    .line 405
    iget v3, v2, Lcom/android/launcher3/model/data/p;->k:I

    .line 406
    .line 407
    sub-int/2addr v3, v10

    .line 408
    iget v2, v2, Lcom/android/launcher3/model/data/p;->l:I

    .line 409
    .line 410
    sub-int/2addr v2, v10

    .line 411
    invoke-direct {v15, v3, v2, v10, v10}, Lc1/b;-><init>(IIII)V

    .line 412
    .line 413
    .line 414
    iget-object v11, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 415
    .line 416
    iget-object v12, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 417
    .line 418
    const v14, 0x7f0b062a

    .line 419
    .line 420
    .line 421
    const/16 v16, 0x1

    .line 422
    .line 423
    const/4 v13, -0x1

    .line 424
    invoke-virtual/range {v11 .. v16}, Lcom/android/launcher3/CellLayout;->e(Landroid/view/View;IILc1/b;Z)Z

    .line 425
    .line 426
    .line 427
    :cond_13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->A1(Ljava/util/ArrayList;)V

    .line 428
    .line 429
    .line 430
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 431
    .line 432
    .line 433
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 434
    .line 435
    .line 436
    move-result v1

    .line 437
    if-eqz v1, :cond_14

    .line 438
    .line 439
    iget-object v1, v0, Lcom/android/launcher3/folder/FolderIcon;->l:Lcom/android/launcher3/BubbleTextView;

    .line 440
    .line 441
    invoke-virtual {v1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 442
    .line 443
    .line 444
    move-result-object v1

    .line 445
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 446
    .line 447
    iget v2, v4, Lcom/android/launcher3/X3;->u0:I

    .line 448
    .line 449
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 450
    .line 451
    .line 452
    move-result-object v0

    .line 453
    const v3, 0x7f070bc5

    .line 454
    .line 455
    .line 456
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 457
    .line 458
    .line 459
    move-result v0

    .line 460
    add-int/2addr v2, v0

    .line 461
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 462
    .line 463
    :cond_14
    :goto_9
    return-void
.end method

.method public static synthetic x0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->o1(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic y0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->m1(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic z0(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/folderbatch/g;->f(Lcom/android/launcher3/model/data/y;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method


# virtual methods
.method public A1(Ljava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lk1/b;

    .line 2
    .line 3
    invoke-direct {v0}, Lk1/b;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_3

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 30
    .line 31
    invoke-virtual {p0, v1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->i1(Lcom/android/launcher3/model/data/y;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 38
    .line 39
    iget-object v3, p0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 40
    .line 41
    invoke-interface {v3, v1}, Lcom/android/launcher3/views/k;->getDotInfoForItem(Lcom/android/launcher3/model/data/y;)Lk1/a;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v2, v1}, Lk1/b;->i(Landroid/content/Context;Lk1/a;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->setDotInfo(Lk1/b;)V

    .line 50
    .line 51
    .line 52
    :cond_3
    :goto_1
    return-void
.end method

.method public B1()V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

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
    const/4 v1, 0x1

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 13
    .line 14
    iget v2, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 15
    .line 16
    if-ne v2, v1, :cond_0

    .line 17
    .line 18
    iget v0, v0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 19
    .line 20
    if-ne v0, v1, :cond_0

    .line 21
    .line 22
    goto/16 :goto_2

    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-boolean v0, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 31
    .line 32
    const/4 v2, 0x2

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 36
    .line 37
    iget v3, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 38
    .line 39
    if-eq v3, v1, :cond_2

    .line 40
    .line 41
    iget v0, v0, Lcom/android/launcher3/model/data/p;->k:I

    .line 42
    .line 43
    if-ne v3, v0, :cond_2

    .line 44
    .line 45
    :cond_1
    move v0, v2

    .line 46
    goto :goto_0

    .line 47
    :cond_2
    const/4 v0, 0x3

    .line 48
    :goto_0
    iget-object v3, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 49
    .line 50
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-ge v3, v0, :cond_3

    .line 59
    .line 60
    iget-object v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 61
    .line 62
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    iget-boolean v3, v3, Lcom/android/launcher3/X3;->B0:Z

    .line 67
    .line 68
    if-eqz v3, :cond_d

    .line 69
    .line 70
    iget-object v3, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 71
    .line 72
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    if-nez v3, :cond_d

    .line 81
    .line 82
    :cond_3
    iget-object v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 83
    .line 84
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    iget-boolean v3, v3, Lcom/android/launcher3/X3;->B0:Z

    .line 89
    .line 90
    if-eqz v3, :cond_4

    .line 91
    .line 92
    iget-object v3, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 93
    .line 94
    iget v3, v3, Lcom/android/launcher3/model/data/p;->k:I

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_4
    iget-object v3, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 98
    .line 99
    iget v3, v3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 100
    .line 101
    :goto_1
    iget-object v4, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 102
    .line 103
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    int-to-float v4, v4

    .line 112
    const/high16 v5, 0x3f800000    # 1.0f

    .line 113
    .line 114
    mul-float/2addr v4, v5

    .line 115
    int-to-float v5, v3

    .line 116
    div-float/2addr v4, v5

    .line 117
    float-to-double v4, v4

    .line 118
    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    .line 119
    .line 120
    .line 121
    move-result-wide v4

    .line 122
    double-to-int v4, v4

    .line 123
    iget-object v5, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 124
    .line 125
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 130
    .line 131
    .line 132
    move-result v5

    .line 133
    invoke-static {v5, v3}, Ljava/lang/Math;->min(II)I

    .line 134
    .line 135
    .line 136
    move-result v5

    .line 137
    iget-object v6, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 138
    .line 139
    invoke-virtual {v6}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 140
    .line 141
    .line 142
    move-result-object v6

    .line 143
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 144
    .line 145
    .line 146
    move-result v6

    .line 147
    const/4 v7, 0x4

    .line 148
    if-gt v6, v0, :cond_6

    .line 149
    .line 150
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 151
    .line 152
    iget v0, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 153
    .line 154
    if-ne v0, v7, :cond_5

    .line 155
    .line 156
    move v3, v2

    .line 157
    :cond_5
    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    .line 158
    .line 159
    .line 160
    move-result v4

    .line 161
    move v5, v3

    .line 162
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 163
    .line 164
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    iget-boolean v0, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 169
    .line 170
    if-eqz v0, :cond_9

    .line 171
    .line 172
    if-le v5, v2, :cond_7

    .line 173
    .line 174
    if-ge v5, v7, :cond_7

    .line 175
    .line 176
    move v5, v7

    .line 177
    :cond_7
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 178
    .line 179
    iget v0, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 180
    .line 181
    invoke-static {v7, v0}, Ljava/lang/Math;->min(II)I

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    invoke-static {v5, v0}, Ljava/lang/Math;->min(II)I

    .line 186
    .line 187
    .line 188
    move-result v5

    .line 189
    if-ne v5, v7, :cond_8

    .line 190
    .line 191
    move v4, v2

    .line 192
    :cond_8
    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    .line 193
    .line 194
    .line 195
    move-result v4

    .line 196
    :cond_9
    move v11, v4

    .line 197
    move v10, v5

    .line 198
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 199
    .line 200
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    iget-boolean v0, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 205
    .line 206
    const-string v1, "TransformFolderIcon"

    .line 207
    .line 208
    if-eqz v0, :cond_a

    .line 209
    .line 210
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 211
    .line 212
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->q()Z

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    if-eqz v0, :cond_a

    .line 221
    .line 222
    const-string p0, "updateFolderIconSpan return, showTransformFolderInNormalMode and isMoreDragMode"

    .line 223
    .line 224
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :cond_a
    if-lez v10, :cond_b

    .line 229
    .line 230
    if-gtz v11, :cond_c

    .line 231
    .line 232
    :cond_b
    move-object v6, p0

    .line 233
    goto :goto_5

    .line 234
    :cond_c
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 235
    .line 236
    iget v1, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 237
    .line 238
    if-lt v10, v1, :cond_e

    .line 239
    .line 240
    iget v0, v0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 241
    .line 242
    if-ge v11, v0, :cond_d

    .line 243
    .line 244
    goto :goto_3

    .line 245
    :cond_d
    :goto_2
    return-void

    .line 246
    :cond_e
    :goto_3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    check-cast v0, Lcom/android/launcher3/CellLayout;

    .line 255
    .line 256
    invoke-virtual {v0, p0}, Lcom/android/launcher3/CellLayout;->g0(Landroid/view/View;)V

    .line 257
    .line 258
    .line 259
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 260
    .line 261
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    iget-boolean v0, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 266
    .line 267
    if-nez v0, :cond_f

    .line 268
    .line 269
    iget-object v6, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 270
    .line 271
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 272
    .line 273
    iget v8, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 274
    .line 275
    iget v9, v0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 276
    .line 277
    move-object v7, p0

    .line 278
    invoke-virtual/range {v6 .. v11}, Lcom/android/launcher3/folder/u0;->j0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;IIII)V

    .line 279
    .line 280
    .line 281
    move-object v6, v7

    .line 282
    goto :goto_4

    .line 283
    :cond_f
    move-object v6, p0

    .line 284
    :goto_4
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 285
    .line 286
    .line 287
    move-result-object p0

    .line 288
    check-cast p0, Lc1/b;

    .line 289
    .line 290
    iput v10, p0, Lc1/b;->f:I

    .line 291
    .line 292
    iput v11, p0, Lc1/b;->g:I

    .line 293
    .line 294
    iget-object v7, v6, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 295
    .line 296
    iget-object p0, v6, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 297
    .line 298
    iget v8, p0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 299
    .line 300
    iget v9, p0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 301
    .line 302
    const/4 v12, 0x1

    .line 303
    invoke-static/range {v6 .. v12}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->h0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/C2;IIIIZ)V

    .line 304
    .line 305
    .line 306
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->requestLayout()V

    .line 307
    .line 308
    .line 309
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 310
    .line 311
    .line 312
    move-result-object p0

    .line 313
    invoke-interface {p0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 314
    .line 315
    .line 316
    move-result-object p0

    .line 317
    check-cast p0, Lcom/android/launcher3/CellLayout;

    .line 318
    .line 319
    invoke-virtual {p0, v6}, Lcom/android/launcher3/CellLayout;->f0(Landroid/view/View;)V

    .line 320
    .line 321
    .line 322
    return-void

    .line 323
    :goto_5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 324
    .line 325
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 326
    .line 327
    .line 328
    const-string v0, "updateFolderIconSpan error return, cellX="

    .line 329
    .line 330
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 331
    .line 332
    .line 333
    iget-object v0, v6, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 334
    .line 335
    iget v0, v0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 336
    .line 337
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 338
    .line 339
    .line 340
    const-string v0, " cellY="

    .line 341
    .line 342
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 343
    .line 344
    .line 345
    iget-object v0, v6, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 346
    .line 347
    iget v0, v0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 348
    .line 349
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    const-string v0, " maxSpanX="

    .line 353
    .line 354
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 355
    .line 356
    .line 357
    invoke-virtual {p0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    const-string v0, " maxSpanY="

    .line 361
    .line 362
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    invoke-virtual {p0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 366
    .line 367
    .line 368
    const-string v0, " mInfo="

    .line 369
    .line 370
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    iget-object v0, v6, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 374
    .line 375
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 376
    .line 377
    .line 378
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 379
    .line 380
    .line 381
    move-result-object p0

    .line 382
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 383
    .line 384
    .line 385
    return-void
.end method

.method public C(Landroid/graphics/Rect;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x0

    .line 14
    if-lez v2, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingRight()I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    sub-int/2addr v2, v4

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v2, v3

    .line 27
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-lez v4, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingBottom()I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    sub-int/2addr v3, v4

    .line 42
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 43
    .line 44
    if-eqz p0, :cond_2

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 51
    .line 52
    iget v4, p0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 53
    .line 54
    sub-int/2addr v3, v4

    .line 55
    iget v4, p0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 56
    .line 57
    add-int/2addr v0, v4

    .line 58
    iget p0, p0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 59
    .line 60
    sub-int/2addr v2, p0

    .line 61
    :cond_2
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public C1(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    iput p1, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 4
    .line 5
    iput p2, v0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-boolean v0, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 14
    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 18
    .line 19
    iget p2, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    if-ne p2, v0, :cond_0

    .line 23
    .line 24
    iget p2, p1, Lcom/android/launcher3/model/data/p;->m:I

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v1, 0x4

    .line 28
    if-ne p2, v1, :cond_1

    .line 29
    .line 30
    iget p2, p1, Lcom/android/launcher3/model/data/p;->m:I

    .line 31
    .line 32
    mul-int/2addr p2, v0

    .line 33
    :cond_1
    :goto_0
    iget v1, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 34
    .line 35
    if-ne v1, v0, :cond_2

    .line 36
    .line 37
    iget p1, p1, Lcom/android/launcher3/model/data/p;->n:I

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_2
    move p1, v1

    .line 41
    :goto_1
    move v2, p2

    .line 42
    move p2, p1

    .line 43
    move p1, v2

    .line 44
    :cond_3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->D1(II)V

    .line 45
    .line 46
    .line 47
    invoke-direct {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->u1()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public D()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->h0:Lcom/android/launcher3/Workspace;

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    invoke-virtual {v0, v3}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    instance-of v3, v0, Lcom/android/launcher3/CellLayout;

    .line 22
    .line 23
    if-eqz v3, :cond_0

    .line 24
    .line 25
    check-cast v0, Lcom/android/launcher3/CellLayout;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-ltz v0, :cond_0

    .line 36
    .line 37
    move v1, v2

    .line 38
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v0, v0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    if-nez v1, :cond_1

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 53
    .line 54
    iget p0, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 55
    .line 56
    const/16 v0, -0x65

    .line 57
    .line 58
    if-ne p0, v0, :cond_1

    .line 59
    .line 60
    return v2

    .line 61
    :cond_1
    return v1
.end method

.method public D1(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    iput p1, v0, Lcom/android/launcher3/model/data/p;->k:I

    .line 4
    .line 5
    iput p2, v0, Lcom/android/launcher3/model/data/p;->l:I

    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Lz1/J3;->a0(Lcom/android/launcher3/model/data/p;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public E(I)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 2

    .line 1
    iget-object p2, p1, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 2
    .line 3
    if-eq p2, p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p2, "TransformFolderIcon"

    .line 7
    .line 8
    const-string v0, "onDragStart 1"

    .line 9
    .line 10
    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    iget-object p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->o0:Landroid/view/View;

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Lcom/android/launcher3/CellLayout;->removeView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    iget-object p2, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 21
    .line 22
    instance-of p2, p2, Lcom/android/launcher3/model/data/I;

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    if-eqz p2, :cond_1

    .line 26
    .line 27
    new-instance p2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$n;

    .line 28
    .line 29
    invoke-direct {p2, p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$n;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V

    .line 30
    .line 31
    .line 32
    :try_start_0
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 35
    .line 36
    filled-new-array {p1}, [Lcom/android/launcher3/model/data/y;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {v1, v0, p1}, Lcom/android/launcher3/folder/Folder;->W1(Z[Lcom/android/launcher3/model/data/y;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .line 42
    .line 43
    invoke-virtual {p2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$n;->close()V

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    :try_start_1
    invoke-virtual {p2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$n;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_1
    move-exception p1

    .line 53
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    :goto_0
    throw p0

    .line 57
    :cond_1
    :goto_1
    iput-boolean v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->q0:Z

    .line 58
    .line 59
    return-void
.end method

.method public F1()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

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
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v6, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 17
    .line 18
    iget v2, v6, Lcom/android/launcher3/model/data/p;->k:I

    .line 19
    .line 20
    iget v3, v6, Lcom/android/launcher3/model/data/p;->l:I

    .line 21
    .line 22
    iget v4, v6, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 23
    .line 24
    iget v5, v6, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 25
    .line 26
    invoke-static/range {v1 .. v6}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->d1(Landroid/content/Context;IIIILcom/android/launcher3/model/data/p;)Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->m:Landroid/graphics/Rect;

    .line 35
    .line 36
    iget v2, v0, Landroid/graphics/Rect;->left:I

    .line 37
    .line 38
    iget v3, v0, Landroid/graphics/Rect;->top:I

    .line 39
    .line 40
    iget v4, v0, Landroid/graphics/Rect;->right:I

    .line 41
    .line 42
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 43
    .line 44
    invoke-virtual {v1, v2, v3, v4, v0}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 50
    .line 51
    iget-object v1, v1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lcom/android/launcher3/CellLayout;->setBorderSpace(Landroid/graphics/Point;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 57
    .line 58
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Lc1/b;

    .line 63
    .line 64
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 65
    .line 66
    iget v1, v1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 67
    .line 68
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 69
    .line 70
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 71
    .line 72
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->i0:Landroid/view/View;

    .line 73
    .line 74
    if-eqz v0, :cond_1

    .line 75
    .line 76
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->c()I

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    iput p0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 87
    .line 88
    iput p0, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 89
    .line 90
    :cond_1
    :goto_0
    return-void
.end method

.method public G(Lcom/android/launcher3/n0$a;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

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
    const/4 v1, 0x2

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-boolean v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p0:Z

    .line 13
    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 17
    .line 18
    iget v2, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 19
    .line 20
    iget v3, v0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 21
    .line 22
    mul-int/2addr v2, v3

    .line 23
    if-gt v2, v1, :cond_2

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-gt v0, v1, :cond_2

    .line 34
    .line 35
    goto/16 :goto_2

    .line 36
    .line 37
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p0:Z

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 42
    .line 43
    iget v2, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 44
    .line 45
    iget v3, v0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 46
    .line 47
    mul-int/2addr v2, v3

    .line 48
    iget v3, v0, Lcom/android/launcher3/model/data/p;->m:I

    .line 49
    .line 50
    if-gt v2, v3, :cond_1

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iget-object v2, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 61
    .line 62
    iget v2, v2, Lcom/android/launcher3/model/data/p;->m:I

    .line 63
    .line 64
    if-ne v0, v2, :cond_1

    .line 65
    .line 66
    goto/16 :goto_2

    .line 67
    .line 68
    :cond_1
    iget-boolean v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p0:Z

    .line 69
    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g1()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_2

    .line 77
    .line 78
    goto/16 :goto_2

    .line 79
    .line 80
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->q()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_3

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_3
    new-array v0, v1, [F

    .line 94
    .line 95
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->c1(Lcom/android/launcher3/n0$a;[F)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iput v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->l0:I

    .line 100
    .line 101
    iget v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->m0:I

    .line 102
    .line 103
    if-eq v0, v1, :cond_6

    .line 104
    .line 105
    iget-boolean v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p0:Z

    .line 106
    .line 107
    if-eqz v1, :cond_4

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_4
    add-int/lit8 v0, v0, -0x1

    .line 111
    .line 112
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 113
    .line 114
    invoke-virtual {v1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 123
    .line 124
    if-ne v0, v1, :cond_5

    .line 125
    .line 126
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->u:Lcom/android/launcher3/c;

    .line 127
    .line 128
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->v0:Lcom/android/launcher3/L4;

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Lcom/android/launcher3/c;->e(Lcom/android/launcher3/L4;)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->u:Lcom/android/launcher3/c;

    .line 134
    .line 135
    const-wide/16 v1, 0x320

    .line 136
    .line 137
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/c;->d(J)V

    .line 138
    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->u:Lcom/android/launcher3/c;

    .line 142
    .line 143
    invoke-virtual {v0}, Lcom/android/launcher3/c;->b()V

    .line 144
    .line 145
    .line 146
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->r0:Lcom/android/launcher3/c;

    .line 147
    .line 148
    invoke-virtual {v0}, Lcom/android/launcher3/c;->b()V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->r0:Lcom/android/launcher3/c;

    .line 152
    .line 153
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->w0:Lcom/android/launcher3/L4;

    .line 154
    .line 155
    invoke-virtual {v0, v1}, Lcom/android/launcher3/c;->e(Lcom/android/launcher3/L4;)V

    .line 156
    .line 157
    .line 158
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->r0:Lcom/android/launcher3/c;

    .line 159
    .line 160
    const-wide/16 v1, 0xfa

    .line 161
    .line 162
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/c;->d(J)V

    .line 163
    .line 164
    .line 165
    iget v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->l0:I

    .line 166
    .line 167
    iput v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->m0:I

    .line 168
    .line 169
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->l:LO0/e;

    .line 170
    .line 171
    if-eqz p1, :cond_6

    .line 172
    .line 173
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    iget p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->l0:I

    .line 178
    .line 179
    add-int/lit8 p0, p0, 0x1

    .line 180
    .line 181
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    const v1, 0x7f14027a

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0, v1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    invoke-virtual {p1, p0}, LO0/e;->a(Ljava/lang/CharSequence;)V

    .line 197
    .line 198
    .line 199
    :cond_6
    :goto_2
    return-void
.end method

.method public H()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/folder/FolderIcon;->H()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public I(Lcom/android/launcher3/n0$a;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->h:Z

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    if-nez v0, :cond_3

    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 25
    .line 26
    instance-of v2, v0, Lcom/android/launcher3/C2;

    .line 27
    .line 28
    if-eqz v2, :cond_0

    .line 29
    .line 30
    check-cast v0, Lcom/android/launcher3/C2;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->v2()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_3

    .line 37
    .line 38
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 39
    .line 40
    instance-of v2, v0, Lcom/android/launcher3/C2;

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    check-cast v0, Lcom/android/launcher3/C2;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->O0:Z

    .line 51
    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0, p1}, Lcom/android/launcher3/folder/Folder;->I(Lcom/android/launcher3/n0$a;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 70
    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    iget v0, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 74
    .line 75
    const/4 v2, 0x1

    .line 76
    if-ne v0, v2, :cond_2

    .line 77
    .line 78
    iget p1, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 79
    .line 80
    if-ne p1, v2, :cond_2

    .line 81
    .line 82
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 83
    .line 84
    sget-object p1, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 85
    .line 86
    invoke-interface {p0, p1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    if-nez p0, :cond_2

    .line 91
    .line 92
    return v2

    .line 93
    :cond_2
    return v1

    .line 94
    :cond_3
    :goto_0
    const-string p0, "TransformFolderIcon"

    .line 95
    .line 96
    const-string p1, "acceptDrop false"

    .line 97
    .line 98
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    return v1
.end method

.method public J(Lcom/android/launcher3/n0$a;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onDragExit dragObject dragComplete="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-boolean v1, p1, Lcom/android/launcher3/n0$a;->e:Z

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, " mIsExternalDrag="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-boolean v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p0:Z

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, ", folder: "

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "TransformFolderIcon"

    .line 43
    .line 44
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 48
    .line 49
    iget v0, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 50
    .line 51
    const/16 v1, -0x65

    .line 52
    .line 53
    if-ne v0, v1, :cond_0

    .line 54
    .line 55
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const/4 v1, 0x2

    .line 62
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const v2, 0x7f0b02eb

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v2, v1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    :cond_0
    const/4 v0, 0x1

    .line 73
    iput-boolean v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->y0:Z

    .line 74
    .line 75
    iget-boolean v0, p1, Lcom/android/launcher3/n0$a;->e:Z

    .line 76
    .line 77
    const/4 v1, 0x0

    .line 78
    if-nez v0, :cond_1

    .line 79
    .line 80
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->s0:Lcom/android/launcher3/c;

    .line 81
    .line 82
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->x0:Lcom/android/launcher3/L4;

    .line 83
    .line 84
    invoke-virtual {v0, v2}, Lcom/android/launcher3/c;->e(Lcom/android/launcher3/L4;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->s0:Lcom/android/launcher3/c;

    .line 88
    .line 89
    const-wide/16 v2, 0x190

    .line 90
    .line 91
    invoke-virtual {v0, v2, v3}, Lcom/android/launcher3/c;->d(J)V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 98
    .line 99
    .line 100
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->r0:Lcom/android/launcher3/c;

    .line 101
    .line 102
    invoke-virtual {v0}, Lcom/android/launcher3/c;->b()V

    .line 103
    .line 104
    .line 105
    iget-boolean p1, p1, Lcom/android/launcher3/n0$a;->e:Z

    .line 106
    .line 107
    if-nez p1, :cond_2

    .line 108
    .line 109
    iget-object p1, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 110
    .line 111
    invoke-virtual {p1, p0}, Lcom/android/launcher3/folder/u0;->d0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V

    .line 112
    .line 113
    .line 114
    :cond_2
    iget-boolean p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p0:Z

    .line 115
    .line 116
    if-eqz p1, :cond_3

    .line 117
    .line 118
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->u0:Landroid/util/Pair;

    .line 119
    .line 120
    if-nez p1, :cond_3

    .line 121
    .line 122
    iget-object p1, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 123
    .line 124
    invoke-virtual {p1, p0, v1}, Lcom/android/launcher3/folder/u0;->k0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Z)V

    .line 125
    .line 126
    .line 127
    :cond_3
    const/4 p1, 0x0

    .line 128
    iput-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->u0:Landroid/util/Pair;

    .line 129
    .line 130
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->u:Lcom/android/launcher3/c;

    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/android/launcher3/c;->b()V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public L0(Landroid/view/View;Lcom/android/launcher3/model/data/I;I)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    move-object v5, v0

    .line 6
    check-cast v5, Lc1/b;

    .line 7
    .line 8
    invoke-direct {p0, p3}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->W0(I)Landroid/graphics/Point;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget v0, v0, Landroid/graphics/Point;->x:I

    .line 13
    .line 14
    invoke-virtual {v5, v0}, Lc1/b;->e(I)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, p3}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->W0(I)Landroid/graphics/Point;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 22
    .line 23
    invoke-virtual {v5, v0}, Lc1/b;->g(I)V

    .line 24
    .line 25
    .line 26
    iput p3, p2, Lcom/android/launcher3/model/data/y;->rank:I

    .line 27
    .line 28
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 29
    .line 30
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getViewId()I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    const/4 v6, 0x1

    .line 35
    move-object v2, p1

    .line 36
    move v3, p3

    .line 37
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/CellLayout;->e(Landroid/view/View;IILc1/b;Z)Z

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public M0()V
    .locals 15

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_3

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 10
    .line 11
    iget v7, v0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 12
    .line 13
    iget v8, v0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v5, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 20
    .line 21
    iget v1, v5, Lcom/android/launcher3/model/data/p;->k:I

    .line 22
    .line 23
    iget v2, v5, Lcom/android/launcher3/model/data/p;->l:I

    .line 24
    .line 25
    iget v3, v5, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 26
    .line 27
    iget v4, v5, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 28
    .line 29
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->d1(Landroid/content/Context;IIIILcom/android/launcher3/model/data/p;)Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getAllChildBubbleTextViewDrawableList()Ljava/util/ArrayList;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 38
    .line 39
    iget v1, v0, Lcom/android/launcher3/model/data/p;->m:I

    .line 40
    .line 41
    const/4 v2, 0x2

    .line 42
    if-ne v1, v2, :cond_1

    .line 43
    .line 44
    const/4 v1, 0x3

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    move v1, v2

    .line 47
    :goto_0
    iput v1, v0, Lcom/android/launcher3/model/data/p;->n:I

    .line 48
    .line 49
    iput v1, v0, Lcom/android/launcher3/model/data/p;->m:I

    .line 50
    .line 51
    iget v4, v0, Lcom/android/launcher3/model/data/p;->k:I

    .line 52
    .line 53
    const/4 v6, 0x1

    .line 54
    if-ne v4, v6, :cond_2

    .line 55
    .line 56
    move v4, v6

    .line 57
    goto :goto_1

    .line 58
    :cond_2
    iget v4, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 59
    .line 60
    mul-int/2addr v4, v1

    .line 61
    div-int/2addr v4, v2

    .line 62
    :goto_1
    iget v9, v0, Lcom/android/launcher3/model/data/p;->l:I

    .line 63
    .line 64
    if-ne v9, v6, :cond_3

    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_3
    iget v0, v0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 68
    .line 69
    mul-int/2addr v0, v1

    .line 70
    div-int/lit8 v6, v0, 0x2

    .line 71
    .line 72
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    const-string v1, "changeFolderGridMode: "

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v1, " , "

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 97
    .line 98
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    const-string v1, "TransformFolderIcon"

    .line 108
    .line 109
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0, v4, v6}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->D1(II)V

    .line 113
    .line 114
    .line 115
    invoke-direct {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->u1()V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 122
    .line 123
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iget-boolean v0, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 128
    .line 129
    if-eqz v0, :cond_4

    .line 130
    .line 131
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 132
    .line 133
    .line 134
    move-result-object v9

    .line 135
    iget-object v14, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 136
    .line 137
    iget v10, v14, Lcom/android/launcher3/model/data/p;->k:I

    .line 138
    .line 139
    iget v11, v14, Lcom/android/launcher3/model/data/p;->l:I

    .line 140
    .line 141
    iget v12, v14, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 142
    .line 143
    iget v13, v14, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 144
    .line 145
    invoke-static/range {v9 .. v14}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->d1(Landroid/content/Context;IIIILcom/android/launcher3/model/data/p;)Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getAllChildBubbleTextViewDrawableList()Ljava/util/ArrayList;

    .line 150
    .line 151
    .line 152
    move-result-object v6

    .line 153
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 154
    .line 155
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 156
    .line 157
    iget v9, v0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 158
    .line 159
    iget v10, v0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 160
    .line 161
    move-object v2, p0

    .line 162
    invoke-virtual/range {v1 .. v10}, Lcom/android/launcher3/folder/u0;->p0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;Ljava/util/ArrayList;Ljava/util/ArrayList;IIII)V

    .line 163
    .line 164
    .line 165
    :cond_4
    :goto_3
    return-void
.end method

.method public O0()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->t1()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->N0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public Q(FF)Z
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->C(Landroid/graphics/Rect;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const v2, 0x7f070c18

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const v2, 0x7f070c19

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    iget v2, v0, Landroid/graphics/Rect;->left:I

    .line 32
    .line 33
    sub-int/2addr v2, v1

    .line 34
    iput v2, v0, Landroid/graphics/Rect;->left:I

    .line 35
    .line 36
    iget v2, v0, Landroid/graphics/Rect;->top:I

    .line 37
    .line 38
    sub-int/2addr v2, v1

    .line 39
    iput v2, v0, Landroid/graphics/Rect;->top:I

    .line 40
    .line 41
    iget v2, v0, Landroid/graphics/Rect;->right:I

    .line 42
    .line 43
    add-int/2addr v2, v1

    .line 44
    iput v2, v0, Landroid/graphics/Rect;->right:I

    .line 45
    .line 46
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 47
    .line 48
    add-int/2addr v1, p0

    .line 49
    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 50
    .line 51
    float-to-int p0, p1

    .line 52
    float-to-int p1, p2

    .line 53
    invoke-virtual {v0, p0, p1}, Landroid/graphics/Rect;->contains(II)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    return p0
.end method

.method public R(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 4
    .line 5
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_3

    .line 10
    .line 11
    move v2, v0

    .line 12
    :goto_1
    iget-object v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 13
    .line 14
    invoke-virtual {v3}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-ge v2, v3, :cond_2

    .line 19
    .line 20
    iget-object v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 21
    .line 22
    invoke-virtual {v3, v2, v1}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    if-eqz v3, :cond_0

    .line 27
    .line 28
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    instance-of v4, v4, Lcom/android/launcher3/model/data/y;

    .line 33
    .line 34
    if-eqz v4, :cond_0

    .line 35
    .line 36
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    check-cast v4, Lcom/android/launcher3/model/data/y;

    .line 41
    .line 42
    invoke-interface {p1, v4, v3}, Lcom/android/launcher3/util/Y0$a;->a(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    if-eqz v4, :cond_0

    .line 47
    .line 48
    return-object v3

    .line 49
    :cond_0
    instance-of v4, v3, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 50
    .line 51
    if-eqz v4, :cond_1

    .line 52
    .line 53
    check-cast v3, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 54
    .line 55
    invoke-virtual {v3, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->l(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_3
    const/4 p0, 0x0

    .line 67
    return-object p0
.end method

.method public V0(Landroid/graphics/Rect;)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, v1, v1}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    instance-of v2, v0, Lcom/android/launcher3/BubbleTextView;

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Lcom/android/launcher3/BubbleTextView;->d0(Landroid/graphics/Rect;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 20
    .line 21
    iget p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    return v1
.end method

.method public W(Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->o(Lcom/android/launcher3/model/data/y;)Z

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public X()V
    .locals 1

    .line 1
    const-string p0, "TransformFolderIcon"

    .line 2
    .line 3
    const-string v0, "onDragExit empty"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Y(Lcom/android/launcher3/n0$a;Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/folder/FolderIcon;->Y(Lcom/android/launcher3/n0$a;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected Z(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;Landroid/graphics/Rect;FIZ)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p5

    .line 8
    .line 9
    move/from16 v4, p6

    .line 10
    .line 11
    const-string v5, "TransformFolderIcon"

    .line 12
    .line 13
    new-instance v6, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v7, "onDrop() called with: d = ["

    .line 19
    .line 20
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v7, "], itemReturnedOnFailedDrop = ["

    .line 27
    .line 28
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v7, "]"

    .line 35
    .line 36
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    const-string v5, "TransformFolderIcon"

    .line 47
    .line 48
    new-instance v6, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v7, "onDrop 1--itemReturnedOnFailedDrop:"

    .line 54
    .line 55
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v4, "--d: "

    .line 62
    .line 63
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    const/4 v4, -0x1

    .line 81
    iput v4, v1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 82
    .line 83
    iput v4, v1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 84
    .line 85
    iget-object v6, v2, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 86
    .line 87
    if-eqz v6, :cond_6

    .line 88
    .line 89
    iget-object v4, v0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 90
    .line 91
    instance-of v4, v4, Lcom/android/launcher3/C2;

    .line 92
    .line 93
    if-eqz v4, :cond_6

    .line 94
    .line 95
    const-string v4, "TransformFolderIcon"

    .line 96
    .line 97
    new-instance v5, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .line 101
    .line 102
    const-string v7, "onDrop 1--animateView: "

    .line 103
    .line 104
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 108
    .line 109
    .line 110
    move-result-object v7

    .line 111
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    iget-object v4, v0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 122
    .line 123
    check-cast v4, Lcom/android/launcher3/C2;

    .line 124
    .line 125
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    new-instance v7, Landroid/graphics/Rect;

    .line 130
    .line 131
    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v5, v6, v7}, Lcom/android/launcher3/views/BaseDragLayer;->getViewRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 135
    .line 136
    .line 137
    const/high16 v7, 0x3f800000    # 1.0f

    .line 138
    .line 139
    if-nez p3, :cond_0

    .line 140
    .line 141
    new-instance v8, Landroid/graphics/Rect;

    .line 142
    .line 143
    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 147
    .line 148
    .line 149
    move-result-object v4

    .line 150
    invoke-virtual {v4}, Lcom/android/launcher3/Workspace;->V2()V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getScaleX()F

    .line 154
    .line 155
    .line 156
    move-result v9

    .line 157
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getScaleY()F

    .line 158
    .line 159
    .line 160
    move-result v10

    .line 161
    invoke-virtual {v0, v7}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v0, v7}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v5, v0, v8}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 168
    .line 169
    .line 170
    move-result v11

    .line 171
    invoke-virtual {v0, v9}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v0, v10}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v4}, Lcom/android/launcher3/Workspace;->Q2()V

    .line 178
    .line 179
    .line 180
    goto :goto_0

    .line 181
    :cond_0
    move-object/from16 v8, p3

    .line 182
    .line 183
    move/from16 v11, p4

    .line 184
    .line 185
    :goto_0
    iget-object v4, v0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 186
    .line 187
    invoke-interface {v4}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 188
    .line 189
    .line 190
    move-result-object v4

    .line 191
    iget-object v4, v4, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 192
    .line 193
    iget v4, v4, Lcom/android/launcher3/r4;->U:I

    .line 194
    .line 195
    iget-object v9, v0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 196
    .line 197
    const/4 v10, 0x1

    .line 198
    invoke-virtual {v9, v1, v3, v10}, Lcom/android/launcher3/folder/Folder;->E0(Lcom/android/launcher3/model/data/y;IZ)V

    .line 199
    .line 200
    .line 201
    const/4 v9, 0x2

    .line 202
    new-array v12, v9, [I

    .line 203
    .line 204
    invoke-virtual {v0, v3, v4, v12}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->y(II[I)F

    .line 205
    .line 206
    .line 207
    move-result v13

    .line 208
    const/4 v14, 0x0

    .line 209
    aget v15, v12, v14

    .line 210
    .line 211
    int-to-float v15, v15

    .line 212
    mul-float/2addr v15, v11

    .line 213
    invoke-static {v15}, Ljava/lang/Math;->round(F)I

    .line 214
    .line 215
    .line 216
    move-result v15

    .line 217
    aput v15, v12, v14

    .line 218
    .line 219
    aget v15, v12, v10

    .line 220
    .line 221
    int-to-float v15, v15

    .line 222
    mul-float/2addr v15, v11

    .line 223
    invoke-static {v15}, Ljava/lang/Math;->round(F)I

    .line 224
    .line 225
    .line 226
    move-result v15

    .line 227
    aput v15, v12, v10

    .line 228
    .line 229
    const-string v15, "TransformFolderIcon"

    .line 230
    .line 231
    move/from16 p6, v7

    .line 232
    .line 233
    new-instance v7, Ljava/lang/StringBuilder;

    .line 234
    .line 235
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 236
    .line 237
    .line 238
    move/from16 p3, v9

    .line 239
    .line 240
    const-string v9, "onDrop 1--scale: "

    .line 241
    .line 242
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    const-string v9, "--center[0]:"

    .line 249
    .line 250
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    aget v9, v12, v14

    .line 254
    .line 255
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    const-string v9, "--center[1]:"

    .line 259
    .line 260
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    aget v9, v12, v10

    .line 264
    .line 265
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v7

    .line 272
    invoke-static {v15, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    .line 274
    .line 275
    aget v7, v12, v14

    .line 276
    .line 277
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 278
    .line 279
    .line 280
    move-result v9

    .line 281
    div-int/lit8 v9, v9, 0x2

    .line 282
    .line 283
    sub-int/2addr v7, v9

    .line 284
    aget v9, v12, v10

    .line 285
    .line 286
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 287
    .line 288
    .line 289
    move-result v10

    .line 290
    div-int/lit8 v10, v10, 0x2

    .line 291
    .line 292
    sub-int/2addr v9, v10

    .line 293
    invoke-virtual {v8, v7, v9}, Landroid/graphics/Rect;->offset(II)V

    .line 294
    .line 295
    .line 296
    iget-object v7, v0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 297
    .line 298
    check-cast v7, Lcom/android/launcher3/C2;

    .line 299
    .line 300
    invoke-virtual {v7}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 301
    .line 302
    .line 303
    move-result-object v7

    .line 304
    invoke-virtual {v7}, Lcom/android/launcher3/G4;->q()Z

    .line 305
    .line 306
    .line 307
    move-result v7

    .line 308
    if-eqz v7, :cond_1

    .line 309
    .line 310
    iget-object v7, v0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 311
    .line 312
    invoke-interface {v7}, Lcom/android/launcher3/views/k;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 313
    .line 314
    .line 315
    move-result-object v7

    .line 316
    invoke-virtual {v7}, Lcom/android/launcher3/dragndrop/j;->A()Landroid/graphics/Point;

    .line 317
    .line 318
    .line 319
    move-result-object v7

    .line 320
    iget v9, v7, Landroid/graphics/Point;->x:I

    .line 321
    .line 322
    int-to-float v9, v9

    .line 323
    invoke-virtual {v6, v9}, Landroid/widget/FrameLayout;->setPivotX(F)V

    .line 324
    .line 325
    .line 326
    iget v9, v7, Landroid/graphics/Point;->y:I

    .line 327
    .line 328
    int-to-float v9, v9

    .line 329
    invoke-virtual {v6, v9}, Landroid/widget/FrameLayout;->setPivotY(F)V

    .line 330
    .line 331
    .line 332
    iget v9, v7, Landroid/graphics/Point;->x:I

    .line 333
    .line 334
    neg-int v9, v9

    .line 335
    iget v7, v7, Landroid/graphics/Point;->y:I

    .line 336
    .line 337
    neg-int v7, v7

    .line 338
    invoke-virtual {v8, v9, v7}, Landroid/graphics/Rect;->offset(II)V

    .line 339
    .line 340
    .line 341
    :cond_1
    if-ge v3, v4, :cond_2

    .line 342
    .line 343
    const/high16 v3, 0x3f000000    # 0.5f

    .line 344
    .line 345
    goto :goto_1

    .line 346
    :cond_2
    const/4 v3, 0x0

    .line 347
    :goto_1
    mul-float/2addr v13, v11

    .line 348
    iget-object v4, v2, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 349
    .line 350
    instance-of v4, v4, Lcom/android/launcher3/allapps/r;

    .line 351
    .line 352
    if-eqz v4, :cond_3

    .line 353
    .line 354
    iget-object v4, v0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 355
    .line 356
    invoke-interface {v4}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 357
    .line 358
    .line 359
    move-result-object v4

    .line 360
    iget v7, v4, Lcom/android/launcher3/h0;->B1:I

    .line 361
    .line 362
    int-to-float v7, v7

    .line 363
    mul-float v7, v7, p6

    .line 364
    .line 365
    iget v4, v4, Lcom/android/launcher3/h0;->J2:I

    .line 366
    .line 367
    int-to-float v4, v4

    .line 368
    div-float/2addr v7, v4

    .line 369
    mul-float/2addr v13, v7

    .line 370
    :cond_3
    move v9, v13

    .line 371
    const-string v4, "TransformFolderIcon"

    .line 372
    .line 373
    const-string v7, "onDrop 1 animateView"

    .line 374
    .line 375
    invoke-static {v4, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 376
    .line 377
    .line 378
    iget-object v4, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 379
    .line 380
    invoke-virtual {v4}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 381
    .line 382
    .line 383
    move-result-object v4

    .line 384
    iget-boolean v4, v4, Lcom/android/launcher3/X3;->B0:Z

    .line 385
    .line 386
    if-eqz v4, :cond_4

    .line 387
    .line 388
    iget-object v4, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 389
    .line 390
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 391
    .line 392
    .line 393
    move-result-object v4

    .line 394
    invoke-virtual {v4}, Lcom/android/launcher3/G4;->q()Z

    .line 395
    .line 396
    .line 397
    move-result v4

    .line 398
    if-eqz v4, :cond_4

    .line 399
    .line 400
    sget-object v12, Lcom/android/launcher3/anim/L;->j:Landroid/view/animation/Interpolator;

    .line 401
    .line 402
    const/4 v14, 0x0

    .line 403
    const/4 v15, 0x0

    .line 404
    const/16 v11, 0x190

    .line 405
    .line 406
    const/4 v13, 0x0

    .line 407
    move v10, v9

    .line 408
    move-object v7, v8

    .line 409
    move v8, v3

    .line 410
    invoke-virtual/range {v5 .. v15}, Lcom/android/launcher3/dragndrop/DragLayer;->f(Lcom/android/launcher3/dragndrop/v;Landroid/graphics/Rect;FFFILandroid/view/animation/Interpolator;Ljava/lang/Runnable;ILandroid/view/View;)V

    .line 411
    .line 412
    .line 413
    :cond_4
    iget-object v3, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 414
    .line 415
    const/16 v4, 0x8

    .line 416
    .line 417
    invoke-virtual {v3, v4}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 418
    .line 419
    .line 420
    move-result v3

    .line 421
    if-nez v3, :cond_5

    .line 422
    .line 423
    iget-object v3, v0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 424
    .line 425
    invoke-virtual {v3, v1}, Lcom/android/launcher3/folder/Folder;->n1(Lcom/android/launcher3/model/data/y;)V

    .line 426
    .line 427
    .line 428
    :cond_5
    new-instance v1, Lcom/android/launcher3/folder/K;

    .line 429
    .line 430
    invoke-direct {v1}, Lcom/android/launcher3/folder/K;-><init>()V

    .line 431
    .line 432
    .line 433
    new-instance v3, Ljava/util/ArrayList;

    .line 434
    .line 435
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 436
    .line 437
    .line 438
    iget-object v4, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 439
    .line 440
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/p;->x()Ljava/util/ArrayList;

    .line 441
    .line 442
    .line 443
    move-result-object v4

    .line 444
    monitor-enter v4

    .line 445
    :try_start_0
    iget-object v5, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 446
    .line 447
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/p;->x()Ljava/util/ArrayList;

    .line 448
    .line 449
    .line 450
    move-result-object v5

    .line 451
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 452
    .line 453
    .line 454
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 455
    sget-object v4, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 456
    .line 457
    new-instance v5, LU1/h;

    .line 458
    .line 459
    invoke-direct {v5, v0, v2, v3, v1}, LU1/h;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/n0$a;Ljava/util/ArrayList;Lcom/android/launcher3/folder/K;)V

    .line 460
    .line 461
    .line 462
    invoke-virtual {v4, v5}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 463
    .line 464
    .line 465
    new-instance v1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$f;

    .line 466
    .line 467
    invoke-direct {v1, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$f;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V

    .line 468
    .line 469
    .line 470
    const-wide/16 v2, 0x1b2

    .line 471
    .line 472
    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/FrameLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 473
    .line 474
    .line 475
    return-void

    .line 476
    :catchall_0
    move-exception v0

    .line 477
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 478
    throw v0

    .line 479
    :cond_6
    invoke-virtual/range {p0 .. p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p(Lcom/android/launcher3/model/data/y;)V

    .line 480
    .line 481
    .line 482
    return-void
.end method

.method public Z0(Lcom/android/launcher3/n0$a;Ljava/util/ArrayList;)Landroid/util/Pair;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/n0$a;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    iget v1, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-ne v1, v2, :cond_0

    .line 7
    .line 8
    iget v0, v0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 9
    .line 10
    if-ne v0, v2, :cond_0

    .line 11
    .line 12
    goto/16 :goto_16

    .line 13
    .line 14
    :cond_0
    if-nez p2, :cond_1

    .line 15
    .line 16
    new-instance p2, Ljava/util/ArrayList;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-direct {p2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-boolean v0, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 34
    .line 35
    const/4 v1, 0x2

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 39
    .line 40
    iget v0, v0, Lcom/android/launcher3/model/data/p;->m:I

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    move v0, v1

    .line 44
    :goto_0
    iget-object v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 45
    .line 46
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    iget-boolean v3, v3, Lcom/android/launcher3/X3;->B0:Z

    .line 51
    .line 52
    if-eqz v3, :cond_3

    .line 53
    .line 54
    iget-object v3, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 55
    .line 56
    iget v3, v3, Lcom/android/launcher3/model/data/p;->n:I

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_3
    move v3, v1

    .line 60
    :goto_1
    iget-object v4, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 61
    .line 62
    iget v5, v4, Lcom/android/launcher3/model/data/p;->k:I

    .line 63
    .line 64
    if-ne v5, v2, :cond_4

    .line 65
    .line 66
    iget v4, v4, Lcom/android/launcher3/model/data/p;->l:I

    .line 67
    .line 68
    if-ne v4, v3, :cond_4

    .line 69
    .line 70
    move v4, v3

    .line 71
    goto :goto_2

    .line 72
    :cond_4
    move v4, v0

    .line 73
    :goto_2
    if-eqz p1, :cond_5

    .line 74
    .line 75
    iget-object v5, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 76
    .line 77
    if-eqz v5, :cond_5

    .line 78
    .line 79
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    if-eq v5, v4, :cond_5

    .line 84
    .line 85
    goto/16 :goto_16

    .line 86
    .line 87
    :cond_5
    if-nez p1, :cond_6

    .line 88
    .line 89
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    if-le p2, v4, :cond_6

    .line 94
    .line 95
    goto/16 :goto_16

    .line 96
    .line 97
    :cond_6
    iget-object p2, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 98
    .line 99
    iget v4, p2, Lcom/android/launcher3/model/data/p;->k:I

    .line 100
    .line 101
    if-ne v4, v2, :cond_7

    .line 102
    .line 103
    iget v5, p2, Lcom/android/launcher3/model/data/p;->l:I

    .line 104
    .line 105
    if-eq v5, v3, :cond_8

    .line 106
    .line 107
    :cond_7
    if-ne v4, v0, :cond_21

    .line 108
    .line 109
    iget p2, p2, Lcom/android/launcher3/model/data/p;->l:I

    .line 110
    .line 111
    if-eq p2, v2, :cond_8

    .line 112
    .line 113
    goto/16 :goto_16

    .line 114
    .line 115
    :cond_8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    const/4 v4, -0x1

    .line 120
    if-eqz p2, :cond_20

    .line 121
    .line 122
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    invoke-interface {p2}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    instance-of p2, p2, Lcom/android/launcher3/CellLayout;

    .line 131
    .line 132
    if-eqz p2, :cond_20

    .line 133
    .line 134
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 135
    .line 136
    .line 137
    move-result-object p2

    .line 138
    invoke-interface {p2}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 139
    .line 140
    .line 141
    move-result-object p2

    .line 142
    check-cast p2, Lcom/android/launcher3/CellLayout;

    .line 143
    .line 144
    iget-object v5, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 145
    .line 146
    iget v6, v5, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 147
    .line 148
    iget v5, v5, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 149
    .line 150
    const/4 v7, 0x0

    .line 151
    if-eqz p1, :cond_9

    .line 152
    .line 153
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 154
    .line 155
    if-eqz p1, :cond_9

    .line 156
    .line 157
    iget v8, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 158
    .line 159
    iget v9, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 160
    .line 161
    iget p1, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 162
    .line 163
    iget-object v10, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->h0:Lcom/android/launcher3/Workspace;

    .line 164
    .line 165
    invoke-virtual {v10, p2}, Lcom/android/launcher3/Workspace;->f(Lcom/android/launcher3/CellLayout;)I

    .line 166
    .line 167
    .line 168
    move-result v10

    .line 169
    if-ne p1, v10, :cond_a

    .line 170
    .line 171
    move p1, v2

    .line 172
    goto :goto_3

    .line 173
    :cond_9
    move v9, v5

    .line 174
    move v8, v6

    .line 175
    :cond_a
    move p1, v7

    .line 176
    :goto_3
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 177
    .line 178
    iget v10, p0, Lcom/android/launcher3/model/data/p;->k:I

    .line 179
    .line 180
    if-ne v10, v0, :cond_15

    .line 181
    .line 182
    iget v0, p0, Lcom/android/launcher3/model/data/p;->l:I

    .line 183
    .line 184
    if-ne v0, v2, :cond_15

    .line 185
    .line 186
    invoke-virtual {p2}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 187
    .line 188
    .line 189
    move-result p0

    .line 190
    sub-int/2addr p0, v2

    .line 191
    if-ge v5, p0, :cond_f

    .line 192
    .line 193
    add-int/lit8 p0, v5, 0x1

    .line 194
    .line 195
    invoke-virtual {p2, v6, p0}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    if-eqz v0, :cond_c

    .line 200
    .line 201
    if-eqz p1, :cond_b

    .line 202
    .line 203
    if-ne v6, v8, :cond_b

    .line 204
    .line 205
    if-ne p0, v9, :cond_b

    .line 206
    .line 207
    goto :goto_4

    .line 208
    :cond_b
    move v0, v7

    .line 209
    goto :goto_5

    .line 210
    :cond_c
    :goto_4
    move v0, v2

    .line 211
    :goto_5
    add-int/lit8 v3, v6, 0x1

    .line 212
    .line 213
    invoke-virtual {p2, v3, p0}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 214
    .line 215
    .line 216
    move-result-object v10

    .line 217
    if-eqz v10, :cond_e

    .line 218
    .line 219
    if-eqz p1, :cond_d

    .line 220
    .line 221
    if-ne v3, v8, :cond_d

    .line 222
    .line 223
    if-ne p0, v9, :cond_d

    .line 224
    .line 225
    goto :goto_6

    .line 226
    :cond_d
    move p0, v7

    .line 227
    goto :goto_7

    .line 228
    :cond_e
    :goto_6
    move p0, v2

    .line 229
    :goto_7
    if-eqz v0, :cond_f

    .line 230
    .line 231
    if-eqz p0, :cond_f

    .line 232
    .line 233
    invoke-virtual {p2}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 234
    .line 235
    .line 236
    move-result v4

    .line 237
    const/4 p0, 0x4

    .line 238
    move v11, v4

    .line 239
    move v4, p0

    .line 240
    move p0, v11

    .line 241
    goto :goto_8

    .line 242
    :cond_f
    move p0, v4

    .line 243
    :goto_8
    if-lez v5, :cond_14

    .line 244
    .line 245
    if-gez v4, :cond_14

    .line 246
    .line 247
    if-gez p0, :cond_14

    .line 248
    .line 249
    sub-int/2addr v5, v2

    .line 250
    invoke-virtual {p2, v6, v5}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    if-eqz v0, :cond_11

    .line 255
    .line 256
    if-eqz p1, :cond_10

    .line 257
    .line 258
    if-ne v6, v8, :cond_10

    .line 259
    .line 260
    if-ne v5, v9, :cond_10

    .line 261
    .line 262
    goto :goto_9

    .line 263
    :cond_10
    move v0, v7

    .line 264
    goto :goto_a

    .line 265
    :cond_11
    :goto_9
    move v0, v2

    .line 266
    :goto_a
    add-int/2addr v6, v2

    .line 267
    invoke-virtual {p2, v6, v5}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 268
    .line 269
    .line 270
    move-result-object v3

    .line 271
    if-eqz v3, :cond_13

    .line 272
    .line 273
    if-eqz p1, :cond_12

    .line 274
    .line 275
    if-ne v6, v8, :cond_12

    .line 276
    .line 277
    if-ne v5, v9, :cond_12

    .line 278
    .line 279
    goto :goto_b

    .line 280
    :cond_12
    move v2, v7

    .line 281
    :cond_13
    :goto_b
    if-eqz v0, :cond_14

    .line 282
    .line 283
    if-eqz v2, :cond_14

    .line 284
    .line 285
    invoke-virtual {p2}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 286
    .line 287
    .line 288
    move-result p0

    .line 289
    move v2, v1

    .line 290
    goto :goto_c

    .line 291
    :cond_14
    move v2, v4

    .line 292
    :goto_c
    move v4, p0

    .line 293
    goto/16 :goto_14

    .line 294
    .line 295
    :cond_15
    if-ne v10, v2, :cond_1f

    .line 296
    .line 297
    iget p0, p0, Lcom/android/launcher3/model/data/p;->l:I

    .line 298
    .line 299
    if-ne p0, v3, :cond_1f

    .line 300
    .line 301
    invoke-virtual {p2}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 302
    .line 303
    .line 304
    move-result p0

    .line 305
    sub-int/2addr p0, v2

    .line 306
    if-ge v6, p0, :cond_1a

    .line 307
    .line 308
    add-int/lit8 p0, v6, 0x1

    .line 309
    .line 310
    invoke-virtual {p2, p0, v5}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 311
    .line 312
    .line 313
    move-result-object v0

    .line 314
    if-eqz v0, :cond_17

    .line 315
    .line 316
    if-eqz p1, :cond_16

    .line 317
    .line 318
    if-ne p0, v8, :cond_16

    .line 319
    .line 320
    if-ne v5, v9, :cond_16

    .line 321
    .line 322
    goto :goto_d

    .line 323
    :cond_16
    move v0, v7

    .line 324
    goto :goto_e

    .line 325
    :cond_17
    :goto_d
    move v0, v2

    .line 326
    :goto_e
    add-int/lit8 v1, v5, 0x1

    .line 327
    .line 328
    invoke-virtual {p2, p0, v1}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 329
    .line 330
    .line 331
    move-result-object v3

    .line 332
    if-eqz v3, :cond_19

    .line 333
    .line 334
    if-eqz p1, :cond_18

    .line 335
    .line 336
    if-ne p0, v8, :cond_18

    .line 337
    .line 338
    if-ne v1, v9, :cond_18

    .line 339
    .line 340
    goto :goto_f

    .line 341
    :cond_18
    move p0, v7

    .line 342
    goto :goto_10

    .line 343
    :cond_19
    :goto_f
    move p0, v2

    .line 344
    :goto_10
    if-eqz v0, :cond_1a

    .line 345
    .line 346
    if-eqz p0, :cond_1a

    .line 347
    .line 348
    invoke-virtual {p2}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 349
    .line 350
    .line 351
    move-result v4

    .line 352
    const/4 p0, 0x3

    .line 353
    move v11, v4

    .line 354
    move v4, p0

    .line 355
    move p0, v11

    .line 356
    goto :goto_11

    .line 357
    :cond_1a
    move p0, v4

    .line 358
    :goto_11
    if-lez v6, :cond_14

    .line 359
    .line 360
    if-gez v4, :cond_14

    .line 361
    .line 362
    if-gez p0, :cond_14

    .line 363
    .line 364
    sub-int/2addr v6, v2

    .line 365
    invoke-virtual {p2, v6, v5}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 366
    .line 367
    .line 368
    move-result-object v0

    .line 369
    if-eqz v0, :cond_1c

    .line 370
    .line 371
    if-eqz p1, :cond_1b

    .line 372
    .line 373
    if-ne v6, v8, :cond_1b

    .line 374
    .line 375
    if-ne v5, v9, :cond_1b

    .line 376
    .line 377
    goto :goto_12

    .line 378
    :cond_1b
    move v0, v7

    .line 379
    goto :goto_13

    .line 380
    :cond_1c
    :goto_12
    move v0, v2

    .line 381
    :goto_13
    add-int/2addr v5, v2

    .line 382
    invoke-virtual {p2, v6, v5}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 383
    .line 384
    .line 385
    move-result-object v1

    .line 386
    if-eqz v1, :cond_1d

    .line 387
    .line 388
    if-eqz p1, :cond_1e

    .line 389
    .line 390
    if-ne v6, v8, :cond_1e

    .line 391
    .line 392
    if-ne v5, v9, :cond_1e

    .line 393
    .line 394
    :cond_1d
    move v7, v2

    .line 395
    :cond_1e
    if-eqz v0, :cond_14

    .line 396
    .line 397
    if-eqz v7, :cond_14

    .line 398
    .line 399
    invoke-virtual {p2}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 400
    .line 401
    .line 402
    move-result v4

    .line 403
    goto :goto_14

    .line 404
    :cond_1f
    move v2, v4

    .line 405
    :goto_14
    move p0, v4

    .line 406
    move v4, v2

    .line 407
    goto :goto_15

    .line 408
    :cond_20
    const-string p0, "TransformFolderIcon"

    .line 409
    .line 410
    const-string p1, "getFolderBgExpandOrientation parent error"

    .line 411
    .line 412
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 413
    .line 414
    .line 415
    move p0, v4

    .line 416
    :goto_15
    if-lez v4, :cond_21

    .line 417
    .line 418
    if-lez p0, :cond_21

    .line 419
    .line 420
    new-instance p1, Landroid/util/Pair;

    .line 421
    .line 422
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 423
    .line 424
    .line 425
    move-result-object p2

    .line 426
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 427
    .line 428
    .line 429
    move-result-object p0

    .line 430
    invoke-direct {p1, p2, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 431
    .line 432
    .line 433
    return-object p1

    .line 434
    :cond_21
    :goto_16
    const/4 p0, 0x0

    .line 435
    return-object p0
.end method

.method public a0(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->a0(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getContentView()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public b0(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->v1()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Lcom/android/launcher3/a;->isOpen()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->B1()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->r0:Lcom/android/launcher3/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/c;->a()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->r0:Lcom/android/launcher3/c;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/c;->b()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->w0:Lcom/android/launcher3/L4;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->r0:Lcom/android/launcher3/c;

    .line 17
    .line 18
    invoke-interface {v0, p0}, Lcom/android/launcher3/L4;->a(Lcom/android/launcher3/c;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public c0(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->c0(Ljava/lang/CharSequence;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->d(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d0(Lcom/android/launcher3/model/data/y;Landroid/view/View;Ljava/util/ArrayList;Lcom/android/launcher3/n0$a;Landroid/graphics/Rect;F)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/model/data/y;",
            "Landroid/view/View;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;",
            "Lcom/android/launcher3/n0$a;",
            "Landroid/graphics/Rect;",
            "F)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0(Landroid/view/View;)Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p(Lcom/android/launcher3/model/data/y;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    if-eqz p3, :cond_1

    .line 16
    .line 17
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    move-object v1, p3

    .line 22
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 23
    .line 24
    if-ne p1, v1, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v5, 0x1

    .line 28
    const/4 v6, 0x0

    .line 29
    move-object v0, p0

    .line 30
    move-object v2, p4

    .line 31
    move-object v3, p5

    .line 32
    move v4, p6

    .line 33
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->Z(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;Landroid/graphics/Rect;FIZ)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g1()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->w(Landroid/graphics/Canvas;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->z0:Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->A0:Landroid/graphics/Rect;

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->z0:Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 30
    .line 31
    iget v1, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 32
    .line 33
    const/16 v2, -0x64

    .line 34
    .line 35
    if-ne v1, v2, :cond_3

    .line 36
    .line 37
    const/16 v1, 0x20

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    invoke-direct {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->U0(Landroid/graphics/Canvas;)V

    .line 46
    .line 47
    .line 48
    :cond_3
    return-void
.end method

.method public e()Lcom/android/launcher3/util/a2;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public e0(Lcom/android/launcher3/model/data/y;Landroid/view/View;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;Landroid/graphics/Rect;F)V
    .locals 2

    .line 1
    const-string v0, "TransformFolderIcon"

    .line 2
    .line 3
    const-string v1, "performCreateAnimation 2"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p4, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 9
    .line 10
    invoke-virtual {p0, p2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0(Landroid/view/View;)Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p(Lcom/android/launcher3/model/data/y;)V

    .line 14
    .line 15
    .line 16
    move-object p1, p3

    .line 17
    move-object p3, p5

    .line 18
    const/4 p5, 0x1

    .line 19
    move-object p2, p4

    .line 20
    move p4, p6

    .line 21
    const/4 p6, 0x0

    .line 22
    invoke-virtual/range {p0 .. p6}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->Z(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;Landroid/graphics/Rect;FIZ)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public f0(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    const-string v0, "TransformFolderIcon"

    .line 2
    .line 3
    const-string v1, "performDestroyAnimation"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/folder/u0;->n0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public f1(Lcom/android/launcher3/n0$a;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->D()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->I(Lcom/android/launcher3/n0$a;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public g0(Landroid/view/View;)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    const-string p1, "TransformFolderIcon"

    .line 2
    .line 3
    const-string v0, "prepareCreateAnimation 1"

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public g1()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, v0, v0}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    instance-of p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    return v0
.end method

.method public getAllChildBubbleTextViewDrawableList()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

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
    new-instance p0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getAllChildBubbleTextViewList()Ljava/util/ArrayList;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Lcom/android/launcher3/BubbleTextView;

    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    invoke-virtual {v1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    instance-of v2, v2, Lcom/android/launcher3/model/data/y;

    .line 49
    .line 50
    if-eqz v2, :cond_1

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    return-object v0
.end method

.method public getAllChildBubbleTextViewList()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/BubbleTextView;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

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
    new-instance p0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-ge v1, v2, :cond_3

    .line 34
    .line 35
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 36
    .line 37
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    instance-of v3, v2, Lcom/android/launcher3/BubbleTextView;

    .line 46
    .line 47
    if-eqz v3, :cond_1

    .line 48
    .line 49
    check-cast v2, Lcom/android/launcher3/BubbleTextView;

    .line 50
    .line 51
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    instance-of v3, v2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 56
    .line 57
    if-eqz v3, :cond_2

    .line 58
    .line 59
    check-cast v2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 60
    .line 61
    invoke-virtual {v2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->getAllBubbleTextViewChildList()Ljava/util/ArrayList;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 66
    .line 67
    .line 68
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_3
    return-object v0
.end method

.method public getAllModeChildBubbleTextViewList()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/BubbleTextView;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 8
    .line 9
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-ge v1, v2, :cond_2

    .line 18
    .line 19
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 20
    .line 21
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    instance-of v3, v2, Lcom/android/launcher3/BubbleTextView;

    .line 30
    .line 31
    if-eqz v3, :cond_0

    .line 32
    .line 33
    check-cast v2, Lcom/android/launcher3/BubbleTextView;

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_0
    instance-of v3, v2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 40
    .line 41
    if-eqz v3, :cond_1

    .line 42
    .line 43
    check-cast v2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 44
    .line 45
    invoke-virtual {v2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->getAllBubbleTextViewChildList()Ljava/util/ArrayList;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 50
    .line 51
    .line 52
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    return-object v0
.end method

.method public getBackgroundStrokeWidth()F
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    return p0
.end method

.method public getBgBlurImageView()Lcom/android/launcher3/blur/a;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->j0:Lcom/android/launcher3/blur/a;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getBigChildBubbleTextViewList()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/BubbleTextView;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

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
    new-instance p0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-ge v1, v2, :cond_2

    .line 34
    .line 35
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 36
    .line 37
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    instance-of v3, v2, Lcom/android/launcher3/BubbleTextView;

    .line 46
    .line 47
    if-eqz v3, :cond_1

    .line 48
    .line 49
    check-cast v2, Lcom/android/launcher3/BubbleTextView;

    .line 50
    .line 51
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    return-object v0
.end method

.method public getBorderSpace()Landroid/graphics/Point;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    .line 4
    .line 5
    return-object p0
.end method

.method public getContentView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getDropView()Landroid/view/View;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/n0;->getDropView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getFinalItemSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->c()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getFolder()Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getFolderBackground()Lcom/android/launcher3/folder/u0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getFolderFinalIconSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 4
    .line 5
    return p0
.end method

.method public getFolderIconPaddingX()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->k:I

    .line 4
    .line 5
    return p0
.end method

.method public getFolderIconPaddingY()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->l:I

    .line 4
    .line 5
    return p0
.end method

.method public getFolderIconSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 4
    .line 5
    return p0
.end method

.method public getFolderName()Lcom/android/launcher3/BubbleTextView;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/folder/FolderIcon;->getFolderName()Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getIconVisible()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/folder/FolderIcon;->getIconVisible()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getLastGridItemsView()Landroid/view/ViewGroup;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 12
    .line 13
    :cond_0
    return-object p0
.end method

.method public getLayoutRule()Lcom/android/launcher3/folder/a;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getLayoutRuleMFV()Lcom/android/launcher3/folder/i0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getNotificationCount()I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->w:Lk1/b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lk1/b;->d()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v0, v1

    .line 12
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-static {v2}, Lcom/android/launcher3/nubia/c;->s(Landroid/content/Context;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-nez v2, :cond_1

    .line 21
    .line 22
    return v0

    .line 23
    :cond_1
    iget-object v2, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-eqz v3, :cond_4

    .line 44
    .line 45
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-static {v4, v3}, Lcom/android/launcher3/nubia/c;->h(Landroid/content/Context;Ljava/lang/Object;)Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    if-eqz v4, :cond_2

    .line 60
    .line 61
    invoke-virtual {p0, v3}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->i1(Lcom/android/launcher3/model/data/y;)Z

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    if-eqz v4, :cond_2

    .line 66
    .line 67
    iget-object v4, p0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 68
    .line 69
    invoke-interface {v4, v3}, Lcom/android/launcher3/views/k;->getDotInfoForItem(Lcom/android/launcher3/model/data/y;)Lk1/a;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    if-eqz v3, :cond_3

    .line 74
    .line 75
    invoke-virtual {v3}, Lk1/a;->d()I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    goto :goto_2

    .line 80
    :cond_3
    move v3, v1

    .line 81
    :goto_2
    sub-int/2addr v0, v3

    .line 82
    add-int/lit8 v0, v0, 0x1

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_4
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    return p0
.end method

.method public getPreviewItemManager()Lcom/android/launcher3/folder/A0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getTextVisible()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/folder/FolderIcon;->getTextVisible()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getTintBackgroundColor()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-static {v0}, Lx1/O;->z1(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 16
    .line 17
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->s0:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/p;->G()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0

    .line 28
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 29
    .line 30
    iget p0, p0, Lcom/android/launcher3/model/data/p;->o:I

    .line 31
    .line 32
    const v0, -0x7fd3d3d4

    .line 33
    .line 34
    .line 35
    if-ne p0, v0, :cond_1

    .line 36
    .line 37
    const p0, -0x7f0e0e0f

    .line 38
    .line 39
    .line 40
    :cond_1
    return p0
.end method

.method public getViewType()I
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/folder/FolderIcon;->getViewType()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public h0(Lcom/android/launcher3/model/data/y;Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "removeItem() called with: item = ["

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, "], animate = ["

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v1, "]"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "TransformFolderIcon"

    .line 32
    .line 33
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/folder/FolderIcon;->h0(Lcom/android/launcher3/model/data/y;Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public h1(Landroid/view/MotionEvent;)Z
    .locals 8

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->C(Landroid/graphics/Rect;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    float-to-int v1, v1

    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    float-to-int v2, v2

    .line 19
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Rect;->contains(II)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x0

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    return v2

    .line 27
    :cond_0
    move v1, v2

    .line 28
    :goto_0
    iget-object v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 29
    .line 30
    invoke-virtual {v3}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-ge v1, v3, :cond_2

    .line 39
    .line 40
    iget-object v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 41
    .line 42
    invoke-virtual {v3}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    iget v5, v0, Landroid/graphics/Rect;->left:I

    .line 55
    .line 56
    int-to-float v5, v5

    .line 57
    invoke-virtual {v3}, Landroid/view/View;->getX()F

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    add-float/2addr v5, v6

    .line 62
    sub-float/2addr v4, v5

    .line 63
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    iget v6, v0, Landroid/graphics/Rect;->top:I

    .line 68
    .line 69
    int-to-float v6, v6

    .line 70
    invoke-virtual {v3}, Landroid/view/View;->getY()F

    .line 71
    .line 72
    .line 73
    move-result v7

    .line 74
    add-float/2addr v6, v7

    .line 75
    sub-float/2addr v5, v6

    .line 76
    instance-of v6, v3, Lcom/android/launcher3/BubbleTextView;

    .line 77
    .line 78
    if-eqz v6, :cond_1

    .line 79
    .line 80
    check-cast v3, Lcom/android/launcher3/BubbleTextView;

    .line 81
    .line 82
    invoke-virtual {v3, v4, v5}, Lcom/android/launcher3/BubbleTextView;->p0(FF)Z

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    if-eqz v3, :cond_1

    .line 87
    .line 88
    return v2

    .line 89
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_2
    const/4 p0, 0x1

    .line 93
    return p0
.end method

.method public i0()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/folder/FolderIcon;->i0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->E()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, p0}, Lcom/android/launcher3/dragndrop/j;->O(Lcom/android/launcher3/n0;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0, p0}, Lcom/android/launcher3/dragndrop/j;->N(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    const-string p0, "TransformFolderIcon"

    .line 37
    .line 38
    const-string v0, "removeListeners, DragController is null!"

    .line 39
    .line 40
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public i1(Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/util/ArrayList;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    return v0
.end method

.method public l(Lcom/android/launcher3/n0$a;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onDragEnter dragObject="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, ", folder: "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "TransformFolderIcon"

    .line 31
    .line 32
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    const/4 v0, -0x1

    .line 36
    iput v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->m0:I

    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->s0:Lcom/android/launcher3/c;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/android/launcher3/c;->b()V

    .line 41
    .line 42
    .line 43
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    const/4 v3, 0x1

    .line 47
    if-ne v0, p0, :cond_0

    .line 48
    .line 49
    iget-boolean v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->d0:Z

    .line 50
    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    move v0, v3

    .line 54
    goto :goto_0

    .line 55
    :cond_0
    move v0, v2

    .line 56
    :goto_0
    iput-boolean v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->d0:Z

    .line 57
    .line 58
    iget-object v4, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 59
    .line 60
    invoke-virtual {v4}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    iget-boolean v4, v4, Lcom/android/launcher3/X3;->B0:Z

    .line 65
    .line 66
    if-eqz v4, :cond_2

    .line 67
    .line 68
    iget-object v4, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 69
    .line 70
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-virtual {v4}, Lcom/android/launcher3/q4;->a0()Z

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    if-eqz v4, :cond_2

    .line 79
    .line 80
    if-eqz v0, :cond_1

    .line 81
    .line 82
    iget-boolean v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->q0:Z

    .line 83
    .line 84
    if-nez v0, :cond_1

    .line 85
    .line 86
    move v0, v3

    .line 87
    goto :goto_1

    .line 88
    :cond_1
    move v0, v2

    .line 89
    :cond_2
    :goto_1
    iget-object v4, p1, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 90
    .line 91
    if-eq v4, p0, :cond_3

    .line 92
    .line 93
    iput-boolean v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p0:Z

    .line 94
    .line 95
    const-string v0, "onDragEnter mIsExternalDrag"

    .line 96
    .line 97
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 101
    .line 102
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v0, p0}, Lcom/android/launcher3/dragndrop/j;->N(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 110
    .line 111
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0, p0}, Lcom/android/launcher3/dragndrop/j;->g(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 119
    .line 120
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    iput v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->n0:I

    .line 129
    .line 130
    invoke-direct {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->S0(Lcom/android/launcher3/n0$a;)V

    .line 131
    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_3
    if-eqz v0, :cond_4

    .line 135
    .line 136
    const-string v0, "onDragEnter isOutAndIn"

    .line 137
    .line 138
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    .line 140
    .line 141
    iput-boolean v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p0:Z

    .line 142
    .line 143
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 144
    .line 145
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    iput v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->n0:I

    .line 154
    .line 155
    goto :goto_2

    .line 156
    :cond_4
    iget-boolean v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->y0:Z

    .line 157
    .line 158
    if-eqz v0, :cond_5

    .line 159
    .line 160
    iput-boolean v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->y0:Z

    .line 161
    .line 162
    :cond_5
    :goto_2
    iget-boolean v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p0:Z

    .line 163
    .line 164
    if-eqz v0, :cond_6

    .line 165
    .line 166
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->u0:Landroid/util/Pair;

    .line 167
    .line 168
    if-nez v0, :cond_6

    .line 169
    .line 170
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 171
    .line 172
    invoke-virtual {v0, p0, v3}, Lcom/android/launcher3/folder/u0;->k0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Z)V

    .line 173
    .line 174
    .line 175
    :cond_6
    iget-boolean v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p0:Z

    .line 176
    .line 177
    if-eqz v0, :cond_9

    .line 178
    .line 179
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g1()Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-eqz v0, :cond_9

    .line 184
    .line 185
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 186
    .line 187
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->q1()Z

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    if-nez v0, :cond_9

    .line 192
    .line 193
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 194
    .line 195
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/FolderIcon;->s0(Lcom/android/launcher3/model/data/y;)Z

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    if-eqz v0, :cond_9

    .line 200
    .line 201
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 202
    .line 203
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    sget-object v1, Lcom/android/launcher3/q4$a;->l:Lcom/android/launcher3/q4$a;

    .line 212
    .line 213
    invoke-virtual {v0, v1}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    if-eqz v0, :cond_7

    .line 218
    .line 219
    goto :goto_3

    .line 220
    :cond_7
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->u:Lcom/android/launcher3/c;

    .line 221
    .line 222
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->v0:Lcom/android/launcher3/L4;

    .line 223
    .line 224
    invoke-virtual {v0, v1}, Lcom/android/launcher3/c;->e(Lcom/android/launcher3/L4;)V

    .line 225
    .line 226
    .line 227
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 228
    .line 229
    instance-of v0, p1, Lcom/android/launcher3/model/data/F;

    .line 230
    .line 231
    if-nez v0, :cond_8

    .line 232
    .line 233
    instance-of v0, p1, Lcom/android/launcher3/widget/y0;

    .line 234
    .line 235
    if-nez v0, :cond_8

    .line 236
    .line 237
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->t2(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result p1

    .line 241
    if-eqz p1, :cond_9

    .line 242
    .line 243
    :cond_8
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->u:Lcom/android/launcher3/c;

    .line 244
    .line 245
    const-wide/16 v0, 0x320

    .line 246
    .line 247
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/c;->d(J)V

    .line 248
    .line 249
    .line 250
    :cond_9
    :goto_3
    return-void
.end method

.method public l0(Lcom/android/launcher3/folder/K;Lcom/android/launcher3/logging/d;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/folder/FolderIcon;->l0(Lcom/android/launcher3/folder/K;Lcom/android/launcher3/logging/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n0()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->w:Lk1/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lk1/b;->k()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->i1(Lcom/android/launcher3/model/data/y;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    iget-object v2, p0, Lcom/android/launcher3/folder/FolderIcon;->w:Lk1/b;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    iget-object v4, p0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 47
    .line 48
    invoke-interface {v4, v1}, Lcom/android/launcher3/views/k;->getDotInfoForItem(Lcom/android/launcher3/model/data/y;)Lk1/a;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v2, v3, v1}, Lk1/b;->i(Landroid/content/Context;Lk1/a;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->w:Lk1/b;

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->setDotInfo(Lk1/b;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public o(Lcom/android/launcher3/model/data/y;)Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "acceptDrop() called with: dragInfo = ["

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, "]"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "TransformFolderIcon"

    .line 24
    .line 25
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    invoke-super {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->o(Lcom/android/launcher3/model/data/y;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    iget p0, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    if-ne p0, v0, :cond_0

    .line 38
    .line 39
    iget p0, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 40
    .line 41
    if-ne p0, v0, :cond_0

    .line 42
    .line 43
    return v0

    .line 44
    :cond_0
    const/4 p0, 0x0

    .line 45
    :cond_1
    return p0
.end method

.method protected o0(ZZ)V
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const/high16 v0, 0x3f800000    # 1.0f

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    :goto_0
    xor-int/2addr p1, p2

    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isShown()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    new-array p1, p1, [F

    .line 18
    .line 19
    const/4 p2, 0x0

    .line 20
    aput v0, p1, p2

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->s([F)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->t()V

    .line 27
    .line 28
    .line 29
    iput v0, p0, Lcom/android/launcher3/folder/FolderIcon;->z:F

    .line 30
    .line 31
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 32
    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g1()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-nez p1, :cond_2

    .line 40
    .line 41
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->h0:Lcom/android/launcher3/Workspace;

    .line 11
    .line 12
    const v0, 0x7f0b0629

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/android/launcher3/CellLayout;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-boolean v1, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    if-nez v1, :cond_1

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    const v0, 0x7f0e0248

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const v0, 0x7f0e0247

    .line 53
    .line 54
    .line 55
    :goto_0
    invoke-virtual {v1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-nez v1, :cond_2

    .line 77
    .line 78
    const v1, 0x7f0e0249

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_2
    const v1, 0x7f0e024a

    .line 83
    .line 84
    .line 85
    :goto_1
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 90
    .line 91
    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 92
    .line 93
    :goto_2
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 94
    .line 95
    new-instance v1, Lc1/b;

    .line 96
    .line 97
    const/4 v2, 0x1

    .line 98
    invoke-direct {v1, v2, v2, v2, v2}, Lc1/b;-><init>(IIII)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 105
    .line 106
    new-instance v1, LU1/c;

    .line 107
    .line 108
    invoke-direct {v1, p0}, LU1/c;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 115
    .line 116
    new-instance v1, LU1/d;

    .line 117
    .line 118
    invoke-direct {v1, p0}, LU1/d;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 125
    .line 126
    invoke-virtual {v0, p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->setTransformFolderIcon(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 130
    .line 131
    const v1, 0x7f0b063d

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->i0:Landroid/view/View;

    .line 139
    .line 140
    invoke-static {}, Lx1/O;->k1()Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-eqz v0, :cond_3

    .line 145
    .line 146
    const/4 v0, 0x0

    .line 147
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setDefaultFocusHighlightEnabled(Z)V

    .line 148
    .line 149
    .line 150
    :cond_3
    return-void
.end method

.method protected onFocusChanged(ZILandroid/graphics/Rect;)V
    .locals 3

    .line 1
    invoke-static {}, Lx1/O;->k1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const v0, 0x3f83d70a    # 1.03f

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 14
    .line 15
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->animate()Landroid/view/ViewPropertyAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1, v0}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1, v0}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-wide/16 v1, 0x64

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 34
    .line 35
    .line 36
    :cond_1
    invoke-super {p0, p1, p2, p3}, Landroid/widget/FrameLayout;->onFocusChanged(ZILandroid/graphics/Rect;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method protected onMeasure(II)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean v1, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/folder/FolderIcon;->onMeasure(II)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 16
    .line 17
    iget v2, v1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->h:I

    .line 18
    .line 19
    if-lez v2, :cond_1

    .line 20
    .line 21
    iget v1, v1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->i:I

    .line 22
    .line 23
    if-gtz v1, :cond_2

    .line 24
    .line 25
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iget-object v7, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 30
    .line 31
    iget v3, v7, Lcom/android/launcher3/model/data/p;->k:I

    .line 32
    .line 33
    iget v4, v7, Lcom/android/launcher3/model/data/p;->l:I

    .line 34
    .line 35
    iget v5, v7, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 36
    .line 37
    iget v6, v7, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 38
    .line 39
    invoke-static/range {v2 .. v7}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->d1(Landroid/content/Context;IIIILcom/android/launcher3/model/data/p;)Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iput-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 44
    .line 45
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 46
    .line 47
    iget v1, v1, Lcom/android/launcher3/model/data/y;->container:I

    .line 48
    .line 49
    const/16 v2, -0x65

    .line 50
    .line 51
    const/4 v3, 0x0

    .line 52
    if-ne v1, v2, :cond_5

    .line 53
    .line 54
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    const v5, 0x7f070bc5

    .line 67
    .line 68
    .line 69
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    iget v5, v0, Lcom/android/launcher3/X3;->F:I

    .line 74
    .line 75
    iget v6, v0, Lcom/android/launcher3/X3;->r:I

    .line 76
    .line 77
    add-int v7, v5, v6

    .line 78
    .line 79
    add-int/2addr v7, v4

    .line 80
    iget v8, v0, Lcom/android/launcher3/h0;->B1:I

    .line 81
    .line 82
    sub-int v9, v1, v8

    .line 83
    .line 84
    div-int/lit8 v9, v9, 0x2

    .line 85
    .line 86
    add-int/2addr v9, v6

    .line 87
    add-int/2addr v9, v4

    .line 88
    iget v10, v0, Lcom/android/launcher3/X3;->q0:I

    .line 89
    .line 90
    sub-int v5, v2, v5

    .line 91
    .line 92
    sub-int/2addr v5, v8

    .line 93
    iget v8, v0, Lcom/android/launcher3/h0;->D1:I

    .line 94
    .line 95
    sub-int/2addr v5, v8

    .line 96
    add-int/2addr v5, v6

    .line 97
    add-int/2addr v5, v4

    .line 98
    invoke-static {}, Lx1/O;->C3()Z

    .line 99
    .line 100
    .line 101
    move-result v6

    .line 102
    if-eqz v6, :cond_3

    .line 103
    .line 104
    iget-object v5, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->a0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 105
    .line 106
    iget v5, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->g:I

    .line 107
    .line 108
    sub-int/2addr v1, v5

    .line 109
    div-int/lit8 v1, v1, 0x2

    .line 110
    .line 111
    iget v6, v0, Lcom/android/launcher3/X3;->r:I

    .line 112
    .line 113
    div-int/lit8 v7, v6, 0x2

    .line 114
    .line 115
    add-int/2addr v1, v7

    .line 116
    add-int v9, v1, v4

    .line 117
    .line 118
    sub-int v1, v2, v5

    .line 119
    .line 120
    div-int/lit8 v1, v1, 0x2

    .line 121
    .line 122
    div-int/lit8 v7, v6, 0x2

    .line 123
    .line 124
    add-int/2addr v7, v1

    .line 125
    add-int/2addr v7, v4

    .line 126
    sub-int/2addr v2, v1

    .line 127
    sub-int/2addr v2, v5

    .line 128
    iget v0, v0, Lcom/android/launcher3/h0;->D1:I

    .line 129
    .line 130
    sub-int/2addr v2, v0

    .line 131
    div-int/lit8 v6, v6, 0x2

    .line 132
    .line 133
    add-int/2addr v2, v6

    .line 134
    add-int v5, v2, v4

    .line 135
    .line 136
    :cond_3
    invoke-virtual {p0, v10, v7, v10, v5}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->setPadding(IIII)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    instance-of v1, v0, LU1/a;

    .line 144
    .line 145
    if-eqz v1, :cond_4

    .line 146
    .line 147
    check-cast v0, LU1/a;

    .line 148
    .line 149
    invoke-virtual {v0, v9, v7, v9, v5}, LU1/a;->e(IIII)LU1/a;

    .line 150
    .line 151
    .line 152
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 153
    .line 154
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 159
    .line 160
    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 161
    .line 162
    sub-int/2addr v9, v10

    .line 163
    iput v9, v0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 164
    .line 165
    iput v9, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 166
    .line 167
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    if-eqz v1, :cond_9

    .line 172
    .line 173
    const/16 v1, 0x10

    .line 174
    .line 175
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :cond_5
    iget v1, v0, Lcom/android/launcher3/X3;->q0:I

    .line 180
    .line 181
    iget v2, v0, Lcom/android/launcher3/X3;->s0:I

    .line 182
    .line 183
    invoke-virtual {p0, v1, v2, v1, v3}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->setPadding(IIII)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    instance-of v2, v1, LU1/a;

    .line 191
    .line 192
    if-eqz v2, :cond_6

    .line 193
    .line 194
    check-cast v1, LU1/a;

    .line 195
    .line 196
    iget v2, v0, Lcom/android/launcher3/X3;->r0:I

    .line 197
    .line 198
    iget v4, v0, Lcom/android/launcher3/X3;->q0:I

    .line 199
    .line 200
    add-int v5, v2, v4

    .line 201
    .line 202
    iget v6, v0, Lcom/android/launcher3/X3;->s0:I

    .line 203
    .line 204
    add-int/2addr v2, v4

    .line 205
    iget v4, v0, Lcom/android/launcher3/X3;->t0:I

    .line 206
    .line 207
    invoke-virtual {v1, v5, v6, v2, v4}, LU1/a;->e(IIII)LU1/a;

    .line 208
    .line 209
    .line 210
    :cond_6
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 211
    .line 212
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 217
    .line 218
    iget v2, v0, Lcom/android/launcher3/X3;->t0:I

    .line 219
    .line 220
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 221
    .line 222
    iget v0, v0, Lcom/android/launcher3/X3;->r0:I

    .line 223
    .line 224
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 225
    .line 226
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 227
    .line 228
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    if-eqz v0, :cond_7

    .line 233
    .line 234
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 235
    .line 236
    :cond_7
    invoke-static {}, Lm1/a;->a()Z

    .line 237
    .line 238
    .line 239
    move-result v0

    .line 240
    if-eqz v0, :cond_8

    .line 241
    .line 242
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 243
    .line 244
    .line 245
    move-result v0

    .line 246
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 247
    .line 248
    .line 249
    move-result v1

    .line 250
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    const v3, 0x7f0703ea

    .line 255
    .line 256
    .line 257
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 258
    .line 259
    .line 260
    move-result v2

    .line 261
    add-int/2addr v1, v2

    .line 262
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingRight()I

    .line 263
    .line 264
    .line 265
    move-result v2

    .line 266
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingBottom()I

    .line 267
    .line 268
    .line 269
    move-result v3

    .line 270
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->setPadding(IIII)V

    .line 271
    .line 272
    .line 273
    :cond_8
    invoke-static {}, Lm1/a;->b()Z

    .line 274
    .line 275
    .line 276
    move-result v0

    .line 277
    if-eqz v0, :cond_9

    .line 278
    .line 279
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 280
    .line 281
    .line 282
    move-result v0

    .line 283
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 284
    .line 285
    .line 286
    move-result-object v1

    .line 287
    const v2, 0x7f0704c0

    .line 288
    .line 289
    .line 290
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 291
    .line 292
    .line 293
    move-result v1

    .line 294
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingRight()I

    .line 295
    .line 296
    .line 297
    move-result v2

    .line 298
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingBottom()I

    .line 299
    .line 300
    .line 301
    move-result v3

    .line 302
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->setPadding(IIII)V

    .line 303
    .line 304
    .line 305
    :cond_9
    :goto_0
    invoke-static {}, Lcom/android/launcher3/blur/f;->h()Z

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    if-eqz v0, :cond_a

    .line 310
    .line 311
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->j0:Lcom/android/launcher3/blur/a;

    .line 312
    .line 313
    if-eqz v0, :cond_a

    .line 314
    .line 315
    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    instance-of v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 320
    .line 321
    if-eqz v0, :cond_a

    .line 322
    .line 323
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 324
    .line 325
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 326
    .line 327
    .line 328
    move-result-object v0

    .line 329
    instance-of v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 330
    .line 331
    if-eqz v0, :cond_a

    .line 332
    .line 333
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 334
    .line 335
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 340
    .line 341
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->j0:Lcom/android/launcher3/blur/a;

    .line 342
    .line 343
    invoke-virtual {v1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 344
    .line 345
    .line 346
    move-result-object v1

    .line 347
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 348
    .line 349
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 350
    .line 351
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 352
    .line 353
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 354
    .line 355
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 356
    .line 357
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 358
    .line 359
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 360
    .line 361
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 362
    .line 363
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 364
    .line 365
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->j0:Lcom/android/launcher3/blur/a;

    .line 366
    .line 367
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 368
    .line 369
    .line 370
    :cond_a
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/folder/FolderIcon;->onMeasure(II)V

    .line 371
    .line 372
    .line 373
    return-void
.end method

.method protected onSetAlpha(I)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/launcher3/blur/f;->l(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onSetAlpha(I)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->k:Lcom/android/launcher3/V;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V;->h(Landroid/view/MotionEvent;)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0
.end method

.method public p(Lcom/android/launcher3/model/data/y;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "addItem() called with: item = ["

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, "]"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "TransformFolderIcon"

    .line 24
    .line 25
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    invoke-super {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->p(Lcom/android/launcher3/model/data/y;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public p1(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

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
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 15
    .line 16
    .line 17
    new-instance p1, LU1/f;

    .line 18
    .line 19
    invoke-direct {p1}, LU1/f;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 23
    .line 24
    .line 25
    new-instance p1, Ljava/util/ArrayList;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-direct {p1, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 34
    .line 35
    .line 36
    new-instance v1, LU1/g;

    .line 37
    .line 38
    invoke-direct {v1}, LU1/g;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-ne v1, v2, :cond_1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-le v0, p1, :cond_2

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->B1()V

    .line 66
    .line 67
    .line 68
    :cond_2
    :goto_0
    return-void
.end method

.method public q(ZZZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public q0(Ljava/util/function/Predicate;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->getAllBubbleTextViewChildList()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/android/launcher3/BubbleTextView;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/widget/TextView;->getVisibility()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    const/16 v3, 0x8

    .line 28
    .line 29
    if-eq v2, v3, :cond_0

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Lcom/android/launcher3/model/data/I;

    .line 36
    .line 37
    invoke-interface {p1, v1}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->v1()V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public r(Landroid/view/View;Lcom/android/launcher3/n0$a;Z)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onDropCompleted success="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v2, "TransformFolderIcon"

    .line 19
    .line 20
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    if-eqz p3, :cond_2

    .line 24
    .line 25
    if-eq p1, p0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 28
    .line 29
    if-eq p1, v0, :cond_1

    .line 30
    .line 31
    if-eqz p2, :cond_1

    .line 32
    .line 33
    iget-object v0, p2, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 34
    .line 35
    instance-of v0, v0, Lcom/android/launcher3/model/data/I;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    new-instance p1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    const-string v0, "onDropCompleted normal success="

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string p3, " size="

    .line 53
    .line 54
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget-object p3, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 58
    .line 59
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 64
    .line 65
    .line 66
    move-result p3

    .line 67
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    const/4 p3, 0x1

    .line 88
    if-le p1, p3, :cond_0

    .line 89
    .line 90
    iget-object p1, p2, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 91
    .line 92
    move-object p2, p1

    .line 93
    check-cast p2, Lcom/android/launcher3/model/data/I;

    .line 94
    .line 95
    iget p2, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 96
    .line 97
    if-gez p2, :cond_5

    .line 98
    .line 99
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 100
    .line 101
    invoke-virtual {p0, p1, p3}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->h0(Lcom/android/launcher3/model/data/y;Z)V

    .line 102
    .line 103
    .line 104
    goto/16 :goto_3

    .line 105
    .line 106
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->x1()V

    .line 107
    .line 108
    .line 109
    goto/16 :goto_3

    .line 110
    .line 111
    :cond_1
    iget-object p2, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 112
    .line 113
    if-ne p1, p2, :cond_5

    .line 114
    .line 115
    new-instance p1, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string p2, " target is open folder"

    .line 127
    .line 128
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->v1()V

    .line 139
    .line 140
    .line 141
    goto/16 :goto_3

    .line 142
    .line 143
    :cond_2
    if-eq p1, p0, :cond_5

    .line 144
    .line 145
    iget-object p1, p2, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 146
    .line 147
    if-ne p1, p0, :cond_5

    .line 148
    .line 149
    iget-object p1, p2, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 150
    .line 151
    instance-of p1, p1, Lcom/android/launcher3/model/data/I;

    .line 152
    .line 153
    if-eqz p1, :cond_5

    .line 154
    .line 155
    new-instance p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$n;

    .line 156
    .line 157
    invoke-direct {p1, p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$n;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V

    .line 158
    .line 159
    .line 160
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 161
    .line 162
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 163
    .line 164
    .line 165
    const-string v1, "onDropCompleted success:"

    .line 166
    .line 167
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p3

    .line 177
    invoke-static {v2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    .line 179
    .line 180
    iget-object p3, p0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 181
    .line 182
    if-eqz p3, :cond_3

    .line 183
    .line 184
    invoke-static {p3}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 185
    .line 186
    .line 187
    move-result-object p3

    .line 188
    if-eqz p3, :cond_3

    .line 189
    .line 190
    iget-object p3, p0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 191
    .line 192
    invoke-static {p3}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 193
    .line 194
    .line 195
    move-result-object p3

    .line 196
    invoke-virtual {p3}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 197
    .line 198
    .line 199
    move-result-object p3

    .line 200
    invoke-virtual {p3, p2}, Lcom/android/launcher3/Workspace;->O2(Lcom/android/launcher3/n0$a;)V

    .line 201
    .line 202
    .line 203
    goto :goto_0

    .line 204
    :catchall_0
    move-exception p0

    .line 205
    goto :goto_1

    .line 206
    :cond_3
    :goto_0
    iget-object p3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 207
    .line 208
    invoke-virtual {p3}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 209
    .line 210
    .line 211
    move-result-object p3

    .line 212
    invoke-virtual {p3}, Lcom/android/launcher3/G4;->q()Z

    .line 213
    .line 214
    .line 215
    move-result p3

    .line 216
    if-nez p3, :cond_4

    .line 217
    .line 218
    iget-object p3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 219
    .line 220
    invoke-virtual {p3}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 221
    .line 222
    .line 223
    move-result-object p3

    .line 224
    invoke-virtual {p3}, Lcom/android/launcher3/Workspace;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 225
    .line 226
    .line 227
    move-result-object p3

    .line 228
    invoke-virtual {p3}, Lcom/android/launcher3/dragndrop/j;->H()Z

    .line 229
    .line 230
    .line 231
    move-result p3

    .line 232
    if-nez p3, :cond_4

    .line 233
    .line 234
    iget-object p2, p2, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 235
    .line 236
    invoke-virtual {p0, p2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p(Lcom/android/launcher3/model/data/y;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 237
    .line 238
    .line 239
    :cond_4
    invoke-virtual {p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$n;->close()V

    .line 240
    .line 241
    .line 242
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->v1()V

    .line 243
    .line 244
    .line 245
    goto :goto_3

    .line 246
    :goto_1
    :try_start_1
    invoke-virtual {p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$n;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 247
    .line 248
    .line 249
    goto :goto_2

    .line 250
    :catchall_1
    move-exception p1

    .line 251
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 252
    .line 253
    .line 254
    :goto_2
    throw p0

    .line 255
    :cond_5
    :goto_3
    iget-object p1, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 256
    .line 257
    const/4 p2, 0x0

    .line 258
    invoke-virtual {p1, p2}, Lcom/android/launcher3/folder/Folder;->r2(Z)V

    .line 259
    .line 260
    .line 261
    iput-boolean p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->q0:Z

    .line 262
    .line 263
    return-void
.end method

.method public r1()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Lcom/android/launcher3/dragndrop/j;->h(Lcom/android/launcher3/n0;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->u1()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-boolean v1, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 24
    .line 25
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->s()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    const-string v2, "transform_folder_bg_ease"

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const-string v2, "transform_folder_bg"

    .line 39
    .line 40
    :goto_0
    invoke-static {v1, v2}, Lf1/d;->f(Landroid/content/Context;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-static {v1, v2}, Lz/a;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    goto :goto_2

    .line 49
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 54
    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    const-string v1, "folder_bg_streamer_land"

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_2
    const-string v1, "folder_bg_streamer"

    .line 61
    .line 62
    :goto_1
    invoke-static {v2, v1}, Lf1/d;->d(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    :goto_2
    if-eqz v1, :cond_4

    .line 67
    .line 68
    iget-boolean v2, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 69
    .line 70
    if-eqz v2, :cond_3

    .line 71
    .line 72
    new-instance v2, LU1/a;

    .line 73
    .line 74
    invoke-direct {v2, v1}, LU1/a;-><init>(Landroid/graphics/drawable/Drawable;)V

    .line 75
    .line 76
    .line 77
    iget v1, v0, Lcom/android/launcher3/X3;->r0:I

    .line 78
    .line 79
    iget v3, v0, Lcom/android/launcher3/X3;->q0:I

    .line 80
    .line 81
    add-int v4, v1, v3

    .line 82
    .line 83
    iget v5, v0, Lcom/android/launcher3/X3;->s0:I

    .line 84
    .line 85
    add-int/2addr v1, v3

    .line 86
    iget v0, v0, Lcom/android/launcher3/X3;->t0:I

    .line 87
    .line 88
    invoke-virtual {v2, v4, v5, v1, v0}, LU1/a;->e(IIII)LU1/a;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getTintBackgroundColor()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 97
    .line 98
    .line 99
    invoke-static {}, Lcom/android/launcher3/blur/f;->h()Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-eqz v2, :cond_4

    .line 104
    .line 105
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->j0:Lcom/android/launcher3/blur/a;

    .line 106
    .line 107
    if-eqz v2, :cond_4

    .line 108
    .line 109
    invoke-virtual {v2, v0}, Lcom/android/launcher3/blur/a;->setBlurBgTopColorTintColor(I)V

    .line 110
    .line 111
    .line 112
    :cond_4
    iput-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->c0:Landroid/graphics/drawable/Drawable;

    .line 113
    .line 114
    invoke-virtual {p0, v1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 118
    .line 119
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    new-instance v1, LU1/i;

    .line 124
    .line 125
    invoke-direct {v1, p0}, LU1/i;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 132
    .line 133
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    new-instance v1, LU1/j;

    .line 138
    .line 139
    invoke-direct {v1, p0}, LU1/j;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public varargs s([F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->a([F)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->t()V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->C0:Landroid/util/Property;

    .line 21
    .line 22
    invoke-static {p0, v0, p1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/android/launcher3/folder/FolderIcon;->A:Landroid/animation/Animator;

    .line 27
    .line 28
    new-instance v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$g;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$g;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->A:Landroid/animation/Animator;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public s1(II)V
    .locals 11

    .line 1
    if-ne p2, p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_4

    .line 4
    .line 5
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 8
    .line 9
    iget p1, p1, Lcom/android/launcher3/model/data/p;->k:I

    .line 10
    .line 11
    const/4 v8, 0x0

    .line 12
    const/high16 v1, 0x41f00000    # 30.0f

    .line 13
    .line 14
    move v9, v1

    .line 15
    move v5, v8

    .line 16
    move v10, v5

    .line 17
    :goto_0
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-ge v10, v1, :cond_6

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    if-lt v10, p2, :cond_1

    .line 36
    .line 37
    add-int/lit8 v2, v10, 0x1

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    move v2, v10

    .line 41
    :goto_1
    instance-of v3, v1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 42
    .line 43
    if-eqz v3, :cond_3

    .line 44
    .line 45
    iget-object v3, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 46
    .line 47
    iget v4, v3, Lcom/android/launcher3/model/data/p;->k:I

    .line 48
    .line 49
    iget v3, v3, Lcom/android/launcher3/model/data/p;->l:I

    .line 50
    .line 51
    mul-int/2addr v4, v3

    .line 52
    add-int/lit8 v4, v4, -0x1

    .line 53
    .line 54
    if-ne v2, v4, :cond_2

    .line 55
    .line 56
    move v2, v8

    .line 57
    goto :goto_2

    .line 58
    :cond_2
    const/4 v2, 0x4

    .line 59
    :goto_2
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 60
    .line 61
    .line 62
    goto :goto_3

    .line 63
    :cond_3
    iget-object v3, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 64
    .line 65
    iget v4, v3, Lcom/android/launcher3/model/data/p;->k:I

    .line 66
    .line 67
    iget v3, v3, Lcom/android/launcher3/model/data/p;->l:I

    .line 68
    .line 69
    mul-int/2addr v4, v3

    .line 70
    if-lt v2, v4, :cond_4

    .line 71
    .line 72
    const-string v2, "TransformFolderIcon"

    .line 73
    .line 74
    const-string v3, "realTimeReorder remove end icon, set alpha 0"

    .line 75
    .line 76
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    const/4 v2, 0x0

    .line 80
    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 81
    .line 82
    .line 83
    goto :goto_3

    .line 84
    :cond_4
    move v3, v2

    .line 85
    rem-int v2, v3, p1

    .line 86
    .line 87
    div-int/2addr v3, p1

    .line 88
    const/4 v6, 0x1

    .line 89
    const/4 v7, 0x1

    .line 90
    const/16 v4, 0xe6

    .line 91
    .line 92
    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher3/CellLayout;->g(Landroid/view/View;IIIIZZ)Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-eqz v1, :cond_5

    .line 97
    .line 98
    int-to-float v1, v5

    .line 99
    add-float/2addr v1, v9

    .line 100
    float-to-int v5, v1

    .line 101
    const v1, 0x3f666666    # 0.9f

    .line 102
    .line 103
    .line 104
    mul-float/2addr v9, v1

    .line 105
    :cond_5
    :goto_3
    add-int/lit8 v10, v10, 0x1

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_6
    :goto_4
    return-void
.end method

.method public setAlarmOpenFolder(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->setAlarmOpenFolder(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setDotInfo(Lk1/b;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->setDotInfo(Lk1/b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setDragFromOtherTarget(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->d0:Z

    .line 2
    .line 3
    return-void
.end method

.method public setFolderBackground(Lcom/android/launcher3/folder/u0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setForceHideDot(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->setForceHideDot(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic setForceHideRing(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/H;->setForceHideRing(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setIconVisible(Z)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-super {p0, v0}, Lcom/android/launcher3/folder/FolderIcon;->setIconVisible(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x4

    .line 11
    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->c0:Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    const/4 p1, 0x0

    .line 20
    :goto_1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public setPadding(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setTextVisible(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->setTextVisible(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setTintBackgroundColor(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    iput p1, v0, Lcom/android/launcher3/model/data/p;->o:I

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/android/launcher3/model/data/p;->O(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-static {}, Lcom/android/launcher3/blur/f;->h()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->j0:Lcom/android/launcher3/blur/a;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Lcom/android/launcher3/blur/a;->setBlurBgTopColorTintColor(I)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public setVisibility(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/blur/f;->h()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    invoke-static {p0}, Lcom/android/launcher3/blur/f;->m(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public u()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/folder/FolderIcon;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public v()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onDragEnd mIsExternalDrag= "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p0:Z

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, " mDragInProgress="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-boolean v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->q0:Z

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "TransformFolderIcon"

    .line 31
    .line 32
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    iget-boolean v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p0:Z

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 41
    .line 42
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    invoke-static {}, Lx1/O;->e2()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    new-instance v0, LU1/b;

    .line 55
    .line 56
    invoke-direct {v0, p0}, LU1/b;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V

    .line 57
    .line 58
    .line 59
    const-wide/16 v2, 0x1f4

    .line 60
    .line 61
    invoke-virtual {p0, v0, v2, v3}, Landroid/widget/FrameLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->O0()V

    .line 66
    .line 67
    .line 68
    iput-boolean v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p0:Z

    .line 69
    .line 70
    :cond_1
    :goto_0
    iput-boolean v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->q0:Z

    .line 71
    .line 72
    const/4 v0, 0x0

    .line 73
    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->o0:Landroid/view/View;

    .line 74
    .line 75
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0, p0}, Lcom/android/launcher3/dragndrop/j;->N(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public v1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->w1(Ljava/util/ArrayList;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public w(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->H()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v2, "transform folder drawDot: ---"

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    iget-boolean v2, p0, Lcom/android/launcher3/folder/FolderIcon;->v:Z

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v2, "-------"

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget v2, p0, Lcom/android/launcher3/folder/FolderIcon;->z:F

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v2, "----"

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v2, "TransformFolderIcon"

    .line 43
    .line 44
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    iget-boolean v1, p0, Lcom/android/launcher3/folder/FolderIcon;->v:Z

    .line 48
    .line 49
    if-nez v1, :cond_5

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    if-nez v0, :cond_0

    .line 53
    .line 54
    iget v0, p0, Lcom/android/launcher3/folder/FolderIcon;->z:F

    .line 55
    .line 56
    cmpl-float v0, v0, v1

    .line 57
    .line 58
    if-lez v0, :cond_5

    .line 59
    .line 60
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v2}, Lcom/android/launcher3/H5;->B()Lcom/android/launcher3/H5$c;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    sget-object v3, Lcom/android/launcher3/H5$c;->g:Lcom/android/launcher3/H5$c;

    .line 79
    .line 80
    if-ne v2, v3, :cond_1

    .line 81
    .line 82
    const/4 v2, 0x0

    .line 83
    goto :goto_0

    .line 84
    :cond_1
    const/4 v2, 0x1

    .line 85
    :goto_0
    iput v2, v0, Ls1/m$a;->i:I

    .line 86
    .line 87
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 88
    .line 89
    iget-object v0, v0, Ls1/m$a;->c:Landroid/graphics/Rect;

    .line 90
    .line 91
    invoke-virtual {p0, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->C(Landroid/graphics/Rect;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 95
    .line 96
    if-eqz v0, :cond_2

    .line 97
    .line 98
    iget v0, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 99
    .line 100
    const/16 v2, -0x64

    .line 101
    .line 102
    if-ne v0, v2, :cond_2

    .line 103
    .line 104
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    mul-int/lit8 v3, v3, 0x2

    .line 115
    .line 116
    sub-int/2addr v2, v3

    .line 117
    iget-object v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 118
    .line 119
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    iget v3, v3, Lcom/android/launcher3/X3;->r0:I

    .line 124
    .line 125
    mul-int/lit8 v3, v3, 0x2

    .line 126
    .line 127
    sub-int/2addr v2, v3

    .line 128
    iput v2, v0, Ls1/m$a;->n:I

    .line 129
    .line 130
    iput v2, v0, Ls1/m$a;->g:I

    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 134
    .line 135
    iget-object v2, v0, Ls1/m$a;->c:Landroid/graphics/Rect;

    .line 136
    .line 137
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    iput v2, v0, Ls1/m$a;->n:I

    .line 142
    .line 143
    iput v2, v0, Ls1/m$a;->g:I

    .line 144
    .line 145
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->w:Lk1/b;

    .line 146
    .line 147
    if-eqz v0, :cond_3

    .line 148
    .line 149
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 150
    .line 151
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getNotificationCount()I

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    iput v2, v0, Ls1/m$a;->f:I

    .line 156
    .line 157
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 158
    .line 159
    iget v2, p0, Lcom/android/launcher3/folder/FolderIcon;->z:F

    .line 160
    .line 161
    iget-object v3, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 162
    .line 163
    invoke-virtual {v3}, Lcom/android/launcher3/folder/u0;->w0()F

    .line 164
    .line 165
    .line 166
    move-result v3

    .line 167
    sub-float/2addr v2, v3

    .line 168
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    iput v1, v0, Ls1/m$a;->d:F

    .line 173
    .line 174
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 175
    .line 176
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    iget v1, v1, Lcom/android/launcher3/r4;->V:F

    .line 189
    .line 190
    iput v1, v0, Ls1/m$a;->j:F

    .line 191
    .line 192
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 193
    .line 194
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    iget-boolean v0, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 199
    .line 200
    if-eqz v0, :cond_4

    .line 201
    .line 202
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    const v1, 0x7f070aaa

    .line 207
    .line 208
    .line 209
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    neg-float v1, v0

    .line 214
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 215
    .line 216
    .line 217
    iget-object v2, p0, Lcom/android/launcher3/folder/FolderIcon;->x:Ls1/m;

    .line 218
    .line 219
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 220
    .line 221
    .line 222
    move-result-object v3

    .line 223
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 224
    .line 225
    invoke-virtual {v2, v3, p1, p0}, Ls1/m;->a(Landroid/content/Context;Landroid/graphics/Canvas;Ls1/m$a;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 229
    .line 230
    .line 231
    return-void

    .line 232
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->x:Ls1/m;

    .line 233
    .line 234
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 239
    .line 240
    invoke-virtual {v0, v1, p1, p0}, Ls1/m;->a(Landroid/content/Context;Landroid/graphics/Canvas;Ls1/m$a;)V

    .line 241
    .line 242
    .line 243
    :cond_5
    return-void
.end method

.method public x(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->x(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public x1()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "replaceFolderWithFinalItem size="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "TransformFolderIcon"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 34
    .line 35
    const/16 v2, 0x8

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_4

    .line 42
    .line 43
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    const/4 v2, 0x1

    .line 54
    if-le v0, v2, :cond_0

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 58
    .line 59
    const/16 v2, 0x20

    .line 60
    .line 61
    invoke-virtual {v0, v2}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->q()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_2

    .line 91
    .line 92
    const-string p0, "replaceFolderWithFinalItem isMoreDragMode return"

    .line 93
    .line 94
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 101
    .line 102
    .line 103
    const-string v2, "replaceFolderWithFinalItem, folder: "

    .line 104
    .line 105
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-object v2, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 109
    .line 110
    iget-object v2, v2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 111
    .line 112
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v2, ", id: "

    .line 116
    .line 117
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    iget-object v2, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 121
    .line 122
    iget v2, v2, Lcom/android/launcher3/model/data/y;->id:I

    .line 123
    .line 124
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    .line 133
    .line 134
    new-instance v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$k;

    .line 135
    .line 136
    invoke-direct {v0, p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$k;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V

    .line 137
    .line 138
    .line 139
    invoke-static {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->Y0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)Lcom/android/launcher3/BubbleTextView;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    if-eqz v1, :cond_3

    .line 144
    .line 145
    invoke-virtual {p0, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0(Ljava/lang/Runnable;)V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :cond_3
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 150
    .line 151
    .line 152
    :cond_4
    :goto_0
    return-void
.end method

.method protected y(II[I)F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    const/16 p1, 0x7e

    .line 3
    .line 4
    aput p1, p3, p0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    const/16 p1, 0x3e

    .line 8
    .line 9
    aput p1, p3, p0

    .line 10
    .line 11
    const p0, 0x3e570a3d    # 0.21f

    .line 12
    .line 13
    .line 14
    return p0
.end method

.method public y1(Landroid/view/View;Lcom/android/launcher3/dragndrop/p;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Lcom/android/launcher3/model/data/I;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 10
    .line 11
    iget v0, v0, Lcom/android/launcher3/model/data/y;->rank:I

    .line 12
    .line 13
    iput v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->n0:I

    .line 14
    .line 15
    iput-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->o0:Landroid/view/View;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, p0}, Lcom/android/launcher3/dragndrop/j;->g(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0, p1, p0, p2}, Lcom/android/launcher3/Workspace;->F0(Landroid/view/View;Lcom/android/launcher3/m0;Lcom/android/launcher3/dragndrop/p;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    const/4 p0, 0x1

    .line 36
    return p0
.end method

.method public z(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v3, "onDrop DragObject DragOptions dragTitle="

    .line 11
    .line 12
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    iget-object v4, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 16
    .line 17
    iget-object v4, v4, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 18
    .line 19
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v4, " mIsExternalDrag="

    .line 23
    .line 24
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget-boolean v4, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p0:Z

    .line 28
    .line 29
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v4, " mEmptyCellRank="

    .line 33
    .line 34
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget v4, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->n0:I

    .line 38
    .line 39
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v4, " size="

    .line 43
    .line 44
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-object v5, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 48
    .line 49
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    const-string v5, "TransformFolderIcon"

    .line 65
    .line 66
    invoke-static {v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    iget v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->n0:I

    .line 70
    .line 71
    iget-object v6, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 72
    .line 73
    invoke-virtual {v6}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 74
    .line 75
    .line 76
    move-result-object v6

    .line 77
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 78
    .line 79
    .line 80
    move-result v6

    .line 81
    if-le v2, v6, :cond_0

    .line 82
    .line 83
    iget-object v2, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 84
    .line 85
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    iput v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->n0:I

    .line 94
    .line 95
    :cond_0
    invoke-static {}, Lx1/Y;->i()Ljava/lang/Boolean;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    const/4 v6, 0x0

    .line 104
    if-eqz v2, :cond_2

    .line 105
    .line 106
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-static {v2}, Lx1/Y;->j(Landroid/content/Context;)Z

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    if-eqz v2, :cond_2

    .line 115
    .line 116
    iget-object v2, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 117
    .line 118
    const/16 v7, 0x20

    .line 119
    .line 120
    invoke-virtual {v2, v7}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    if-eqz v2, :cond_1

    .line 125
    .line 126
    iget-object v2, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 127
    .line 128
    iget v7, v2, Lcom/android/launcher3/model/data/y;->container:I

    .line 129
    .line 130
    iget-object v8, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 131
    .line 132
    iget v8, v8, Lcom/android/launcher3/model/data/y;->id:I

    .line 133
    .line 134
    if-eq v7, v8, :cond_1

    .line 135
    .line 136
    iget-object v7, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 137
    .line 138
    invoke-static {v7, v2}, Lcom/android/launcher3/resource/h1;->L(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;)V

    .line 139
    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_1
    iget-object v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 143
    .line 144
    invoke-static {v2}, Lcom/android/launcher3/resource/h1;->Y(Lcom/android/launcher3/C2;)Ljava/util/ArrayList;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 149
    .line 150
    .line 151
    move-result v7

    .line 152
    if-nez v7, :cond_2

    .line 153
    .line 154
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    check-cast v2, Lcom/android/launcher3/model/data/p;

    .line 159
    .line 160
    iget-object v7, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 161
    .line 162
    iget v8, v7, Lcom/android/launcher3/model/data/y;->container:I

    .line 163
    .line 164
    iget v2, v2, Lcom/android/launcher3/model/data/y;->id:I

    .line 165
    .line 166
    if-ne v8, v2, :cond_2

    .line 167
    .line 168
    iget-object v8, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 169
    .line 170
    iget v8, v8, Lcom/android/launcher3/model/data/y;->id:I

    .line 171
    .line 172
    if-eq v8, v2, :cond_2

    .line 173
    .line 174
    iget-object v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 175
    .line 176
    invoke-static {v2, v7}, Lcom/android/launcher3/resource/h1;->z0(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;)V

    .line 177
    .line 178
    .line 179
    :cond_2
    :goto_0
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    invoke-interface {v2}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    instance-of v2, v2, Lcom/android/launcher3/Hotseat;

    .line 188
    .line 189
    const/4 v7, 0x1

    .line 190
    if-eqz v2, :cond_3

    .line 191
    .line 192
    iget-object v2, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 193
    .line 194
    iget v2, v2, Lcom/android/launcher3/model/data/y;->container:I

    .line 195
    .line 196
    const/16 v8, -0x65

    .line 197
    .line 198
    if-ne v8, v2, :cond_3

    .line 199
    .line 200
    iget-object v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 201
    .line 202
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    iput-boolean v7, v2, Lcom/android/launcher3/Workspace;->B0:Z

    .line 207
    .line 208
    :cond_3
    iget-object v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 209
    .line 210
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    invoke-virtual {v2}, Lcom/android/launcher3/G4;->q()Z

    .line 215
    .line 216
    .line 217
    move-result v2

    .line 218
    if-eqz v2, :cond_5

    .line 219
    .line 220
    iget-object v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 221
    .line 222
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    invoke-virtual {v2, v1, v0}, Lcom/android/launcher3/menu/c;->c(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/folder/FolderIcon;)V

    .line 227
    .line 228
    .line 229
    iget-object v1, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 230
    .line 231
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    invoke-virtual {v1}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 244
    .line 245
    .line 246
    move-result v2

    .line 247
    if-eqz v2, :cond_4

    .line 248
    .line 249
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 250
    .line 251
    .line 252
    move-result-object v2

    .line 253
    check-cast v2, Landroid/view/View;

    .line 254
    .line 255
    iget-object v3, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 256
    .line 257
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 258
    .line 259
    .line 260
    move-result-object v3

    .line 261
    invoke-virtual {v3, v2}, Lcom/android/launcher3/Workspace;->K2(Landroid/view/View;)V

    .line 262
    .line 263
    .line 264
    goto :goto_1

    .line 265
    :cond_4
    return-void

    .line 266
    :cond_5
    iget-boolean v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p0:Z

    .line 267
    .line 268
    if-eqz v2, :cond_6

    .line 269
    .line 270
    iget v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->n0:I

    .line 271
    .line 272
    iget-object v8, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 273
    .line 274
    iget v9, v8, Lcom/android/launcher3/model/data/p;->k:I

    .line 275
    .line 276
    iget v10, v8, Lcom/android/launcher3/model/data/p;->l:I

    .line 277
    .line 278
    mul-int/2addr v9, v10

    .line 279
    sub-int/2addr v9, v7

    .line 280
    if-ne v2, v9, :cond_6

    .line 281
    .line 282
    invoke-virtual {v8}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 283
    .line 284
    .line 285
    move-result-object v2

    .line 286
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 287
    .line 288
    .line 289
    move-result v2

    .line 290
    iget-object v8, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 291
    .line 292
    iget v9, v8, Lcom/android/launcher3/model/data/p;->k:I

    .line 293
    .line 294
    iget v10, v8, Lcom/android/launcher3/model/data/p;->l:I

    .line 295
    .line 296
    mul-int/2addr v9, v10

    .line 297
    if-lt v2, v9, :cond_6

    .line 298
    .line 299
    invoke-virtual {v8}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 300
    .line 301
    .line 302
    move-result-object v2

    .line 303
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 304
    .line 305
    .line 306
    move-result v2

    .line 307
    iput v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->n0:I

    .line 308
    .line 309
    :cond_6
    iput-boolean v6, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->q0:Z

    .line 310
    .line 311
    iget-object v2, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 312
    .line 313
    instance-of v8, v2, Lcom/android/launcher3/widget/y0;

    .line 314
    .line 315
    const/4 v9, 0x0

    .line 316
    if-eqz v8, :cond_7

    .line 317
    .line 318
    check-cast v2, Lcom/android/launcher3/widget/y0;

    .line 319
    .line 320
    move-object v11, v2

    .line 321
    goto :goto_2

    .line 322
    :cond_7
    move-object v11, v9

    .line 323
    :goto_2
    if-eqz v11, :cond_8

    .line 324
    .line 325
    iget-object v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 326
    .line 327
    invoke-virtual {v11, v2}, Lcom/android/launcher3/widget/y0;->P(Landroid/content/Context;)LD1/i;

    .line 328
    .line 329
    .line 330
    move-result-object v2

    .line 331
    invoke-virtual {v2}, LD1/i;->c()Lcom/android/launcher3/model/data/I;

    .line 332
    .line 333
    .line 334
    move-result-object v2

    .line 335
    goto :goto_3

    .line 336
    :cond_8
    move-object v2, v9

    .line 337
    :goto_3
    iget-object v8, v0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 338
    .line 339
    invoke-virtual {v8, v0}, Lcom/android/launcher3/folder/u0;->U(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)Landroid/util/Pair;

    .line 340
    .line 341
    .line 342
    move-result-object v8

    .line 343
    if-eqz v11, :cond_9

    .line 344
    .line 345
    if-nez v2, :cond_9

    .line 346
    .line 347
    iget-object v2, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 348
    .line 349
    iget v12, v2, Lcom/android/launcher3/model/data/y;->id:I

    .line 350
    .line 351
    iput v12, v11, Lcom/android/launcher3/model/data/y;->container:I

    .line 352
    .line 353
    iget v13, v2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 354
    .line 355
    iput v13, v11, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 356
    .line 357
    iget v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->n0:I

    .line 358
    .line 359
    iput v2, v11, Lcom/android/launcher3/model/data/y;->rank:I

    .line 360
    .line 361
    iget-object v10, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 362
    .line 363
    iget v15, v11, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 364
    .line 365
    iget v2, v11, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 366
    .line 367
    const/4 v14, 0x0

    .line 368
    move/from16 v16, v2

    .line 369
    .line 370
    invoke-virtual/range {v10 .. v16}, Lcom/android/launcher3/C2;->Y0(Lcom/android/launcher3/W4;II[III)V

    .line 371
    .line 372
    .line 373
    iput-boolean v6, v1, Lcom/android/launcher3/n0$a;->k:Z

    .line 374
    .line 375
    goto/16 :goto_a

    .line 376
    .line 377
    :cond_9
    if-eqz v2, :cond_a

    .line 378
    .line 379
    :goto_4
    move-object v11, v2

    .line 380
    goto :goto_5

    .line 381
    :cond_a
    iget-object v2, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 382
    .line 383
    instance-of v10, v2, Lcom/android/launcher3/model/data/d;

    .line 384
    .line 385
    if-eqz v10, :cond_b

    .line 386
    .line 387
    check-cast v2, Lcom/android/launcher3/model/data/d;

    .line 388
    .line 389
    iget-object v10, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 390
    .line 391
    invoke-virtual {v2, v10}, Lcom/android/launcher3/model/data/d;->a(Landroid/content/Context;)Lcom/android/launcher3/model/data/I;

    .line 392
    .line 393
    .line 394
    move-result-object v2

    .line 395
    goto :goto_4

    .line 396
    :cond_b
    check-cast v2, Lcom/android/launcher3/model/data/I;

    .line 397
    .line 398
    goto :goto_4

    .line 399
    :goto_5
    iget-boolean v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p0:Z

    .line 400
    .line 401
    if-eqz v2, :cond_c

    .line 402
    .line 403
    new-instance v2, Ljava/util/ArrayList;

    .line 404
    .line 405
    iget-object v10, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 406
    .line 407
    invoke-virtual {v10}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 408
    .line 409
    .line 410
    move-result-object v10

    .line 411
    invoke-direct {v2, v10}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 412
    .line 413
    .line 414
    iget v10, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->n0:I

    .line 415
    .line 416
    iput v10, v11, Lcom/android/launcher3/model/data/y;->rank:I

    .line 417
    .line 418
    invoke-virtual {v2, v10, v11}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 419
    .line 420
    .line 421
    invoke-direct {v0, v2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->w1(Ljava/util/ArrayList;)V

    .line 422
    .line 423
    .line 424
    iget-object v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 425
    .line 426
    iget v10, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->n0:I

    .line 427
    .line 428
    invoke-direct {v0, v10}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->W0(I)Landroid/graphics/Point;

    .line 429
    .line 430
    .line 431
    move-result-object v10

    .line 432
    iget v10, v10, Landroid/graphics/Point;->x:I

    .line 433
    .line 434
    iget v12, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->n0:I

    .line 435
    .line 436
    invoke-direct {v0, v12}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->W0(I)Landroid/graphics/Point;

    .line 437
    .line 438
    .line 439
    move-result-object v12

    .line 440
    iget v12, v12, Landroid/graphics/Point;->y:I

    .line 441
    .line 442
    invoke-virtual {v2, v10, v12}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 443
    .line 444
    .line 445
    move-result-object v2

    .line 446
    iget-object v10, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 447
    .line 448
    invoke-virtual {v10}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 449
    .line 450
    .line 451
    move-result-object v10

    .line 452
    iget-object v12, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 453
    .line 454
    iget v12, v12, Lcom/android/launcher3/model/data/y;->id:I

    .line 455
    .line 456
    iget v14, v11, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 457
    .line 458
    iget v15, v11, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 459
    .line 460
    const/4 v13, 0x0

    .line 461
    invoke-virtual/range {v10 .. v15}, Lz1/J3;->x(Lcom/android/launcher3/model/data/y;IIII)V

    .line 462
    .line 463
    .line 464
    iget-object v10, v1, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 465
    .line 466
    if-eq v10, v0, :cond_d

    .line 467
    .line 468
    invoke-virtual {v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 469
    .line 470
    .line 471
    move-result-object v10

    .line 472
    invoke-virtual {v10, v6}, Lcom/android/launcher3/folder/Folder;->r2(Z)V

    .line 473
    .line 474
    .line 475
    goto :goto_6

    .line 476
    :cond_c
    iget-object v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->o0:Landroid/view/View;

    .line 477
    .line 478
    iget v10, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->n0:I

    .line 479
    .line 480
    invoke-virtual {v0, v2, v11, v10}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->L0(Landroid/view/View;Lcom/android/launcher3/model/data/I;I)V

    .line 481
    .line 482
    .line 483
    :cond_d
    :goto_6
    iget-object v10, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 484
    .line 485
    invoke-virtual {v10}, Lcom/android/launcher3/dragndrop/v;->u()Z

    .line 486
    .line 487
    .line 488
    move-result v10

    .line 489
    if-eqz v10, :cond_12

    .line 490
    .line 491
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getScaleX()F

    .line 492
    .line 493
    .line 494
    move-result v10

    .line 495
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getScaleY()F

    .line 496
    .line 497
    .line 498
    move-result v12

    .line 499
    const/high16 v13, 0x3f800000    # 1.0f

    .line 500
    .line 501
    invoke-virtual {v0, v13}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 502
    .line 503
    .line 504
    invoke-virtual {v0, v13}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 505
    .line 506
    .line 507
    if-eqz v8, :cond_e

    .line 508
    .line 509
    iget-object v3, v0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 510
    .line 511
    iget-object v4, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 512
    .line 513
    iget-object v5, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 514
    .line 515
    invoke-virtual {v3, v0, v4, v5, v2}, Lcom/android/launcher3/folder/u0;->h0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/C2;Lcom/android/launcher3/dragndrop/v;Landroid/view/View;)V

    .line 516
    .line 517
    .line 518
    goto/16 :goto_7

    .line 519
    .line 520
    :cond_e
    iget-object v8, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 521
    .line 522
    invoke-virtual {v8}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 523
    .line 524
    .line 525
    move-result-object v8

    .line 526
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    .line 527
    .line 528
    .line 529
    move-result v8

    .line 530
    iget-object v13, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 531
    .line 532
    iget v14, v13, Lcom/android/launcher3/model/data/p;->k:I

    .line 533
    .line 534
    iget v15, v13, Lcom/android/launcher3/model/data/p;->l:I

    .line 535
    .line 536
    mul-int/2addr v14, v15

    .line 537
    if-lt v8, v14, :cond_f

    .line 538
    .line 539
    iget-boolean v8, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p0:Z

    .line 540
    .line 541
    if-eqz v8, :cond_f

    .line 542
    .line 543
    iget v8, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->n0:I

    .line 544
    .line 545
    invoke-virtual {v13}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 546
    .line 547
    .line 548
    move-result-object v13

    .line 549
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    .line 550
    .line 551
    .line 552
    move-result v13

    .line 553
    if-ne v8, v13, :cond_f

    .line 554
    .line 555
    new-instance v2, Ljava/lang/StringBuilder;

    .line 556
    .line 557
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 558
    .line 559
    .line 560
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 561
    .line 562
    .line 563
    iget-object v3, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 564
    .line 565
    iget-object v3, v3, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 566
    .line 567
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 568
    .line 569
    .line 570
    const-string v3, " external drag to folder last 4 small icon location column ="

    .line 571
    .line 572
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 573
    .line 574
    .line 575
    iget-object v3, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 576
    .line 577
    iget v3, v3, Lcom/android/launcher3/model/data/p;->k:I

    .line 578
    .line 579
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 580
    .line 581
    .line 582
    const-string v3, " , row: ="

    .line 583
    .line 584
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 585
    .line 586
    .line 587
    iget-object v3, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 588
    .line 589
    iget v3, v3, Lcom/android/launcher3/model/data/p;->l:I

    .line 590
    .line 591
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 592
    .line 593
    .line 594
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 595
    .line 596
    .line 597
    iget-object v3, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 598
    .line 599
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 600
    .line 601
    .line 602
    move-result-object v3

    .line 603
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 604
    .line 605
    .line 606
    move-result v3

    .line 607
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 608
    .line 609
    .line 610
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 611
    .line 612
    .line 613
    move-result-object v2

    .line 614
    invoke-static {v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 615
    .line 616
    .line 617
    invoke-direct {v0, v1, v6}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->Q0(Lcom/android/launcher3/n0$a;Z)V

    .line 618
    .line 619
    .line 620
    iget-object v2, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 621
    .line 622
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 623
    .line 624
    .line 625
    move-result-object v2

    .line 626
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 627
    .line 628
    .line 629
    move-result v2

    .line 630
    iget-object v3, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 631
    .line 632
    iget v4, v3, Lcom/android/launcher3/model/data/p;->k:I

    .line 633
    .line 634
    iget v3, v3, Lcom/android/launcher3/model/data/p;->l:I

    .line 635
    .line 636
    mul-int/2addr v4, v3

    .line 637
    if-ne v2, v4, :cond_11

    .line 638
    .line 639
    iget-object v2, v0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 640
    .line 641
    invoke-direct {v0, v6}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b1(I)Lcom/android/launcher3/BubbleTextView;

    .line 642
    .line 643
    .line 644
    move-result-object v3

    .line 645
    invoke-virtual {v2, v0, v7, v3}, Lcom/android/launcher3/folder/u0;->i0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;ZLcom/android/launcher3/BubbleTextView;)V

    .line 646
    .line 647
    .line 648
    goto/16 :goto_7

    .line 649
    .line 650
    :cond_f
    iget-object v8, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 651
    .line 652
    invoke-virtual {v8}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 653
    .line 654
    .line 655
    move-result-object v8

    .line 656
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    .line 657
    .line 658
    .line 659
    move-result v8

    .line 660
    iget-object v13, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 661
    .line 662
    iget v14, v13, Lcom/android/launcher3/model/data/p;->k:I

    .line 663
    .line 664
    iget v13, v13, Lcom/android/launcher3/model/data/p;->l:I

    .line 665
    .line 666
    mul-int v15, v14, v13

    .line 667
    .line 668
    if-lt v8, v15, :cond_10

    .line 669
    .line 670
    iget-boolean v8, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p0:Z

    .line 671
    .line 672
    if-nez v8, :cond_10

    .line 673
    .line 674
    iget v8, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->n0:I

    .line 675
    .line 676
    mul-int/2addr v14, v13

    .line 677
    sub-int/2addr v14, v7

    .line 678
    if-ne v8, v14, :cond_10

    .line 679
    .line 680
    new-instance v2, Ljava/lang/StringBuilder;

    .line 681
    .line 682
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 683
    .line 684
    .line 685
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 686
    .line 687
    .line 688
    iget-object v3, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 689
    .line 690
    iget-object v3, v3, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 691
    .line 692
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 693
    .line 694
    .line 695
    const-string v3, " internal drag to folder last 4 small icon location column ="

    .line 696
    .line 697
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 698
    .line 699
    .line 700
    iget-object v3, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 701
    .line 702
    iget v3, v3, Lcom/android/launcher3/model/data/p;->k:I

    .line 703
    .line 704
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 705
    .line 706
    .line 707
    const-string v3, ", row ="

    .line 708
    .line 709
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 710
    .line 711
    .line 712
    iget-object v3, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 713
    .line 714
    iget v3, v3, Lcom/android/launcher3/model/data/p;->l:I

    .line 715
    .line 716
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 717
    .line 718
    .line 719
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 720
    .line 721
    .line 722
    iget-object v3, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 723
    .line 724
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 725
    .line 726
    .line 727
    move-result-object v3

    .line 728
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 729
    .line 730
    .line 731
    move-result v3

    .line 732
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 733
    .line 734
    .line 735
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 736
    .line 737
    .line 738
    move-result-object v2

    .line 739
    invoke-static {v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 740
    .line 741
    .line 742
    invoke-direct {v0, v1, v7}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->Q0(Lcom/android/launcher3/n0$a;Z)V

    .line 743
    .line 744
    .line 745
    move v2, v7

    .line 746
    goto :goto_8

    .line 747
    :cond_10
    new-instance v4, Ljava/lang/StringBuilder;

    .line 748
    .line 749
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 750
    .line 751
    .line 752
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 753
    .line 754
    .line 755
    iget-object v3, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 756
    .line 757
    iget-object v3, v3, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 758
    .line 759
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 760
    .line 761
    .line 762
    const-string v3, " onDrop use origin animateViewIntoPosition"

    .line 763
    .line 764
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 765
    .line 766
    .line 767
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 768
    .line 769
    .line 770
    move-result-object v3

    .line 771
    invoke-static {v5, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 772
    .line 773
    .line 774
    iget-object v3, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

    .line 775
    .line 776
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 777
    .line 778
    .line 779
    move-result-object v3

    .line 780
    iget-object v4, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 781
    .line 782
    invoke-virtual {v3, v4, v2, v9}, Lcom/android/launcher3/dragndrop/DragLayer;->i(Lcom/android/launcher3/dragndrop/v;Landroid/view/View;Landroid/view/View;)V

    .line 783
    .line 784
    .line 785
    iget-object v2, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 786
    .line 787
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 788
    .line 789
    .line 790
    move-result-object v2

    .line 791
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 792
    .line 793
    .line 794
    move-result v2

    .line 795
    iget-object v3, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 796
    .line 797
    iget v4, v3, Lcom/android/launcher3/model/data/p;->k:I

    .line 798
    .line 799
    iget v3, v3, Lcom/android/launcher3/model/data/p;->l:I

    .line 800
    .line 801
    mul-int v5, v4, v3

    .line 802
    .line 803
    if-lt v2, v5, :cond_11

    .line 804
    .line 805
    iget-boolean v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p0:Z

    .line 806
    .line 807
    if-eqz v2, :cond_11

    .line 808
    .line 809
    iget v2, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->n0:I

    .line 810
    .line 811
    mul-int/2addr v4, v3

    .line 812
    sub-int/2addr v4, v7

    .line 813
    if-ge v2, v4, :cond_11

    .line 814
    .line 815
    invoke-direct {v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->P0()V

    .line 816
    .line 817
    .line 818
    :cond_11
    :goto_7
    move v2, v6

    .line 819
    :goto_8
    invoke-virtual {v0, v10}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 820
    .line 821
    .line 822
    invoke-virtual {v0, v12}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 823
    .line 824
    .line 825
    goto :goto_9

    .line 826
    :cond_12
    iput-boolean v6, v1, Lcom/android/launcher3/n0$a;->k:Z

    .line 827
    .line 828
    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 829
    .line 830
    .line 831
    move v2, v6

    .line 832
    :goto_9
    new-instance v3, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$n;

    .line 833
    .line 834
    invoke-direct {v3, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$n;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V

    .line 835
    .line 836
    .line 837
    :try_start_0
    iget-object v4, v0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 838
    .line 839
    iget v5, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->n0:I

    .line 840
    .line 841
    invoke-virtual {v4, v11, v5, v6}, Lcom/android/launcher3/folder/Folder;->E0(Lcom/android/launcher3/model/data/y;IZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 842
    .line 843
    .line 844
    invoke-virtual {v3}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$n;->close()V

    .line 845
    .line 846
    .line 847
    iget-object v3, v0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 848
    .line 849
    invoke-virtual {v3, v6}, Lcom/android/launcher3/folder/Folder;->r2(Z)V

    .line 850
    .line 851
    .line 852
    iget-boolean v3, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p0:Z

    .line 853
    .line 854
    if-nez v3, :cond_13

    .line 855
    .line 856
    iget v3, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->n0:I

    .line 857
    .line 858
    iget-object v4, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 859
    .line 860
    iget v5, v4, Lcom/android/launcher3/model/data/p;->k:I

    .line 861
    .line 862
    iget v8, v4, Lcom/android/launcher3/model/data/p;->l:I

    .line 863
    .line 864
    mul-int/2addr v5, v8

    .line 865
    sub-int/2addr v5, v7

    .line 866
    if-ne v3, v5, :cond_13

    .line 867
    .line 868
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 869
    .line 870
    .line 871
    move-result-object v3

    .line 872
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 873
    .line 874
    .line 875
    move-result v3

    .line 876
    iget-object v4, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 877
    .line 878
    iget v5, v4, Lcom/android/launcher3/model/data/p;->k:I

    .line 879
    .line 880
    iget v4, v4, Lcom/android/launcher3/model/data/p;->l:I

    .line 881
    .line 882
    mul-int/2addr v5, v4

    .line 883
    if-le v3, v5, :cond_13

    .line 884
    .line 885
    invoke-direct {v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->t1()V

    .line 886
    .line 887
    .line 888
    :cond_13
    iget-object v3, v1, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 889
    .line 890
    if-eq v3, v0, :cond_14

    .line 891
    .line 892
    invoke-virtual {v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 893
    .line 894
    .line 895
    move-result-object v3

    .line 896
    invoke-virtual {v3, v6}, Lcom/android/launcher3/folder/Folder;->r2(Z)V

    .line 897
    .line 898
    .line 899
    :cond_14
    if-eqz v2, :cond_15

    .line 900
    .line 901
    invoke-direct {v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->R0()V

    .line 902
    .line 903
    .line 904
    :cond_15
    :goto_a
    iput-boolean v6, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->q0:Z

    .line 905
    .line 906
    iget-object v1, v1, Lcom/android/launcher3/n0$a;->l:LO0/e;

    .line 907
    .line 908
    if-eqz v1, :cond_16

    .line 909
    .line 910
    const v2, 0x7f140219

    .line 911
    .line 912
    .line 913
    invoke-virtual {v1, v2}, LO0/e;->c(I)V

    .line 914
    .line 915
    .line 916
    :cond_16
    iget-object v1, v0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 917
    .line 918
    invoke-virtual {v1, v0}, Lcom/android/launcher3/folder/u0;->d0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V

    .line 919
    .line 920
    .line 921
    return-void

    .line 922
    :catchall_0
    move-exception v0

    .line 923
    move-object v1, v0

    .line 924
    :try_start_1
    invoke-virtual {v3}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$n;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 925
    .line 926
    .line 927
    goto :goto_b

    .line 928
    :catchall_1
    move-exception v0

    .line 929
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 930
    .line 931
    .line 932
    :goto_b
    throw v1
.end method

.method public z1()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->b0:Lcom/android/launcher3/C2;

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
    goto :goto_1

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getAllChildBubbleTextViewList()Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    instance-of v1, v1, Lcom/android/launcher3/model/data/y;

    .line 39
    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0}, Lcom/android/launcher3/BubbleTextView;->getIconSize()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-virtual {v0}, Lcom/android/launcher3/BubbleTextView;->getIconSize()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    const/4 v3, 0x0

    .line 61
    invoke-virtual {v1, v3, v3, v2, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    :goto_1
    return-void
.end method
