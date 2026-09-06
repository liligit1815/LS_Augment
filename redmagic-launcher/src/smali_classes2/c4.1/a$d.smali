.class public Lc4/a$d;
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
    name = "d"
.end annotation


# instance fields
.field protected final a:F

.field protected final b:F

.field protected final c:Lc4/a$b;

.field final synthetic d:Lc4/a;


# direct methods
.method public constructor <init>(Lc4/a;F)V
    .locals 1

    .line 1
    iput-object p1, p0, Lc4/a$d;->d:Lc4/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Lc4/a$d;->a:F

    .line 7
    .line 8
    const/high16 v0, 0x40000000    # 2.0f

    .line 9
    .line 10
    mul-float/2addr p2, v0

    .line 11
    iput p2, p0, Lc4/a$d;->b:F

    .line 12
    .line 13
    invoke-virtual {p1}, Lc4/a;->q()Lc4/a$b;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lc4/a$d;->c:Lc4/a$b;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public a(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public b(Lc4/a$e;)V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lc4/a$d;->d:Lc4/a;

    .line 2
    .line 3
    invoke-static {v0}, Lc4/a;->b(Lc4/a;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lc4/a$d;->d:Lc4/a;

    .line 10
    .line 11
    iget-object v1, v0, Lc4/a;->o:Lc4/d;

    .line 12
    .line 13
    invoke-interface {p1}, Lc4/a$e;->c()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0}, Lc4/a$d;->c()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-interface {v1, v0, p1, v2}, Lc4/d;->a(Lc4/c;II)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lc4/a$d;->d:Lc4/a;

    .line 25
    .line 26
    invoke-static {p1}, Lc4/a;->f(Lc4/a;)Landroid/view/VelocityTracker;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const/16 v0, 0x3e8

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lc4/a$d;->d:Lc4/a;

    .line 36
    .line 37
    iget-object p1, p1, Lc4/a;->j:Ld4/c;

    .line 38
    .line 39
    invoke-interface {p1}, Ld4/c;->c()Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    float-to-double v0, p1

    .line 48
    const-wide v2, -0x411b074a771c970fL    # -1.0E-5

    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    cmpg-double p1, v2, v0

    .line 54
    .line 55
    if-gez p1, :cond_0

    .line 56
    .line 57
    const-wide v2, 0x3ee4f8b588e368f1L    # 1.0E-5

    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    cmpg-double p1, v0, v2

    .line 63
    .line 64
    if-gez p1, :cond_0

    .line 65
    .line 66
    iget-object p1, p0, Lc4/a$d;->d:Lc4/a;

    .line 67
    .line 68
    invoke-static {p1}, Lc4/a;->f(Lc4/a;)Landroid/view/VelocityTracker;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->getXVelocity()F

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    goto :goto_0

    .line 77
    :cond_0
    iget-object p1, p0, Lc4/a$d;->d:Lc4/a;

    .line 78
    .line 79
    invoke-static {p1}, Lc4/a;->f(Lc4/a;)Landroid/view/VelocityTracker;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    :goto_0
    iget-object v0, p0, Lc4/a$d;->d:Lc4/a;

    .line 88
    .line 89
    invoke-static {v0}, Lc4/a;->c(Lc4/a;)Landroidx/dynamicanimation/animation/j;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0, p1}, Landroidx/dynamicanimation/animation/e;->r(F)Landroidx/dynamicanimation/animation/e;

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lc4/a$d;->d:Lc4/a;

    .line 97
    .line 98
    invoke-static {p1}, Lc4/a;->c(Lc4/a;)Landroidx/dynamicanimation/animation/j;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p1}, Landroidx/dynamicanimation/animation/e;->h()Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-nez p1, :cond_1

    .line 107
    .line 108
    iget-object p1, p0, Lc4/a$d;->d:Lc4/a;

    .line 109
    .line 110
    invoke-static {p1}, Lc4/a;->c(Lc4/a;)Landroidx/dynamicanimation/animation/j;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {p1}, Landroidx/dynamicanimation/animation/j;->t()V

    .line 115
    .line 116
    .line 117
    :cond_1
    iget-object p1, p0, Lc4/a$d;->d:Lc4/a;

    .line 118
    .line 119
    invoke-static {p1}, Lc4/a;->f(Lc4/a;)Landroid/view/VelocityTracker;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->clear()V

    .line 124
    .line 125
    .line 126
    :cond_2
    iget-object p1, p0, Lc4/a$d;->d:Lc4/a;

    .line 127
    .line 128
    iget-object v0, p1, Lc4/a;->k:Lc4/a$f;

    .line 129
    .line 130
    invoke-virtual {p1, v0}, Lc4/a;->z(Lc4/a$e;)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Lc4/a$d;->d:Lc4/a;

    .line 134
    .line 135
    const/high16 v0, 0x3f800000    # 1.0f

    .line 136
    .line 137
    invoke-static {p1, v0}, Lc4/a;->j(Lc4/a;F)V

    .line 138
    .line 139
    .line 140
    iget-object p0, p0, Lc4/a$d;->d:Lc4/a;

    .line 141
    .line 142
    invoke-static {p0, v0}, Lc4/a;->i(Lc4/a;F)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :catch_0
    move-exception p0

    .line 147
    const-string p1, "Z#QScroll-BounceSta"

    .line 148
    .line 149
    const-string v0, "handleEntryTransition error, e = "

    .line 150
    .line 151
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 152
    .line 153
    .line 154
    return-void
.end method

.method public c()I
    .locals 0

    .line 1
    const/4 p0, 0x3

    .line 2
    return p0
.end method

.method public d(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
