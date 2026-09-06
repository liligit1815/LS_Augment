.class abstract Lcom/google/android/material/floatingactionbutton/a$l;
.super Landroid/animation/AnimatorListenerAdapter;
.source "FloatingActionButtonImpl.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/floatingactionbutton/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "l"
.end annotation


# instance fields
.field private g:Z

.field private h:F

.field private i:F

.field final synthetic j:Lcom/google/android/material/floatingactionbutton/a;


# direct methods
.method private constructor <init>(Lcom/google/android/material/floatingactionbutton/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/floatingactionbutton/a$l;->j:Lcom/google/android/material/floatingactionbutton/a;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/material/floatingactionbutton/a;Lcom/google/android/material/floatingactionbutton/a$a;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1}, Lcom/google/android/material/floatingactionbutton/a$l;-><init>(Lcom/google/android/material/floatingactionbutton/a;)V

    return-void
.end method


# virtual methods
.method protected abstract a()F
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/google/android/material/floatingactionbutton/a$l;->j:Lcom/google/android/material/floatingactionbutton/a;

    .line 2
    .line 3
    iget v0, p0, Lcom/google/android/material/floatingactionbutton/a$l;->i:F

    .line 4
    .line 5
    float-to-int v0, v0

    .line 6
    int-to-float v0, v0

    .line 7
    invoke-virtual {p1, v0}, Lcom/google/android/material/floatingactionbutton/a;->e0(F)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/google/android/material/floatingactionbutton/a$l;->g:Z

    .line 12
    .line 13
    return-void
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/floatingactionbutton/a$l;->g:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/a$l;->j:Lcom/google/android/material/floatingactionbutton/a;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/google/android/material/floatingactionbutton/a;->b:Lq3/g;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {v0}, Lq3/g;->u()F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    :goto_0
    iput v0, p0, Lcom/google/android/material/floatingactionbutton/a$l;->h:F

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/a$l;->a()F

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Lcom/google/android/material/floatingactionbutton/a$l;->i:F

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Lcom/google/android/material/floatingactionbutton/a$l;->g:Z

    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/a$l;->j:Lcom/google/android/material/floatingactionbutton/a;

    .line 29
    .line 30
    iget v1, p0, Lcom/google/android/material/floatingactionbutton/a$l;->h:F

    .line 31
    .line 32
    iget p0, p0, Lcom/google/android/material/floatingactionbutton/a$l;->i:F

    .line 33
    .line 34
    sub-float/2addr p0, v1

    .line 35
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    mul-float/2addr p0, p1

    .line 40
    add-float/2addr v1, p0

    .line 41
    float-to-int p0, v1

    .line 42
    int-to-float p0, p0

    .line 43
    invoke-virtual {v0, p0}, Lcom/google/android/material/floatingactionbutton/a;->e0(F)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
