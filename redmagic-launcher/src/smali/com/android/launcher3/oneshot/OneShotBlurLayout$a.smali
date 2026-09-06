.class Lcom/android/launcher3/oneshot/OneShotBlurLayout$a;
.super Ljava/lang/Object;
.source "OneShotBlurLayout.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/oneshot/OneShotBlurLayout;->getOneMirrorToEndFromKeyguardAnimation()Landroid/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/widget/ImageView;

.field final synthetic h:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/oneshot/OneShotBlurLayout;Landroid/widget/ImageView;Landroid/widget/ImageView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/oneshot/OneShotBlurLayout$a;->g:Landroid/widget/ImageView;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/launcher3/oneshot/OneShotBlurLayout$a;->h:Landroid/widget/ImageView;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 10

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
    float-to-double v0, p1

    .line 12
    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    .line 13
    .line 14
    const-wide v8, 0x3ff147ae20000000L    # 1.0800000429153442

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 20
    .line 21
    const-wide/16 v4, 0x0

    .line 22
    .line 23
    invoke-static/range {v0 .. v9}, LW2/m;->a(DDDDD)D

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    double-to-float p1, v0

    .line 28
    iget-object v0, p0, Lcom/android/launcher3/oneshot/OneShotBlurLayout$a;->g:Landroid/widget/ImageView;

    .line 29
    .line 30
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setScaleX(F)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/oneshot/OneShotBlurLayout$a;->g:Landroid/widget/ImageView;

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setScaleY(F)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/oneshot/OneShotBlurLayout$a;->h:Landroid/widget/ImageView;

    .line 39
    .line 40
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setScaleX(F)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/android/launcher3/oneshot/OneShotBlurLayout$a;->h:Landroid/widget/ImageView;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleY(F)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
