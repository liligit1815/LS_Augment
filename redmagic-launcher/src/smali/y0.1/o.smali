.class public Ly0/o;
.super Ly0/g;
.source "TextKeyframeAnimation.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ly0/g<",
        "LA0/b;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "LI0/a<",
            "LA0/b;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ly0/g;-><init>(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method bridge synthetic i(LI0/a;F)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ly0/o;->p(LI0/a;F)LA0/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method p(LI0/a;F)LA0/b;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI0/a<",
            "LA0/b;",
            ">;F)",
            "LA0/b;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ly0/a;->e:LI0/c;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget v1, p1, LI0/a;->g:F

    .line 6
    .line 7
    iget-object v2, p1, LI0/a;->h:Ljava/lang/Float;

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    const v2, 0x7f7fffff    # Float.MAX_VALUE

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    :goto_0
    iget-object v3, p1, LI0/a;->b:Ljava/lang/Object;

    .line 20
    .line 21
    move-object v4, v3

    .line 22
    move-object v3, v4

    .line 23
    check-cast v3, LA0/b;

    .line 24
    .line 25
    iget-object p1, p1, LI0/a;->c:Ljava/lang/Object;

    .line 26
    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    move-object p1, v4

    .line 30
    check-cast p1, LA0/b;

    .line 31
    .line 32
    :goto_1
    move-object v4, p1

    .line 33
    goto :goto_2

    .line 34
    :cond_1
    check-cast p1, LA0/b;

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :goto_2
    invoke-virtual {p0}, Ly0/a;->d()F

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    invoke-virtual {p0}, Ly0/a;->f()F

    .line 42
    .line 43
    .line 44
    move-result v7

    .line 45
    move v5, p2

    .line 46
    invoke-virtual/range {v0 .. v7}, LI0/c;->b(FFLjava/lang/Object;Ljava/lang/Object;FFF)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, LA0/b;

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_2
    move v5, p2

    .line 54
    const/high16 p0, 0x3f800000    # 1.0f

    .line 55
    .line 56
    cmpl-float p0, v5, p0

    .line 57
    .line 58
    if-nez p0, :cond_4

    .line 59
    .line 60
    iget-object p0, p1, LI0/a;->c:Ljava/lang/Object;

    .line 61
    .line 62
    if-nez p0, :cond_3

    .line 63
    .line 64
    goto :goto_3

    .line 65
    :cond_3
    check-cast p0, LA0/b;

    .line 66
    .line 67
    return-object p0

    .line 68
    :cond_4
    :goto_3
    iget-object p0, p1, LI0/a;->b:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast p0, LA0/b;

    .line 71
    .line 72
    return-object p0
.end method

.method public q(LI0/c;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI0/c<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, LI0/b;

    .line 2
    .line 3
    invoke-direct {v0}, LI0/b;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, LA0/b;

    .line 7
    .line 8
    invoke-direct {v1}, LA0/b;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v2, Ly0/o$a;

    .line 12
    .line 13
    invoke-direct {v2, p0, v0, p1, v1}, Ly0/o$a;-><init>(Ly0/o;LI0/b;LI0/c;LA0/b;)V

    .line 14
    .line 15
    .line 16
    invoke-super {p0, v2}, Ly0/a;->n(LI0/c;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
