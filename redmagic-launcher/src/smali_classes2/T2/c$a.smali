.class LT2/c$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SplashScreenExitAnimationUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LT2/c;->f(Landroid/view/ViewGroup;Landroid/view/SurfaceControl;ILcom/android/wm/shell/shared/m;Landroid/graphics/Rect;IIFFIILandroid/animation/Animator$AnimatorListener;F)Landroid/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:LT2/c$c;

.field final synthetic h:Landroid/view/ViewGroup;

.field final synthetic i:LT2/c$b;

.field final synthetic j:Landroid/view/View;


# direct methods
.method constructor <init>(LT2/c$c;Landroid/view/ViewGroup;LT2/c$b;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, LT2/c$a;->g:LT2/c$c;

    .line 2
    .line 3
    iput-object p2, p0, LT2/c$a;->h:Landroid/view/ViewGroup;

    .line 4
    .line 5
    iput-object p3, p0, LT2/c$a;->i:LT2/c$b;

    .line 6
    .line 7
    iput-object p4, p0, LT2/c$a;->j:Landroid/view/View;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, LT2/c$a;->g:LT2/c$c;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, LT2/c$c;->a()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p1, p0, LT2/c$a;->h:Landroid/view/ViewGroup;

    .line 12
    .line 13
    iget-object v0, p0, LT2/c$a;->i:LT2/c$b;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, LT2/c$a;->h:Landroid/view/ViewGroup;

    .line 19
    .line 20
    iget-object p0, p0, LT2/c$a;->j:Landroid/view/View;

    .line 21
    .line 22
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
