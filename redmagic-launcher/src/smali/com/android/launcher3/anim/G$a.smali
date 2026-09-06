.class Lcom/android/launcher3/anim/G$a;
.super Ljava/lang/Object;
.source "BoomField.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/anim/G;->f(Landroid/view/View;Landroid/animation/AnimatorListenerAdapter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field g:Ljava/util/Random;

.field final synthetic h:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/android/launcher3/anim/G;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/anim/G$a;->h:Landroid/view/View;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/Random;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/anim/G$a;->g:Ljava/util/Random;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/anim/G$a;->h:Landroid/view/View;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/anim/G$a;->g:Ljava/util/Random;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/Random;->nextFloat()F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/high16 v1, 0x3f000000    # 0.5f

    .line 10
    .line 11
    sub-float/2addr v0, v1

    .line 12
    iget-object v2, p0, Lcom/android/launcher3/anim/G$a;->h:Landroid/view/View;

    .line 13
    .line 14
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    int-to-float v2, v2

    .line 19
    mul-float/2addr v0, v2

    .line 20
    const v2, 0x3d4ccccd    # 0.05f

    .line 21
    .line 22
    .line 23
    mul-float/2addr v0, v2

    .line 24
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/launcher3/anim/G$a;->h:Landroid/view/View;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/anim/G$a;->g:Ljava/util/Random;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/util/Random;->nextFloat()F

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    sub-float/2addr v0, v1

    .line 36
    iget-object p0, p0, Lcom/android/launcher3/anim/G$a;->h:Landroid/view/View;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    int-to-float p0, p0

    .line 43
    mul-float/2addr v0, p0

    .line 44
    mul-float/2addr v0, v2

    .line 45
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
