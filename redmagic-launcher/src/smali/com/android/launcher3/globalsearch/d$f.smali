.class Lcom/android/launcher3/globalsearch/d$f;
.super Lcom/android/launcher3/globalsearch/d$h;
.source "GSAppLocationAnim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/globalsearch/d;->k(Landroid/os/Handler;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/C2;)Lcom/android/launcher3/globalsearch/d$h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/animation/AnimatorSet;

.field final synthetic h:Landroid/animation/Animator$AnimatorListener;


# direct methods
.method constructor <init>(Lcom/android/launcher3/globalsearch/d;Landroid/animation/AnimatorSet;Landroid/animation/Animator$AnimatorListener;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/globalsearch/d$f;->g:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/launcher3/globalsearch/d$f;->h:Landroid/animation/Animator$AnimatorListener;

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/globalsearch/d$h;-><init>(Lcom/android/launcher3/globalsearch/d;Lcom/android/launcher3/globalsearch/e;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    return-void
.end method

.method public run()V
    .locals 2

    .line 1
    const-string v0, "Global_Search_GSAppLocationAnim"

    .line 2
    .line 3
    const-string v1, "iconTwinkle--run"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d$f;->g:Landroid/animation/AnimatorSet;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/launcher3/globalsearch/d$f;->h:Landroid/animation/Animator$AnimatorListener;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/d$f;->g:Landroid/animation/AnimatorSet;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 18
    .line 19
    .line 20
    return-void
.end method
