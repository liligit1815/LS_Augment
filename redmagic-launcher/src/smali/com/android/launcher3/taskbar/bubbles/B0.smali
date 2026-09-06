.class public final synthetic Lcom/android/launcher3/taskbar/bubbles/B0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

.field public final synthetic h:Z


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/B0;->g:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/android/launcher3/taskbar/bubbles/B0;->h:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B0;->g:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/bubbles/B0;->h:Z

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->a(Lcom/android/launcher3/taskbar/bubbles/BubbleView;ZLandroid/animation/ValueAnimator;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
