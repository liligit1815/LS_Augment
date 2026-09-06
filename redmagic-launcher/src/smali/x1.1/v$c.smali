.class Lx1/v$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ClickScaleAnimHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lx1/v;->o()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lx1/v;


# direct methods
.method constructor <init>(Lx1/v;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lx1/v$c;->g:Lx1/v;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;Z)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lx1/v$c;->g:Lx1/v;

    .line 5
    .line 6
    invoke-static {p1}, Lx1/v;->c(Lx1/v;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const p2, 0x7f0b015d

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p1, p2, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lx1/v$c;->g:Lx1/v;

    .line 18
    .line 19
    invoke-static {p0}, Lx1/v;->c(Lx1/v;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    instance-of p0, p0, Lcom/android/launcher3/widget/T;

    .line 24
    .line 25
    return-void
.end method
