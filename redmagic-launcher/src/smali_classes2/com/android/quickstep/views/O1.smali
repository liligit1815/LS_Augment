.class public final synthetic Lcom/android/quickstep/views/O1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:Z

.field public final synthetic h:Lcom/android/quickstep/views/TaskMenuView;


# direct methods
.method public synthetic constructor <init>(ZLcom/android/quickstep/views/TaskMenuView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/android/quickstep/views/O1;->g:Z

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/views/O1;->h:Lcom/android/quickstep/views/TaskMenuView;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/views/O1;->g:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/views/O1;->h:Lcom/android/quickstep/views/TaskMenuView;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Lcom/android/quickstep/views/TaskMenuView;->U(ZLcom/android/quickstep/views/TaskMenuView;Landroid/animation/ValueAnimator;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
