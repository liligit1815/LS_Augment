.class public final Lcom/android/launcher3/taskbar/N2;
.super Ljava/lang/Object;
.source "TaskbarInsetsController.kt"

# interfaces
.implements Lcom/android/launcher3/taskbar/R1$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/N2$a;,
        Lcom/android/launcher3/taskbar/N2$b;
    }
.end annotation


# static fields
.field public static final p:Lcom/android/launcher3/taskbar/N2$a;


# instance fields
.field private final g:Lcom/android/launcher3/taskbar/I1;

.field private final h:I

.field private final i:Landroid/graphics/Region;

.field private final j:Landroid/os/IBinder;

.field private final k:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "Lcom/android/launcher3/h0;",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field

.field private final l:Lcom/android/internal/policy/GestureNavigationSettingsObserver;

.field private final m:Lcom/android/launcher3/taskbar/N2$b;

.field private n:Lcom/android/launcher3/taskbar/R1;

.field private o:Landroid/view/WindowManager$LayoutParams;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/N2$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/N2$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/taskbar/N2;->p:Lcom/android/launcher3/taskbar/N2$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;)V
    .locals 4

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const v1, 0x7f070b9d

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/android/launcher3/taskbar/N2;->h:I

    .line 23
    .line 24
    new-instance v0, Landroid/graphics/Region;

    .line 25
    .line 26
    invoke-direct {v0}, Landroid/graphics/Region;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/android/launcher3/taskbar/N2;->i:Landroid/graphics/Region;

    .line 30
    .line 31
    new-instance v0, Landroid/os/Binder;

    .line 32
    .line 33
    invoke-direct {v0}, Landroid/os/Binder;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/android/launcher3/taskbar/N2;->j:Landroid/os/IBinder;

    .line 37
    .line 38
    new-instance v0, Lcom/android/launcher3/taskbar/K2;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/K2;-><init>(Lcom/android/launcher3/taskbar/N2;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/android/launcher3/taskbar/N2;->k:Lu4/l;

    .line 44
    .line 45
    new-instance v0, Lcom/android/internal/policy/GestureNavigationSettingsObserver;

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getMainThreadHandler()Landroid/os/Handler;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    sget-object v2, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 52
    .line 53
    invoke-virtual {v2}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    new-instance v3, Lcom/android/launcher3/taskbar/f1;

    .line 58
    .line 59
    invoke-direct {v3, p0}, Lcom/android/launcher3/taskbar/f1;-><init>(Lcom/android/launcher3/taskbar/N2;)V

    .line 60
    .line 61
    .line 62
    invoke-direct {v0, v1, v2, p1, v3}, Lcom/android/internal/policy/GestureNavigationSettingsObserver;-><init>(Landroid/os/Handler;Landroid/os/Handler;Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Lcom/android/launcher3/taskbar/N2;->l:Lcom/android/internal/policy/GestureNavigationSettingsObserver;

    .line 66
    .line 67
    new-instance p1, Lcom/android/launcher3/taskbar/N2$b;

    .line 68
    .line 69
    invoke-direct {p1}, Lcom/android/launcher3/taskbar/N2$b;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object p1, p0, Lcom/android/launcher3/taskbar/N2;->m:Lcom/android/launcher3/taskbar/N2$b;

    .line 73
    .line 74
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/N2;Lcom/android/launcher3/h0;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/N2;->e(Lcom/android/launcher3/taskbar/N2;Lcom/android/launcher3/h0;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lu4/l;Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/N2;->o(Lu4/l;Lcom/android/launcher3/h0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lu4/l;Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/N2;->m(Lu4/l;Lcom/android/launcher3/h0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final e(Lcom/android/launcher3/taskbar/N2;Lcom/android/launcher3/h0;)Lh4/t;
    .locals 1

    .line 1
    const-string v0, "<unused var>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/N2;->p()V

    .line 7
    .line 8
    .line 9
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 10
    .line 11
    return-object p0
.end method

.method private final g(II)Landroid/graphics/Insets;
    .locals 3

    .line 1
    and-int/lit8 p0, p2, 0x50

    .line 2
    .line 3
    const-string v0, "of(...)"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/16 v2, 0x50

    .line 7
    .line 8
    if-ne p0, v2, :cond_0

    .line 9
    .line 10
    invoke-static {v1, v1, v1, p1}, Landroid/graphics/Insets;->of(IIII)Landroid/graphics/Insets;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const p0, 0x800003

    .line 19
    .line 20
    .line 21
    and-int/2addr p2, p0

    .line 22
    if-ne p2, p0, :cond_1

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move p0, v1

    .line 27
    :goto_0
    if-eqz p0, :cond_2

    .line 28
    .line 29
    move p2, p1

    .line 30
    goto :goto_1

    .line 31
    :cond_2
    move p2, v1

    .line 32
    :goto_1
    if-eqz p0, :cond_3

    .line 33
    .line 34
    move p1, v1

    .line 35
    :cond_3
    invoke-static {p2, v1, p1, v1}, Landroid/graphics/Insets;->of(IIII)Landroid/graphics/Insets;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-object p0
.end method

.method private final h(III)Landroid/graphics/Insets;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ContextThemeWrapper;->getDisplay()Landroid/view/Display;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/view/Display;->getCutout()Landroid/view/DisplayCutout;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/N2;->g(II)Landroid/graphics/Insets;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    new-instance v2, Landroid/view/DisplayInfo;

    .line 23
    .line 24
    invoke-direct {v2}, Landroid/view/DisplayInfo;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/view/Display;->getDisplayInfo(Landroid/view/DisplayInfo;)Z

    .line 28
    .line 29
    .line 30
    iget v0, v2, Landroid/view/DisplayInfo;->logicalWidth:I

    .line 31
    .line 32
    iget v2, v2, Landroid/view/DisplayInfo;->logicalHeight:I

    .line 33
    .line 34
    invoke-virtual {v1, v0, v2, p0, p3}, Landroid/view/DisplayCutout;->getRotated(IIII)Landroid/view/DisplayCutout;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    and-int/lit8 p3, p2, 0x50

    .line 39
    .line 40
    const-string v0, "of(...)"

    .line 41
    .line 42
    const/16 v1, 0x50

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    if-ne p3, v1, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/DisplayCutout;->getSafeInsetBottom()I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    invoke-static {v2, v2, v2, p0}, Landroid/graphics/Insets;->of(IIII)Landroid/graphics/Insets;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_1
    const p3, 0x800003

    .line 64
    .line 65
    .line 66
    and-int/2addr p2, p3

    .line 67
    if-ne p2, p3, :cond_2

    .line 68
    .line 69
    const/4 p2, 0x1

    .line 70
    goto :goto_0

    .line 71
    :cond_2
    move p2, v2

    .line 72
    :goto_0
    if-eqz p2, :cond_3

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/view/DisplayCutout;->getSafeInsetLeft()I

    .line 75
    .line 76
    .line 77
    move-result p3

    .line 78
    invoke-static {p1, p3}, Ljava/lang/Math;->max(II)I

    .line 79
    .line 80
    .line 81
    move-result p3

    .line 82
    goto :goto_1

    .line 83
    :cond_3
    move p3, v2

    .line 84
    :goto_1
    if-eqz p2, :cond_4

    .line 85
    .line 86
    move p0, v2

    .line 87
    goto :goto_2

    .line 88
    :cond_4
    invoke-virtual {p0}, Landroid/view/DisplayCutout;->getSafeInsetRight()I

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    :goto_2
    invoke-static {p3, v2, p0, v2}, Landroid/graphics/Insets;->of(IIII)Landroid/graphics/Insets;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-object p0
.end method

.method private final i(I)[Landroid/view/InsetsFrameProvider;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->R0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const/16 v0, 0x9

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v0, v1

    .line 14
    :goto_0
    or-int/2addr p1, v0

    .line 15
    new-instance v0, Landroid/view/InsetsFrameProvider;

    .line 16
    .line 17
    iget-object v2, p0, Lcom/android/launcher3/taskbar/N2;->j:Landroid/os/IBinder;

    .line 18
    .line 19
    invoke-static {}, Landroid/view/WindowInsets$Type;->navigationBars()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-direct {v0, v2, v1, v3}, Landroid/view/InsetsFrameProvider;-><init>(Ljava/lang/Object;II)V

    .line 24
    .line 25
    .line 26
    const/16 v2, 0xb

    .line 27
    .line 28
    invoke-virtual {v0, p1, v2}, Landroid/view/InsetsFrameProvider;->setFlags(II)Landroid/view/InsetsFrameProvider;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance v0, Landroid/view/InsetsFrameProvider;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/android/launcher3/taskbar/N2;->j:Landroid/os/IBinder;

    .line 35
    .line 36
    invoke-static {}, Landroid/view/WindowInsets$Type;->tappableElement()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    invoke-direct {v0, v2, v1, v3}, Landroid/view/InsetsFrameProvider;-><init>(Ljava/lang/Object;II)V

    .line 41
    .line 42
    .line 43
    new-instance v2, Landroid/view/InsetsFrameProvider;

    .line 44
    .line 45
    iget-object v3, p0, Lcom/android/launcher3/taskbar/N2;->j:Landroid/os/IBinder;

    .line 46
    .line 47
    invoke-static {}, Landroid/view/WindowInsets$Type;->mandatorySystemGestures()I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    invoke-direct {v2, v3, v1, v4}, Landroid/view/InsetsFrameProvider;-><init>(Ljava/lang/Object;II)V

    .line 52
    .line 53
    .line 54
    new-instance v3, Landroid/view/InsetsFrameProvider;

    .line 55
    .line 56
    iget-object v4, p0, Lcom/android/launcher3/taskbar/N2;->j:Landroid/os/IBinder;

    .line 57
    .line 58
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemGestures()I

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    invoke-direct {v3, v4, v1, v5}, Landroid/view/InsetsFrameProvider;-><init>(Ljava/lang/Object;II)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v3, v1}, Landroid/view/InsetsFrameProvider;->setSource(I)Landroid/view/InsetsFrameProvider;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    new-instance v4, Landroid/view/InsetsFrameProvider;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/android/launcher3/taskbar/N2;->j:Landroid/os/IBinder;

    .line 72
    .line 73
    const/4 v5, 0x1

    .line 74
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemGestures()I

    .line 75
    .line 76
    .line 77
    move-result v6

    .line 78
    invoke-direct {v4, p0, v5, v6}, Landroid/view/InsetsFrameProvider;-><init>(Ljava/lang/Object;II)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v4, v1}, Landroid/view/InsetsFrameProvider;->setSource(I)Landroid/view/InsetsFrameProvider;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    filled-new-array {p1, v0, v2, v3, p0}, [Landroid/view/InsetsFrameProvider;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    return-object p0
.end method

.method private final j([Landroid/view/InsetsFrameProvider;I)[Landroid/view/InsetsFrameProvider;
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->R0()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    or-int/2addr p0, p2

    .line 8
    array-length p2, p1

    .line 9
    const/4 v0, 0x0

    .line 10
    :goto_0
    if-ge v0, p2, :cond_1

    .line 11
    .line 12
    aget-object v1, p1, v0

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/view/InsetsFrameProvider;->getType()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-static {}, Landroid/view/WindowInsets$Type;->navigationBars()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-ne v2, v3, :cond_0

    .line 23
    .line 24
    const/4 v2, 0x3

    .line 25
    invoke-virtual {v1, p0, v2}, Landroid/view/InsetsFrameProvider;->setFlags(II)Landroid/view/InsetsFrameProvider;

    .line 26
    .line 27
    .line 28
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    return-object p1
.end method

.method private static final m(Lu4/l;Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final o(Lu4/l;Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final q(Landroid/view/InsetsFrameProvider;II)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "controllers"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/a4;->O()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v3, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 19
    .line 20
    if-nez v3, :cond_1

    .line 21
    .line 22
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    move-object v3, v1

    .line 26
    :cond_1
    iget-object v3, v3, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 27
    .line 28
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/a4;->S()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    iget-object v4, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 33
    .line 34
    invoke-virtual {v4}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-virtual {p1}, Landroid/view/InsetsFrameProvider;->getType()I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    invoke-static {}, Landroid/view/WindowInsets$Type;->navigationBars()I

    .line 43
    .line 44
    .line 45
    move-result v6

    .line 46
    const/4 v7, 0x0

    .line 47
    if-ne v5, v6, :cond_2

    .line 48
    .line 49
    invoke-direct {p0, v0, p2, p3}, Lcom/android/launcher3/taskbar/N2;->h(III)Landroid/graphics/Insets;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    invoke-virtual {p1, p3}, Landroid/view/InsetsFrameProvider;->setInsetsSize(Landroid/graphics/Insets;)Landroid/view/InsetsFrameProvider;

    .line 54
    .line 55
    .line 56
    goto/16 :goto_3

    .line 57
    .line 58
    :cond_2
    invoke-virtual {p1}, Landroid/view/InsetsFrameProvider;->getType()I

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    invoke-static {}, Landroid/view/WindowInsets$Type;->mandatorySystemGestures()I

    .line 63
    .line 64
    .line 65
    move-result v6

    .line 66
    if-ne v5, v6, :cond_5

    .line 67
    .line 68
    iget-object v4, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 69
    .line 70
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    if-eqz v4, :cond_3

    .line 75
    .line 76
    invoke-direct {p0, v0, p2, p3}, Lcom/android/launcher3/taskbar/N2;->h(III)Landroid/graphics/Insets;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    invoke-virtual {p1, p3}, Landroid/view/InsetsFrameProvider;->setInsetsSize(Landroid/graphics/Insets;)Landroid/view/InsetsFrameProvider;

    .line 81
    .line 82
    .line 83
    goto/16 :goto_3

    .line 84
    .line 85
    :cond_3
    iget-object v4, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 86
    .line 87
    invoke-virtual {v4}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    const-string v5, "navigation_bar_gesture_height"

    .line 92
    .line 93
    invoke-static {v5, v4}, Lc2/a;->d(Ljava/lang/String;Landroid/content/res/Resources;)I

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    iget-object v5, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 98
    .line 99
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 100
    .line 101
    .line 102
    move-result-object v5

    .line 103
    iget-boolean v5, v5, Lcom/android/launcher3/h0;->p3:Z

    .line 104
    .line 105
    if-eqz v5, :cond_4

    .line 106
    .line 107
    iget-object v5, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 108
    .line 109
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 110
    .line 111
    .line 112
    move-result v5

    .line 113
    if-nez v5, :cond_4

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_4
    move v0, v4

    .line 117
    :goto_0
    invoke-direct {p0, v0, p2, p3}, Lcom/android/launcher3/taskbar/N2;->h(III)Landroid/graphics/Insets;

    .line 118
    .line 119
    .line 120
    move-result-object p3

    .line 121
    invoke-virtual {p1, p3}, Landroid/view/InsetsFrameProvider;->setInsetsSize(Landroid/graphics/Insets;)Landroid/view/InsetsFrameProvider;

    .line 122
    .line 123
    .line 124
    goto :goto_3

    .line 125
    :cond_5
    invoke-virtual {p1}, Landroid/view/InsetsFrameProvider;->getType()I

    .line 126
    .line 127
    .line 128
    move-result p3

    .line 129
    invoke-static {}, Landroid/view/WindowInsets$Type;->tappableElement()I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-ne p3, v0, :cond_6

    .line 134
    .line 135
    invoke-direct {p0, v3, p2}, Lcom/android/launcher3/taskbar/N2;->g(II)Landroid/graphics/Insets;

    .line 136
    .line 137
    .line 138
    move-result-object p3

    .line 139
    invoke-virtual {p1, p3}, Landroid/view/InsetsFrameProvider;->setInsetsSize(Landroid/graphics/Insets;)Landroid/view/InsetsFrameProvider;

    .line 140
    .line 141
    .line 142
    goto :goto_3

    .line 143
    :cond_6
    invoke-virtual {p1}, Landroid/view/InsetsFrameProvider;->getType()I

    .line 144
    .line 145
    .line 146
    move-result p3

    .line 147
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemGestures()I

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-ne p3, v0, :cond_8

    .line 152
    .line 153
    invoke-virtual {p1}, Landroid/view/InsetsFrameProvider;->getIndex()I

    .line 154
    .line 155
    .line 156
    move-result p3

    .line 157
    if-nez p3, :cond_8

    .line 158
    .line 159
    iget-object p3, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 160
    .line 161
    invoke-virtual {p3}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    .line 162
    .line 163
    .line 164
    move-result p3

    .line 165
    if-eqz p3, :cond_7

    .line 166
    .line 167
    move p3, v7

    .line 168
    goto :goto_1

    .line 169
    :cond_7
    iget-object p3, p0, Lcom/android/launcher3/taskbar/N2;->l:Lcom/android/internal/policy/GestureNavigationSettingsObserver;

    .line 170
    .line 171
    invoke-virtual {p3, v4}, Lcom/android/internal/policy/GestureNavigationSettingsObserver;->getLeftSensitivityForCallingUser(Landroid/content/res/Resources;)I

    .line 172
    .line 173
    .line 174
    move-result p3

    .line 175
    :goto_1
    invoke-static {p3, v7, v7, v7}, Landroid/graphics/Insets;->of(IIII)Landroid/graphics/Insets;

    .line 176
    .line 177
    .line 178
    move-result-object p3

    .line 179
    invoke-virtual {p1, p3}, Landroid/view/InsetsFrameProvider;->setInsetsSize(Landroid/graphics/Insets;)Landroid/view/InsetsFrameProvider;

    .line 180
    .line 181
    .line 182
    goto :goto_3

    .line 183
    :cond_8
    invoke-virtual {p1}, Landroid/view/InsetsFrameProvider;->getType()I

    .line 184
    .line 185
    .line 186
    move-result p3

    .line 187
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemGestures()I

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    if-ne p3, v0, :cond_a

    .line 192
    .line 193
    invoke-virtual {p1}, Landroid/view/InsetsFrameProvider;->getIndex()I

    .line 194
    .line 195
    .line 196
    move-result p3

    .line 197
    const/4 v0, 0x1

    .line 198
    if-ne p3, v0, :cond_a

    .line 199
    .line 200
    iget-object p3, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 201
    .line 202
    invoke-virtual {p3}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    .line 203
    .line 204
    .line 205
    move-result p3

    .line 206
    if-eqz p3, :cond_9

    .line 207
    .line 208
    move p3, v7

    .line 209
    goto :goto_2

    .line 210
    :cond_9
    iget-object p3, p0, Lcom/android/launcher3/taskbar/N2;->l:Lcom/android/internal/policy/GestureNavigationSettingsObserver;

    .line 211
    .line 212
    invoke-virtual {p3, v4}, Lcom/android/internal/policy/GestureNavigationSettingsObserver;->getRightSensitivityForCallingUser(Landroid/content/res/Resources;)I

    .line 213
    .line 214
    .line 215
    move-result p3

    .line 216
    :goto_2
    invoke-static {v7, v7, p3, v7}, Landroid/graphics/Insets;->of(IIII)Landroid/graphics/Insets;

    .line 217
    .line 218
    .line 219
    move-result-object p3

    .line 220
    invoke-virtual {p1, p3}, Landroid/view/InsetsFrameProvider;->setInsetsSize(Landroid/graphics/Insets;)Landroid/view/InsetsFrameProvider;

    .line 221
    .line 222
    .line 223
    :cond_a
    :goto_3
    iget-object p3, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 224
    .line 225
    invoke-virtual {p3}, Lcom/android/launcher3/taskbar/I1;->R0()Z

    .line 226
    .line 227
    .line 228
    move-result p3

    .line 229
    if-eqz p3, :cond_c

    .line 230
    .line 231
    iget-object p3, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 232
    .line 233
    if-nez p3, :cond_b

    .line 234
    .line 235
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    goto :goto_4

    .line 239
    :cond_b
    move-object v1, p3

    .line 240
    :goto_4
    iget-object p3, v1, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 241
    .line 242
    invoke-virtual {p3}, Lcom/android/launcher3/taskbar/a4;->Q()I

    .line 243
    .line 244
    .line 245
    move-result p3

    .line 246
    invoke-direct {p0, p3, p2}, Lcom/android/launcher3/taskbar/N2;->g(II)Landroid/graphics/Insets;

    .line 247
    .line 248
    .line 249
    move-result-object p3

    .line 250
    goto :goto_5

    .line 251
    :cond_c
    iget p3, p0, Lcom/android/launcher3/taskbar/N2;->h:I

    .line 252
    .line 253
    invoke-direct {p0, p3, p2}, Lcom/android/launcher3/taskbar/N2;->g(II)Landroid/graphics/Insets;

    .line 254
    .line 255
    .line 256
    move-result-object p3

    .line 257
    :goto_5
    new-instance v0, Landroid/view/InsetsFrameProvider$InsetsSizeOverride;

    .line 258
    .line 259
    const/16 v1, 0x7db

    .line 260
    .line 261
    invoke-direct {v0, v1, p3}, Landroid/view/InsetsFrameProvider$InsetsSizeOverride;-><init>(ILandroid/graphics/Insets;)V

    .line 262
    .line 263
    .line 264
    new-instance v2, Landroid/view/InsetsFrameProvider$InsetsSizeOverride;

    .line 265
    .line 266
    invoke-virtual {p1}, Landroid/view/InsetsFrameProvider;->getInsetsSize()Landroid/graphics/Insets;

    .line 267
    .line 268
    .line 269
    move-result-object v4

    .line 270
    const/16 v5, 0x7ef

    .line 271
    .line 272
    invoke-direct {v2, v5, v4}, Landroid/view/InsetsFrameProvider$InsetsSizeOverride;-><init>(ILandroid/graphics/Insets;)V

    .line 273
    .line 274
    .line 275
    filled-new-array {v0, v2}, [Landroid/view/InsetsFrameProvider$InsetsSizeOverride;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    iget-object v2, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 280
    .line 281
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/I1;->R0()Z

    .line 282
    .line 283
    .line 284
    move-result v2

    .line 285
    if-eqz v2, :cond_d

    .line 286
    .line 287
    invoke-direct {p0, v7, p2}, Lcom/android/launcher3/taskbar/N2;->g(II)Landroid/graphics/Insets;

    .line 288
    .line 289
    .line 290
    move-result-object p2

    .line 291
    goto :goto_6

    .line 292
    :cond_d
    invoke-direct {p0, v3, p2}, Lcom/android/launcher3/taskbar/N2;->g(II)Landroid/graphics/Insets;

    .line 293
    .line 294
    .line 295
    move-result-object p2

    .line 296
    :goto_6
    new-instance v2, Landroid/view/InsetsFrameProvider$InsetsSizeOverride;

    .line 297
    .line 298
    invoke-direct {v2, v1, p3}, Landroid/view/InsetsFrameProvider$InsetsSizeOverride;-><init>(ILandroid/graphics/Insets;)V

    .line 299
    .line 300
    .line 301
    new-instance p3, Landroid/view/InsetsFrameProvider$InsetsSizeOverride;

    .line 302
    .line 303
    invoke-direct {p3, v5, p2}, Landroid/view/InsetsFrameProvider$InsetsSizeOverride;-><init>(ILandroid/graphics/Insets;)V

    .line 304
    .line 305
    .line 306
    filled-new-array {v2, p3}, [Landroid/view/InsetsFrameProvider$InsetsSizeOverride;

    .line 307
    .line 308
    .line 309
    move-result-object p2

    .line 310
    iget-object p0, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 311
    .line 312
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->R0()Z

    .line 313
    .line 314
    .line 315
    move-result p0

    .line 316
    if-nez p0, :cond_e

    .line 317
    .line 318
    sget-boolean p0, Lf1/a;->g:Z

    .line 319
    .line 320
    if-eqz p0, :cond_f

    .line 321
    .line 322
    :cond_e
    invoke-virtual {p1}, Landroid/view/InsetsFrameProvider;->getType()I

    .line 323
    .line 324
    .line 325
    move-result p0

    .line 326
    invoke-static {}, Landroid/view/WindowInsets$Type;->tappableElement()I

    .line 327
    .line 328
    .line 329
    move-result p3

    .line 330
    if-ne p0, p3, :cond_f

    .line 331
    .line 332
    invoke-virtual {p1, p2}, Landroid/view/InsetsFrameProvider;->setInsetsSizeOverrides([Landroid/view/InsetsFrameProvider$InsetsSizeOverride;)Landroid/view/InsetsFrameProvider;

    .line 333
    .line 334
    .line 335
    return-void

    .line 336
    :cond_f
    invoke-virtual {p1}, Landroid/view/InsetsFrameProvider;->getType()I

    .line 337
    .line 338
    .line 339
    move-result p0

    .line 340
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemGestures()I

    .line 341
    .line 342
    .line 343
    move-result p2

    .line 344
    if-eq p0, p2, :cond_10

    .line 345
    .line 346
    invoke-virtual {p1, v0}, Landroid/view/InsetsFrameProvider;->setInsetsSizeOverrides([Landroid/view/InsetsFrameProvider$InsetsSizeOverride;)Landroid/view/InsetsFrameProvider;

    .line 347
    .line 348
    .line 349
    :cond_10
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 6

    .line 1
    const-string v0, "prefix"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "pw"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "TaskbarInsetsController:"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->o:Landroid/view/WindowManager$LayoutParams;

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    const-string v2, "windowLayoutParams"

    .line 35
    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    move-object v0, v1

    .line 42
    :cond_0
    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 43
    .line 44
    new-instance v3, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v4, "\twindowHeight="

    .line 53
    .line 54
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->o:Landroid/view/WindowManager$LayoutParams;

    .line 68
    .line 69
    if-nez v0, :cond_1

    .line 70
    .line 71
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_1
    move-object v1, v0

    .line 76
    :goto_0
    iget-object v0, v1, Landroid/view/WindowManager$LayoutParams;->providedInsets:[Landroid/view/InsetsFrameProvider;

    .line 77
    .line 78
    invoke-static {v0}, Lkotlin/jvm/internal/d;->a([Ljava/lang/Object;)Ljava/util/Iterator;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-eqz v1, :cond_5

    .line 87
    .line 88
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    check-cast v1, Landroid/view/InsetsFrameProvider;

    .line 93
    .line 94
    invoke-virtual {v1}, Landroid/view/InsetsFrameProvider;->getType()I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    invoke-static {v2}, Landroid/view/WindowInsets$Type;->toString(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-virtual {v1}, Landroid/view/InsetsFrameProvider;->getInsetsSize()Landroid/graphics/Insets;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    new-instance v4, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string v5, "\tprovidedInsets: (type="

    .line 115
    .line 116
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    const-string v2, " insetsSize="

    .line 123
    .line 124
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v1}, Landroid/view/InsetsFrameProvider;->getInsetsSizeOverrides()[Landroid/view/InsetsFrameProvider$InsetsSizeOverride;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    if-eqz v2, :cond_4

    .line 142
    .line 143
    const-string v2, " insetsSizeOverrides={"

    .line 144
    .line 145
    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v1}, Landroid/view/InsetsFrameProvider;->getInsetsSizeOverrides()[Landroid/view/InsetsFrameProvider$InsetsSizeOverride;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    const-string v2, "getInsetsSizeOverrides(...)"

    .line 153
    .line 154
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    array-length v2, v1

    .line 158
    const/4 v3, 0x0

    .line 159
    :goto_2
    if-ge v3, v2, :cond_3

    .line 160
    .line 161
    aget-object v4, v1, v3

    .line 162
    .line 163
    if-lez v3, :cond_2

    .line 164
    .line 165
    const-string v5, ", "

    .line 166
    .line 167
    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    :cond_2
    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/Object;)V

    .line 171
    .line 172
    .line 173
    add-int/lit8 v3, v3, 0x1

    .line 174
    .line 175
    goto :goto_2

    .line 176
    :cond_3
    const-string v1, "})"

    .line 177
    .line 178
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    :cond_4
    invoke-virtual {p2}, Ljava/io/PrintWriter;->println()V

    .line 182
    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->m:Lcom/android/launcher3/taskbar/N2$b;

    .line 186
    .line 187
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/N2$b;->a()Landroid/graphics/Rect;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    new-instance v1, Ljava/lang/StringBuilder;

    .line 192
    .line 193
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 194
    .line 195
    .line 196
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    const-string v2, "\tlastSetTouchableBounds="

    .line 200
    .line 201
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    iget-object p0, p0, Lcom/android/launcher3/taskbar/N2;->m:Lcom/android/launcher3/taskbar/N2$b;

    .line 215
    .line 216
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/N2$b;->b()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    new-instance v0, Ljava/lang/StringBuilder;

    .line 221
    .line 222
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 223
    .line 224
    .line 225
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    const-string p1, "\tlastSetTouchableReason="

    .line 229
    .line 230
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object p0

    .line 240
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 241
    .line 242
    .line 243
    return-void
.end method

.method public final f(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    const-string v0, "canvas"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/graphics/Paint;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 9
    .line 10
    .line 11
    const/high16 v1, -0x10000

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 14
    .line 15
    .line 16
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/taskbar/N2;->m:Lcom/android/launcher3/taskbar/N2$b;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/N2$b;->a()Landroid/graphics/Rect;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0, v0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final k()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/N2;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public final l(Lcom/android/launcher3/taskbar/R1;)V
    .locals 2

    .line 1
    const-string v0, "controllers"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->getWindowLayoutParams()Landroid/view/WindowManager$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/android/launcher3/taskbar/N2;->o:Landroid/view/WindowManager$LayoutParams;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/N2;->p()V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->k:Lu4/l;

    .line 22
    .line 23
    new-instance v1, Lcom/android/launcher3/taskbar/L2;

    .line 24
    .line 25
    invoke-direct {v1, v0}, Lcom/android/launcher3/taskbar/L2;-><init>(Lu4/l;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p1, v1}, Lcom/android/launcher3/views/k;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/taskbar/N2;->l:Lcom/android/internal/policy/GestureNavigationSettingsObserver;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/android/internal/policy/GestureNavigationSettingsObserver;->registerForCallingUser()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final n()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/N2;->k:Lu4/l;

    .line 4
    .line 5
    new-instance v2, Lcom/android/launcher3/taskbar/M2;

    .line 6
    .line 7
    invoke-direct {v2, v1}, Lcom/android/launcher3/taskbar/M2;-><init>(Lu4/l;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v2}, Lcom/android/launcher3/views/k;->removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/taskbar/N2;->l:Lcom/android/internal/policy/GestureNavigationSettingsObserver;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/internal/policy/GestureNavigationSettingsObserver;->unregister()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final p()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    const-string v1, "controllers"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v2

    .line 12
    :cond_0
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/a4;->S()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    const/4 v4, 0x0

    .line 19
    if-lez v3, :cond_1

    .line 20
    .line 21
    const/4 v3, 0x2

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    move v3, v4

    .line 24
    :goto_0
    iget-object v5, p0, Lcom/android/launcher3/taskbar/N2;->o:Landroid/view/WindowManager$LayoutParams;

    .line 25
    .line 26
    const-string v6, "windowLayoutParams"

    .line 27
    .line 28
    if-nez v5, :cond_2

    .line 29
    .line 30
    invoke-static {v6}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    move-object v5, v2

    .line 34
    :cond_2
    invoke-static {}, Lf1/a;->d()Z

    .line 35
    .line 36
    .line 37
    move-result v7

    .line 38
    if-eqz v7, :cond_5

    .line 39
    .line 40
    iget-object v7, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 41
    .line 42
    if-nez v7, :cond_3

    .line 43
    .line 44
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    move-object v7, v2

    .line 48
    :cond_3
    invoke-virtual {v7}, Lcom/android/launcher3/taskbar/R1;->g()Lcom/android/launcher3/taskbar/J3;

    .line 49
    .line 50
    .line 51
    move-result-object v7

    .line 52
    if-eqz v7, :cond_5

    .line 53
    .line 54
    iget-object v7, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 55
    .line 56
    if-nez v7, :cond_4

    .line 57
    .line 58
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    move-object v7, v2

    .line 62
    :cond_4
    invoke-virtual {v7}, Lcom/android/launcher3/taskbar/R1;->g()Lcom/android/launcher3/taskbar/J3;

    .line 63
    .line 64
    .line 65
    move-result-object v7

    .line 66
    invoke-static {v7}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    iget-object v7, v7, Lcom/android/launcher3/taskbar/J3;->t:[Landroid/view/InsetsFrameProvider;

    .line 70
    .line 71
    const-string v8, "insetsFrameProviders"

    .line 72
    .line 73
    invoke-static {v7, v8}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-direct {p0, v7, v3}, Lcom/android/launcher3/taskbar/N2;->j([Landroid/view/InsetsFrameProvider;I)[Landroid/view/InsetsFrameProvider;

    .line 77
    .line 78
    .line 79
    move-result-object v7

    .line 80
    goto :goto_1

    .line 81
    :cond_5
    invoke-direct {p0, v3}, Lcom/android/launcher3/taskbar/N2;->i(I)[Landroid/view/InsetsFrameProvider;

    .line 82
    .line 83
    .line 84
    move-result-object v7

    .line 85
    :goto_1
    iput-object v7, v5, Landroid/view/WindowManager$LayoutParams;->providedInsets:[Landroid/view/InsetsFrameProvider;

    .line 86
    .line 87
    iget-object v5, p0, Lcom/android/launcher3/taskbar/N2;->o:Landroid/view/WindowManager$LayoutParams;

    .line 88
    .line 89
    if-nez v5, :cond_6

    .line 90
    .line 91
    invoke-static {v6}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    move-object v5, v2

    .line 95
    :cond_6
    iget-object v5, v5, Landroid/view/WindowManager$LayoutParams;->paramsForRotation:[Landroid/view/WindowManager$LayoutParams;

    .line 96
    .line 97
    if-eqz v5, :cond_8

    .line 98
    .line 99
    iget-object v5, p0, Lcom/android/launcher3/taskbar/N2;->o:Landroid/view/WindowManager$LayoutParams;

    .line 100
    .line 101
    if-nez v5, :cond_7

    .line 102
    .line 103
    invoke-static {v6}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    move-object v5, v2

    .line 107
    :cond_7
    iget-object v5, v5, Landroid/view/WindowManager$LayoutParams;->paramsForRotation:[Landroid/view/WindowManager$LayoutParams;

    .line 108
    .line 109
    invoke-static {v5}, Lkotlin/jvm/internal/d;->a([Ljava/lang/Object;)Ljava/util/Iterator;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 114
    .line 115
    .line 116
    move-result v7

    .line 117
    if-eqz v7, :cond_8

    .line 118
    .line 119
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v7

    .line 123
    check-cast v7, Landroid/view/WindowManager$LayoutParams;

    .line 124
    .line 125
    invoke-direct {p0, v3}, Lcom/android/launcher3/taskbar/N2;->i(I)[Landroid/view/InsetsFrameProvider;

    .line 126
    .line 127
    .line 128
    move-result-object v8

    .line 129
    iput-object v8, v7, Landroid/view/WindowManager$LayoutParams;->providedInsets:[Landroid/view/InsetsFrameProvider;

    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_8
    iget-object v3, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 133
    .line 134
    if-nez v3, :cond_9

    .line 135
    .line 136
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    move-object v3, v2

    .line 140
    :cond_9
    iget-object v3, v3, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 141
    .line 142
    const-string v5, "bubbleControllers"

    .line 143
    .line 144
    invoke-static {v3, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    invoke-static {v3}, Lw4/a;->a(Ljava/util/Optional;)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    check-cast v3, Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 152
    .line 153
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/a4;->W()I

    .line 154
    .line 155
    .line 156
    move-result v5

    .line 157
    if-eqz v3, :cond_a

    .line 158
    .line 159
    iget-object v7, v3, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 160
    .line 161
    if-eqz v7, :cond_a

    .line 162
    .line 163
    invoke-interface {v7}, LX1/b;->F()I

    .line 164
    .line 165
    .line 166
    :cond_a
    iget-object v7, p0, Lcom/android/launcher3/taskbar/N2;->i:Landroid/graphics/Region;

    .line 167
    .line 168
    invoke-virtual {v7}, Landroid/graphics/Region;->setEmpty()V

    .line 169
    .line 170
    .line 171
    if-eqz v3, :cond_c

    .line 172
    .line 173
    iget-object v7, v3, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 174
    .line 175
    iget-object v3, v3, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 176
    .line 177
    invoke-interface {v3}, LX1/b;->v()Z

    .line 178
    .line 179
    .line 180
    move-result v3

    .line 181
    invoke-virtual {v7}, Lcom/android/launcher3/taskbar/bubbles/g0;->y0()Z

    .line 182
    .line 183
    .line 184
    move-result v8

    .line 185
    if-nez v3, :cond_b

    .line 186
    .line 187
    if-eqz v8, :cond_c

    .line 188
    .line 189
    :cond_b
    sget-object v3, Lcom/android/launcher3/taskbar/N2;->p:Lcom/android/launcher3/taskbar/N2$a;

    .line 190
    .line 191
    iget-object v8, p0, Lcom/android/launcher3/taskbar/N2;->i:Landroid/graphics/Region;

    .line 192
    .line 193
    invoke-virtual {v7}, Lcom/android/launcher3/taskbar/bubbles/g0;->W()Landroid/graphics/Rect;

    .line 194
    .line 195
    .line 196
    move-result-object v9

    .line 197
    invoke-static {v3, v8, v9}, Lcom/android/launcher3/taskbar/N2$a;->a(Lcom/android/launcher3/taskbar/N2$a;Landroid/graphics/Region;Landroid/graphics/Rect;)V

    .line 198
    .line 199
    .line 200
    iget-object v8, p0, Lcom/android/launcher3/taskbar/N2;->i:Landroid/graphics/Region;

    .line 201
    .line 202
    invoke-virtual {v7}, Lcom/android/launcher3/taskbar/bubbles/g0;->s0()Landroid/graphics/Rect;

    .line 203
    .line 204
    .line 205
    move-result-object v7

    .line 206
    invoke-static {v3, v8, v7}, Lcom/android/launcher3/taskbar/N2$a;->a(Lcom/android/launcher3/taskbar/N2$a;Landroid/graphics/Region;Landroid/graphics/Rect;)V

    .line 207
    .line 208
    .line 209
    :cond_c
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/a4;->c0()Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    if-nez v0, :cond_e

    .line 214
    .line 215
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 216
    .line 217
    if-nez v0, :cond_d

    .line 218
    .line 219
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    move-object v0, v2

    .line 223
    :cond_d
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 224
    .line 225
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/o4;->v()Z

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    if-nez v0, :cond_e

    .line 230
    .line 231
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 232
    .line 233
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->r2()Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-eqz v0, :cond_10

    .line 238
    .line 239
    :cond_e
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->o:Landroid/view/WindowManager$LayoutParams;

    .line 240
    .line 241
    if-nez v0, :cond_f

    .line 242
    .line 243
    invoke-static {v6}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    move-object v0, v2

    .line 247
    :cond_f
    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 248
    .line 249
    sub-int v1, v0, v5

    .line 250
    .line 251
    iget-object v3, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 252
    .line 253
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 254
    .line 255
    .line 256
    move-result-object v3

    .line 257
    iget v3, v3, Lcom/android/launcher3/h0;->T0:I

    .line 258
    .line 259
    sget-object v5, Lcom/android/launcher3/taskbar/N2;->p:Lcom/android/launcher3/taskbar/N2$a;

    .line 260
    .line 261
    iget-object v7, p0, Lcom/android/launcher3/taskbar/N2;->i:Landroid/graphics/Region;

    .line 262
    .line 263
    new-instance v8, Landroid/graphics/Rect;

    .line 264
    .line 265
    invoke-direct {v8, v4, v1, v3, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 266
    .line 267
    .line 268
    invoke-static {v5, v7, v8}, Lcom/android/launcher3/taskbar/N2$a;->a(Lcom/android/launcher3/taskbar/N2$a;Landroid/graphics/Region;Landroid/graphics/Rect;)V

    .line 269
    .line 270
    .line 271
    :cond_10
    :goto_3
    const/4 v0, 0x4

    .line 272
    if-ge v4, v0, :cond_13

    .line 273
    .line 274
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->o:Landroid/view/WindowManager$LayoutParams;

    .line 275
    .line 276
    if-nez v0, :cond_11

    .line 277
    .line 278
    invoke-static {v6}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 279
    .line 280
    .line 281
    move-object v0, v2

    .line 282
    :cond_11
    iget-object v0, v0, Landroid/view/WindowManager$LayoutParams;->paramsForRotation:[Landroid/view/WindowManager$LayoutParams;

    .line 283
    .line 284
    aget-object v0, v0, v4

    .line 285
    .line 286
    iget-object v1, v0, Landroid/view/WindowManager$LayoutParams;->providedInsets:[Landroid/view/InsetsFrameProvider;

    .line 287
    .line 288
    invoke-static {v1}, Lkotlin/jvm/internal/d;->a([Ljava/lang/Object;)Ljava/util/Iterator;

    .line 289
    .line 290
    .line 291
    move-result-object v1

    .line 292
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 293
    .line 294
    .line 295
    move-result v3

    .line 296
    if-eqz v3, :cond_12

    .line 297
    .line 298
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 299
    .line 300
    .line 301
    move-result-object v3

    .line 302
    check-cast v3, Landroid/view/InsetsFrameProvider;

    .line 303
    .line 304
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 305
    .line 306
    .line 307
    iget v5, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 308
    .line 309
    invoke-direct {p0, v3, v5, v4}, Lcom/android/launcher3/taskbar/N2;->q(Landroid/view/InsetsFrameProvider;II)V

    .line 310
    .line 311
    .line 312
    goto :goto_4

    .line 313
    :cond_12
    add-int/lit8 v4, v4, 0x1

    .line 314
    .line 315
    goto :goto_3

    .line 316
    :cond_13
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->o:Landroid/view/WindowManager$LayoutParams;

    .line 317
    .line 318
    if-nez v0, :cond_14

    .line 319
    .line 320
    invoke-static {v6}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 321
    .line 322
    .line 323
    move-object v0, v2

    .line 324
    :cond_14
    iget-object v0, v0, Landroid/view/WindowManager$LayoutParams;->providedInsets:[Landroid/view/InsetsFrameProvider;

    .line 325
    .line 326
    invoke-static {v0}, Lkotlin/jvm/internal/d;->a([Ljava/lang/Object;)Ljava/util/Iterator;

    .line 327
    .line 328
    .line 329
    move-result-object v0

    .line 330
    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 331
    .line 332
    .line 333
    move-result v1

    .line 334
    if-eqz v1, :cond_16

    .line 335
    .line 336
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 337
    .line 338
    .line 339
    move-result-object v1

    .line 340
    check-cast v1, Landroid/view/InsetsFrameProvider;

    .line 341
    .line 342
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 343
    .line 344
    .line 345
    iget-object v3, p0, Lcom/android/launcher3/taskbar/N2;->o:Landroid/view/WindowManager$LayoutParams;

    .line 346
    .line 347
    if-nez v3, :cond_15

    .line 348
    .line 349
    invoke-static {v6}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 350
    .line 351
    .line 352
    move-object v3, v2

    .line 353
    :cond_15
    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 354
    .line 355
    iget-object v4, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 356
    .line 357
    invoke-virtual {v4}, Landroid/view/ContextThemeWrapper;->getDisplay()Landroid/view/Display;

    .line 358
    .line 359
    .line 360
    move-result-object v4

    .line 361
    invoke-virtual {v4}, Landroid/view/Display;->getRotation()I

    .line 362
    .line 363
    .line 364
    move-result v4

    .line 365
    invoke-direct {p0, v1, v3, v4}, Lcom/android/launcher3/taskbar/N2;->q(Landroid/view/InsetsFrameProvider;II)V

    .line 366
    .line 367
    .line 368
    goto :goto_5

    .line 369
    :cond_16
    iget-object p0, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 370
    .line 371
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->O1()V

    .line 372
    .line 373
    .line 374
    return-void
.end method

.method public final r(Landroid/view/ViewTreeObserver$InternalInsetsInfo;)V
    .locals 7

    .line 1
    const-string v0, "insetsInfo"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Landroid/view/ViewTreeObserver$InternalInsetsInfo;->touchableRegion:Landroid/graphics/Region;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/Region;->setEmpty()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 12
    .line 13
    const-string v1, "controllers"

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    move-object v0, v2

    .line 22
    :cond_0
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/util/Optional;->isPresent()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v3, 0x1

    .line 29
    const/4 v4, 0x0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 33
    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    move-object v0, v2

    .line 40
    :cond_1
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/util/Optional;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->A0()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    move v0, v3

    .line 57
    goto :goto_0

    .line 58
    :cond_2
    move v0, v4

    .line 59
    :goto_0
    iget-object v5, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 60
    .line 61
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/I1;->a1()Z

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    if-eqz v5, :cond_6

    .line 66
    .line 67
    iget-object v5, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 68
    .line 69
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/I1;->k1()Z

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    if-eqz v5, :cond_6

    .line 74
    .line 75
    iget-object v5, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 76
    .line 77
    if-nez v5, :cond_3

    .line 78
    .line 79
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    move-object v5, v2

    .line 83
    :cond_3
    iget-object v5, v5, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 84
    .line 85
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/M0;->s0()Z

    .line 86
    .line 87
    .line 88
    move-result v5

    .line 89
    if-eqz v5, :cond_5

    .line 90
    .line 91
    iget-object v5, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 92
    .line 93
    if-nez v5, :cond_4

    .line 94
    .line 95
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    move-object v5, v2

    .line 99
    :cond_4
    iget-object v5, v5, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 100
    .line 101
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/M0;->r0()Z

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    if-nez v5, :cond_6

    .line 106
    .line 107
    :cond_5
    invoke-virtual {p1, v4}, Landroid/view/ViewTreeObserver$InternalInsetsInfo;->setTouchableInsets(I)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->m:Lcom/android/launcher3/taskbar/N2$b;

    .line 111
    .line 112
    const-string v3, "Phone button nav mode: Fullscreen touchable, IME not affecting nav buttons"

    .line 113
    .line 114
    invoke-virtual {v0, v3}, Lcom/android/launcher3/taskbar/N2$b;->c(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    :goto_1
    move v3, v4

    .line 118
    goto/16 :goto_6

    .line 119
    .line 120
    :cond_6
    iget-object v5, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 121
    .line 122
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 123
    .line 124
    .line 125
    move-result-object v5

    .line 126
    invoke-virtual {v5}, Landroid/widget/FrameLayout;->getAlpha()F

    .line 127
    .line 128
    .line 129
    move-result v5

    .line 130
    const v6, 0x3c23d70a    # 0.01f

    .line 131
    .line 132
    .line 133
    cmpg-float v5, v5, v6

    .line 134
    .line 135
    const/4 v6, 0x3

    .line 136
    if-gez v5, :cond_7

    .line 137
    .line 138
    invoke-virtual {p1, v6}, Landroid/view/ViewTreeObserver$InternalInsetsInfo;->setTouchableInsets(I)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->m:Lcom/android/launcher3/taskbar/N2$b;

    .line 142
    .line 143
    const-string v4, "Taskbar is invisible"

    .line 144
    .line 145
    invoke-virtual {v0, v4}, Lcom/android/launcher3/taskbar/N2$b;->c(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    goto/16 :goto_6

    .line 149
    .line 150
    :cond_7
    iget-object v5, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 151
    .line 152
    if-nez v5, :cond_8

    .line 153
    .line 154
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    move-object v5, v2

    .line 158
    :cond_8
    iget-object v5, v5, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 159
    .line 160
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/M0;->s0()Z

    .line 161
    .line 162
    .line 163
    move-result v5

    .line 164
    if-eqz v5, :cond_a

    .line 165
    .line 166
    iget-object v5, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 167
    .line 168
    if-nez v5, :cond_9

    .line 169
    .line 170
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    move-object v5, v2

    .line 174
    :cond_9
    iget-object v5, v5, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 175
    .line 176
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/a4;->g0()Z

    .line 177
    .line 178
    .line 179
    move-result v5

    .line 180
    if-eqz v5, :cond_a

    .line 181
    .line 182
    invoke-virtual {p1, v6}, Landroid/view/ViewTreeObserver$InternalInsetsInfo;->setTouchableInsets(I)V

    .line 183
    .line 184
    .line 185
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->m:Lcom/android/launcher3/taskbar/N2$b;

    .line 186
    .line 187
    const-string v4, "Stashed over IME"

    .line 188
    .line 189
    invoke-virtual {v0, v4}, Lcom/android/launcher3/taskbar/N2$b;->c(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    goto/16 :goto_6

    .line 193
    .line 194
    :cond_a
    iget-object v5, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 195
    .line 196
    if-nez v5, :cond_b

    .line 197
    .line 198
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    move-object v5, v2

    .line 202
    :cond_b
    iget-object v5, v5, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 203
    .line 204
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/o4;->y()Z

    .line 205
    .line 206
    .line 207
    move-result v5

    .line 208
    if-nez v5, :cond_c

    .line 209
    .line 210
    invoke-virtual {p1, v6}, Landroid/view/ViewTreeObserver$InternalInsetsInfo;->setTouchableInsets(I)V

    .line 211
    .line 212
    .line 213
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->m:Lcom/android/launcher3/taskbar/N2$b;

    .line 214
    .line 215
    const-string v4, "Taskbar is not touchable"

    .line 216
    .line 217
    invoke-virtual {v0, v4}, Lcom/android/launcher3/taskbar/N2$b;->c(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    goto/16 :goto_6

    .line 221
    .line 222
    :cond_c
    iget-object v5, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 223
    .line 224
    if-nez v5, :cond_d

    .line 225
    .line 226
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    move-object v5, v2

    .line 230
    :cond_d
    iget-object v5, v5, Lcom/android/launcher3/taskbar/R1;->b:Lcom/android/launcher3/taskbar/j2;

    .line 231
    .line 232
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/j2;->n0()Z

    .line 233
    .line 234
    .line 235
    move-result v5

    .line 236
    if-eqz v5, :cond_e

    .line 237
    .line 238
    invoke-virtual {p1, v6}, Landroid/view/ViewTreeObserver$InternalInsetsInfo;->setTouchableInsets(I)V

    .line 239
    .line 240
    .line 241
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->m:Lcom/android/launcher3/taskbar/N2$b;

    .line 242
    .line 243
    const-string v4, "System drag is in progress"

    .line 244
    .line 245
    invoke-virtual {v0, v4}, Lcom/android/launcher3/taskbar/N2$b;->c(Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    goto/16 :goto_6

    .line 249
    .line 250
    :cond_e
    iget-object v5, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 251
    .line 252
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/I1;->h1()Z

    .line 253
    .line 254
    .line 255
    move-result v5

    .line 256
    if-eqz v5, :cond_f

    .line 257
    .line 258
    invoke-virtual {p1, v4}, Landroid/view/ViewTreeObserver$InternalInsetsInfo;->setTouchableInsets(I)V

    .line 259
    .line 260
    .line 261
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->m:Lcom/android/launcher3/taskbar/N2$b;

    .line 262
    .line 263
    const-string v3, "Taskbar is fullscreen"

    .line 264
    .line 265
    invoke-virtual {v0, v3}, Lcom/android/launcher3/taskbar/N2$b;->c(Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 269
    .line 270
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    iget-object v3, p0, Lcom/android/launcher3/taskbar/N2;->m:Lcom/android/launcher3/taskbar/N2$b;

    .line 275
    .line 276
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/N2$b;->a()Landroid/graphics/Rect;

    .line 277
    .line 278
    .line 279
    move-result-object v3

    .line 280
    invoke-virtual {v0, v3, v4}, Landroid/widget/FrameLayout;->getBoundsInWindow(Landroid/graphics/Rect;Z)V

    .line 281
    .line 282
    .line 283
    goto/16 :goto_1

    .line 284
    .line 285
    :cond_f
    iget-object v5, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 286
    .line 287
    if-nez v5, :cond_10

    .line 288
    .line 289
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    move-object v5, v2

    .line 293
    :cond_10
    iget-object v5, v5, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 294
    .line 295
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/W4;->A()Z

    .line 296
    .line 297
    .line 298
    move-result v5

    .line 299
    if-nez v5, :cond_12

    .line 300
    .line 301
    iget-object v5, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 302
    .line 303
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/I1;->Z0()Z

    .line 304
    .line 305
    .line 306
    move-result v5

    .line 307
    if-nez v5, :cond_12

    .line 308
    .line 309
    if-eqz v0, :cond_11

    .line 310
    .line 311
    goto :goto_2

    .line 312
    :cond_11
    invoke-virtual {p1, v6}, Landroid/view/ViewTreeObserver$InternalInsetsInfo;->setTouchableInsets(I)V

    .line 313
    .line 314
    .line 315
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->m:Lcom/android/launcher3/taskbar/N2$b;

    .line 316
    .line 317
    const-string v4, "Icons are not visible, but other components such as 3 buttons might be"

    .line 318
    .line 319
    invoke-virtual {v0, v4}, Lcom/android/launcher3/taskbar/N2$b;->c(Ljava/lang/String;)V

    .line 320
    .line 321
    .line 322
    goto/16 :goto_6

    .line 323
    .line 324
    :cond_12
    :goto_2
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 325
    .line 326
    if-nez v0, :cond_13

    .line 327
    .line 328
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 329
    .line 330
    .line 331
    move-object v0, v2

    .line 332
    :cond_13
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 333
    .line 334
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/o4;->v()Z

    .line 335
    .line 336
    .line 337
    move-result v0

    .line 338
    if-eqz v0, :cond_1a

    .line 339
    .line 340
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 341
    .line 342
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 343
    .line 344
    .line 345
    move-result v0

    .line 346
    if-eqz v0, :cond_1a

    .line 347
    .line 348
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 349
    .line 350
    if-nez v0, :cond_14

    .line 351
    .line 352
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 353
    .line 354
    .line 355
    move-object v0, v2

    .line 356
    :cond_14
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 357
    .line 358
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->getLastDrawnTransientRect()Landroid/graphics/RectF;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    const-string v3, "getLastDrawnTransientRect(...)"

    .line 367
    .line 368
    invoke-static {v0, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 369
    .line 370
    .line 371
    new-instance v3, Landroid/graphics/Region;

    .line 372
    .line 373
    new-instance v5, Landroid/graphics/Rect;

    .line 374
    .line 375
    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 376
    .line 377
    .line 378
    invoke-virtual {v0, v5}, Landroid/graphics/RectF;->roundOut(Landroid/graphics/Rect;)V

    .line 379
    .line 380
    .line 381
    invoke-direct {v3, v5}, Landroid/graphics/Region;-><init>(Landroid/graphics/Rect;)V

    .line 382
    .line 383
    .line 384
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 385
    .line 386
    if-nez v0, :cond_15

    .line 387
    .line 388
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 389
    .line 390
    .line 391
    move-object v0, v2

    .line 392
    :cond_15
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 393
    .line 394
    const-string v5, "bubbleControllers"

    .line 395
    .line 396
    invoke-static {v0, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 397
    .line 398
    .line 399
    invoke-static {v0}, Lw4/a;->a(Ljava/util/Optional;)Ljava/lang/Object;

    .line 400
    .line 401
    .line 402
    move-result-object v0

    .line 403
    check-cast v0, Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 404
    .line 405
    if-eqz v0, :cond_18

    .line 406
    .line 407
    iget-object v5, v0, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 408
    .line 409
    invoke-interface {v5}, LX1/b;->E()Z

    .line 410
    .line 411
    .line 412
    move-result v5

    .line 413
    if-nez v5, :cond_16

    .line 414
    .line 415
    goto :goto_3

    .line 416
    :cond_16
    iget-object v5, v0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 417
    .line 418
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/bubbles/g0;->A0()Z

    .line 419
    .line 420
    .line 421
    move-result v5

    .line 422
    if-nez v5, :cond_17

    .line 423
    .line 424
    goto :goto_3

    .line 425
    :cond_17
    iget-object v0, v0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 426
    .line 427
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->W()Landroid/graphics/Rect;

    .line 428
    .line 429
    .line 430
    move-result-object v0

    .line 431
    goto :goto_4

    .line 432
    :cond_18
    :goto_3
    move-object v0, v2

    .line 433
    :goto_4
    if-eqz v0, :cond_19

    .line 434
    .line 435
    sget-object v5, Lcom/android/launcher3/taskbar/N2;->p:Lcom/android/launcher3/taskbar/N2$a;

    .line 436
    .line 437
    invoke-static {v5, v3, v0}, Lcom/android/launcher3/taskbar/N2$a;->a(Lcom/android/launcher3/taskbar/N2$a;Landroid/graphics/Region;Landroid/graphics/Rect;)V

    .line 438
    .line 439
    .line 440
    :cond_19
    iget-object v0, p1, Landroid/view/ViewTreeObserver$InternalInsetsInfo;->touchableRegion:Landroid/graphics/Region;

    .line 441
    .line 442
    invoke-virtual {v0, v3}, Landroid/graphics/Region;->set(Landroid/graphics/Region;)Z

    .line 443
    .line 444
    .line 445
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->m:Lcom/android/launcher3/taskbar/N2$b;

    .line 446
    .line 447
    const-string v5, "Transient Taskbar is in Overview"

    .line 448
    .line 449
    invoke-virtual {v0, v5}, Lcom/android/launcher3/taskbar/N2$b;->c(Ljava/lang/String;)V

    .line 450
    .line 451
    .line 452
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->m:Lcom/android/launcher3/taskbar/N2$b;

    .line 453
    .line 454
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/N2$b;->a()Landroid/graphics/Rect;

    .line 455
    .line 456
    .line 457
    move-result-object v0

    .line 458
    invoke-virtual {v3}, Landroid/graphics/Region;->getBounds()Landroid/graphics/Rect;

    .line 459
    .line 460
    .line 461
    move-result-object v3

    .line 462
    invoke-virtual {v0, v3}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 463
    .line 464
    .line 465
    goto :goto_5

    .line 466
    :cond_1a
    iget-object v0, p1, Landroid/view/ViewTreeObserver$InternalInsetsInfo;->touchableRegion:Landroid/graphics/Region;

    .line 467
    .line 468
    iget-object v3, p0, Lcom/android/launcher3/taskbar/N2;->i:Landroid/graphics/Region;

    .line 469
    .line 470
    invoke-virtual {v0, v3}, Landroid/graphics/Region;->set(Landroid/graphics/Region;)Z

    .line 471
    .line 472
    .line 473
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->m:Lcom/android/launcher3/taskbar/N2$b;

    .line 474
    .line 475
    const-string v3, "Using default touchable region"

    .line 476
    .line 477
    invoke-virtual {v0, v3}, Lcom/android/launcher3/taskbar/N2$b;->c(Ljava/lang/String;)V

    .line 478
    .line 479
    .line 480
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->m:Lcom/android/launcher3/taskbar/N2$b;

    .line 481
    .line 482
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/N2$b;->a()Landroid/graphics/Rect;

    .line 483
    .line 484
    .line 485
    move-result-object v0

    .line 486
    iget-object v3, p0, Lcom/android/launcher3/taskbar/N2;->i:Landroid/graphics/Region;

    .line 487
    .line 488
    invoke-virtual {v3}, Landroid/graphics/Region;->getBounds()Landroid/graphics/Rect;

    .line 489
    .line 490
    .line 491
    move-result-object v3

    .line 492
    invoke-virtual {v0, v3}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 493
    .line 494
    .line 495
    :goto_5
    invoke-virtual {p1, v6}, Landroid/view/ViewTreeObserver$InternalInsetsInfo;->setTouchableInsets(I)V

    .line 496
    .line 497
    .line 498
    goto/16 :goto_1

    .line 499
    .line 500
    :goto_6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->n:Lcom/android/launcher3/taskbar/R1;

    .line 501
    .line 502
    if-nez v0, :cond_1b

    .line 503
    .line 504
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 505
    .line 506
    .line 507
    goto :goto_7

    .line 508
    :cond_1b
    move-object v2, v0

    .line 509
    :goto_7
    iget-object v0, v2, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 510
    .line 511
    iget-object v1, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 512
    .line 513
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 514
    .line 515
    .line 516
    move-result-object v1

    .line 517
    iget-object v2, p1, Landroid/view/ViewTreeObserver$InternalInsetsInfo;->touchableRegion:Landroid/graphics/Region;

    .line 518
    .line 519
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/taskbar/M0;->T(Lcom/android/launcher3/views/BaseDragLayer;Landroid/graphics/Region;)V

    .line 520
    .line 521
    .line 522
    iget-object v0, p0, Lcom/android/launcher3/taskbar/N2;->m:Lcom/android/launcher3/taskbar/N2$b;

    .line 523
    .line 524
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/N2$b;->a()Landroid/graphics/Rect;

    .line 525
    .line 526
    .line 527
    move-result-object v0

    .line 528
    iget-object p1, p1, Landroid/view/ViewTreeObserver$InternalInsetsInfo;->touchableRegion:Landroid/graphics/Region;

    .line 529
    .line 530
    invoke-virtual {p1}, Landroid/graphics/Region;->getBounds()Landroid/graphics/Rect;

    .line 531
    .line 532
    .line 533
    move-result-object p1

    .line 534
    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 535
    .line 536
    .line 537
    iget-object p0, p0, Lcom/android/launcher3/taskbar/N2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 538
    .line 539
    invoke-virtual {p0, v3}, Lcom/android/launcher3/taskbar/I1;->m0(Z)V

    .line 540
    .line 541
    .line 542
    return-void
.end method
