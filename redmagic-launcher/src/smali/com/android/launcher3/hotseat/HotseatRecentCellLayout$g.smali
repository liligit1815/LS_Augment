.class Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$g;
.super Ljava/lang/Object;
.source "HotseatRecentCellLayout.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->P0(ILcom/android/launcher3/model/data/I;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$g;->g:Landroid/view/View;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    mul-float/2addr v0, v1

    .line 8
    const/4 v1, 0x0

    .line 9
    add-float/2addr v0, v1

    .line 10
    iget-object v1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$g;->g:Landroid/view/View;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const v0, 0x3e4ccccc    # 0.19999999f

    .line 20
    .line 21
    .line 22
    mul-float/2addr p1, v0

    .line 23
    const v0, 0x3f4ccccd    # 0.8f

    .line 24
    .line 25
    .line 26
    add-float/2addr p1, v0

    .line 27
    iget-object v0, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$g;->g:Landroid/view/View;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$g;->g:Landroid/view/View;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
