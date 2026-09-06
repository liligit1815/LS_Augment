.class Lcom/android/launcher3/q5$G$b;
.super Lu2/f;
.source "QuickstepTransitionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/q5$G;->b(Landroid/view/View;ZLandroid/window/WindowAnimationState;)Lu2/c$d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic c:Z

.field final synthetic d:Landroid/window/WindowAnimationState;


# direct methods
.method constructor <init>(Lu2/c$d;ZLandroid/window/WindowAnimationState;)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Lcom/android/launcher3/q5$G$b;->c:Z

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/launcher3/q5$G$b;->d:Landroid/window/WindowAnimationState;

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lu2/f;-><init>(Lu2/c$d;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Landroid/window/WindowAnimationState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5$G$b;->d:Landroid/window/WindowAnimationState;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/q5$G$b;->c:Z

    .line 2
    .line 3
    return p0
.end method
