.class public final LJ/X;
.super Ljava/lang/Object;
.source "WindowInsetsAnimationCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LJ/X$c;,
        LJ/X$d;,
        LJ/X$b;,
        LJ/X$a;
    }
.end annotation


# instance fields
.field private a:LJ/X$d;


# direct methods
.method public constructor <init>(ILandroid/view/animation/Interpolator;J)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, LJ/X$c;

    invoke-direct {v0, p1, p2, p3, p4}, LJ/X$c;-><init>(ILandroid/view/animation/Interpolator;J)V

    iput-object v0, p0, LJ/X;->a:LJ/X$d;

    return-void
.end method

.method private constructor <init>(Landroid/view/WindowInsetsAnimation;)V
    .locals 4

    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    .line 3
    invoke-direct {p0, v3, v0, v1, v2}, LJ/X;-><init>(ILandroid/view/animation/Interpolator;J)V

    .line 4
    new-instance v0, LJ/X$c;

    invoke-direct {v0, p1}, LJ/X$c;-><init>(Landroid/view/WindowInsetsAnimation;)V

    iput-object v0, p0, LJ/X;->a:LJ/X$d;

    return-void
.end method

.method static c(Landroid/view/View;LJ/X$b;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, LJ/X$c;->g(Landroid/view/View;LJ/X$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static e(Landroid/view/WindowInsetsAnimation;)LJ/X;
    .locals 1

    .line 1
    new-instance v0, LJ/X;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LJ/X;-><init>(Landroid/view/WindowInsetsAnimation;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a()F
    .locals 0

    .line 1
    iget-object p0, p0, LJ/X;->a:LJ/X$d;

    .line 2
    .line 3
    invoke-virtual {p0}, LJ/X$d;->a()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget-object p0, p0, LJ/X;->a:LJ/X$d;

    .line 2
    .line 3
    invoke-virtual {p0}, LJ/X$d;->b()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d(F)V
    .locals 0

    .line 1
    iget-object p0, p0, LJ/X;->a:LJ/X$d;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LJ/X$d;->c(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
