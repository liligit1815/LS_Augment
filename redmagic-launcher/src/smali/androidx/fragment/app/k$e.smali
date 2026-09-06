.class public final Landroidx/fragment/app/k$e;
.super Landroid/animation/AnimatorListenerAdapter;
.source "DefaultSpecialEffectsController.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/fragment/app/k;->I(Ljava/util/List;Ljava/util/List;ZLjava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroidx/fragment/app/k;

.field final synthetic h:Landroid/view/View;

.field final synthetic i:Z

.field final synthetic j:Landroidx/fragment/app/W$c;

.field final synthetic k:Landroidx/fragment/app/k$a;


# direct methods
.method constructor <init>(Landroidx/fragment/app/k;Landroid/view/View;ZLandroidx/fragment/app/W$c;Landroidx/fragment/app/k$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/fragment/app/k$e;->g:Landroidx/fragment/app/k;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/fragment/app/k$e;->h:Landroid/view/View;

    .line 4
    .line 5
    iput-boolean p3, p0, Landroidx/fragment/app/k$e;->i:Z

    .line 6
    .line 7
    iput-object p4, p0, Landroidx/fragment/app/k$e;->j:Landroidx/fragment/app/W$c;

    .line 8
    .line 9
    iput-object p5, p0, Landroidx/fragment/app/k$e;->k:Landroidx/fragment/app/k$a;

    .line 10
    .line 11
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    const-string v0, "anim"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Landroidx/fragment/app/k$e;->g:Landroidx/fragment/app/k;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroidx/fragment/app/W;->q()Landroid/view/ViewGroup;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object v0, p0, Landroidx/fragment/app/k$e;->h:Landroid/view/View;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->endViewTransition(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    iget-boolean p1, p0, Landroidx/fragment/app/k$e;->i:Z

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Landroidx/fragment/app/k$e;->j:Landroidx/fragment/app/W$c;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroidx/fragment/app/W$c;->g()Landroidx/fragment/app/W$c$b;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object v0, p0, Landroidx/fragment/app/k$e;->h:Landroid/view/View;

    .line 28
    .line 29
    const-string v1, "viewToAnimate"

    .line 30
    .line 31
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroidx/fragment/app/W$c$b;->c(Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Landroidx/fragment/app/k$e;->k:Landroidx/fragment/app/k$a;

    .line 38
    .line 39
    invoke-virtual {p1}, Landroidx/fragment/app/k$b;->a()V

    .line 40
    .line 41
    .line 42
    const/4 p1, 0x2

    .line 43
    invoke-static {p1}, Landroidx/fragment/app/F;->J0(I)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    new-instance p1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    const-string v0, "Animator from operation "

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Landroidx/fragment/app/k$e;->j:Landroidx/fragment/app/W$c;

    .line 60
    .line 61
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string p0, " has ended."

    .line 65
    .line 66
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const-string p1, "FragmentManager"

    .line 74
    .line 75
    invoke-static {p1, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    :cond_1
    return-void
.end method
