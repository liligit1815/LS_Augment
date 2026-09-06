.class Lcom/google/android/material/floatingactionbutton/a$d;
.super Ljava/lang/Object;
.source "FloatingActionButtonImpl.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/floatingactionbutton/a;->j(FFFII)Landroid/animation/AnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:F

.field final synthetic h:F

.field final synthetic i:F

.field final synthetic j:F

.field final synthetic k:F

.field final synthetic l:F

.field final synthetic m:F

.field final synthetic n:Landroid/graphics/Matrix;

.field final synthetic o:Lcom/google/android/material/floatingactionbutton/a;


# direct methods
.method constructor <init>(Lcom/google/android/material/floatingactionbutton/a;FFFFFFFLandroid/graphics/Matrix;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/floatingactionbutton/a$d;->o:Lcom/google/android/material/floatingactionbutton/a;

    .line 2
    .line 3
    iput p2, p0, Lcom/google/android/material/floatingactionbutton/a$d;->g:F

    .line 4
    .line 5
    iput p3, p0, Lcom/google/android/material/floatingactionbutton/a$d;->h:F

    .line 6
    .line 7
    iput p4, p0, Lcom/google/android/material/floatingactionbutton/a$d;->i:F

    .line 8
    .line 9
    iput p5, p0, Lcom/google/android/material/floatingactionbutton/a$d;->j:F

    .line 10
    .line 11
    iput p6, p0, Lcom/google/android/material/floatingactionbutton/a$d;->k:F

    .line 12
    .line 13
    iput p7, p0, Lcom/google/android/material/floatingactionbutton/a$d;->l:F

    .line 14
    .line 15
    iput p8, p0, Lcom/google/android/material/floatingactionbutton/a$d;->m:F

    .line 16
    .line 17
    iput-object p9, p0, Lcom/google/android/material/floatingactionbutton/a$d;->n:Landroid/graphics/Matrix;

    .line 18
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 5

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
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/a$d;->o:Lcom/google/android/material/floatingactionbutton/a;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/google/android/material/floatingactionbutton/a;->v:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 14
    .line 15
    iget v1, p0, Lcom/google/android/material/floatingactionbutton/a$d;->g:F

    .line 16
    .line 17
    iget v2, p0, Lcom/google/android/material/floatingactionbutton/a$d;->h:F

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    const v4, 0x3e4ccccd    # 0.2f

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2, v3, v4, p1}, LY2/a;->b(FFFFF)F

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setAlpha(F)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/a$d;->o:Lcom/google/android/material/floatingactionbutton/a;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/google/android/material/floatingactionbutton/a;->v:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 33
    .line 34
    iget v1, p0, Lcom/google/android/material/floatingactionbutton/a$d;->i:F

    .line 35
    .line 36
    iget v2, p0, Lcom/google/android/material/floatingactionbutton/a$d;->j:F

    .line 37
    .line 38
    invoke-static {v1, v2, p1}, LY2/a;->a(FFF)F

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {v0, v1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setScaleX(F)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/a$d;->o:Lcom/google/android/material/floatingactionbutton/a;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/google/android/material/floatingactionbutton/a;->v:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 48
    .line 49
    iget v1, p0, Lcom/google/android/material/floatingactionbutton/a$d;->k:F

    .line 50
    .line 51
    iget v2, p0, Lcom/google/android/material/floatingactionbutton/a$d;->j:F

    .line 52
    .line 53
    invoke-static {v1, v2, p1}, LY2/a;->a(FFF)F

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-virtual {v0, v1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setScaleY(F)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/a$d;->o:Lcom/google/android/material/floatingactionbutton/a;

    .line 61
    .line 62
    iget v1, p0, Lcom/google/android/material/floatingactionbutton/a$d;->l:F

    .line 63
    .line 64
    iget v2, p0, Lcom/google/android/material/floatingactionbutton/a$d;->m:F

    .line 65
    .line 66
    invoke-static {v1, v2, p1}, LY2/a;->a(FFF)F

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    invoke-static {v0, v1}, Lcom/google/android/material/floatingactionbutton/a;->c(Lcom/google/android/material/floatingactionbutton/a;F)F

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/a$d;->o:Lcom/google/android/material/floatingactionbutton/a;

    .line 74
    .line 75
    iget v1, p0, Lcom/google/android/material/floatingactionbutton/a$d;->l:F

    .line 76
    .line 77
    iget v2, p0, Lcom/google/android/material/floatingactionbutton/a$d;->m:F

    .line 78
    .line 79
    invoke-static {v1, v2, p1}, LY2/a;->a(FFF)F

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    iget-object v1, p0, Lcom/google/android/material/floatingactionbutton/a$d;->n:Landroid/graphics/Matrix;

    .line 84
    .line 85
    invoke-static {v0, p1, v1}, Lcom/google/android/material/floatingactionbutton/a;->d(Lcom/google/android/material/floatingactionbutton/a;FLandroid/graphics/Matrix;)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/google/android/material/floatingactionbutton/a$d;->o:Lcom/google/android/material/floatingactionbutton/a;

    .line 89
    .line 90
    iget-object p1, p1, Lcom/google/android/material/floatingactionbutton/a;->v:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 91
    .line 92
    iget-object p0, p0, Lcom/google/android/material/floatingactionbutton/a$d;->n:Landroid/graphics/Matrix;

    .line 93
    .line 94
    invoke-virtual {p1, p0}, Landroid/widget/ImageButton;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method
