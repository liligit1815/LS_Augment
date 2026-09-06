.class public final synthetic Lcom/android/launcher3/popup/a;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/popup/c;

.field public final synthetic h:Landroid/animation/ValueAnimator;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/popup/c;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/popup/a;->g:Lcom/android/launcher3/popup/c;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/popup/a;->h:Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/a;->g:Lcom/android/launcher3/popup/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/popup/a;->h:Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/popup/c;->N(Lcom/android/launcher3/popup/c;Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
