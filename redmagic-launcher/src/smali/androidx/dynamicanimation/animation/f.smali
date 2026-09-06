.class public final Landroidx/dynamicanimation/animation/f;
.super Landroidx/dynamicanimation/animation/e;
.source "FlingAnimation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/dynamicanimation/animation/f$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/dynamicanimation/animation/e<",
        "Landroidx/dynamicanimation/animation/f;",
        ">;"
    }
.end annotation


# instance fields
.field private final B:Landroidx/dynamicanimation/animation/f$a;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(TK;",
            "Landroidx/dynamicanimation/animation/g<",
            "TK;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/dynamicanimation/animation/e;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroidx/dynamicanimation/animation/f$a;

    .line 5
    .line 6
    invoke-direct {p1}, Landroidx/dynamicanimation/animation/f$a;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Landroidx/dynamicanimation/animation/f;->B:Landroidx/dynamicanimation/animation/f$a;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/e;->g()F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-virtual {p1, p0}, Landroidx/dynamicanimation/animation/f$a;->c(F)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public A(F)Landroidx/dynamicanimation/animation/f;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/dynamicanimation/animation/e;->r(F)Landroidx/dynamicanimation/animation/e;

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method s(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/dynamicanimation/animation/f;->B:Landroidx/dynamicanimation/animation/f$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/dynamicanimation/animation/f$a;->c(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method v(J)Z
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/dynamicanimation/animation/f;->B:Landroidx/dynamicanimation/animation/f$a;

    .line 2
    .line 3
    iget v1, p0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 4
    .line 5
    iget v2, p0, Landroidx/dynamicanimation/animation/e;->a:F

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2, p1, p2}, Landroidx/dynamicanimation/animation/f$a;->d(FFJ)Landroidx/dynamicanimation/animation/e$p;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget p2, p1, Landroidx/dynamicanimation/animation/e$p;->a:F

    .line 12
    .line 13
    iput p2, p0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 14
    .line 15
    iget p1, p1, Landroidx/dynamicanimation/animation/e$p;->b:F

    .line 16
    .line 17
    iput p1, p0, Landroidx/dynamicanimation/animation/e;->a:F

    .line 18
    .line 19
    iget v0, p0, Landroidx/dynamicanimation/animation/e;->h:F

    .line 20
    .line 21
    cmpg-float v1, p2, v0

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    if-gez v1, :cond_0

    .line 25
    .line 26
    iput v0, p0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 27
    .line 28
    return v2

    .line 29
    :cond_0
    iget v0, p0, Landroidx/dynamicanimation/animation/e;->g:F

    .line 30
    .line 31
    cmpl-float v1, p2, v0

    .line 32
    .line 33
    if-lez v1, :cond_1

    .line 34
    .line 35
    iput v0, p0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 36
    .line 37
    return v2

    .line 38
    :cond_1
    invoke-virtual {p0, p2, p1}, Landroidx/dynamicanimation/animation/f;->w(FF)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eqz p0, :cond_2

    .line 43
    .line 44
    return v2

    .line 45
    :cond_2
    const/4 p0, 0x0

    .line 46
    return p0
.end method

.method w(FF)Z
    .locals 1

    .line 1
    iget v0, p0, Landroidx/dynamicanimation/animation/e;->g:F

    .line 2
    .line 3
    cmpl-float v0, p1, v0

    .line 4
    .line 5
    if-gez v0, :cond_1

    .line 6
    .line 7
    iget v0, p0, Landroidx/dynamicanimation/animation/e;->h:F

    .line 8
    .line 9
    cmpg-float v0, p1, v0

    .line 10
    .line 11
    if-lez v0, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Landroidx/dynamicanimation/animation/f;->B:Landroidx/dynamicanimation/animation/f$a;

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2}, Landroidx/dynamicanimation/animation/f$a;->a(FF)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public x(F)Landroidx/dynamicanimation/animation/f;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v0, p1, v0

    .line 3
    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Landroidx/dynamicanimation/animation/f;->B:Landroidx/dynamicanimation/animation/f$a;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroidx/dynamicanimation/animation/f$a;->b(F)V

    .line 9
    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 13
    .line 14
    const-string p1, "Friction must be positive"

    .line 15
    .line 16
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw p0
.end method

.method public y(F)Landroidx/dynamicanimation/animation/f;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/dynamicanimation/animation/e;->m(F)Landroidx/dynamicanimation/animation/e;

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public z(F)Landroidx/dynamicanimation/animation/f;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/dynamicanimation/animation/e;->n(F)Landroidx/dynamicanimation/animation/e;

    .line 2
    .line 3
    .line 4
    return-object p0
.end method
