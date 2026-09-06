.class Lb4/e$b;
.super Ljava/lang/Object;
.source "SpringAnimationCommon.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb4/e;->i(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:Lb4/e;


# direct methods
.method constructor <init>(Lb4/e;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lb4/e$b;->h:Lb4/e;

    .line 2
    .line 3
    iput p2, p0, Lb4/e$b;->g:I

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
    iget-object v0, p0, Lb4/e$b;->h:Lb4/e;

    .line 12
    .line 13
    invoke-static {v0}, Lb4/e;->b(Lb4/e;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    int-to-float v1, p1

    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 19
    .line 20
    .line 21
    iget v0, p0, Lb4/e$b;->g:I

    .line 22
    .line 23
    if-ne p1, v0, :cond_0

    .line 24
    .line 25
    iget-object p1, p0, Lb4/e$b;->h:Lb4/e;

    .line 26
    .line 27
    invoke-static {p1}, Lb4/e;->a(Lb4/e;)Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    iget-object p1, p0, Lb4/e$b;->h:Lb4/e;

    .line 34
    .line 35
    invoke-static {p1}, Lb4/e;->a(Lb4/e;)Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lb4/e$b;->h:Lb4/e;

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    invoke-static {p1, v0}, Lb4/e;->d(Lb4/e;Z)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lb4/e$b;->h:Lb4/e;

    .line 49
    .line 50
    invoke-static {p1, v0}, Lb4/e;->e(Lb4/e;Z)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lb4/e$b;->h:Lb4/e;

    .line 54
    .line 55
    invoke-virtual {p0}, Lb4/e;->p()Landroidx/dynamicanimation/animation/j;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/j;->t()V

    .line 60
    .line 61
    .line 62
    :cond_0
    return-void
.end method
