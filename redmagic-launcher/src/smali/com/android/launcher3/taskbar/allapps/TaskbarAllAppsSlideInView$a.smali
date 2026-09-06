.class Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView$a;
.super Ljava/lang/Object;
.source "TaskbarAllAppsSlideInView.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->y0(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView$a;->h:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView$a;->g:Z

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView$a;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView$a;->b(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic b(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView$a;->h:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->u0(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView$a;->h:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/widget/LinearLayout;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView$a;->h:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView$a;->g:Z

    .line 9
    .line 10
    new-instance v1, Lcom/android/launcher3/taskbar/allapps/h;

    .line 11
    .line 12
    invoke-direct {v1, p0, v0}, Lcom/android/launcher3/taskbar/allapps/h;-><init>(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView$a;Z)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v1}, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->t0(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView$a;->h:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->r0(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;)Landroid/os/Handler;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView$a;->h:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

    .line 25
    .line 26
    invoke-static {p0}, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->s0(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;)Ljava/lang/Runnable;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView$a;->h:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/widget/LinearLayout;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
