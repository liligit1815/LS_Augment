.class public interface abstract LX1/b;
.super Ljava/lang/Object;
.source "BubbleStashController.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LX1/b$a;,
        LX1/b$b;,
        LX1/b$c;,
        LX1/b$d;
    }
.end annotation


# static fields
.field public static final a:LX1/b$b;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, LX1/b$b;->a:LX1/b$b;

    .line 2
    .line 3
    sput-object v0, LX1/b;->a:LX1/b$b;

    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public abstract A(F)V
.end method

.method public B()Lcom/android/launcher3/util/v1$c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/util/v1<",
            "Landroid/view/View;",
            ">.c;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public abstract C(Landroid/graphics/Rect;)V
.end method

.method public abstract D()I
.end method

.method public E()Z
    .locals 1

    .line 1
    invoke-interface {p0}, LX1/b;->o()LX1/b$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, LX1/b$a;->g:LX1/b$a;

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public abstract F()I
.end method

.method public abstract G()Z
.end method

.method public abstract H(F)V
.end method

.method public abstract I(LN2/h;)V
.end method

.method public abstract J()V
.end method

.method public b()F
    .locals 1

    .line 1
    invoke-interface {p0}, LX1/b;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, LX1/b;->k()F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-interface {p0}, LX1/b;->l()F

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public abstract c()Z
.end method

.method public abstract d(LX1/b$a;)V
.end method

.method public abstract e(ZF)V
.end method

.method public abstract f(Z)V
.end method

.method public g(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, p1, v0}, LX1/b;->m(ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public h(LN2/h;LN2/h;)V
    .locals 0

    .line 1
    const-string p0, "fromLocation"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "toLocation"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public abstract i()F
.end method

.method public abstract j()Ljava/lang/Float;
.end method

.method public abstract k()F
.end method

.method public abstract l()F
.end method

.method public abstract m(ZZ)V
.end method

.method public abstract n()V
.end method

.method public abstract o()LX1/b$a;
.end method

.method public abstract p(Landroid/view/MotionEvent;)Z
.end method

.method public abstract q()V
.end method

.method public r(LN2/h;LN2/h;)V
    .locals 0

    .line 1
    const-string p0, "fromLocation"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "toLocation"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public abstract s()LM2/i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "LM2/i<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end method

.method public abstract t(Lcom/android/launcher3/taskbar/N2;Lcom/android/launcher3/taskbar/bubbles/g0;Lcom/android/launcher3/taskbar/bubbles/A0;LX1/b$c;)V
.end method

.method public u()Z
    .locals 1

    .line 1
    invoke-interface {p0}, LX1/b;->o()LX1/b$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, LX1/b$a;->h:LX1/b$a;

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public abstract v()Z
.end method

.method public abstract w()Z
.end method

.method public abstract x()V
.end method

.method public abstract y()F
.end method

.method public abstract z(I)V
.end method
