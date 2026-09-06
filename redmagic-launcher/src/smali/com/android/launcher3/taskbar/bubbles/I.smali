.class public final synthetic Lcom/android/launcher3/taskbar/bubbles/I;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

.field public final synthetic h:Z

.field public final synthetic i:F

.field public final synthetic j:F

.field public final synthetic k:Z

.field public final synthetic l:F

.field public final synthetic m:F


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;ZFFZFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/I;->g:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/android/launcher3/taskbar/bubbles/I;->h:Z

    .line 7
    .line 8
    iput p3, p0, Lcom/android/launcher3/taskbar/bubbles/I;->i:F

    .line 9
    .line 10
    iput p4, p0, Lcom/android/launcher3/taskbar/bubbles/I;->j:F

    .line 11
    .line 12
    iput-boolean p5, p0, Lcom/android/launcher3/taskbar/bubbles/I;->k:Z

    .line 13
    .line 14
    iput p6, p0, Lcom/android/launcher3/taskbar/bubbles/I;->l:F

    .line 15
    .line 16
    iput p7, p0, Lcom/android/launcher3/taskbar/bubbles/I;->m:F

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/I;->g:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/bubbles/I;->h:Z

    .line 4
    .line 5
    iget v2, p0, Lcom/android/launcher3/taskbar/bubbles/I;->i:F

    .line 6
    .line 7
    iget v3, p0, Lcom/android/launcher3/taskbar/bubbles/I;->j:F

    .line 8
    .line 9
    iget-boolean v4, p0, Lcom/android/launcher3/taskbar/bubbles/I;->k:Z

    .line 10
    .line 11
    iget v5, p0, Lcom/android/launcher3/taskbar/bubbles/I;->l:F

    .line 12
    .line 13
    iget v6, p0, Lcom/android/launcher3/taskbar/bubbles/I;->m:F

    .line 14
    .line 15
    move-object v7, p1

    .line 16
    invoke-static/range {v0 .. v7}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->j(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;ZFFZFFLandroid/animation/ValueAnimator;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
