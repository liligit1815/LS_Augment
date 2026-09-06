.class public Lu2/f;
.super Ljava/lang/Object;
.source "DelegateTransitionAnimatorController.kt"

# interfaces
.implements Lu2/c$d;


# instance fields
.field private final b:Lu2/c$d;


# direct methods
.method public constructor <init>(Lu2/c$d;)V
    .locals 1

    .line 1
    const-string v0, "delegate"

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
    iput-object p1, p0, Lu2/f;->b:Lu2/c$d;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public c(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/f;->b:Lu2/c$d;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lu2/c$d;->c(Ljava/lang/Boolean;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e()Lu2/F$k;
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/f;->b:Lu2/c$d;

    .line 2
    .line 3
    invoke-interface {p0}, Lu2/F$c;->e()Lu2/F$k;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public f()Lu2/c$f;
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/f;->b:Lu2/c$d;

    .line 2
    .line 3
    invoke-interface {p0}, Lu2/c$d;->f()Lu2/c$f;

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0
.end method

.method public h()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/f;->b:Lu2/c$d;

    .line 2
    .line 3
    invoke-interface {p0}, Lu2/F$c;->h()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public i(Lu2/F$k;FF)V
    .locals 1

    .line 1
    const-string v0, "state"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lu2/f;->b:Lu2/c$d;

    .line 7
    .line 8
    invoke-interface {p0, p1, p2, p3}, Lu2/F$c;->i(Lu2/F$k;FF)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public j(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/f;->b:Lu2/c$d;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lu2/F$c;->j(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/f;->b:Lu2/c$d;

    .line 2
    .line 3
    invoke-interface {p0}, Lu2/F$c;->l()Landroid/view/ViewGroup;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public m(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/f;->b:Lu2/c$d;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lu2/F$c;->m(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
