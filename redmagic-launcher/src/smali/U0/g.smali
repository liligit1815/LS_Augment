.class public final LU0/g;
.super Ljava/lang/Object;
.source "IconSurfaceManagerProxy.java"

# interfaces
.implements LU0/a;
.implements Lcom/android/launcher3/util/a2;


# static fields
.field public static final h:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "LU0/g;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final g:LU0/e;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    new-instance v1, LU0/f;

    .line 4
    .line 5
    invoke-direct {v1}, LU0/f;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, LU0/g;->h:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p1, LU0/e;

    .line 5
    .line 6
    invoke-direct {p1}, LU0/e;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, LU0/g;->g:LU0/e;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public b(Landroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public c(Landroid/view/View;Z)Z
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, LU0/g;->b(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, LU0/g;->g:LU0/e;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, LU0/e;->c(Landroid/view/View;Z)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public close()V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/view/View;)I
    .locals 0

    .line 1
    iget-object p0, p0, LU0/g;->g:LU0/e;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LU0/e;->i(Landroid/view/View;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e(Landroid/view/View;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, LU0/g;->g:LU0/e;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, LU0/e;->x(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g(Landroid/view/View;ZZI)Z
    .locals 0

    .line 1
    iget-object p0, p0, LU0/g;->g:LU0/e;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, LU0/e;->e(Landroid/view/View;ZZI)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public j(Landroid/view/SurfaceControl;)V
    .locals 0

    .line 1
    iget-object p0, p0, LU0/g;->g:LU0/e;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LU0/e;->w(Landroid/view/SurfaceControl;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
