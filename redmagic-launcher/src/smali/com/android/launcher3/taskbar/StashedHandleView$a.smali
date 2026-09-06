.class Lcom/android/launcher3/taskbar/StashedHandleView$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "StashedHandleView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/StashedHandleView;->c(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/taskbar/StashedHandleView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/StashedHandleView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/StashedHandleView$a;->g:Lcom/android/launcher3/taskbar/StashedHandleView;

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
    iget-object p0, p0, Lcom/android/launcher3/taskbar/StashedHandleView$a;->g:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/StashedHandleView;->a(Lcom/android/launcher3/taskbar/StashedHandleView;Landroid/animation/ObjectAnimator;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
