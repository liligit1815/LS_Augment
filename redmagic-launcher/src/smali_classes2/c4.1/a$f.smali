.class public Lc4/a$f;
.super Ljava/lang/Object;
.source "BaseOverScrollBounceEffectDecorator.java"

# interfaces
.implements Lc4/a$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc4/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "f"
.end annotation


# instance fields
.field final a:Lc4/a$c;

.field final synthetic b:Lc4/a;


# direct methods
.method public constructor <init>(Lc4/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lc4/a$f;->b:Lc4/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lc4/a;->r()Lc4/a$c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lc4/a$f;->a:Lc4/a$c;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lc4/a$f;->b:Lc4/a;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Lc4/a;->h(Lc4/a;Z)V

    .line 5
    .line 6
    .line 7
    return p1
.end method

.method public b(Lc4/a$e;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lc4/a$f;->b:Lc4/a;

    .line 2
    .line 3
    iget-object v1, v0, Lc4/a;->o:Lc4/d;

    .line 4
    .line 5
    invoke-interface {p1}, Lc4/a$e;->c()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0}, Lc4/a$f;->c()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-interface {v1, v0, p1, p0}, Lc4/d;->a(Lc4/c;II)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public c()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public d(Landroid/view/MotionEvent;)Z
    .locals 9

    .line 1
    iget-object v0, p0, Lc4/a$f;->b:Lc4/a;

    .line 2
    .line 3
    iget-object v0, v0, Lc4/a;->j:Ld4/c;

    .line 4
    .line 5
    invoke-interface {v0}, Ld4/c;->c()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lc4/a$f;->a:Lc4/a$c;

    .line 10
    .line 11
    invoke-virtual {v1, v0, p1}, Lc4/a$c;->a(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    return v2

    .line 19
    :cond_0
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    float-to-double v3, v1

    .line 30
    const-wide v5, -0x40e5c91d14e3bcd3L    # -1.0E-4

    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    cmpg-double v1, v5, v3

    .line 36
    .line 37
    if-gez v1, :cond_1

    .line 38
    .line 39
    const-wide v7, 0x3f1a36e2eb1c432dL    # 1.0E-4

    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    cmpg-double v1, v3, v7

    .line 45
    .line 46
    if-gez v1, :cond_1

    .line 47
    .line 48
    float-to-double v0, v0

    .line 49
    cmpg-double v3, v5, v0

    .line 50
    .line 51
    if-gez v3, :cond_1

    .line 52
    .line 53
    cmpg-double v0, v0, v7

    .line 54
    .line 55
    if-gez v0, :cond_1

    .line 56
    .line 57
    iget-object v0, p0, Lc4/a$f;->b:Lc4/a;

    .line 58
    .line 59
    const/4 v1, 0x1

    .line 60
    invoke-static {v0, v1}, Lc4/a;->g(Lc4/a;Z)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    iget-object v0, p0, Lc4/a$f;->b:Lc4/a;

    .line 65
    .line 66
    invoke-static {v0, v2}, Lc4/a;->g(Lc4/a;Z)V

    .line 67
    .line 68
    .line 69
    :cond_2
    :goto_0
    iget-object v0, p0, Lc4/a$f;->b:Lc4/a;

    .line 70
    .line 71
    iget-object v0, v0, Lc4/a;->j:Ld4/c;

    .line 72
    .line 73
    invoke-interface {v0}, Ld4/c;->b()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_3

    .line 78
    .line 79
    iget-object v0, p0, Lc4/a$f;->a:Lc4/a$c;

    .line 80
    .line 81
    iget-boolean v0, v0, Lc4/a$c;->c:Z

    .line 82
    .line 83
    if-nez v0, :cond_4

    .line 84
    .line 85
    :cond_3
    iget-object v0, p0, Lc4/a$f;->b:Lc4/a;

    .line 86
    .line 87
    iget-object v0, v0, Lc4/a;->j:Ld4/c;

    .line 88
    .line 89
    invoke-interface {v0}, Ld4/c;->a()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_5

    .line 94
    .line 95
    iget-object v0, p0, Lc4/a$f;->a:Lc4/a$c;

    .line 96
    .line 97
    iget-boolean v0, v0, Lc4/a$c;->c:Z

    .line 98
    .line 99
    if-nez v0, :cond_5

    .line 100
    .line 101
    :cond_4
    iget-object v0, p0, Lc4/a$f;->b:Lc4/a;

    .line 102
    .line 103
    iget-object v0, v0, Lc4/a;->i:Lc4/a$g;

    .line 104
    .line 105
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    iput v1, v0, Lc4/a$g;->a:I

    .line 110
    .line 111
    iget-object v0, p0, Lc4/a$f;->a:Lc4/a$c;

    .line 112
    .line 113
    const/4 v1, 0x0

    .line 114
    iput v1, v0, Lc4/a$c;->a:F

    .line 115
    .line 116
    iget-object v2, p0, Lc4/a$f;->b:Lc4/a;

    .line 117
    .line 118
    iget-object v3, v2, Lc4/a;->i:Lc4/a$g;

    .line 119
    .line 120
    iput v1, v3, Lc4/a$g;->b:F

    .line 121
    .line 122
    iget-boolean v0, v0, Lc4/a$c;->c:Z

    .line 123
    .line 124
    iput-boolean v0, v3, Lc4/a$g;->c:Z

    .line 125
    .line 126
    iget-object v0, v2, Lc4/a;->l:Lc4/a$h;

    .line 127
    .line 128
    invoke-virtual {v2, v0}, Lc4/a;->z(Lc4/a$e;)V

    .line 129
    .line 130
    .line 131
    iget-object p0, p0, Lc4/a$f;->b:Lc4/a;

    .line 132
    .line 133
    iget-object p0, p0, Lc4/a;->l:Lc4/a$h;

    .line 134
    .line 135
    invoke-virtual {p0, p1}, Lc4/a$h;->d(Landroid/view/MotionEvent;)Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    return p0

    .line 140
    :cond_5
    return v2
.end method
