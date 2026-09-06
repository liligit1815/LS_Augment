.class public final LZ2/b;
.super Ljava/lang/Object;
.source "BadgeState.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LZ2/b$a;
    }
.end annotation


# instance fields
.field private final a:LZ2/b$a;

.field private final b:LZ2/b$a;

.field final c:F

.field final d:F

.field final e:F

.field final f:F

.field final g:F

.field final h:F

.field final i:I

.field final j:I

.field k:I


# direct methods
.method constructor <init>(Landroid/content/Context;IIILZ2/b$a;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, LZ2/b$a;

    invoke-direct {v0}, LZ2/b$a;-><init>()V

    iput-object v0, p0, LZ2/b;->b:LZ2/b$a;

    if-nez p5, :cond_0

    .line 3
    new-instance p5, LZ2/b$a;

    invoke-direct {p5}, LZ2/b$a;-><init>()V

    :cond_0
    if-eqz p2, :cond_1

    .line 4
    invoke-static {p5, p2}, LZ2/b$a;->b(LZ2/b$a;I)I

    .line 5
    :cond_1
    invoke-static {p5}, LZ2/b$a;->a(LZ2/b$a;)I

    move-result p2

    invoke-direct {p0, p1, p2, p3, p4}, LZ2/b;->a(Landroid/content/Context;III)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    .line 7
    sget p4, LX2/l;->K:I

    const/4 v1, -0x1

    .line 8
    invoke-virtual {p2, p4, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p4

    int-to-float p4, p4

    iput p4, p0, LZ2/b;->c:F

    .line 9
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    sget v2, LX2/d;->R:I

    .line 10
    invoke-virtual {p4, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p4

    iput p4, p0, LZ2/b;->i:I

    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    sget v2, LX2/d;->T:I

    .line 12
    invoke-virtual {p4, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p4

    iput p4, p0, LZ2/b;->j:I

    .line 13
    sget p4, LX2/l;->U:I

    .line 14
    invoke-virtual {p2, p4, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p4

    int-to-float p4, p4

    iput p4, p0, LZ2/b;->d:F

    .line 15
    sget p4, LX2/l;->S:I

    sget v2, LX2/d;->p:I

    .line 16
    invoke-virtual {p3, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    invoke-virtual {p2, p4, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p4

    iput p4, p0, LZ2/b;->e:F

    .line 17
    sget p4, LX2/l;->X:I

    sget v3, LX2/d;->q:I

    .line 18
    invoke-virtual {p3, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v4

    .line 19
    invoke-virtual {p2, p4, v4}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p4

    iput p4, p0, LZ2/b;->g:F

    .line 20
    sget p4, LX2/l;->J:I

    .line 21
    invoke-virtual {p3, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    invoke-virtual {p2, p4, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p4

    iput p4, p0, LZ2/b;->f:F

    .line 22
    sget p4, LX2/l;->T:I

    .line 23
    invoke-virtual {p3, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    .line 24
    invoke-virtual {p2, p4, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p4

    iput p4, p0, LZ2/b;->h:F

    .line 25
    sget p4, LX2/l;->e0:I

    const/4 v2, 0x1

    .line 26
    invoke-virtual {p2, p4, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p4

    iput p4, p0, LZ2/b;->k:I

    .line 27
    invoke-static {p5}, LZ2/b$a;->e(LZ2/b$a;)I

    move-result p4

    const/4 v3, -0x2

    if-ne p4, v3, :cond_2

    const/16 p4, 0xff

    goto :goto_0

    :cond_2
    invoke-static {p5}, LZ2/b$a;->e(LZ2/b$a;)I

    move-result p4

    :goto_0
    invoke-static {v0, p4}, LZ2/b$a;->j(LZ2/b$a;I)I

    .line 28
    invoke-static {p5}, LZ2/b$a;->I(LZ2/b$a;)I

    move-result p4

    const/4 v4, 0x0

    if-eq p4, v3, :cond_3

    .line 29
    invoke-static {p5}, LZ2/b$a;->I(LZ2/b$a;)I

    move-result p4

    invoke-static {v0, p4}, LZ2/b$a;->L(LZ2/b$a;I)I

    goto :goto_1

    .line 30
    :cond_3
    sget p4, LX2/l;->d0:I

    invoke-virtual {p2, p4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 31
    invoke-virtual {p2, p4, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p4

    invoke-static {v0, p4}, LZ2/b$a;->L(LZ2/b$a;I)I

    goto :goto_1

    .line 32
    :cond_4
    invoke-static {v0, v1}, LZ2/b$a;->L(LZ2/b$a;I)I

    .line 33
    :goto_1
    invoke-static {p5}, LZ2/b$a;->e0(LZ2/b$a;)Ljava/lang/String;

    move-result-object p4

    if-eqz p4, :cond_5

    .line 34
    invoke-static {p5}, LZ2/b$a;->e0(LZ2/b$a;)Ljava/lang/String;

    move-result-object p4

    invoke-static {v0, p4}, LZ2/b$a;->f0(LZ2/b$a;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_2

    .line 35
    :cond_5
    sget p4, LX2/l;->N:I

    invoke-virtual {p2, p4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 36
    invoke-virtual {p2, p4}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p4

    invoke-static {v0, p4}, LZ2/b$a;->f0(LZ2/b$a;Ljava/lang/String;)Ljava/lang/String;

    .line 37
    :cond_6
    :goto_2
    invoke-static {p5}, LZ2/b$a;->g0(LZ2/b$a;)Ljava/lang/CharSequence;

    move-result-object p4

    invoke-static {v0, p4}, LZ2/b$a;->h0(LZ2/b$a;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 38
    invoke-static {p5}, LZ2/b$a;->i0(LZ2/b$a;)Ljava/lang/CharSequence;

    move-result-object p4

    if-nez p4, :cond_7

    .line 39
    sget p4, LX2/j;->s:I

    invoke-virtual {p1, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p4

    goto :goto_3

    .line 40
    :cond_7
    invoke-static {p5}, LZ2/b$a;->i0(LZ2/b$a;)Ljava/lang/CharSequence;

    move-result-object p4

    .line 41
    :goto_3
    invoke-static {v0, p4}, LZ2/b$a;->j0(LZ2/b$a;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 42
    invoke-static {p5}, LZ2/b$a;->k0(LZ2/b$a;)I

    move-result p4

    if-nez p4, :cond_8

    .line 43
    sget p4, LX2/i;->a:I

    goto :goto_4

    .line 44
    :cond_8
    invoke-static {p5}, LZ2/b$a;->k0(LZ2/b$a;)I

    move-result p4

    .line 45
    :goto_4
    invoke-static {v0, p4}, LZ2/b$a;->l0(LZ2/b$a;I)I

    .line 46
    invoke-static {p5}, LZ2/b$a;->m0(LZ2/b$a;)I

    move-result p4

    if-nez p4, :cond_9

    .line 47
    sget p4, LX2/j;->x:I

    goto :goto_5

    .line 48
    :cond_9
    invoke-static {p5}, LZ2/b$a;->m0(LZ2/b$a;)I

    move-result p4

    .line 49
    :goto_5
    invoke-static {v0, p4}, LZ2/b$a;->n0(LZ2/b$a;I)I

    .line 50
    invoke-static {p5}, LZ2/b$a;->o0(LZ2/b$a;)Ljava/lang/Boolean;

    move-result-object p4

    if-eqz p4, :cond_b

    invoke-static {p5}, LZ2/b$a;->o0(LZ2/b$a;)Ljava/lang/Boolean;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p4

    if-eqz p4, :cond_a

    goto :goto_6

    :cond_a
    move v2, v4

    :cond_b
    :goto_6
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p4

    invoke-static {v0, p4}, LZ2/b$a;->p0(LZ2/b$a;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    .line 51
    invoke-static {p5}, LZ2/b$a;->q0(LZ2/b$a;)I

    move-result p4

    if-ne p4, v3, :cond_c

    .line 52
    sget p4, LX2/l;->b0:I

    invoke-virtual {p2, p4, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p4

    goto :goto_7

    .line 53
    :cond_c
    invoke-static {p5}, LZ2/b$a;->q0(LZ2/b$a;)I

    move-result p4

    .line 54
    :goto_7
    invoke-static {v0, p4}, LZ2/b$a;->r0(LZ2/b$a;I)I

    .line 55
    invoke-static {p5}, LZ2/b$a;->g(LZ2/b$a;)I

    move-result p4

    if-ne p4, v3, :cond_d

    .line 56
    sget p4, LX2/l;->c0:I

    invoke-virtual {p2, p4, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p4

    goto :goto_8

    .line 57
    :cond_d
    invoke-static {p5}, LZ2/b$a;->g(LZ2/b$a;)I

    move-result p4

    .line 58
    :goto_8
    invoke-static {v0, p4}, LZ2/b$a;->h(LZ2/b$a;I)I

    .line 59
    invoke-static {p5}, LZ2/b$a;->l(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p4

    if-nez p4, :cond_e

    .line 60
    sget p4, LX2/l;->L:I

    sget v1, LX2/k;->a:I

    invoke-virtual {p2, p4, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p4

    goto :goto_9

    .line 61
    :cond_e
    invoke-static {p5}, LZ2/b$a;->l(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result p4

    .line 62
    :goto_9
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    .line 63
    invoke-static {v0, p4}, LZ2/b$a;->q(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 64
    invoke-static {p5}, LZ2/b$a;->r(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p4

    if-nez p4, :cond_f

    .line 65
    sget p4, LX2/l;->M:I

    invoke-virtual {p2, p4, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p4

    goto :goto_a

    .line 66
    :cond_f
    invoke-static {p5}, LZ2/b$a;->r(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result p4

    .line 67
    :goto_a
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    .line 68
    invoke-static {v0, p4}, LZ2/b$a;->t(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 69
    invoke-static {p5}, LZ2/b$a;->u(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p4

    if-nez p4, :cond_10

    .line 70
    sget p4, LX2/l;->V:I

    sget v1, LX2/k;->a:I

    invoke-virtual {p2, p4, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p4

    goto :goto_b

    .line 71
    :cond_10
    invoke-static {p5}, LZ2/b$a;->u(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result p4

    .line 72
    :goto_b
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    .line 73
    invoke-static {v0, p4}, LZ2/b$a;->v(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 74
    invoke-static {p5}, LZ2/b$a;->w(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p4

    if-nez p4, :cond_11

    .line 75
    sget p4, LX2/l;->W:I

    invoke-virtual {p2, p4, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p4

    goto :goto_c

    .line 76
    :cond_11
    invoke-static {p5}, LZ2/b$a;->w(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result p4

    .line 77
    :goto_c
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    .line 78
    invoke-static {v0, p4}, LZ2/b$a;->x(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 79
    invoke-static {p5}, LZ2/b$a;->y(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p4

    if-nez p4, :cond_12

    .line 80
    sget p4, LX2/l;->H:I

    invoke-static {p1, p2, p4}, LZ2/b;->G(Landroid/content/Context;Landroid/content/res/TypedArray;I)I

    move-result p4

    goto :goto_d

    .line 81
    :cond_12
    invoke-static {p5}, LZ2/b$a;->y(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result p4

    .line 82
    :goto_d
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    .line 83
    invoke-static {v0, p4}, LZ2/b$a;->z(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 84
    invoke-static {p5}, LZ2/b$a;->A(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p4

    if-nez p4, :cond_13

    .line 85
    sget p4, LX2/l;->O:I

    sget v1, LX2/k;->e:I

    invoke-virtual {p2, p4, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p4

    goto :goto_e

    .line 86
    :cond_13
    invoke-static {p5}, LZ2/b$a;->A(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result p4

    .line 87
    :goto_e
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    .line 88
    invoke-static {v0, p4}, LZ2/b$a;->B(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 89
    invoke-static {p5}, LZ2/b$a;->C(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p4

    if-eqz p4, :cond_14

    .line 90
    invoke-static {p5}, LZ2/b$a;->C(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0, p1}, LZ2/b$a;->D(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;

    goto :goto_f

    .line 91
    :cond_14
    sget p4, LX2/l;->P:I

    invoke-virtual {p2, p4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 92
    invoke-static {p1, p2, p4}, LZ2/b;->G(Landroid/content/Context;Landroid/content/res/TypedArray;I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 93
    invoke-static {v0, p1}, LZ2/b$a;->D(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;

    goto :goto_f

    .line 94
    :cond_15
    new-instance p4, Ln3/d;

    .line 95
    invoke-static {v0}, LZ2/b$a;->A(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-direct {p4, p1, v1}, Ln3/d;-><init>(Landroid/content/Context;I)V

    .line 96
    invoke-virtual {p4}, Ln3/d;->i()Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0, p1}, LZ2/b$a;->D(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 97
    :goto_f
    invoke-static {p5}, LZ2/b$a;->E(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p1

    if-nez p1, :cond_16

    .line 98
    sget p1, LX2/l;->I:I

    const p4, 0x800035

    invoke-virtual {p2, p1, p4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p1

    goto :goto_10

    .line 99
    :cond_16
    invoke-static {p5}, LZ2/b$a;->E(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 100
    :goto_10
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 101
    invoke-static {v0, p1}, LZ2/b$a;->F(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 102
    invoke-static {p5}, LZ2/b$a;->G(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p1

    if-nez p1, :cond_17

    .line 103
    sget p1, LX2/l;->R:I

    sget p4, LX2/d;->S:I

    .line 104
    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p4

    .line 105
    invoke-virtual {p2, p1, p4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    goto :goto_11

    .line 106
    :cond_17
    invoke-static {p5}, LZ2/b$a;->G(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 107
    :goto_11
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 108
    invoke-static {v0, p1}, LZ2/b$a;->H(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 109
    invoke-static {p5}, LZ2/b$a;->J(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p1

    if-nez p1, :cond_18

    .line 110
    sget p1, LX2/l;->Q:I

    sget p4, LX2/d;->r:I

    .line 111
    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    .line 112
    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    goto :goto_12

    .line 113
    :cond_18
    invoke-static {p5}, LZ2/b$a;->J(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 114
    :goto_12
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 115
    invoke-static {v0, p1}, LZ2/b$a;->K(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 116
    invoke-static {p5}, LZ2/b$a;->M(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p1

    if-nez p1, :cond_19

    .line 117
    sget p1, LX2/l;->Y:I

    invoke-virtual {p2, p1, v4}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result p1

    goto :goto_13

    .line 118
    :cond_19
    invoke-static {p5}, LZ2/b$a;->M(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 119
    :goto_13
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 120
    invoke-static {v0, p1}, LZ2/b$a;->N(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 121
    invoke-static {p5}, LZ2/b$a;->O(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p1

    if-nez p1, :cond_1a

    .line 122
    sget p1, LX2/l;->f0:I

    invoke-virtual {p2, p1, v4}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result p1

    goto :goto_14

    .line 123
    :cond_1a
    invoke-static {p5}, LZ2/b$a;->O(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 124
    :goto_14
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 125
    invoke-static {v0, p1}, LZ2/b$a;->P(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 126
    invoke-static {p5}, LZ2/b$a;->Q(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p1

    if-nez p1, :cond_1b

    .line 127
    sget p1, LX2/l;->Z:I

    .line 128
    invoke-static {v0}, LZ2/b$a;->M(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    .line 129
    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result p1

    goto :goto_15

    .line 130
    :cond_1b
    invoke-static {p5}, LZ2/b$a;->Q(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 131
    :goto_15
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 132
    invoke-static {v0, p1}, LZ2/b$a;->R(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 133
    invoke-static {p5}, LZ2/b$a;->S(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p1

    if-nez p1, :cond_1c

    .line 134
    sget p1, LX2/l;->g0:I

    .line 135
    invoke-static {v0}, LZ2/b$a;->O(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    .line 136
    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result p1

    goto :goto_16

    .line 137
    :cond_1c
    invoke-static {p5}, LZ2/b$a;->S(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 138
    :goto_16
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 139
    invoke-static {v0, p1}, LZ2/b$a;->T(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 140
    invoke-static {p5}, LZ2/b$a;->U(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p1

    if-nez p1, :cond_1d

    .line 141
    sget p1, LX2/l;->a0:I

    invoke-virtual {p2, p1, v4}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result p1

    goto :goto_17

    .line 142
    :cond_1d
    invoke-static {p5}, LZ2/b$a;->U(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 143
    :goto_17
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 144
    invoke-static {v0, p1}, LZ2/b$a;->V(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 145
    invoke-static {p5}, LZ2/b$a;->W(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p1

    if-nez p1, :cond_1e

    move p1, v4

    goto :goto_18

    :cond_1e
    invoke-static {p5}, LZ2/b$a;->W(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    :goto_18
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 146
    invoke-static {v0, p1}, LZ2/b$a;->X(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 147
    invoke-static {p5}, LZ2/b$a;->Y(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p1

    if-nez p1, :cond_1f

    move p1, v4

    goto :goto_19

    :cond_1f
    invoke-static {p5}, LZ2/b$a;->Y(LZ2/b$a;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    :goto_19
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 148
    invoke-static {v0, p1}, LZ2/b$a;->Z(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 149
    invoke-static {p5}, LZ2/b$a;->a0(LZ2/b$a;)Ljava/lang/Boolean;

    move-result-object p1

    if-nez p1, :cond_20

    .line 150
    sget p1, LX2/l;->G:I

    invoke-virtual {p2, p1, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    goto :goto_1a

    .line 151
    :cond_20
    invoke-static {p5}, LZ2/b$a;->a0(LZ2/b$a;)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    .line 152
    :goto_1a
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    .line 153
    invoke-static {v0, p1}, LZ2/b$a;->b0(LZ2/b$a;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    .line 154
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 155
    invoke-static {p5}, LZ2/b$a;->c0(LZ2/b$a;)Ljava/util/Locale;

    move-result-object p1

    if-nez p1, :cond_21

    .line 156
    sget-object p1, Ljava/util/Locale$Category;->FORMAT:Ljava/util/Locale$Category;

    invoke-static {p1}, Ljava/util/Locale;->getDefault(Ljava/util/Locale$Category;)Ljava/util/Locale;

    move-result-object p1

    .line 157
    invoke-static {v0, p1}, LZ2/b$a;->d0(LZ2/b$a;Ljava/util/Locale;)Ljava/util/Locale;

    goto :goto_1b

    .line 158
    :cond_21
    invoke-static {p5}, LZ2/b$a;->c0(LZ2/b$a;)Ljava/util/Locale;

    move-result-object p1

    invoke-static {v0, p1}, LZ2/b$a;->d0(LZ2/b$a;Ljava/util/Locale;)Ljava/util/Locale;

    .line 159
    :goto_1b
    iput-object p5, p0, LZ2/b;->a:LZ2/b$a;

    return-void
.end method

.method private static G(Landroid/content/Context;Landroid/content/res/TypedArray;I)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ln3/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private a(Landroid/content/Context;III)Landroid/content/res/TypedArray;
    .locals 6

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    const-string v0, "badge"

    .line 5
    .line 6
    invoke-static {p1, p2, v0}, Lcom/google/android/material/drawable/a;->i(Landroid/content/Context;ILjava/lang/CharSequence;)Landroid/util/AttributeSet;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-interface {p2}, Landroid/util/AttributeSet;->getStyleAttribute()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    :goto_0
    move-object v1, p2

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    const/4 p2, 0x0

    .line 17
    move v0, p0

    .line 18
    goto :goto_0

    .line 19
    :goto_1
    if-nez v0, :cond_1

    .line 20
    .line 21
    move v4, p4

    .line 22
    goto :goto_2

    .line 23
    :cond_1
    move v4, v0

    .line 24
    :goto_2
    sget-object v2, LX2/l;->F:[I

    .line 25
    .line 26
    new-array v5, p0, [I

    .line 27
    .line 28
    move-object v0, p1

    .line 29
    move v3, p3

    .line 30
    invoke-static/range {v0 .. v5}, Lcom/google/android/material/internal/p;->i(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method


# virtual methods
.method A()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->S(LZ2/b$a;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method B()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->O(LZ2/b$a;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method C()Z
    .locals 1

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->I(LZ2/b$a;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, -0x1

    .line 8
    if-eq p0, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method D()Z
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->e0(LZ2/b$a;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method E()Z
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->a0(LZ2/b$a;)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method F()Z
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->o0(LZ2/b$a;)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method H(I)V
    .locals 1

    .line 1
    iget-object v0, p0, LZ2/b;->a:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {v0, p1}, LZ2/b$a;->j(LZ2/b$a;I)I

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 7
    .line 8
    invoke-static {p0, p1}, LZ2/b$a;->j(LZ2/b$a;I)I

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method b()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->W(LZ2/b$a;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method c()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->Y(LZ2/b$a;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method d()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->e(LZ2/b$a;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method e()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->y(LZ2/b$a;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method f()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->E(LZ2/b$a;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method g()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->G(LZ2/b$a;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method h()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->r(LZ2/b$a;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method i()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->l(LZ2/b$a;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method j()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->C(LZ2/b$a;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method k()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->J(LZ2/b$a;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method l()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->w(LZ2/b$a;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method m()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->u(LZ2/b$a;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method n()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->m0(LZ2/b$a;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method o()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->g0(LZ2/b$a;)Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method p()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->i0(LZ2/b$a;)Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method q()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->k0(LZ2/b$a;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method r()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->Q(LZ2/b$a;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method s()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->M(LZ2/b$a;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method t()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->U(LZ2/b$a;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method u()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->q0(LZ2/b$a;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method v()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->g(LZ2/b$a;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method w()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->I(LZ2/b$a;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method x()Ljava/util/Locale;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->c0(LZ2/b$a;)Ljava/util/Locale;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method y()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->e0(LZ2/b$a;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method z()I
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b;->b:LZ2/b$a;

    .line 2
    .line 3
    invoke-static {p0}, LZ2/b$a;->A(LZ2/b$a;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
