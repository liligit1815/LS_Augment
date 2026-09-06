.class Lb4/b$a;
.super Ljava/lang/Object;
.source "ClickScaleAnimHelperListener.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb4/b;->g()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lb4/b;


# direct methods
.method constructor <init>(Lb4/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lb4/b$a;->g:Lb4/b;

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
    iget-object v0, p0, Lb4/b$a;->g:Lb4/b;

    .line 12
    .line 13
    invoke-static {v0}, Lb4/b;->b(Lb4/b;)F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/high16 v1, 0x3f800000    # 1.0f

    .line 18
    .line 19
    sub-float v0, v1, v0

    .line 20
    .line 21
    mul-float/2addr v0, p1

    .line 22
    sub-float/2addr v1, v0

    .line 23
    iget-object p1, p0, Lb4/b$a;->g:Lb4/b;

    .line 24
    .line 25
    invoke-static {p1}, Lb4/b;->a(Lb4/b;)F

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    mul-float/2addr v1, p1

    .line 30
    iget-object p0, p0, Lb4/b$a;->g:Lb4/b;

    .line 31
    .line 32
    invoke-static {p0}, Lb4/b;->c(Lb4/b;)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p0, v1}, Lb4/b;->d(Landroid/view/View;F)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
