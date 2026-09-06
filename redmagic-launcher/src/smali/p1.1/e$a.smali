.class Lp1/e$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "HotseatSwapAnimation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lp1/e;->f()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lp1/e;


# direct methods
.method constructor <init>(Lp1/e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lp1/e$a;->g:Lp1/e;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lp1/e$a;->g:Lp1/e;

    .line 2
    .line 3
    invoke-virtual {p1}, Lp1/e;->e()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lp1/e$a;->g:Lp1/e;

    .line 7
    .line 8
    invoke-static {p1}, Lp1/e;->b(Lp1/e;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lp1/e$a;->g:Lp1/e;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-static {p0, p1}, Lp1/e;->c(Lp1/e;Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
