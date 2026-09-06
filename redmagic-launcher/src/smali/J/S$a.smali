.class LJ/S$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ViewPropertyAnimatorCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LJ/S;->h(Landroid/view/View;LJ/T;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:LJ/T;

.field final synthetic h:Landroid/view/View;

.field final synthetic i:LJ/S;


# direct methods
.method constructor <init>(LJ/S;LJ/T;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, LJ/S$a;->i:LJ/S;

    .line 2
    .line 3
    iput-object p2, p0, LJ/S$a;->g:LJ/T;

    .line 4
    .line 5
    iput-object p3, p0, LJ/S$a;->h:Landroid/view/View;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, LJ/S$a;->g:LJ/T;

    .line 2
    .line 3
    iget-object p0, p0, LJ/S$a;->h:Landroid/view/View;

    .line 4
    .line 5
    invoke-interface {p1, p0}, LJ/T;->a(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, LJ/S$a;->g:LJ/T;

    .line 2
    .line 3
    iget-object p0, p0, LJ/S$a;->h:Landroid/view/View;

    .line 4
    .line 5
    invoke-interface {p1, p0}, LJ/T;->b(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, LJ/S$a;->g:LJ/T;

    .line 2
    .line 3
    iget-object p0, p0, LJ/S$a;->h:Landroid/view/View;

    .line 4
    .line 5
    invoke-interface {p1, p0}, LJ/T;->c(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
