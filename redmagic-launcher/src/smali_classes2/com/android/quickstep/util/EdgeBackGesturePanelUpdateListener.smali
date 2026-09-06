.class public final Lcom/android/quickstep/util/EdgeBackGesturePanelUpdateListener;
.super Ljava/lang/Object;
.source "EdgeBackGesturePanelUpdateListener.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final f5178a:I

.field public final f5179b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Lcom/android/quickstep/util/EdgeBackGesturePanelUpdateListener;->f5178a:I

    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/util/EdgeBackGesturePanelUpdateListener;->f5179b:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/EdgeBackGesturePanelUpdateListener;->f5178a:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/EdgeBackGesturePanelUpdateListener;->f5179b:Ljava/lang/Object;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;

    .line 8
    .line 9
    invoke-static {p0, p1}, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->animateSpringFactorsTo$lambda$2$lambda$1(Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;Landroid/animation/ValueAnimator;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
