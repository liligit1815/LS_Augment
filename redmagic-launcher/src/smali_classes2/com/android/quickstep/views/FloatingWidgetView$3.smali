.class Lcom/android/quickstep/views/FloatingWidgetView$3;
.super Ljava/lang/Object;
.source "FloatingWidgetView.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/FloatingWidgetView;->getDelayedAnimator()Landroid/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/views/FloatingWidgetView;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/FloatingWidgetView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetView$3;->this$0:Lcom/android/quickstep/views/FloatingWidgetView;

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
    .locals 6

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetView$3;->this$0:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/high16 v4, 0x3f800000    # 1.0f

    .line 8
    .line 9
    sget-object v5, Lcom/android/launcher3/anim/L;->I:Landroid/view/animation/Interpolator;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/high16 v2, 0x3f800000    # 1.0f

    .line 13
    .line 14
    const/high16 v3, 0x40000000    # 2.0f

    .line 15
    .line 16
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-static {p0, p1}, Lcom/android/quickstep/views/FloatingWidgetView;->i(Lcom/android/quickstep/views/FloatingWidgetView;F)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
