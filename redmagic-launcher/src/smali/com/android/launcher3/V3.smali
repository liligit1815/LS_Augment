.class public abstract Lcom/android/launcher3/V3;
.super Ljava/lang/Object;
.source "LauncherState.java"

# interfaces
.implements Lcom/android/launcher3/statemanager/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/V3$h;,
        Lcom/android/launcher3/V3$f;,
        Lcom/android/launcher3/V3$g;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/statemanager/a<",
        "Lcom/android/launcher3/V3;",
        ">;"
    }
.end annotation


# static fields
.field public static final A:Lcom/android/launcher3/V3;

.field protected static final B:Landroid/graphics/Rect;

.field public static final C:Lcom/android/launcher3/V3;

.field public static final e:I

.field public static final f:I

.field public static final g:I

.field public static final h:I

.field public static final i:I

.field public static final j:I

.field public static final k:I

.field public static final l:I

.field protected static final m:Lcom/android/launcher3/V3$f;

.field protected static final n:Lcom/android/launcher3/V3$g;

.field private static final o:[Lcom/android/launcher3/V3;

.field public static final p:Lcom/android/launcher3/V3;

.field public static final q:Lcom/android/launcher3/V3;

.field public static final r:Lcom/android/launcher3/V3;

.field public static final s:Lcom/android/launcher3/V3;

.field public static final t:Lcom/android/launcher3/V3;

.field public static final u:Lcom/android/launcher3/V3;

.field public static final v:Lcom/android/launcher3/V3;

.field public static final w:Lcom/android/launcher3/V3;

.field public static final x:Lcom/android/launcher3/V3;

.field public static final y:Lcom/android/launcher3/V3;

.field public static final z:Lcom/android/launcher3/V3;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Z

.field private final d:I


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Lcom/android/launcher3/statemanager/a;->a(I)I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    sput v1, Lcom/android/launcher3/V3;->e:I

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-static {v1}, Lcom/android/launcher3/statemanager/a;->a(I)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    sput v2, Lcom/android/launcher3/V3;->f:I

    .line 14
    .line 15
    const/4 v2, 0x2

    .line 16
    invoke-static {v2}, Lcom/android/launcher3/statemanager/a;->a(I)I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    sput v3, Lcom/android/launcher3/V3;->g:I

    .line 21
    .line 22
    const/4 v4, 0x3

    .line 23
    invoke-static {v4}, Lcom/android/launcher3/statemanager/a;->a(I)I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    sput v5, Lcom/android/launcher3/V3;->h:I

    .line 28
    .line 29
    const/4 v5, 0x4

    .line 30
    invoke-static {v5}, Lcom/android/launcher3/statemanager/a;->a(I)I

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    sput v6, Lcom/android/launcher3/V3;->i:I

    .line 35
    .line 36
    const/4 v7, 0x5

    .line 37
    invoke-static {v7}, Lcom/android/launcher3/statemanager/a;->a(I)I

    .line 38
    .line 39
    .line 40
    move-result v8

    .line 41
    sput v8, Lcom/android/launcher3/V3;->j:I

    .line 42
    .line 43
    const/4 v8, 0x6

    .line 44
    invoke-static {v8}, Lcom/android/launcher3/statemanager/a;->a(I)I

    .line 45
    .line 46
    .line 47
    move-result v9

    .line 48
    sput v9, Lcom/android/launcher3/V3;->k:I

    .line 49
    .line 50
    const/4 v9, 0x7

    .line 51
    invoke-static {v9}, Lcom/android/launcher3/statemanager/a;->a(I)I

    .line 52
    .line 53
    .line 54
    move-result v10

    .line 55
    sput v10, Lcom/android/launcher3/V3;->l:I

    .line 56
    .line 57
    new-instance v10, Lcom/android/launcher3/V3$a;

    .line 58
    .line 59
    sget-object v11, LJ0/h;->G:Landroid/view/animation/Interpolator;

    .line 60
    .line 61
    invoke-direct {v10, v11}, Lcom/android/launcher3/V3$a;-><init>(Landroid/view/animation/Interpolator;)V

    .line 62
    .line 63
    .line 64
    sput-object v10, Lcom/android/launcher3/V3;->m:Lcom/android/launcher3/V3$f;

    .line 65
    .line 66
    new-instance v10, Lcom/android/launcher3/V3$b;

    .line 67
    .line 68
    sget-object v11, LJ0/h;->L:Landroid/view/animation/Interpolator;

    .line 69
    .line 70
    invoke-direct {v10, v11}, Lcom/android/launcher3/V3$b;-><init>(Landroid/view/animation/Interpolator;)V

    .line 71
    .line 72
    .line 73
    sput-object v10, Lcom/android/launcher3/V3;->n:Lcom/android/launcher3/V3$g;

    .line 74
    .line 75
    const/16 v10, 0xd

    .line 76
    .line 77
    new-array v10, v10, [Lcom/android/launcher3/V3;

    .line 78
    .line 79
    sput-object v10, Lcom/android/launcher3/V3;->o:[Lcom/android/launcher3/V3;

    .line 80
    .line 81
    new-instance v10, Lcom/android/launcher3/V3$c;

    .line 82
    .line 83
    or-int/2addr v3, v2

    .line 84
    or-int/2addr v3, v6

    .line 85
    invoke-direct {v10, v0, v2, v3}, Lcom/android/launcher3/V3$c;-><init>(III)V

    .line 86
    .line 87
    .line 88
    sput-object v10, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 89
    .line 90
    new-instance v0, LQ1/e;

    .line 91
    .line 92
    invoke-direct {v0, v1}, LQ1/e;-><init>(I)V

    .line 93
    .line 94
    .line 95
    sput-object v0, Lcom/android/launcher3/V3;->q:Lcom/android/launcher3/V3;

    .line 96
    .line 97
    new-instance v0, LQ1/a;

    .line 98
    .line 99
    const/16 v1, 0xa

    .line 100
    .line 101
    invoke-direct {v0, v1}, LQ1/a;-><init>(I)V

    .line 102
    .line 103
    .line 104
    sput-object v0, Lcom/android/launcher3/V3;->r:Lcom/android/launcher3/V3;

    .line 105
    .line 106
    new-instance v0, Lf2/a;

    .line 107
    .line 108
    invoke-direct {v0, v7}, Lf2/a;-><init>(I)V

    .line 109
    .line 110
    .line 111
    sput-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 112
    .line 113
    new-instance v0, LQ1/b;

    .line 114
    .line 115
    invoke-direct {v0, v9}, LQ1/b;-><init>(I)V

    .line 116
    .line 117
    .line 118
    sput-object v0, Lcom/android/launcher3/V3;->t:Lcom/android/launcher3/V3;

    .line 119
    .line 120
    new-instance v0, LQ1/b;

    .line 121
    .line 122
    const/16 v1, 0x8

    .line 123
    .line 124
    invoke-direct {v0, v1, v4}, LQ1/b;-><init>(II)V

    .line 125
    .line 126
    .line 127
    sput-object v0, Lcom/android/launcher3/V3;->u:Lcom/android/launcher3/V3;

    .line 128
    .line 129
    new-instance v0, Lf2/d;

    .line 130
    .line 131
    invoke-direct {v0, v2}, Lf2/d;-><init>(I)V

    .line 132
    .line 133
    .line 134
    sput-object v0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 135
    .line 136
    invoke-static {v4}, Lf2/d;->L(I)Lf2/d;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    sput-object v0, Lcom/android/launcher3/V3;->w:Lcom/android/launcher3/V3;

    .line 141
    .line 142
    invoke-static {v5}, Lf2/d;->N(I)Lf2/d;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    sput-object v0, Lcom/android/launcher3/V3;->x:Lcom/android/launcher3/V3;

    .line 147
    .line 148
    invoke-static {v8}, Lf2/d;->K(I)Lf2/d;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    sput-object v0, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 153
    .line 154
    const/16 v0, 0x9

    .line 155
    .line 156
    invoke-static {v0}, Lf2/d;->M(I)Lf2/d;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    sput-object v0, Lcom/android/launcher3/V3;->z:Lcom/android/launcher3/V3;

    .line 161
    .line 162
    new-instance v0, Lcom/android/launcher3/menu/l;

    .line 163
    .line 164
    const/16 v1, 0xb

    .line 165
    .line 166
    invoke-direct {v0, v1}, Lcom/android/launcher3/menu/l;-><init>(I)V

    .line 167
    .line 168
    .line 169
    sput-object v0, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 170
    .line 171
    new-instance v0, Landroid/graphics/Rect;

    .line 172
    .line 173
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 174
    .line 175
    .line 176
    sput-object v0, Lcom/android/launcher3/V3;->B:Landroid/graphics/Rect;

    .line 177
    .line 178
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/A;

    .line 179
    .line 180
    const/16 v1, 0xc

    .line 181
    .line 182
    invoke-direct {v0, v1}, Lcom/android/launcher3/uioverrides/touchcontrollers/A;-><init>(I)V

    .line 183
    .line 184
    .line 185
    sput-object v0, Lcom/android/launcher3/V3;->C:Lcom/android/launcher3/V3;

    .line 186
    .line 187
    return-void
.end method

.method public constructor <init>(III)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Lcom/android/launcher3/V3;->b:I

    .line 5
    .line 6
    iput p3, p0, Lcom/android/launcher3/V3;->d:I

    .line 7
    .line 8
    sget p2, Lcom/android/launcher3/V3;->k:I

    .line 9
    .line 10
    and-int/2addr p2, p3

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    const/4 p2, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p2, 0x0

    .line 16
    :goto_0
    iput-boolean p2, p0, Lcom/android/launcher3/V3;->c:Z

    .line 17
    .line 18
    iput p1, p0, Lcom/android/launcher3/V3;->a:I

    .line 19
    .line 20
    sget-object p2, Lcom/android/launcher3/V3;->o:[Lcom/android/launcher3/V3;

    .line 21
    .line 22
    aput-object p0, p2, p1

    .line 23
    .line 24
    return-void
.end method

.method public static I()[Lcom/android/launcher3/V3;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/V3;->o:[Lcom/android/launcher3/V3;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, [Lcom/android/launcher3/V3;

    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public A(Lcom/android/launcher3/C2;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public B(Lcom/android/launcher3/C2;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected C(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public D(Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->A()Lcom/android/launcher3/statemanager/a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/android/launcher3/V3;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/android/launcher3/statemanager/d;->U(Lcom/android/launcher3/statemanager/a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public E(Lcom/android/launcher3/C2;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    if-eq p0, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/d;->A()Lcom/android/launcher3/statemanager/a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/launcher3/V3;

    .line 14
    .line 15
    new-instance v1, Lcom/android/launcher3/U3;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Lcom/android/launcher3/U3;-><init>(Lcom/android/launcher3/V3;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Lcom/android/launcher3/anim/h;->b(Ljava/util/function/Consumer;)Landroid/animation/Animator$AnimatorListener;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/statemanager/d;->K(Lcom/android/launcher3/statemanager/a;Landroid/animation/Animator$AnimatorListener;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public F(Lcom/android/launcher3/C2;F)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->A()Lcom/android/launcher3/statemanager/a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/android/launcher3/V3;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/statemanager/d;->V(Lcom/android/launcher3/statemanager/a;F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public G(Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    return-void
.end method

.method public H(Lcom/android/launcher3/C2;Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public c(Lcom/android/launcher3/C2;I)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V3;->t(Lcom/android/launcher3/C2;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    and-int/2addr p0, p2

    .line 6
    if-ne p0, p2, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public d()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final e(Landroid/content/Context;)F
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<DEVICE_PROFI",
            "LE_CONTEXT:Landroid/content/Context;",
            ":",
            "Lcom/android/launcher3/views/k;",
            ">(TDEVICE_PROFI",
            "LE_CONTEXT;",
            ")F"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 6
    .line 7
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->O0:Z

    .line 12
    .line 13
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/V3;->f(Landroid/content/Context;Z)F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public final f(Landroid/content/Context;Z)F
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<DEVICE_PROFI",
            "LE_CONTEXT:Landroid/content/Context;",
            ":",
            "Lcom/android/launcher3/views/k;",
            ">(TDEVICE_PROFI",
            "LE_CONTEXT;",
            "Z)F"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V3;->g(Landroid/content/Context;)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method protected g(Landroid/content/Context;)F
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<DEVICE_PROFI",
            "LE_CONTEXT:Landroid/content/Context;",
            ":",
            "Lcom/android/launcher3/views/k;",
            ">(TDEVICE_PROFI",
            "LE_CONTEXT;",
            ")F"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public bridge synthetic getHistoryForState(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V3;->l(Lcom/android/launcher3/V3;)Lcom/android/launcher3/V3;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h(Lcom/android/launcher3/C2;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getCurrentPageDescription()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final hasFlag(I)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/V3;->d:I

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public i(Lcom/android/launcher3/C2;)I
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x80

    .line 6
    .line 7
    invoke-virtual {p0, p1, v1}, Lcom/android/launcher3/V3;->c(Lcom/android/launcher3/C2;I)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->I0()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    iget p0, v0, Lcom/android/launcher3/h0;->p2:I

    .line 19
    .line 20
    neg-int p0, p0

    .line 21
    return p0
.end method

.method public j(Lcom/android/launcher3/C2;)I
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v1, v0, Lcom/android/launcher3/h0;->M0:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V3;->k(Lcom/android/launcher3/C2;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    iget p1, v0, Lcom/android/launcher3/h0;->T0:I

    .line 14
    .line 15
    sub-int/2addr p1, p0

    .line 16
    iget p0, v0, Lcom/android/launcher3/h0;->o2:I

    .line 17
    .line 18
    sub-int/2addr p1, p0

    .line 19
    return p1

    .line 20
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lcom/android/launcher3/Hotseat;->getQsb()Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    return p0

    .line 43
    :cond_1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getRight()I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    sub-int/2addr p0, p1

    .line 56
    return p0
.end method

.method public k(Lcom/android/launcher3/C2;)I
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/Hotseat;->getQsb()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getRight()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    sub-int/2addr p0, p1

    .line 32
    return p0

    .line 33
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method

.method public l(Lcom/android/launcher3/V3;)Lcom/android/launcher3/V3;
    .locals 0

    .line 1
    sget-object p0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V3;->x(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public o()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public p(Lcom/android/launcher3/C2;)[F
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->k2()[F

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public q(Lcom/android/launcher3/C2;)F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public r()I
    .locals 0

    .line 1
    const p0, 0x7f140201

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public s(Lcom/android/launcher3/C2;)F
    .locals 0

    .line 1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    return p0
.end method

.method public t(Lcom/android/launcher3/C2;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->H0:Z

    .line 6
    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->N0:Z

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/16 p0, 0x225

    .line 19
    .line 20
    return p0

    .line 21
    :cond_1
    :goto_0
    const/16 p0, 0x2a5

    .line 22
    .line 23
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/V3;->a:I

    .line 2
    .line 3
    invoke-static {p0}, Lc2/b;->a(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public u(Lcom/android/launcher3/C2;)F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public v(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$f;
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-eq p0, v1, :cond_0

    .line 9
    .line 10
    sget-object v1, Lcom/android/launcher3/V3;->t:Lcom/android/launcher3/V3;

    .line 11
    .line 12
    if-ne p0, v1, :cond_1

    .line 13
    .line 14
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->d1()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    move v1, v2

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 v1, 0x0

    .line 23
    :goto_0
    invoke-static {}, Lcom/android/launcher3/y0;->c()Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_2

    .line 28
    .line 29
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->H0:Z

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 34
    .line 35
    if-ne p0, v0, :cond_2

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_2
    move v2, v1

    .line 39
    :goto_1
    if-nez v2, :cond_3

    .line 40
    .line 41
    sget-object p0, Lcom/android/launcher3/V3;->m:Lcom/android/launcher3/V3$f;

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_3
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    new-instance v0, Lcom/android/launcher3/V3$d;

    .line 53
    .line 54
    sget-object v1, LJ0/h;->G:Landroid/view/animation/Interpolator;

    .line 55
    .line 56
    invoke-direct {v0, p0, v1, p1}, Lcom/android/launcher3/V3$d;-><init>(Lcom/android/launcher3/V3;Landroid/view/animation/Interpolator;I)V

    .line 57
    .line 58
    .line 59
    return-object v0
.end method

.method public w(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$g;
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/V3;->q:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    if-eq p0, v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/android/launcher3/V3;->r:Lcom/android/launcher3/V3;

    .line 6
    .line 7
    if-ne p0, v0, :cond_1

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->K0:Z

    .line 14
    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    :cond_1
    sget-object p0, Lcom/android/launcher3/V3;->n:Lcom/android/launcher3/V3$g;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_2
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPageSpacing()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    int-to-float v0, v0

    .line 29
    const/high16 v1, 0x40800000    # 4.0f

    .line 30
    .line 31
    div-float/2addr v0, v1

    .line 32
    new-instance v1, Lcom/android/launcher3/V3$e;

    .line 33
    .line 34
    sget-object v2, LJ0/h;->L:Landroid/view/animation/Interpolator;

    .line 35
    .line 36
    invoke-direct {v1, p0, v2, p1, v0}, Lcom/android/launcher3/V3$e;-><init>(Lcom/android/launcher3/V3;Landroid/view/animation/Interpolator;Lcom/android/launcher3/C2;F)V

    .line 37
    .line 38
    .line 39
    return-object v1
.end method

.method public x(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;
    .locals 1

    .line 1
    new-instance p0, Lcom/android/launcher3/V3$h;

    .line 2
    .line 3
    const/high16 p1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, v0, v0}, Lcom/android/launcher3/V3$h;-><init>(FFF)V

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public y(Lcom/android/launcher3/C2;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public z()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
