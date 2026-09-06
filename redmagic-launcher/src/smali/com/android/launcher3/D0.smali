.class public final synthetic Lcom/android/launcher3/D0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/util/u0;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/util/u0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/D0;->g:Lcom/android/launcher3/util/u0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/D0;->g:Lcom/android/launcher3/util/u0;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/launcher3/Hotseat;->I0(Lcom/android/launcher3/util/u0;Landroid/animation/ValueAnimator;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
