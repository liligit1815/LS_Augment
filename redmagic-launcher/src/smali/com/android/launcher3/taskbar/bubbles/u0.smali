.class public Lcom/android/launcher3/taskbar/bubbles/u0;
.super Ljava/lang/Object;
.source "BubbleDragController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/bubbles/u0$f;,
        Lcom/android/launcher3/taskbar/bubbles/u0$g;
    }
.end annotation


# static fields
.field public static final k:Landroidx/dynamicanimation/animation/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/dynamicanimation/animation/g<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final a:Lcom/android/launcher3/taskbar/I1;

.field private b:Lcom/android/launcher3/taskbar/bubbles/t;

.field private c:Lcom/android/launcher3/taskbar/bubbles/g0;

.field private d:Lcom/android/launcher3/taskbar/bubbles/o0;

.field private e:Lcom/android/launcher3/taskbar/bubbles/z;

.field private f:Lcom/android/launcher3/taskbar/bubbles/y0;

.field private final g:LN2/x;

.field private final h:LN2/s;

.field private final i:Lcom/android/launcher3/taskbar/bubbles/u0$f;

.field private j:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/u0$a;

    .line 2
    .line 3
    const-string v1, "dragTranslationX"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/u0$a;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/taskbar/bubbles/u0;->k:Landroidx/dynamicanimation/animation/g;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;Landroid/widget/FrameLayout;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->a:Lcom/android/launcher3/taskbar/I1;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getApplicationContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-class v1, Landroid/view/WindowManager;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Landroid/view/WindowManager;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getApplicationContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v1, v0}, LN2/n;->a(Landroid/content/Context;Landroid/view/WindowManager;)LN2/n;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/u0$b;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/bubbles/u0$b;-><init>(Lcom/android/launcher3/taskbar/bubbles/u0;)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Lcom/android/launcher3/taskbar/bubbles/u0$c;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Lcom/android/launcher3/taskbar/bubbles/u0$c;-><init>(Lcom/android/launcher3/taskbar/bubbles/u0;)V

    .line 34
    .line 35
    .line 36
    new-instance v3, LN2/s;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getApplicationContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-direct {v3, v4, v0, v1, v2}, LN2/s;-><init>(Landroid/content/Context;LN2/n;LN2/s$b;LN2/s$a;)V

    .line 43
    .line 44
    .line 45
    iput-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->h:LN2/s;

    .line 46
    .line 47
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/u0$f;

    .line 48
    .line 49
    const/4 v1, 0x0

    .line 50
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/taskbar/bubbles/u0$f;-><init>(Lcom/android/launcher3/taskbar/bubbles/u0;Lcom/android/launcher3/taskbar/bubbles/x0;)V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->i:Lcom/android/launcher3/taskbar/bubbles/u0$f;

    .line 54
    .line 55
    new-instance v1, LN2/x;

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getApplicationContext()Landroid/content/Context;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-direct {v1, p1, p2, v0}, LN2/x;-><init>(Landroid/content/Context;Landroid/widget/FrameLayout;LN2/x$c;)V

    .line 62
    .line 63
    .line 64
    iput-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->g:LN2/x;

    .line 65
    .line 66
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/bubbles/u0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/u0;->m(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic b(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/I1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->a:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/t;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->b:Lcom/android/launcher3/taskbar/bubbles/t;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/z;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->e:Lcom/android/launcher3/taskbar/bubbles/z;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/g0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->c:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/o0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->d:Lcom/android/launcher3/taskbar/bubbles/o0;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/u0$f;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->i:Lcom/android/launcher3/taskbar/bubbles/u0$f;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic h(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/y0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->f:Lcom/android/launcher3/taskbar/bubbles/y0;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic i(Lcom/android/launcher3/taskbar/bubbles/u0;)LN2/s;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->h:LN2/s;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic j(Lcom/android/launcher3/taskbar/bubbles/u0;)LN2/x;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->g:LN2/x;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic m(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->e:Lcom/android/launcher3/taskbar/bubbles/z;

    .line 4
    .line 5
    invoke-virtual {p1}, LN2/f;->v()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->f:Lcom/android/launcher3/taskbar/bubbles/y0;

    .line 9
    .line 10
    invoke-virtual {p0}, LN2/f;->v()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method


# virtual methods
.method public k(Lcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->a:Lcom/android/launcher3/taskbar/bubbles/t;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->b:Lcom/android/launcher3/taskbar/bubbles/t;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->c:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 8
    .line 9
    iget-object v0, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->f:Lcom/android/launcher3/taskbar/bubbles/o0;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->d:Lcom/android/launcher3/taskbar/bubbles/o0;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->g:Lcom/android/launcher3/taskbar/bubbles/z;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->e:Lcom/android/launcher3/taskbar/bubbles/z;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->h:Lcom/android/launcher3/taskbar/bubbles/y0;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->f:Lcom/android/launcher3/taskbar/bubbles/y0;

    .line 20
    .line 21
    new-instance p1, Lcom/android/launcher3/taskbar/bubbles/t0;

    .line 22
    .line 23
    invoke-direct {p1, p0}, Lcom/android/launcher3/taskbar/bubbles/t0;-><init>(Lcom/android/launcher3/taskbar/bubbles/u0;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/bubbles/o0;->h(Lcom/android/launcher3/taskbar/bubbles/o0$c;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public n(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method public o(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/graphics/PointF;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/u0$e;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1, v0}, Lcom/android/launcher3/taskbar/bubbles/u0$e;-><init>(Lcom/android/launcher3/taskbar/bubbles/u0;Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Landroid/graphics/PointF;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v1}, Landroid/widget/FrameLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public p(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getBubble()Lcom/android/launcher3/taskbar/bubbles/u;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/u0$d;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/taskbar/bubbles/u0$d;-><init>(Lcom/android/launcher3/taskbar/bubbles/u0;Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
