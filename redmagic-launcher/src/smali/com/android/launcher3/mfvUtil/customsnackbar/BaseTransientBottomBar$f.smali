.class Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$f;
.super Ljava/lang/Object;
.source "BaseTransientBottomBar.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->T()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private g:I

.field final synthetic h:I

.field final synthetic i:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;


# direct methods
.method constructor <init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$f;->i:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$f;->h:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    iput p2, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$f;->g:I

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
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-static {}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->o()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$f;->i:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 20
    .line 21
    iget v1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$f;->g:I

    .line 22
    .line 23
    sub-int v1, p1, v1

    .line 24
    .line 25
    invoke-static {v0, v1}, LJ/I;->U(Landroid/view/View;I)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$f;->i:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 32
    .line 33
    int-to-float v1, p1

    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 35
    .line 36
    .line 37
    :goto_0
    iput p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$f;->g:I

    .line 38
    .line 39
    return-void
.end method
