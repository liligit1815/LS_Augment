.class Lcom/android/launcher3/menu/n$a;
.super Lcom/android/launcher3/anim/g;
.source "MenuOverviewStateHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/menu/n;->d(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/V;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/android/launcher3/menu/n;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/menu/n$a;->g:Landroid/view/View;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/n$a;->g:Landroid/view/View;

    .line 2
    .line 3
    const/16 p1, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/n$a;->g:Landroid/view/View;

    .line 2
    .line 3
    const/16 p1, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
