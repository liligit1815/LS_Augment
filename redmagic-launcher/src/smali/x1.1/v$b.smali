.class Lx1/v$b;
.super Ljava/lang/Object;
.source "ClickScaleAnimHelper.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lx1/v;->o()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lx1/v;


# direct methods
.method constructor <init>(Lx1/v;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lx1/v$b;->g:Lx1/v;

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
    .locals 3

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
    iget-object v0, p0, Lx1/v$b;->g:Lx1/v;

    .line 12
    .line 13
    invoke-static {v0}, Lx1/v;->b(Lx1/v;)F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lx1/v$b;->g:Lx1/v;

    .line 18
    .line 19
    invoke-static {v1}, Lx1/v;->b(Lx1/v;)F

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/high16 v2, 0x3f800000    # 1.0f

    .line 24
    .line 25
    sub-float/2addr v2, v1

    .line 26
    mul-float/2addr v2, p1

    .line 27
    add-float/2addr v0, v2

    .line 28
    iget-object p1, p0, Lx1/v$b;->g:Lx1/v;

    .line 29
    .line 30
    invoke-static {p1}, Lx1/v;->a(Lx1/v;)F

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    mul-float/2addr v0, p1

    .line 35
    iget-object p0, p0, Lx1/v$b;->g:Lx1/v;

    .line 36
    .line 37
    invoke-static {p0}, Lx1/v;->c(Lx1/v;)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0, v0}, Lx1/v;->d(Landroid/view/View;F)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
