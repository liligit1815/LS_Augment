.class Lj0/b$a;
.super Ljava/lang/Object;
.source "SlidingPaneLayout.java"

# interfaces
.implements Lj0/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lj0/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lj0/b;


# direct methods
.method constructor <init>(Lj0/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lj0/b$a;->a:Lj0/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lp0/c;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lj0/b$a;->a:Lj0/b;

    .line 2
    .line 3
    iput-object p1, v0, Lj0/b;->B:Lp0/c;

    .line 4
    .line 5
    new-instance p1, Landroidx/transition/b;

    .line 6
    .line 7
    invoke-direct {p1}, Landroidx/transition/b;-><init>()V

    .line 8
    .line 9
    .line 10
    const-wide/16 v0, 0x12c

    .line 11
    .line 12
    invoke-virtual {p1, v0, v1}, Landroidx/transition/k;->Z(J)Landroidx/transition/k;

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    const/high16 v1, 0x3f800000    # 1.0f

    .line 17
    .line 18
    const v2, 0x3e4ccccd    # 0.2f

    .line 19
    .line 20
    .line 21
    invoke-static {v2, v0, v0, v1}, LL/a;->a(FFFF)Landroid/view/animation/Interpolator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p1, v0}, Landroidx/transition/k;->b0(Landroid/animation/TimeInterpolator;)Landroidx/transition/k;

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lj0/b$a;->a:Lj0/b;

    .line 29
    .line 30
    invoke-static {v0, p1}, Landroidx/transition/r;->a(Landroid/view/ViewGroup;Landroidx/transition/k;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lj0/b$a;->a:Lj0/b;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 36
    .line 37
    .line 38
    return-void
.end method
