.class public final synthetic Lcom/android/launcher3/f5;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/q5;

.field public final synthetic h:LP1/h;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/q5;LP1/h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/f5;->g:Lcom/android/launcher3/q5;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/f5;->h:LP1/h;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/f5;->g:Lcom/android/launcher3/q5;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/f5;->h:LP1/h;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/q5;->d(Lcom/android/launcher3/q5;LP1/h;Landroid/animation/ValueAnimator;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
