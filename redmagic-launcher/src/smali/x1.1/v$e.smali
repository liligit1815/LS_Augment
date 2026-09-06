.class Lx1/v$e;
.super Ljava/lang/Object;
.source "ClickScaleAnimHelper.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lx1/v;->i(Landroid/view/View;Landroid/view/View;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:F

.field final synthetic h:F

.field final synthetic i:Landroid/view/View;


# direct methods
.method constructor <init>(FFLandroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput p1, p0, Lx1/v$e;->g:F

    .line 2
    .line 3
    iput p2, p0, Lx1/v$e;->h:F

    .line 4
    .line 5
    iput-object p3, p0, Lx1/v$e;->i:Landroid/view/View;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget v0, p0, Lx1/v$e;->g:F

    .line 12
    .line 13
    iget v1, p0, Lx1/v$e;->h:F

    .line 14
    .line 15
    sub-float/2addr v1, v0

    .line 16
    mul-float/2addr v1, p1

    .line 17
    add-float/2addr v0, v1

    .line 18
    iget-object p0, p0, Lx1/v$e;->i:Landroid/view/View;

    .line 19
    .line 20
    invoke-static {p0, v0}, Lx1/v;->d(Landroid/view/View;F)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
