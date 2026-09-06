.class Lcom/android/launcher3/Workspace$m;
.super Landroid/animation/AnimatorListenerAdapter;
.source "Workspace.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/Workspace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "m"
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/Workspace;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/Workspace;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/Workspace$m;->g:Lcom/android/launcher3/Workspace;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/L6;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/Workspace$m;-><init>(Lcom/android/launcher3/Workspace;)V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace$m;->g:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->v2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace$m;->g:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->y2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace$m;->g:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-static {p0, p1}, Lcom/android/launcher3/Workspace;->x0(Lcom/android/launcher3/Workspace;F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
