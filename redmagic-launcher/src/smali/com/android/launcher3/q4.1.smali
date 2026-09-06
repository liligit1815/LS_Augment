.class public Lcom/android/launcher3/q4;
.super Ljava/lang/Object;
.source "MFVInterfaceProxy.java"

# interfaces
.implements Lcom/android/launcher3/H5$i;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/q4$a;
    }
.end annotation


# static fields
.field private static l:Ljava/lang/ref/WeakReference; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/launcher3/C2;",
            ">;"
        }
    .end annotation
.end field

.field public static volatile m:Z = false

.field private static final n:Landroid/content/ComponentName;


# instance fields
.field private a:Z

.field private b:Z

.field private c:Z

.field private d:Z

.field private e:Lcom/android/launcher3/W3;

.field private f:Lx1/Z;

.field private g:Lcom/android/launcher3/views/k;

.field private h:Lcom/android/launcher3/MFVDockExpandSupport;

.field private i:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/launcher3/H5$h;",
            ">;"
        }
    .end annotation
.end field

.field private j:Lcom/android/launcher3/menu/c;

.field private k:Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/ComponentName;

    .line 2
    .line 3
    const-string v1, "com.android.settings"

    .line 4
    .line 5
    const-string v2, "com.android.settings.DisplaySettings"

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/android/launcher3/q4;->n:Landroid/content/ComponentName;

    .line 11
    .line 12
    return-void
.end method

.method constructor <init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/P2;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/q4;->a:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/android/launcher3/q4;->b:Z

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput-boolean v1, p0, Lcom/android/launcher3/q4;->c:Z

    .line 11
    .line 12
    iput-boolean v0, p0, Lcom/android/launcher3/q4;->d:Z

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/android/launcher3/q4;->k:Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 22
    .line 23
    iput-object v1, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 24
    .line 25
    new-instance v1, Lcom/android/launcher3/W3;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-direct {v1, v2}, Lcom/android/launcher3/W3;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Lcom/android/launcher3/q4;->e:Lcom/android/launcher3/W3;

    .line 35
    .line 36
    new-instance v1, Lx1/Z;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-direct {v1, v2}, Lx1/Z;-><init>(Lcom/android/launcher3/Workspace;)V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Lcom/android/launcher3/q4;->f:Lx1/Z;

    .line 46
    .line 47
    new-instance v1, Lcom/android/launcher3/menu/c;

    .line 48
    .line 49
    invoke-direct {v1, p1, p2}, Lcom/android/launcher3/menu/c;-><init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/P2;)V

    .line 50
    .line 51
    .line 52
    iput-object v1, p0, Lcom/android/launcher3/q4;->j:Lcom/android/launcher3/menu/c;

    .line 53
    .line 54
    sget-object p2, Lcom/android/launcher3/q4;->l:Ljava/lang/ref/WeakReference;

    .line 55
    .line 56
    if-eqz p2, :cond_0

    .line 57
    .line 58
    new-instance p2, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    const-string v1, "MFVInterfaceProxy init sLauncherInstance not null, get="

    .line 64
    .line 65
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    sget-object v1, Lcom/android/launcher3/q4;->l:Ljava/lang/ref/WeakReference;

    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v1, " launcher="

    .line 78
    .line 79
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    const-string v1, "R-Loader"

    .line 90
    .line 91
    invoke-static {v1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    sget-object p2, Lcom/android/launcher3/q4;->l:Ljava/lang/ref/WeakReference;

    .line 95
    .line 96
    invoke-virtual {p2}, Ljava/lang/ref/WeakReference;->clear()V

    .line 97
    .line 98
    .line 99
    sput-object v0, Lcom/android/launcher3/q4;->l:Ljava/lang/ref/WeakReference;

    .line 100
    .line 101
    :cond_0
    new-instance p2, Ljava/lang/ref/WeakReference;

    .line 102
    .line 103
    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    sput-object p2, Lcom/android/launcher3/q4;->l:Ljava/lang/ref/WeakReference;

    .line 107
    .line 108
    invoke-static {}, Lx1/O;->C3()Z

    .line 109
    .line 110
    .line 111
    move-result p2

    .line 112
    if-nez p2, :cond_2

    .line 113
    .line 114
    invoke-static {}, Lx1/O;->A3()Ljava/lang/Boolean;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 119
    .line 120
    .line 121
    move-result p2

    .line 122
    if-eqz p2, :cond_1

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_1
    return-void

    .line 126
    :cond_2
    :goto_0
    new-instance p2, Lcom/android/launcher3/MFVDockExpandSupport;

    .line 127
    .line 128
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-direct {p2, p1}, Lcom/android/launcher3/MFVDockExpandSupport;-><init>(Landroid/content/Context;)V

    .line 133
    .line 134
    .line 135
    iput-object p2, p0, Lcom/android/launcher3/q4;->h:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 136
    .line 137
    return-void
.end method

.method public static synthetic A(Lcom/android/launcher3/q4;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/q4;->b0(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static F(Lcom/android/launcher3/C2;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/q4;->l:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    sget-object v0, Lcom/android/launcher3/q4;->l:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "R-Loader"

    .line 18
    .line 19
    if-eq v0, p0, :cond_0

    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v2, "clearInstance returns launcher="

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    const-string p0, "MFVInterfaceProxy:clearInstance  "

    .line 43
    .line 44
    invoke-static {v1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    sget-object p0, Lcom/android/launcher3/q4;->l:Ljava/lang/ref/WeakReference;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 50
    .line 51
    .line 52
    const/4 p0, 0x0

    .line 53
    sput-object p0, Lcom/android/launcher3/q4;->l:Ljava/lang/ref/WeakReference;

    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method private K(Lcom/android/launcher3/C2;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-direct {p0, p2}, Lcom/android/launcher3/q4;->M(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/view/View;->isAttachedToWindow()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p2}, Landroid/view/View;->invalidate()V

    .line 16
    .line 17
    .line 18
    :cond_1
    :goto_0
    return-void
.end method

.method private M(Landroid/view/View;)V
    .locals 4

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/Workspace;

    .line 6
    .line 7
    new-instance v0, Lcom/android/launcher3/c4;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/android/launcher3/c4;-><init>(Lcom/android/launcher3/q4;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lcom/android/launcher3/Workspace;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    instance-of v0, p1, Lcom/android/launcher3/CellLayout;

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    check-cast p1, Lcom/android/launcher3/CellLayout;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v1, 0x0

    .line 31
    :goto_0
    if-ge v1, v0, :cond_2

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    instance-of v3, v2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 38
    .line 39
    if-eqz v3, :cond_1

    .line 40
    .line 41
    check-cast v2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 42
    .line 43
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getVisibility()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-nez v3, :cond_1

    .line 48
    .line 49
    invoke-direct {p0, v2}, Lcom/android/launcher3/q4;->N(Landroid/view/View;)V

    .line 50
    .line 51
    .line 52
    iget-object v2, v2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 53
    .line 54
    if-eqz v2, :cond_1

    .line 55
    .line 56
    invoke-direct {p0, v2}, Lcom/android/launcher3/q4;->N(Landroid/view/View;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    return-void
.end method

.method private N(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez p0, :cond_0

    .line 10
    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    const/high16 v1, 0x40000000    # 2.0f

    .line 14
    .line 15
    invoke-static {p0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p1, p0, v0}, Landroid/view/View;->measure(II)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {p1, p0, v0, v1, v2}, Landroid/view/View;->layout(IIII)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static Q()Lcom/android/launcher3/C2;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/q4;->l:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/android/launcher3/q4;->l:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/launcher3/C2;

    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_0
    const-string v0, "R-Loader"

    .line 21
    .line 22
    const-string v1, "getLauncher null"

    .line 23
    .line 24
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    return-object v0
.end method

.method public static U()Lz1/y0;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "R-Loader"

    .line 8
    .line 9
    const-string v1, "getModelCacheData--getLauncher() == null"

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    return-object v0

    .line 16
    :cond_0
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->f0()Lz1/y0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    return-object v0
.end method

.method private Y(Ljava/lang/String;Lcom/android/launcher3/C2;Landroid/view/View;ILjava/lang/String;Z)Landroid/graphics/Bitmap;
    .locals 18

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
    move-object/from16 v3, p3

    .line 8
    .line 9
    move/from16 v4, p4

    .line 10
    .line 11
    move-object/from16 v5, p5

    .line 12
    .line 13
    const/4 v6, 0x0

    .line 14
    const-string v7, "R-Loader"

    .line 15
    .line 16
    if-nez v3, :cond_0

    .line 17
    .line 18
    const-string v0, "getViewScreenShoot screenShootView is null , no screen to capture!"

    .line 19
    .line 20
    invoke-static {v7, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    return-object v6

    .line 24
    :cond_0
    if-eqz v4, :cond_1

    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getForeColor()I

    .line 27
    .line 28
    .line 29
    move-result v8

    .line 30
    if-eq v4, v8, :cond_1

    .line 31
    .line 32
    new-instance v8, Lcom/android/launcher3/a4;

    .line 33
    .line 34
    invoke-direct {v8, v2, v4}, Lcom/android/launcher3/a4;-><init>(Lcom/android/launcher3/C2;I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2, v8}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-static {v2}, Lx1/O;->M3(Landroid/content/Context;)Z

    .line 41
    .line 42
    .line 43
    move-result v8

    .line 44
    const/high16 v9, 0x3f800000    # 1.0f

    .line 45
    .line 46
    const/4 v10, 0x0

    .line 47
    const-string v11, "com.zte.mfvkeyguard"

    .line 48
    .line 49
    if-eqz v8, :cond_4

    .line 50
    .line 51
    invoke-virtual {v11, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v8

    .line 55
    if-eqz v8, :cond_4

    .line 56
    .line 57
    if-eqz v2, :cond_4

    .line 58
    .line 59
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 60
    .line 61
    .line 62
    move-result-object v8

    .line 63
    if-eqz v8, :cond_4

    .line 64
    .line 65
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 66
    .line 67
    .line 68
    move-result-object v8

    .line 69
    iget-object v8, v8, Lcom/android/launcher3/q4;->e:Lcom/android/launcher3/W3;

    .line 70
    .line 71
    if-eqz v8, :cond_4

    .line 72
    .line 73
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 74
    .line 75
    .line 76
    move-result-object v8

    .line 77
    iget-object v8, v8, Lcom/android/launcher3/q4;->e:Lcom/android/launcher3/W3;

    .line 78
    .line 79
    invoke-virtual {v8}, Lcom/android/launcher3/W3;->n()Ljava/util/HashMap;

    .line 80
    .line 81
    .line 82
    move-result-object v8

    .line 83
    if-eqz v8, :cond_4

    .line 84
    .line 85
    invoke-virtual {v8}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 86
    .line 87
    .line 88
    move-result-object v8

    .line 89
    invoke-interface {v8}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 90
    .line 91
    .line 92
    move-result-object v8

    .line 93
    move-object v12, v6

    .line 94
    :cond_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 95
    .line 96
    .line 97
    move-result v13

    .line 98
    if-eqz v13, :cond_5

    .line 99
    .line 100
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v13

    .line 104
    check-cast v13, Ljava/util/List;

    .line 105
    .line 106
    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 107
    .line 108
    .line 109
    move-result-object v13

    .line 110
    :cond_3
    :goto_0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    .line 111
    .line 112
    .line 113
    move-result v14

    .line 114
    if-eqz v14, :cond_2

    .line 115
    .line 116
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v14

    .line 120
    check-cast v14, Landroid/view/View;

    .line 121
    .line 122
    invoke-virtual {v14}, Landroid/view/View;->getAlpha()F

    .line 123
    .line 124
    .line 125
    move-result v15

    .line 126
    invoke-static {v15, v10}, Lx1/O;->Y1(FF)Z

    .line 127
    .line 128
    .line 129
    move-result v15

    .line 130
    if-eqz v15, :cond_3

    .line 131
    .line 132
    invoke-virtual {v14, v9}, Landroid/view/View;->setAlpha(F)V

    .line 133
    .line 134
    .line 135
    sget-object v12, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_4
    move-object v12, v6

    .line 139
    :cond_5
    if-eqz v2, :cond_6

    .line 140
    .line 141
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 142
    .line 143
    .line 144
    move-result-object v8

    .line 145
    if-eqz v8, :cond_6

    .line 146
    .line 147
    const-string v8, "getViewScreenShoot, set GONE!"

    .line 148
    .line 149
    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    .line 151
    .line 152
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 153
    .line 154
    .line 155
    move-result-object v8

    .line 156
    invoke-virtual {v8}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 157
    .line 158
    .line 159
    move-result-object v8

    .line 160
    const/16 v13, 0x8

    .line 161
    .line 162
    invoke-virtual {v8, v13}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 163
    .line 164
    .line 165
    :cond_6
    instance-of v8, v3, Lcom/android/launcher3/CellLayout;

    .line 166
    .line 167
    if-eqz v8, :cond_7

    .line 168
    .line 169
    move-object v8, v3

    .line 170
    check-cast v8, Lcom/android/launcher3/CellLayout;

    .line 171
    .line 172
    invoke-virtual {v8}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 173
    .line 174
    .line 175
    move-result-object v8

    .line 176
    invoke-virtual {v8}, Landroid/view/ViewGroup;->invalidate()V

    .line 177
    .line 178
    .line 179
    :cond_7
    const/4 v8, 0x1

    .line 180
    const/4 v13, 0x0

    .line 181
    if-eqz v2, :cond_8

    .line 182
    .line 183
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 184
    .line 185
    .line 186
    move-result-object v14

    .line 187
    invoke-virtual {v14}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 188
    .line 189
    .line 190
    move-result-object v14

    .line 191
    sget-object v15, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 192
    .line 193
    if-ne v14, v15, :cond_8

    .line 194
    .line 195
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 196
    .line 197
    .line 198
    move-result-object v14

    .line 199
    sget-object v15, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 200
    .line 201
    invoke-virtual {v14, v15, v13}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 202
    .line 203
    .line 204
    move v14, v8

    .line 205
    goto :goto_1

    .line 206
    :cond_8
    move v14, v13

    .line 207
    :goto_1
    if-eqz v2, :cond_9

    .line 208
    .line 209
    invoke-static {v2}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 210
    .line 211
    .line 212
    move-result-object v15

    .line 213
    if-eqz v15, :cond_9

    .line 214
    .line 215
    invoke-static {v2}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 216
    .line 217
    .line 218
    move-result-object v15

    .line 219
    invoke-virtual {v15, v13}, Lcom/android/launcher3/a;->close(Z)V

    .line 220
    .line 221
    .line 222
    move/from16 v16, v8

    .line 223
    .line 224
    goto :goto_2

    .line 225
    :cond_9
    move-object v15, v6

    .line 226
    move/from16 v16, v13

    .line 227
    .line 228
    :goto_2
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 229
    .line 230
    .line 231
    move-result-object v17

    .line 232
    invoke-virtual/range {v17 .. v17}, Lcom/android/launcher3/resource/B;->p()Z

    .line 233
    .line 234
    .line 235
    move-result v17

    .line 236
    if-eqz v17, :cond_b

    .line 237
    .line 238
    if-eqz v2, :cond_b

    .line 239
    .line 240
    if-eqz p6, :cond_a

    .line 241
    .line 242
    new-instance v6, Lcom/android/launcher3/h4;

    .line 243
    .line 244
    invoke-direct {v6, v2}, Lcom/android/launcher3/h4;-><init>(Lcom/android/launcher3/C2;)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {v2, v6}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 248
    .line 249
    .line 250
    goto :goto_3

    .line 251
    :cond_a
    new-instance v6, Lcom/android/launcher3/i4;

    .line 252
    .line 253
    invoke-direct {v6, v2}, Lcom/android/launcher3/i4;-><init>(Lcom/android/launcher3/C2;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {v2, v6}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 257
    .line 258
    .line 259
    :cond_b
    :goto_3
    invoke-direct {v0, v2, v3}, Lcom/android/launcher3/q4;->K(Lcom/android/launcher3/C2;Landroid/view/View;)V

    .line 260
    .line 261
    .line 262
    sput-boolean v8, Lcom/android/launcher3/q4;->m:Z

    .line 263
    .line 264
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 265
    .line 266
    .line 267
    move-result-object v6

    .line 268
    invoke-virtual {v6, v3, v13}, Lcom/zte/mifavor/launcher/adapter/compat/c;->a(Landroid/view/View;Z)Landroid/graphics/Bitmap;

    .line 269
    .line 270
    .line 271
    move-result-object v3

    .line 272
    sput-boolean v13, Lcom/android/launcher3/q4;->m:Z

    .line 273
    .line 274
    if-eqz v2, :cond_c

    .line 275
    .line 276
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 277
    .line 278
    .line 279
    move-result-object v6

    .line 280
    if-eqz v6, :cond_c

    .line 281
    .line 282
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 283
    .line 284
    .line 285
    move-result-object v6

    .line 286
    invoke-virtual {v6}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 287
    .line 288
    .line 289
    move-result-object v6

    .line 290
    invoke-virtual {v6, v13}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 291
    .line 292
    .line 293
    const-string v6, "getViewScreenShoot, set VISIBLE!"

    .line 294
    .line 295
    invoke-static {v7, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    .line 297
    .line 298
    :cond_c
    invoke-static {v2}, Lx1/O;->M3(Landroid/content/Context;)Z

    .line 299
    .line 300
    .line 301
    move-result v6

    .line 302
    if-eqz v6, :cond_f

    .line 303
    .line 304
    invoke-virtual {v11, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 305
    .line 306
    .line 307
    move-result v5

    .line 308
    if-eqz v5, :cond_f

    .line 309
    .line 310
    if-eqz v2, :cond_f

    .line 311
    .line 312
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 313
    .line 314
    .line 315
    move-result-object v5

    .line 316
    if-eqz v5, :cond_f

    .line 317
    .line 318
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 319
    .line 320
    .line 321
    move-result-object v5

    .line 322
    iget-object v5, v5, Lcom/android/launcher3/q4;->e:Lcom/android/launcher3/W3;

    .line 323
    .line 324
    if-eqz v5, :cond_f

    .line 325
    .line 326
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 327
    .line 328
    .line 329
    move-result-object v5

    .line 330
    iget-object v5, v5, Lcom/android/launcher3/q4;->e:Lcom/android/launcher3/W3;

    .line 331
    .line 332
    invoke-virtual {v5}, Lcom/android/launcher3/W3;->n()Ljava/util/HashMap;

    .line 333
    .line 334
    .line 335
    move-result-object v5

    .line 336
    if-eqz v5, :cond_f

    .line 337
    .line 338
    invoke-virtual {v5}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 339
    .line 340
    .line 341
    move-result-object v5

    .line 342
    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 343
    .line 344
    .line 345
    move-result-object v5

    .line 346
    :cond_d
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 347
    .line 348
    .line 349
    move-result v6

    .line 350
    if-eqz v6, :cond_f

    .line 351
    .line 352
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 353
    .line 354
    .line 355
    move-result-object v6

    .line 356
    check-cast v6, Ljava/util/List;

    .line 357
    .line 358
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 359
    .line 360
    .line 361
    move-result-object v6

    .line 362
    :cond_e
    :goto_4
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 363
    .line 364
    .line 365
    move-result v8

    .line 366
    if-eqz v8, :cond_d

    .line 367
    .line 368
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 369
    .line 370
    .line 371
    move-result-object v8

    .line 372
    check-cast v8, Landroid/view/View;

    .line 373
    .line 374
    invoke-virtual {v8}, Landroid/view/View;->getAlpha()F

    .line 375
    .line 376
    .line 377
    move-result v11

    .line 378
    invoke-static {v11, v9}, Lx1/O;->Y1(FF)Z

    .line 379
    .line 380
    .line 381
    move-result v11

    .line 382
    if-eqz v11, :cond_e

    .line 383
    .line 384
    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    .line 385
    .line 386
    .line 387
    move-result v11

    .line 388
    if-eqz v11, :cond_e

    .line 389
    .line 390
    invoke-virtual {v8, v10}, Landroid/view/View;->setAlpha(F)V

    .line 391
    .line 392
    .line 393
    goto :goto_4

    .line 394
    :cond_f
    if-eqz v4, :cond_10

    .line 395
    .line 396
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getForeColor()I

    .line 397
    .line 398
    .line 399
    move-result v5

    .line 400
    if-eq v4, v5, :cond_10

    .line 401
    .line 402
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getForeColor()I

    .line 403
    .line 404
    .line 405
    move-result v5

    .line 406
    new-instance v6, Lcom/android/launcher3/j4;

    .line 407
    .line 408
    invoke-direct {v6, v2, v5}, Lcom/android/launcher3/j4;-><init>(Lcom/android/launcher3/C2;I)V

    .line 409
    .line 410
    .line 411
    invoke-virtual {v2, v6}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 412
    .line 413
    .line 414
    :cond_10
    if-eqz v16, :cond_11

    .line 415
    .line 416
    invoke-virtual {v15}, Lcom/android/launcher3/a;->isOpen()Z

    .line 417
    .line 418
    .line 419
    move-result v5

    .line 420
    if-nez v5, :cond_11

    .line 421
    .line 422
    invoke-virtual {v15}, Lcom/android/launcher3/folder/Folder;->animateOpen()V

    .line 423
    .line 424
    .line 425
    :cond_11
    if-eqz v14, :cond_12

    .line 426
    .line 427
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 428
    .line 429
    .line 430
    move-result-object v5

    .line 431
    invoke-virtual {v5}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 432
    .line 433
    .line 434
    move-result-object v5

    .line 435
    sget-object v6, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 436
    .line 437
    if-ne v5, v6, :cond_12

    .line 438
    .line 439
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 440
    .line 441
    .line 442
    move-result-object v5

    .line 443
    sget-object v6, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 444
    .line 445
    invoke-virtual {v5, v6, v13}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 446
    .line 447
    .line 448
    :cond_12
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 449
    .line 450
    .line 451
    move-result-object v5

    .line 452
    invoke-virtual {v5}, Lcom/android/launcher3/resource/B;->p()Z

    .line 453
    .line 454
    .line 455
    move-result v5

    .line 456
    if-eqz v5, :cond_14

    .line 457
    .line 458
    if-eqz v2, :cond_14

    .line 459
    .line 460
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 461
    .line 462
    .line 463
    move-result-object v5

    .line 464
    iget-object v5, v5, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 465
    .line 466
    iget-boolean v5, v5, Lcom/android/launcher3/r4;->l:Z

    .line 467
    .line 468
    if-eqz v5, :cond_13

    .line 469
    .line 470
    new-instance v5, Lcom/android/launcher3/k4;

    .line 471
    .line 472
    invoke-direct {v5, v2}, Lcom/android/launcher3/k4;-><init>(Lcom/android/launcher3/C2;)V

    .line 473
    .line 474
    .line 475
    invoke-virtual {v2, v5}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 476
    .line 477
    .line 478
    goto :goto_5

    .line 479
    :cond_13
    new-instance v5, Lcom/android/launcher3/l4;

    .line 480
    .line 481
    invoke-direct {v5, v2}, Lcom/android/launcher3/l4;-><init>(Lcom/android/launcher3/C2;)V

    .line 482
    .line 483
    .line 484
    invoke-virtual {v2, v5}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 485
    .line 486
    .line 487
    :cond_14
    :goto_5
    new-instance v5, Ljava/lang/StringBuilder;

    .line 488
    .line 489
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 490
    .line 491
    .line 492
    const-string v6, "getViewScreenShoot workSpaceDrawingCache :"

    .line 493
    .line 494
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 495
    .line 496
    .line 497
    if-eqz v3, :cond_15

    .line 498
    .line 499
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 500
    .line 501
    .line 502
    move-result v6

    .line 503
    if-nez v6, :cond_15

    .line 504
    .line 505
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getByteCount()I

    .line 506
    .line 507
    .line 508
    move-result v6

    .line 509
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 510
    .line 511
    .line 512
    move-result-object v6

    .line 513
    goto :goto_6

    .line 514
    :cond_15
    const/4 v6, 0x0

    .line 515
    :goto_6
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 516
    .line 517
    .line 518
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 519
    .line 520
    .line 521
    move-result-object v5

    .line 522
    invoke-static {v7, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 523
    .line 524
    .line 525
    const-string v5, "screenshot_no_dock"

    .line 526
    .line 527
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 528
    .line 529
    .line 530
    move-result v5

    .line 531
    const/4 v6, -0x1

    .line 532
    const/high16 v7, -0x5a000000

    .line 533
    .line 534
    const-string v8, "screenshot_no_dock_white"

    .line 535
    .line 536
    if-eqz v5, :cond_18

    .line 537
    .line 538
    if-ne v4, v7, :cond_17

    .line 539
    .line 540
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 541
    .line 542
    .line 543
    move-result-object v1

    .line 544
    invoke-virtual {v1}, Lcom/android/launcher3/resource/B;->p()Z

    .line 545
    .line 546
    .line 547
    move-result v1

    .line 548
    if-eqz v1, :cond_16

    .line 549
    .line 550
    if-eqz p6, :cond_16

    .line 551
    .line 552
    const-string v8, "screenshot_no_dock_black_with_clock"

    .line 553
    .line 554
    goto :goto_7

    .line 555
    :cond_16
    const-string v8, "screenshot_no_dock_black"

    .line 556
    .line 557
    goto :goto_7

    .line 558
    :cond_17
    if-ne v4, v6, :cond_1b

    .line 559
    .line 560
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 561
    .line 562
    .line 563
    move-result-object v1

    .line 564
    invoke-virtual {v1}, Lcom/android/launcher3/resource/B;->p()Z

    .line 565
    .line 566
    .line 567
    move-result v1

    .line 568
    if-eqz v1, :cond_1b

    .line 569
    .line 570
    if-eqz p6, :cond_1b

    .line 571
    .line 572
    const-string v8, "screenshot_no_dock_white_with_clock"

    .line 573
    .line 574
    goto :goto_7

    .line 575
    :cond_18
    const-string v5, "screenshot"

    .line 576
    .line 577
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 578
    .line 579
    .line 580
    move-result v1

    .line 581
    if-eqz v1, :cond_1b

    .line 582
    .line 583
    if-ne v4, v7, :cond_1a

    .line 584
    .line 585
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 586
    .line 587
    .line 588
    move-result-object v1

    .line 589
    invoke-virtual {v1}, Lcom/android/launcher3/resource/B;->p()Z

    .line 590
    .line 591
    .line 592
    move-result v1

    .line 593
    if-eqz v1, :cond_19

    .line 594
    .line 595
    if-eqz p6, :cond_19

    .line 596
    .line 597
    const-string v8, "screenshot_black_with_clock"

    .line 598
    .line 599
    goto :goto_7

    .line 600
    :cond_19
    const-string v8, "screenshot_black"

    .line 601
    .line 602
    goto :goto_7

    .line 603
    :cond_1a
    const-string v8, "screenshot_white"

    .line 604
    .line 605
    if-ne v4, v6, :cond_1b

    .line 606
    .line 607
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 608
    .line 609
    .line 610
    move-result-object v1

    .line 611
    invoke-virtual {v1}, Lcom/android/launcher3/resource/B;->p()Z

    .line 612
    .line 613
    .line 614
    move-result v1

    .line 615
    if-eqz v1, :cond_1b

    .line 616
    .line 617
    if-eqz p6, :cond_1b

    .line 618
    .line 619
    const-string v8, "screenshot_white_with_clock"

    .line 620
    .line 621
    :cond_1b
    :goto_7
    if-eqz v3, :cond_1c

    .line 622
    .line 623
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 624
    .line 625
    .line 626
    move-result v1

    .line 627
    if-nez v1, :cond_1c

    .line 628
    .line 629
    sget-object v1, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 630
    .line 631
    new-instance v4, Lcom/android/launcher3/m4;

    .line 632
    .line 633
    invoke-direct {v4, v0, v3, v2, v8}, Lcom/android/launcher3/m4;-><init>(Lcom/android/launcher3/q4;Landroid/graphics/Bitmap;Lcom/android/launcher3/C2;Ljava/lang/String;)V

    .line 634
    .line 635
    .line 636
    invoke-virtual {v1, v4}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 637
    .line 638
    .line 639
    return-object v3

    .line 640
    :cond_1c
    invoke-direct {v0, v2, v8}, Lcom/android/launcher3/q4;->h0(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 641
    .line 642
    .line 643
    move-result-object v0

    .line 644
    return-object v0
.end method

.method private synthetic b0(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p1, p2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    check-cast p2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getVisibility()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    invoke-direct {p0, p2}, Lcom/android/launcher3/q4;->N(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-direct {p0, p1}, Lcom/android/launcher3/q4;->N(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method private synthetic c0(Landroid/graphics/Bitmap;Lcom/android/launcher3/C2;Ljava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p2, p1, p3}, Lcom/android/launcher3/q4;->j0(Landroid/content/Context;Landroid/graphics/Bitmap;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private synthetic d0(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p1, Landroid/content/Intent;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-class v1, Lcom/android/launcher3/settings/SettingsActivityMFV;

    .line 10
    .line 11
    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 12
    .line 13
    .line 14
    const-string v0, "android.intent.action.VIEW"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    const/high16 v0, 0x10000000

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 25
    .line 26
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private synthetic e0(Lcom/android/launcher3/C2;I)V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/O6;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/O6;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v0, v1, v2, p2}, Lcom/android/launcher3/O6;->c(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0, p2}, Lcom/android/launcher3/menu/MenuContainer;->D(I)V

    .line 28
    .line 29
    .line 30
    :cond_0
    const/4 v0, 0x0

    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-virtual {p1, p2, v0, v1}, Lcom/android/launcher3/C2;->N3(IZZ)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/q4;->W()Lcom/android/launcher3/H5$h;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/q4;->W()Lcom/android/launcher3/H5$h;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-interface {p0, p2}, Lcom/android/launcher3/H5$h;->onForeColorChanged(I)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method private synthetic f0(Lcom/android/launcher3/util/L1;Ljava/util/Set;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 2

    .line 1
    instance-of v0, p3, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    instance-of v0, p4, Lcom/android/launcher3/BubbleTextView;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1, p3}, Lcom/android/launcher3/util/L1;->h(Lcom/android/launcher3/model/data/y;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p2, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    new-instance p1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string p2, "resetDotWhenChangeMode("

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object p2, p3, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 32
    .line 33
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p2, ")."

    .line 37
    .line 38
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-string p2, "R-Loader"

    .line 46
    .line 47
    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-object p1, p4

    .line 51
    check-cast p1, Lcom/android/launcher3/BubbleTextView;

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/android/launcher3/BubbleTextView;->C0()V

    .line 54
    .line 55
    .line 56
    :cond_0
    instance-of p1, p3, Lcom/android/launcher3/model/data/p;

    .line 57
    .line 58
    if-eqz p1, :cond_4

    .line 59
    .line 60
    instance-of p1, p4, Lcom/android/launcher3/folder/FolderIcon;

    .line 61
    .line 62
    if-eqz p1, :cond_4

    .line 63
    .line 64
    new-instance p1, Lk1/b;

    .line 65
    .line 66
    invoke-direct {p1}, Lk1/b;-><init>()V

    .line 67
    .line 68
    .line 69
    check-cast p3, Lcom/android/launcher3/model/data/p;

    .line 70
    .line 71
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/p;->x()Ljava/util/ArrayList;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    :cond_1
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 80
    .line 81
    .line 82
    move-result p3

    .line 83
    if-eqz p3, :cond_3

    .line 84
    .line 85
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p3

    .line 89
    check-cast p3, Lcom/android/launcher3/model/data/I;

    .line 90
    .line 91
    instance-of v0, p4, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 92
    .line 93
    if-eqz v0, :cond_2

    .line 94
    .line 95
    move-object v0, p4

    .line 96
    check-cast v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 97
    .line 98
    invoke-virtual {v0, p3}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->i1(Lcom/android/launcher3/model/data/y;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_1

    .line 103
    .line 104
    iget-object v0, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 105
    .line 106
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iget-object v1, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 111
    .line 112
    invoke-static {v1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v1, p3}, Lcom/android/launcher3/C2;->getDotInfoForItem(Lcom/android/launcher3/model/data/y;)Lk1/a;

    .line 117
    .line 118
    .line 119
    move-result-object p3

    .line 120
    invoke-virtual {p1, v0, p3}, Lk1/b;->i(Landroid/content/Context;Lk1/a;)V

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 125
    .line 126
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iget-object v1, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 131
    .line 132
    invoke-static {v1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {v1, p3}, Lcom/android/launcher3/C2;->getDotInfoForItem(Lcom/android/launcher3/model/data/y;)Lk1/a;

    .line 137
    .line 138
    .line 139
    move-result-object p3

    .line 140
    invoke-virtual {p1, v0, p3}, Lk1/b;->i(Landroid/content/Context;Lk1/a;)V

    .line 141
    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_3
    check-cast p4, Lcom/android/launcher3/folder/FolderIcon;

    .line 145
    .line 146
    invoke-virtual {p4, p1}, Lcom/android/launcher3/folder/FolderIcon;->setDotInfo(Lk1/b;)V

    .line 147
    .line 148
    .line 149
    :cond_4
    const/4 p0, 0x0

    .line 150
    return p0
.end method

.method private h0(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 3

    .line 1
    const-string p0, "mounted"

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 v0, 0x0

    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    invoke-static {}, Landroid/os/Environment;->isExternalStorageRemovable()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-nez p0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    :goto_0
    invoke-virtual {p1, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    sget-object p0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    new-instance p1, Ljava/io/File;

    .line 55
    .line 56
    invoke-direct {p1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    const-string v2, "R-Loader"

    .line 68
    .line 69
    if-nez v1, :cond_2

    .line 70
    .line 71
    new-instance p1, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    const-string v1, "loadScreenShootBitmapFromExternalFilesDir, screenshoot not exists! fileName:"

    .line 77
    .line 78
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string p2, " path:"

    .line 85
    .line 86
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-static {v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    return-object v0

    .line 100
    :cond_2
    :try_start_0
    new-instance p0, Ljava/io/FileInputStream;

    .line 101
    .line 102
    invoke-direct {p0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 103
    .line 104
    .line 105
    :try_start_1
    invoke-static {p0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    new-instance p2, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .line 113
    .line 114
    const-string v1, "loadScreenShootBitmapFromExternalFilesDir, screenShootBitmap:"

    .line 115
    .line 116
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getByteCount()I

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    invoke-static {v2, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 131
    .line 132
    .line 133
    invoke-static {p0}, Lcom/android/launcher3/util/v0;->a(Ljava/io/Closeable;)V

    .line 134
    .line 135
    .line 136
    return-object p1

    .line 137
    :catchall_0
    move-exception p1

    .line 138
    move-object v0, p0

    .line 139
    goto :goto_3

    .line 140
    :catch_0
    move-exception p1

    .line 141
    goto :goto_2

    .line 142
    :catchall_1
    move-exception p1

    .line 143
    goto :goto_3

    .line 144
    :catch_1
    move-exception p1

    .line 145
    move-object p0, v0

    .line 146
    :goto_2
    :try_start_2
    const-string p2, "loadScreenShootBitmapFromExternalFilesDir, Exception"

    .line 147
    .line 148
    invoke-static {v2, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 149
    .line 150
    .line 151
    invoke-static {p0}, Lcom/android/launcher3/util/v0;->a(Ljava/io/Closeable;)V

    .line 152
    .line 153
    .line 154
    return-object v0

    .line 155
    :goto_3
    invoke-static {v0}, Lcom/android/launcher3/util/v0;->a(Ljava/io/Closeable;)V

    .line 156
    .line 157
    .line 158
    throw p1
.end method

.method private j0(Landroid/content/Context;Landroid/graphics/Bitmap;Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string p0, "mounted"

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 v0, 0x0

    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    invoke-static {}, Landroid/os/Environment;->isExternalStorageRemovable()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-nez p0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    :goto_0
    invoke-virtual {p1, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    sget-object p0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    new-instance p1, Ljava/io/File;

    .line 55
    .line 56
    invoke-direct {p1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-nez v1, :cond_2

    .line 68
    .line 69
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 74
    .line 75
    .line 76
    :cond_2
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_3

    .line 81
    .line 82
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 83
    .line 84
    .line 85
    :cond_3
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    .line 86
    .line 87
    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 88
    .line 89
    .line 90
    :try_start_1
    sget-object p1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    .line 91
    .line 92
    const/16 v0, 0x46

    .line 93
    .line 94
    invoke-virtual {p2, p1, v0, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_4

    .line 99
    .line 100
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->flush()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 104
    .line 105
    .line 106
    const-string p1, "R-Loader"

    .line 107
    .line 108
    new-instance p2, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 111
    .line 112
    .line 113
    const-string v0, "loadScreenShootBitmapFromExternalFilesDir, fileName:"

    .line 114
    .line 115
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    const-string p3, " path:"

    .line 122
    .line 123
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 134
    .line 135
    .line 136
    goto :goto_2

    .line 137
    :catchall_0
    move-exception p0

    .line 138
    move-object v0, v1

    .line 139
    goto :goto_4

    .line 140
    :catch_0
    move-exception p0

    .line 141
    move-object v0, v1

    .line 142
    goto :goto_3

    .line 143
    :cond_4
    :goto_2
    invoke-static {v1}, Lcom/android/launcher3/util/v0;->a(Ljava/io/Closeable;)V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :catchall_1
    move-exception p0

    .line 148
    goto :goto_4

    .line 149
    :catch_1
    move-exception p0

    .line 150
    :goto_3
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 151
    .line 152
    .line 153
    invoke-static {v0}, Lcom/android/launcher3/util/v0;->a(Ljava/io/Closeable;)V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :goto_4
    invoke-static {v0}, Lcom/android/launcher3/util/v0;->a(Ljava/io/Closeable;)V

    .line 158
    .line 159
    .line 160
    throw p0
.end method

.method public static synthetic l(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic m(Lcom/android/launcher3/q4;Lcom/android/launcher3/C2;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/q4;->e0(Lcom/android/launcher3/C2;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Lcom/android/launcher3/C2;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/O6;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/O6;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/O6;->a(Lcom/android/launcher3/Workspace;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic o(Lcom/android/launcher3/P2;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->j0()Lcom/android/launcher3/c1;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/c1;->E()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic p(Lcom/android/launcher3/C2;I)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/O6;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/O6;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, v1, p0, p1}, Lcom/android/launcher3/O6;->c(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic q(Ljava/util/Map;Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    iget v0, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic r(Lcom/android/launcher3/C2;I)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/O6;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/O6;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, v1, p0, p1}, Lcom/android/launcher3/O6;->c(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic s(Lcom/android/launcher3/C2;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/O6;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/O6;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/O6;->a(Lcom/android/launcher3/Workspace;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic t(Lcom/android/launcher3/P2;)V
    .locals 3

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lx1/O;->c:Landroid/net/Uri;

    .line 10
    .line 11
    const-string v1, "themeChange"

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {p0, v0, v1, v2, v2}, Landroid/content/ContentResolver;->call(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catch_0
    move-exception p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic u(Lcom/android/launcher3/C2;I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getSystemUiController()Lcom/android/launcher3/util/E2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getForeColor()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/util/E2;->e(II)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/C2;->N3(IZZ)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic v(Lcom/android/launcher3/C2;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/O6;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/O6;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/O6;->a(Lcom/android/launcher3/Workspace;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic w(Lcom/android/launcher3/q4;Lcom/android/launcher3/util/L1;Ljava/util/Set;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/q4;->f0(Lcom/android/launcher3/util/L1;Ljava/util/Set;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic x(Lcom/android/launcher3/q4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/q4;->d0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y(Lcom/android/launcher3/C2;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/O6;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/O6;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/O6;->a(Lcom/android/launcher3/Workspace;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic z(Lcom/android/launcher3/q4;Landroid/graphics/Bitmap;Lcom/android/launcher3/C2;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/q4;->c0(Landroid/graphics/Bitmap;Lcom/android/launcher3/C2;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public B(Ljava/util/ArrayList;Landroid/os/UserHandle;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;",
            "Landroid/os/UserHandle;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->t3(Ljava/util/ArrayList;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public C(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->y3(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public D()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q4;->k:Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;->s()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method E(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    sget-object p0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 5
    .line 6
    iget v0, p0, Lcom/android/launcher3/V3;->a:I

    .line 7
    .line 8
    const-string v1, "launcher.state"

    .line 9
    .line 10
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget p0, p0, Lcom/android/launcher3/V3;->a:I

    .line 15
    .line 16
    if-ne v0, p0, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    invoke-virtual {p1, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    const-string p0, "R-Loader"

    .line 23
    .line 24
    const-string p1, "checkRestoreState: need to go to normal"

    .line 25
    .line 26
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public G()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/q4;->h:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/MFVDockExpandSupport;->j()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/q4;->h:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 10
    .line 11
    return-void
.end method

.method public H()V
    .locals 2

    .line 1
    const-string v0, "R-Loader"

    .line 2
    .line 3
    const-string v1, "doIconChangePreJob start "

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/q4;->J()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public I()V
    .locals 5

    .line 1
    const-string v0, "R-Loader"

    .line 2
    .line 3
    const-string v1, "doThemeChangePostJob start "

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 9
    .line 10
    check-cast v0, Lcom/android/launcher3/C2;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    new-instance v3, Lx1/x;

    .line 28
    .line 29
    new-instance v4, Lcom/android/launcher3/e4;

    .line 30
    .line 31
    invoke-direct {v4, v0}, Lcom/android/launcher3/e4;-><init>(Lcom/android/launcher3/P2;)V

    .line 32
    .line 33
    .line 34
    invoke-direct {v3, v4, v1}, Lx1/x;-><init>(Ljava/lang/Runnable;Z)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2, v3}, Lcom/android/launcher3/D3;->U0(Lx1/x;)V

    .line 38
    .line 39
    .line 40
    iget-boolean v2, p0, Lcom/android/launcher3/q4;->a:Z

    .line 41
    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->Y0()V

    .line 49
    .line 50
    .line 51
    :cond_0
    iput-boolean v1, p0, Lcom/android/launcher3/q4;->b:Z

    .line 52
    .line 53
    iput-boolean v1, p0, Lcom/android/launcher3/q4;->a:Z

    .line 54
    .line 55
    iput-boolean v1, p0, Lcom/android/launcher3/q4;->d:Z

    .line 56
    .line 57
    return-void
.end method

.method public J()V
    .locals 2

    .line 1
    const-string v0, "R-Loader"

    .line 2
    .line 3
    const-string v1, "doThemeChangePreJob start "

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 9
    .line 10
    check-cast p0, Lcom/android/launcher3/C2;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ls1/P;->v()Ls1/b;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ls1/b;->g0()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ls1/b;->close()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ls1/P;->s0()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->g()Ls1/V;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ls1/T;->c()V

    .line 46
    .line 47
    .line 48
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 49
    .line 50
    new-instance v1, Lcom/android/launcher3/d4;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Lcom/android/launcher3/d4;-><init>(Lcom/android/launcher3/P2;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public L(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/os/UserHandle;",
            ")",
            "Ljava/util/Collection<",
            "+",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/util/HashSet;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance p0, Ljava/util/HashSet;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-direct {p0, v0}, Ljava/util/HashSet;-><init>(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object p1, p1, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 27
    .line 28
    invoke-interface {p1}, Ljava/lang/Iterable;->spliterator()Ljava/util/Spliterator;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const/4 v0, 0x0

    .line 33
    invoke-static {p1, v0}, Ljava/util/stream/StreamSupport;->stream(Ljava/util/Spliterator;Z)Ljava/util/stream/Stream;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p0, p2}, Lcom/android/launcher3/util/P0;->t(Ljava/util/Set;Landroid/os/UserHandle;)Ljava/util/function/Predicate;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-interface {p1, p0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Ljava/util/Collection;

    .line 54
    .line 55
    return-object p0
.end method

.method public O()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/q4;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public P()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/q4;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public R()Lcom/android/launcher3/menu/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q4;->j:Lcom/android/launcher3/menu/c;

    .line 2
    .line 3
    return-object p0
.end method

.method public S()Lcom/android/launcher3/W3;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q4;->e:Lcom/android/launcher3/W3;

    .line 2
    .line 3
    return-object p0
.end method

.method public T()Lcom/android/launcher3/MFVDockExpandSupport;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q4;->h:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 2
    .line 3
    return-object p0
.end method

.method public V()Lx1/Z;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q4;->f:Lx1/Z;

    .line 2
    .line 3
    return-object p0
.end method

.method W()Lcom/android/launcher3/H5$h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q4;->i:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/launcher3/H5$h;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public X()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/q4;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public Z(Lcom/android/launcher3/q4$a;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q4;->j:Lcom/android/launcher3/menu/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/c;->q(Lcom/android/launcher3/q4$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public a()Landroid/graphics/Rect;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public a0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q4;->j:Lcom/android/launcher3/menu/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/menu/c;->s()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public b(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onDefaultWallpaperStateChanged is default: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "R-Loader"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getIsDefaultWallpaper()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-ne v0, p1, :cond_0

    .line 34
    .line 35
    const-string p0, "onDefaultWallpaperStateChanged default wallpaper state is not change,do nothing!"

    .line 36
    .line 37
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/v;->setIsDefaultWallpaper(Z)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->g4()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public c(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onIconChanged,onIconCacheChanged start isIconLoaded: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "R-Loader"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Lcom/android/launcher3/q4;->b:Z

    .line 25
    .line 26
    iput-boolean p1, p0, Lcom/android/launcher3/q4;->c:Z

    .line 27
    .line 28
    return-void
.end method

.method public d()Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    new-instance p0, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    if-eqz v2, :cond_2

    .line 15
    .line 16
    monitor-enter v2

    .line 17
    :try_start_0
    iget-object v3, v2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 18
    .line 19
    invoke-virtual {v3}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    new-instance v4, Lcom/android/launcher3/f4;

    .line 24
    .line 25
    invoke-direct {v4}, Lcom/android/launcher3/f4;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-interface {v3, v4}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    new-instance v4, Lcom/android/launcher3/g4;

    .line 33
    .line 34
    invoke-direct {v4, p0}, Lcom/android/launcher3/g4;-><init>(Ljava/util/Map;)V

    .line 35
    .line 36
    .line 37
    invoke-interface {v3, v4}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 38
    .line 39
    .line 40
    iget-object v3, v2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 41
    .line 42
    invoke-virtual {v3}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-eqz v4, :cond_1

    .line 51
    .line 52
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    check-cast v4, Lcom/android/launcher3/model/data/y;

    .line 57
    .line 58
    iget v5, v4, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 59
    .line 60
    const/4 v6, 0x1

    .line 61
    if-ne v5, v6, :cond_0

    .line 62
    .line 63
    iget v5, v4, Lcom/android/launcher3/model/data/y;->id:I

    .line 64
    .line 65
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    iget-object v4, v4, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 70
    .line 71
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-interface {p0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :catchall_0
    move-exception p0

    .line 80
    goto :goto_1

    .line 81
    :cond_1
    monitor-exit v2

    .line 82
    goto :goto_2

    .line 83
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    throw p0

    .line 85
    :cond_2
    :goto_2
    const-string v2, "R-Loader"

    .line 86
    .line 87
    new-instance v3, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 90
    .line 91
    .line 92
    const-string v4, "getFolderInfos time is "

    .line 93
    .line 94
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 98
    .line 99
    .line 100
    move-result-wide v4

    .line 101
    sub-long/2addr v4, v0

    .line 102
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string v0, " size "

    .line 106
    .line 107
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    return-object p0
.end method

.method public e(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onThemeChanged,onIconCacheChanged start isIconLoaded: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "R-Loader"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Lcom/android/launcher3/q4;->a:Z

    .line 25
    .line 26
    iput-boolean p1, p0, Lcom/android/launcher3/q4;->c:Z

    .line 27
    .line 28
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    const-string v0, "R-Loader"

    .line 2
    .line 3
    const-string v1, "onFontChanged: start"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/android/launcher3/q4;->d:Z

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 12
    .line 13
    check-cast p0, Lcom/android/launcher3/C2;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "com.android.calendar"

    .line 28
    .line 29
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/D3;->z0(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public g(Ljava/lang/String;ILjava/lang/String;Z)Landroid/graphics/Bitmap;
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v3

    .line 7
    const-string v0, "screenshot"

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const-string v1, "R-Loader"

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    sget-object v0, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 19
    .line 20
    invoke-interface {v3, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 27
    .line 28
    invoke-interface {v3, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 35
    .line 36
    invoke-interface {v3, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_0

    .line 41
    .line 42
    const-string p0, "getScreenShoot in error status"

    .line 43
    .line 44
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    return-object v2

    .line 48
    :cond_0
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getRootView()Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    move-object v1, p0

    .line 57
    move-object v2, p1

    .line 58
    move v5, p2

    .line 59
    move-object v6, p3

    .line 60
    move v7, p4

    .line 61
    invoke-direct/range {v1 .. v7}, Lcom/android/launcher3/q4;->Y(Ljava/lang/String;Lcom/android/launcher3/C2;Landroid/view/View;ILjava/lang/String;Z)Landroid/graphics/Bitmap;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_1
    move-object v5, v1

    .line 67
    move-object v1, p0

    .line 68
    move-object p0, v5

    .line 69
    move-object v5, v2

    .line 70
    move-object v2, p1

    .line 71
    move-object p1, v5

    .line 72
    move v5, p2

    .line 73
    move-object v6, p3

    .line 74
    move v7, p4

    .line 75
    const-string p2, "screenshot_no_dock"

    .line 76
    .line 77
    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    if-eqz p2, :cond_2

    .line 82
    .line 83
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    invoke-direct/range {v1 .. v7}, Lcom/android/launcher3/q4;->Y(Ljava/lang/String;Lcom/android/launcher3/C2;Landroid/view/View;ILjava/lang/String;Z)Landroid/graphics/Bitmap;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    return-object p0

    .line 92
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    const-string p3, "getScreenShoot type is error. type:"

    .line 98
    .line 99
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-static {p0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    return-object p1
.end method

.method public g0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const v1, 0x7f14034e

    .line 12
    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;->X(Landroid/view/View;II)Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Lcom/android/launcher3/n4;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Lcom/android/launcher3/n4;-><init>(Lcom/android/launcher3/q4;)V

    .line 22
    .line 23
    .line 24
    const v2, 0x7f14034f

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;->Z(ILandroid/view/View$OnClickListener;)Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/android/launcher3/q4;->k:Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->C()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const v1, 0x7f081988

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/android/launcher3/q4;->k:Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;->O()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public h()Lcom/android/launcher3/views/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Ljava/lang/String;Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/os/UserHandle;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/d;",
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
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    goto/16 :goto_1

    .line 13
    .line 14
    :cond_0
    if-nez p3, :cond_1

    .line 15
    .line 16
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->d0()Ljava/util/ArrayList;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    :cond_2
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_6

    .line 43
    .line 44
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Lcom/android/launcher3/model/data/d;

    .line 49
    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/d;->getTargetComponent()Landroid/content/ComponentName;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    if-nez v2, :cond_3

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/d;->getTargetComponent()Landroid/content/ComponentName;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-eqz v2, :cond_2

    .line 72
    .line 73
    iget-object v2, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 74
    .line 75
    invoke-virtual {p3, v2}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-nez v2, :cond_4

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_4
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-nez v2, :cond_5

    .line 87
    .line 88
    new-instance v2, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v3, "."

    .line 97
    .line 98
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    if-nez v2, :cond_5

    .line 110
    .line 111
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/d;->getTargetComponent()Landroid/content/ComponentName;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-virtual {v2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-eqz v2, :cond_2

    .line 124
    .line 125
    :cond_5
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_6
    :goto_1
    return-object v0
.end method

.method public i0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getPopupDataProvider()Lcom/android/launcher3/popup/n;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/popup/n;->i()Ljava/util/Set;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Lcom/android/launcher3/D3;->j0()Lcom/android/launcher3/c1;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Lcom/android/launcher3/c1;->p()Ljava/util/Set;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    new-instance v1, Lcom/android/launcher3/util/L1;

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    invoke-direct {v1, v2, v2}, Lcom/android/launcher3/util/L1;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 43
    .line 44
    invoke-static {v2}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    new-instance v3, Lcom/android/launcher3/b4;

    .line 53
    .line 54
    invoke-direct {v3, p0, v1, v0}, Lcom/android/launcher3/b4;-><init>(Lcom/android/launcher3/q4;Lcom/android/launcher3/util/L1;Ljava/util/Set;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2, v3}, Lcom/android/launcher3/Workspace;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public j(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onStatusForeColorChanged color is "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "R-Loader"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Lcom/android/launcher3/o4;

    .line 30
    .line 31
    invoke-direct {v1, v0, p1}, Lcom/android/launcher3/o4;-><init>(Lcom/android/launcher3/C2;I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v1}, Lcom/android/launcher3/q4;->j(Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public k0(Lcom/android/launcher3/H5$h;)V
    .locals 1

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/launcher3/q4;->i:Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->clear()V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/android/launcher3/q4;->i:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    :cond_0
    return-void

    .line 14
    :cond_1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 15
    .line 16
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/android/launcher3/q4;->i:Ljava/lang/ref/WeakReference;

    .line 20
    .line 21
    return-void
.end method

.method public onForeColorChanged(I)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onForeColorChanged color is "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "R-Loader"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/q4;->g:Lcom/android/launcher3/views/k;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getForeColor()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-ne v2, p1, :cond_0

    .line 38
    .line 39
    const-string p0, "onForeColorChanged color not change,do nothing!"

    .line 40
    .line 41
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    if-nez p1, :cond_1

    .line 46
    .line 47
    const/4 p1, -0x1

    .line 48
    :cond_1
    invoke-virtual {v0, p1}, Lcom/android/launcher3/v;->updateForeColor(I)V

    .line 49
    .line 50
    .line 51
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Lcom/android/launcher3/resource/B;->p()Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->g4()V

    .line 62
    .line 63
    .line 64
    :cond_2
    new-instance v1, Lcom/android/launcher3/p4;

    .line 65
    .line 66
    invoke-direct {v1, p0, v0, p1}, Lcom/android/launcher3/p4;-><init>(Lcom/android/launcher3/q4;Lcom/android/launcher3/C2;I)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v1}, Lcom/android/launcher3/q4;->j(Ljava/lang/Runnable;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method
