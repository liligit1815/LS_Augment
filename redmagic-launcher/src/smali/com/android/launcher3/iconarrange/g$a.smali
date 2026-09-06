.class Lcom/android/launcher3/iconarrange/g$a;
.super Ljava/lang/Object;
.source "IconConvergeAnim.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/iconarrange/g;->f(Lcom/android/launcher3/dragndrop/v;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/dragndrop/v;

.field final synthetic h:Lcom/android/launcher3/iconarrange/g;


# direct methods
.method constructor <init>(Lcom/android/launcher3/iconarrange/g;Lcom/android/launcher3/dragndrop/v;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/iconarrange/g$a;->h:Lcom/android/launcher3/iconarrange/g;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/iconarrange/g$a;->g:Lcom/android/launcher3/dragndrop/v;

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/g$a;->h:Lcom/android/launcher3/iconarrange/g;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/Float;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {v0, p1}, Lcom/android/launcher3/iconarrange/g;->c(Lcom/android/launcher3/iconarrange/g;F)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/g$a;->g:Lcom/android/launcher3/dragndrop/v;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 19
    .line 20
    .line 21
    return-void
.end method
