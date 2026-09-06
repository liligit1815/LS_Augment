.class Lcom/android/launcher3/q5$b;
.super Ljava/lang/Object;
.source "QuickstepTransitionManager.java"

# interfaces
.implements Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$OnAnimUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/q5;->s0(Landroid/animation/AnimatorSet;Landroid/view/View;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/quickstep/util/MultiValueUpdateListener;


# direct methods
.method constructor <init>(Lcom/android/launcher3/q5;Lcom/android/quickstep/util/MultiValueUpdateListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/q5$b;->a:Lcom/android/quickstep/util/MultiValueUpdateListener;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onUpdate(Landroid/graphics/RectF;FFFF)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5$b;->a:Lcom/android/quickstep/util/MultiValueUpdateListener;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Lcom/android/quickstep/util/MultiValueUpdateListener;->onAnimationUpdate(Landroid/graphics/RectF;FFFF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
