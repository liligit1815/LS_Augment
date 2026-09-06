.class public final synthetic Lcom/android/launcher3/folder/j0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/folder/u0;

.field public final synthetic h:F

.field public final synthetic i:F


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/folder/u0;FF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/folder/j0;->g:Lcom/android/launcher3/folder/u0;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/folder/j0;->h:F

    .line 7
    .line 8
    iput p3, p0, Lcom/android/launcher3/folder/j0;->i:F

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/j0;->g:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/folder/j0;->h:F

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/folder/j0;->i:F

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1}, Lcom/android/launcher3/folder/u0;->d(Lcom/android/launcher3/folder/u0;FFLandroid/animation/ValueAnimator;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
