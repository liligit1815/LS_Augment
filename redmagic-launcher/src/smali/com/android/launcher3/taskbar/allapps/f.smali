.class public final synthetic Lcom/android/launcher3/taskbar/allapps/f;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

.field public final synthetic h:Z

.field public final synthetic i:Landroid/view/animation/Interpolator;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;ZLandroid/view/animation/Interpolator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/allapps/f;->g:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/android/launcher3/taskbar/allapps/f;->h:Z

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/taskbar/allapps/f;->i:Landroid/view/animation/Interpolator;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/f;->g:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/allapps/f;->h:Z

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/f;->i:Landroid/view/animation/Interpolator;

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1}, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->p0(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;ZLandroid/view/animation/Interpolator;Landroid/animation/ValueAnimator;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
