.class public Lcom/android/launcher3/X3;
.super Ljava/lang/Object;
.source "MFVDeviceProfile.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/X3$a;,
        Lcom/android/launcher3/X3$b;
    }
.end annotation


# instance fields
.field protected A:I

.field public final A0:Landroid/graphics/Rect;

.field private B:I

.field public B0:Z

.field public C:I

.field private D:I

.field private E:I

.field public F:I

.field public G:I

.field public H:I

.field private I:I

.field private J:I

.field public K:F

.field private L:Lcom/android/launcher3/X3$a;

.field private M:I

.field private N:I

.field public O:F

.field private P:I

.field private Q:I

.field private R:I

.field private S:I

.field private T:I

.field public U:I

.field public V:I

.field public W:I

.field private X:Z

.field public Y:I

.field public Z:I

.field private a:F

.field public a0:I

.field private b:I

.field public b0:I

.field public c:Ls1/m;

.field private c0:I

.field protected d:I

.field private d0:I

.field protected e:I

.field private e0:I

.field protected f:I

.field private f0:I

.field public g:I

.field public g0:I

.field protected h:I

.field public h0:I

.field public i:I

.field public i0:I

.field public j:I

.field public j0:I

.field public k:I

.field public k0:I

.field protected l:I

.field public l0:I

.field protected m:I

.field public m0:I

.field protected n:I

.field public n0:I

.field protected o:I

.field public o0:I

.field public p:I

.field public p0:I

.field public q:I

.field public q0:I

.field public r:I

.field public r0:I

.field public s:I

.field public s0:I

.field public t:I

.field public t0:I

.field public u:I

.field public u0:I

.field public v:I

.field public v0:I

.field public w:I

.field public w0:I

.field public x:I

.field public x0:I

.field public y:I

.field public y0:I

.field public z:I

.field public final z0:Landroid/graphics/PointF;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/android/launcher3/X3;->a:F

    .line 7
    .line 8
    const v1, 0x3f555555

    .line 9
    .line 10
    .line 11
    iput v1, p0, Lcom/android/launcher3/X3;->K:F

    .line 12
    .line 13
    new-instance v1, Landroid/graphics/PointF;

    .line 14
    .line 15
    invoke-direct {v1, v0, v0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/android/launcher3/X3;->z0:Landroid/graphics/PointF;

    .line 19
    .line 20
    new-instance v0, Landroid/graphics/Rect;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/android/launcher3/X3;->A0:Landroid/graphics/Rect;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput-boolean v0, p0, Lcom/android/launcher3/X3;->B0:Z

    .line 29
    .line 30
    return-void
.end method

.method public static h(Landroid/content/Context;)I
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const v1, 0x7f0c0034

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    int-to-float v0, v0

    .line 17
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {v0, p0}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method public static i(Landroid/content/Context;)Landroid/graphics/Point;
    .locals 7

    .line 1
    const-class v0, Landroid/view/Display;

    .line 2
    .line 3
    const-string v1, "MFVDeviceProfile"

    .line 4
    .line 5
    const-string v2, "display"

    .line 6
    .line 7
    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/hardware/display/DisplayManager;

    .line 12
    .line 13
    new-instance v2, Landroid/graphics/Point;

    .line 14
    .line 15
    invoke-direct {v2}, Landroid/graphics/Point;-><init>()V

    .line 16
    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-virtual {p0, v3}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    return-object v2

    .line 26
    :cond_0
    :try_start_0
    invoke-virtual {p0, v2}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 27
    .line 28
    .line 29
    const-string v4, "getDisplayMetrics: get display real size."

    .line 30
    .line 31
    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catch_0
    :try_start_1
    const-string v4, "getRawHeight"

    .line 36
    .line 37
    new-array v5, v3, [Ljava/lang/Class;

    .line 38
    .line 39
    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    const-string v5, "getRawWidth"

    .line 44
    .line 45
    new-array v6, v3, [Ljava/lang/Class;

    .line 46
    .line 47
    invoke-virtual {v0, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-array v5, v3, [Ljava/lang/Object;

    .line 52
    .line 53
    invoke-virtual {v0, p0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Ljava/lang/Integer;

    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iput v0, v2, Landroid/graphics/Point;->x:I

    .line 64
    .line 65
    new-array v0, v3, [Ljava/lang/Object;

    .line 66
    .line 67
    invoke-virtual {v4, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Ljava/lang/Integer;

    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    iput v0, v2, Landroid/graphics/Point;->y:I

    .line 78
    .line 79
    const-string v0, "getDisplayMetrics: get display raw data."

    .line 80
    .line 81
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :catch_1
    invoke-virtual {p0, v2}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 86
    .line 87
    .line 88
    const-string p0, "getDisplayMetrics: get display size."

    .line 89
    .line 90
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .line 97
    .line 98
    const-string v0, "getDisplayMetrics: window display size: "

    .line 99
    .line 100
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    iget v0, v2, Landroid/graphics/Point;->x:I

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string v0, ", "

    .line 109
    .line 110
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    iget v0, v2, Landroid/graphics/Point;->y:I

    .line 114
    .line 115
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    .line 124
    .line 125
    return-object v2
.end method


# virtual methods
.method public A(Lcom/android/launcher3/h0;Landroid/graphics/Rect;)V
    .locals 3

    .line 1
    iget p1, p0, Lcom/android/launcher3/X3;->A:I

    .line 2
    .line 3
    iget v0, p0, Lcom/android/launcher3/X3;->n:I

    .line 4
    .line 5
    add-int/2addr p1, v0

    .line 6
    iget v0, p0, Lcom/android/launcher3/X3;->E:I

    .line 7
    .line 8
    add-int/2addr p1, v0

    .line 9
    iget v0, p0, Lcom/android/launcher3/X3;->C:I

    .line 10
    .line 11
    iget v1, p0, Lcom/android/launcher3/X3;->z:I

    .line 12
    .line 13
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    iget-boolean v2, p0, Lcom/android/launcher3/X3;->X:Z

    .line 20
    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    iget p0, p2, Landroid/graphics/Rect;->right:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget p0, p0, Lcom/android/launcher3/X3;->C:I

    .line 27
    .line 28
    :goto_0
    invoke-virtual {p2, v0, v1, p0, p1}, Landroid/graphics/Rect;->set(IIII)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public B(Lcom/android/launcher3/h0;Lcom/android/launcher3/F1;Landroid/content/Context;IIZ)V
    .locals 12

    .line 1
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 2
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 3
    iget-boolean v1, p1, Lcom/android/launcher3/h0;->N0:Z

    iput-boolean v1, p0, Lcom/android/launcher3/X3;->X:Z

    .line 4
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    move-result v1

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/android/launcher3/X3;->X:Z

    if-eqz v1, :cond_0

    .line 5
    iget-object v1, p1, Lcom/android/launcher3/X3;->z0:Landroid/graphics/PointF;

    const v2, 0x3f19999a    # 0.6f

    invoke-virtual {v1, v2, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 6
    iget-object v1, p1, Lcom/android/launcher3/X3;->z0:Landroid/graphics/PointF;

    invoke-static {v1, p1, p3}, Lx1/O;->Y4(Landroid/graphics/PointF;Lcom/android/launcher3/h0;Landroid/content/Context;)V

    .line 7
    :cond_0
    iget-boolean v1, p0, Lcom/android/launcher3/X3;->X:Z

    if-eqz v1, :cond_1

    const v1, 0x7f0709c3

    goto :goto_0

    :cond_1
    const v1, 0x7f0709c1

    :goto_0
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/android/launcher3/X3;->n:I

    .line 8
    invoke-static {}, Lm1/a;->a()Z

    move-result v1

    if-eqz v1, :cond_2

    const v1, 0x7f0701c1

    .line 9
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/android/launcher3/X3;->n:I

    :cond_2
    const v1, 0x7f07051f

    .line 10
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/android/launcher3/X3;->o:I

    const/4 v1, 0x0

    .line 11
    iput v1, p1, Lcom/android/launcher3/h0;->E1:I

    const v2, 0x7f0702e9

    .line 12
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->H:I

    .line 13
    iget-boolean v2, p0, Lcom/android/launcher3/X3;->X:Z

    if-eqz v2, :cond_3

    const v2, 0x7f070cf0

    goto :goto_1

    :cond_3
    const v2, 0x7f070cec

    :goto_1
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->z:I

    .line 14
    iget-boolean v2, p0, Lcom/android/launcher3/X3;->X:Z

    if-eqz v2, :cond_4

    const v2, 0x7f070ce5

    .line 15
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->A:I

    goto :goto_2

    :cond_4
    const v2, 0x7f070ce1

    .line 16
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->A:I

    .line 17
    :goto_2
    invoke-static {}, Lx1/O;->k1()Z

    move-result v2

    if-eqz v2, :cond_5

    const v2, 0x7f0709c2

    .line 18
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->n:I

    const v2, 0x7f070ced

    .line 19
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->z:I

    const v2, 0x7f070ce2

    .line 20
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->A:I

    :cond_5
    const v2, 0x7f0709c4

    .line 21
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->B:I

    .line 22
    iget-boolean v2, p0, Lcom/android/launcher3/X3;->X:Z

    if-eqz v2, :cond_6

    const v2, 0x7f070cea

    :goto_3
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_4

    :cond_6
    const v2, 0x7f070ce6

    goto :goto_3

    :goto_4
    iput v2, p0, Lcom/android/launcher3/X3;->C:I

    .line 23
    invoke-static {}, Lx1/O;->k1()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 24
    iget-boolean v2, p1, Lcom/android/launcher3/h0;->P0:Z

    if-eqz v2, :cond_7

    move v2, v1

    goto :goto_5

    :cond_7
    const v2, 0x7f0709c5

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    :goto_5
    iput v2, p0, Lcom/android/launcher3/X3;->B:I

    const v2, 0x7f070ce7

    .line 25
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->C:I

    .line 26
    :cond_8
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->p()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 27
    iput v1, p0, Lcom/android/launcher3/X3;->z:I

    .line 28
    iput v1, p0, Lcom/android/launcher3/X3;->C:I

    .line 29
    :cond_9
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->s()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 30
    iget-boolean v2, p2, Lcom/android/launcher3/r4;->M:Z

    if-eqz v2, :cond_a

    const v2, 0x7f070cef

    .line 31
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->z:I

    const v2, 0x7f070ce9

    .line 32
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->C:I

    const v2, 0x7f070ce4

    .line 33
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->A:I

    goto :goto_6

    :cond_a
    const v2, 0x7f070cee

    .line 34
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->z:I

    const v2, 0x7f070ce8

    .line 35
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->C:I

    const v2, 0x7f070ce3

    .line 36
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->A:I

    .line 37
    :cond_b
    :goto_6
    invoke-static {}, Lm1/a;->a()Z

    move-result v2

    const v3, 0x7f0701c2

    if-eqz v2, :cond_c

    const v2, 0x7f070cf1

    .line 38
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->z:I

    .line 39
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->A:I

    .line 40
    :cond_c
    invoke-static {}, Lm1/a;->b()Z

    move-result v2

    if-eqz v2, :cond_d

    const v2, 0x7f070cf2

    .line 41
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->z:I

    .line 42
    :cond_d
    iget v2, p0, Lcom/android/launcher3/X3;->C:I

    iput v2, p1, Lcom/android/launcher3/h0;->m1:I

    .line 43
    iget-boolean v2, p0, Lcom/android/launcher3/X3;->X:Z

    if-eqz v2, :cond_e

    const v2, 0x7f070186

    goto :goto_7

    :cond_e
    const v2, 0x7f070184

    :goto_7
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->s:I

    .line 44
    invoke-static {}, Lx1/O;->k1()Z

    move-result v2

    if-eqz v2, :cond_f

    const v2, 0x7f070185

    .line 45
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->s:I

    .line 46
    :cond_f
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->s()Z

    move-result v2

    if-eqz v2, :cond_10

    const v2, 0x7f070180

    .line 47
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_8

    :cond_10
    const v2, 0x7f07017f

    .line 48
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    :goto_8
    iput v2, p0, Lcom/android/launcher3/X3;->t:I

    .line 49
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->s()Z

    move-result v2

    if-eqz v2, :cond_11

    const v2, 0x7f070181

    .line 50
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_9

    :cond_11
    const v2, 0x7f070183

    .line 51
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    :goto_9
    iput v2, p0, Lcom/android/launcher3/X3;->v:I

    const v2, 0x7f070182

    .line 52
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->u:I

    const v2, 0x7f070ab4

    .line 53
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    int-to-float v2, v2

    iget v4, p0, Lcom/android/launcher3/X3;->a:F

    mul-float/2addr v2, v4

    float-to-int v2, v2

    iput v2, p0, Lcom/android/launcher3/X3;->p:I

    const v2, 0x7f070ab3

    .line 54
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    int-to-float v2, v2

    iget v4, p0, Lcom/android/launcher3/X3;->a:F

    mul-float/2addr v2, v4

    float-to-int v2, v2

    iput v2, p0, Lcom/android/launcher3/X3;->q:I

    .line 55
    iget v4, p0, Lcom/android/launcher3/X3;->p:I

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->r:I

    .line 56
    iget v4, p0, Lcom/android/launcher3/X3;->s:I

    sub-int/2addr v4, v2

    iput v4, p0, Lcom/android/launcher3/X3;->F:I

    .line 57
    iget-boolean v2, p0, Lcom/android/launcher3/X3;->X:Z

    if-eqz v2, :cond_12

    move v2, v1

    goto :goto_a

    :cond_12
    const v2, 0x7f070350

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v2

    :goto_a
    iput v2, p0, Lcom/android/launcher3/X3;->U:I

    const v2, 0x7f07097f

    .line 58
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->d:I

    const v2, 0x7f070993

    .line 59
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->e:I

    .line 60
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->s()Z

    move-result v2

    if-eqz v2, :cond_13

    const v2, 0x7f070980

    .line 61
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->d:I

    :cond_13
    const v2, 0x7f0709c7

    .line 62
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->f:I

    .line 63
    invoke-static {}, Lm1/a;->a()Z

    move-result v2

    if-eqz v2, :cond_14

    .line 64
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->f:I

    :cond_14
    const v2, 0x7f070522

    .line 65
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->i:I

    const v2, 0x7f0709c8

    .line 66
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->g:I

    const v2, 0x7f070521

    .line 67
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->j:I

    const v2, 0x7f0709bf

    .line 68
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->h:I

    const v2, 0x7f07051e

    .line 69
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->k:I

    .line 70
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 71
    iget-boolean v2, p0, Lcom/android/launcher3/X3;->X:Z

    if-eqz v2, :cond_15

    const v2, 0x7f070afb

    :goto_b
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_c

    :cond_15
    const v2, 0x7f070afa

    goto :goto_b

    :goto_c
    iput v2, p0, Lcom/android/launcher3/X3;->f:I

    .line 72
    iget-boolean v2, p0, Lcom/android/launcher3/X3;->X:Z

    if-eqz v2, :cond_17

    invoke-virtual {p1}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    if-lez v2, :cond_16

    const v2, 0x7f070b05

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_e

    :cond_16
    const v2, 0x7f070b06

    .line 73
    :goto_d
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_e

    :cond_17
    const v2, 0x7f070b04

    goto :goto_d

    :goto_e
    iput v2, p0, Lcom/android/launcher3/X3;->J:I

    .line 74
    iget-boolean v2, p0, Lcom/android/launcher3/X3;->X:Z

    if-eqz v2, :cond_19

    invoke-virtual {p1}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    if-lez v2, :cond_18

    const v2, 0x7f070b02

    :goto_f
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_10

    :cond_18
    const v2, 0x7f070b03

    goto :goto_f

    :cond_19
    const v2, 0x7f070b01

    .line 75
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    :goto_10
    iput v2, p0, Lcom/android/launcher3/X3;->I:I

    .line 76
    invoke-static {}, Lx1/O;->k1()Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 77
    invoke-static {p3}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    move-result-object v2

    iget-boolean v2, v2, Lcom/android/launcher3/util/C1;->g:Z

    if-eqz v2, :cond_1a

    move v2, v1

    goto :goto_11

    :cond_1a
    const v2, 0x7f070491

    .line 78
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    :goto_11
    iput v2, p0, Lcom/android/launcher3/X3;->I:I

    :cond_1b
    const v2, 0x7f07022b

    .line 79
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/android/launcher3/X3;->l:I

    const v2, 0x7f07022c

    .line 80
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/android/launcher3/X3;->m:I

    .line 81
    new-instance v3, Lcom/android/launcher3/X3$a;

    move-object v4, p0

    move-object v5, p1

    move-object v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    invoke-direct/range {v3 .. v9}, Lcom/android/launcher3/X3$a;-><init>(Lcom/android/launcher3/X3;Lcom/android/launcher3/h0;Landroid/content/Context;IIZ)V

    iput-object v3, p0, Lcom/android/launcher3/X3;->L:Lcom/android/launcher3/X3$a;

    if-eqz p6, :cond_1c

    .line 82
    iput v1, p0, Lcom/android/launcher3/X3;->V:I

    goto :goto_12

    :cond_1c
    const v2, 0x7f0702f0

    .line 83
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->V:I

    :goto_12
    const v2, 0x7f0702ef

    .line 84
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->W:I

    const v2, 0x7f070497

    .line 85
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->D:I

    .line 86
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->s()Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 87
    iget-object v2, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    iget-boolean v2, v2, Lcom/android/launcher3/r4;->M:Z

    if-eqz v2, :cond_1d

    const v2, 0x7f070499

    .line 88
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->D:I

    goto :goto_13

    :cond_1d
    const v2, 0x7f070498

    .line 89
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->D:I

    .line 90
    :cond_1e
    :goto_13
    invoke-static {}, Lm1/a;->a()Z

    move-result v2

    if-eqz v2, :cond_1f

    const v2, 0x7f0701b8

    .line 91
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->D:I

    .line 92
    :cond_1f
    iget-boolean v2, p1, Lcom/android/launcher3/h0;->N0:Z

    if-eqz v2, :cond_20

    iget-boolean v2, p1, Lcom/android/launcher3/h0;->I0:Z

    if-nez v2, :cond_21

    .line 93
    :cond_20
    iget v2, p0, Lcom/android/launcher3/X3;->D:I

    iget v3, p2, Lcom/android/launcher3/r4;->R:I

    add-int/2addr v2, v3

    iput v2, p0, Lcom/android/launcher3/X3;->E:I

    .line 94
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    move-result v2

    if-eqz v2, :cond_21

    .line 95
    iget v2, p0, Lcom/android/launcher3/X3;->D:I

    iget v3, p0, Lcom/android/launcher3/X3;->I:I

    add-int/2addr v2, v3

    iput v2, p0, Lcom/android/launcher3/X3;->E:I

    .line 96
    :cond_21
    invoke-static {}, Lx1/O;->k1()Z

    move-result v2

    if-eqz v2, :cond_22

    .line 97
    iput v1, p0, Lcom/android/launcher3/X3;->E:I

    iput v1, p0, Lcom/android/launcher3/X3;->D:I

    .line 98
    :cond_22
    iget-boolean v2, p1, Lcom/android/launcher3/h0;->N0:Z

    if-eqz v2, :cond_24

    iget-boolean v2, p1, Lcom/android/launcher3/h0;->I0:Z

    if-nez v2, :cond_23

    goto :goto_15

    .line 99
    :cond_23
    iget v2, p1, Lcom/android/launcher3/h0;->U0:I

    iget v3, p2, Lcom/android/launcher3/r4;->Q:I

    sub-int/2addr v2, v3

    iget v3, p0, Lcom/android/launcher3/X3;->n:I

    sub-int/2addr v2, v3

    iget v3, p0, Lcom/android/launcher3/X3;->z:I

    iget v7, p0, Lcom/android/launcher3/X3;->A:I

    add-int/2addr v3, v7

    sub-int/2addr v2, v3

    .line 100
    invoke-static {}, Lm1/a;->a()Z

    move-result v3

    if-eqz v3, :cond_25

    .line 101
    iget v2, p1, Lcom/android/launcher3/h0;->U0:I

    iget v3, p2, Lcom/android/launcher3/r4;->Q:I

    sub-int/2addr v2, v3

    iget v3, p0, Lcom/android/launcher3/X3;->z:I

    sub-int/2addr v2, v3

    iget v3, p0, Lcom/android/launcher3/X3;->n:I

    sub-int/2addr v2, v3

    iget v3, p0, Lcom/android/launcher3/X3;->A:I

    :goto_14
    sub-int/2addr v2, v3

    goto :goto_16

    .line 102
    :cond_24
    :goto_15
    iget v2, p1, Lcom/android/launcher3/h0;->U0:I

    iget v3, p2, Lcom/android/launcher3/r4;->Q:I

    sub-int/2addr v2, v3

    iget v3, p0, Lcom/android/launcher3/X3;->n:I

    sub-int/2addr v2, v3

    iget v3, p0, Lcom/android/launcher3/X3;->z:I

    iget v7, p0, Lcom/android/launcher3/X3;->A:I

    add-int/2addr v3, v7

    sub-int/2addr v2, v3

    iget v3, p0, Lcom/android/launcher3/X3;->E:I

    goto :goto_14

    .line 103
    :cond_25
    :goto_16
    iget-object v3, p1, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    iget v3, v3, Landroid/graphics/Point;->y:I

    iget v7, p2, Lcom/android/launcher3/F1;->G0:I

    invoke-static {v2, v3, v7}, Lcom/android/launcher3/h0;->O(III)I

    move-result v3

    iput v3, p0, Lcom/android/launcher3/X3;->y:I

    .line 104
    iget v3, p1, Lcom/android/launcher3/h0;->T0:I

    iget v7, p0, Lcom/android/launcher3/X3;->C:I

    mul-int/lit8 v8, v7, 0x2

    sub-int v8, v3, v8

    mul-int/lit8 v7, v7, 0x2

    sub-int/2addr v3, v7

    .line 105
    iget v7, p2, Lcom/android/launcher3/F1;->d1:I

    div-int/2addr v3, v7

    .line 106
    iget-boolean v7, p1, Lcom/android/launcher3/h0;->N0:Z

    const/4 v9, 0x1

    if-eqz v7, :cond_26

    iget-boolean v7, p1, Lcom/android/launcher3/h0;->I0:Z

    if-eqz v7, :cond_26

    .line 107
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 108
    invoke-virtual {p0, p1, v3}, Lcom/android/launcher3/X3;->A(Lcom/android/launcher3/h0;Landroid/graphics/Rect;)V

    .line 109
    iget v7, v3, Landroid/graphics/Rect;->left:I

    iget v3, v3, Landroid/graphics/Rect;->right:I

    add-int/2addr v7, v3

    sub-int v8, p4, v7

    .line 110
    iget-object v3, p1, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    iget v3, v3, Landroid/graphics/Point;->x:I

    iget v7, p2, Lcom/android/launcher3/F1;->H0:I

    add-int/2addr v7, v9

    invoke-static {v8, v3, v7}, Lcom/android/launcher3/h0;->P(III)I

    move-result v3

    iput v3, p0, Lcom/android/launcher3/X3;->x:I

    goto :goto_17

    .line 111
    :cond_26
    iget-object v7, p1, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    iget v7, v7, Landroid/graphics/Point;->x:I

    iget v10, p2, Lcom/android/launcher3/F1;->H0:I

    invoke-static {v8, v7, v10}, Lcom/android/launcher3/h0;->P(III)I

    move-result v7

    iput v7, p0, Lcom/android/launcher3/X3;->x:I

    .line 112
    :goto_17
    invoke-static {}, Lx1/O;->k1()Z

    move-result v7

    if-eqz v7, :cond_28

    .line 113
    invoke-static {p3}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    move-result-object v7

    invoke-virtual {v7, p3}, Lcom/android/launcher3/b0;->i(Landroid/content/Context;)Landroid/graphics/Point;

    move-result-object v7

    if-eqz v7, :cond_27

    .line 114
    iget v10, v7, Landroid/graphics/Point;->x:I

    iput v10, p2, Lcom/android/launcher3/F1;->G0:I

    .line 115
    iget v10, v7, Landroid/graphics/Point;->y:I

    iput v10, p2, Lcom/android/launcher3/F1;->H0:I

    .line 116
    :cond_27
    iget-object v10, p1, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    iget v10, v10, Landroid/graphics/Point;->y:I

    iget v11, v7, Landroid/graphics/Point;->x:I

    invoke-static {v2, v10, v11}, Lcom/android/launcher3/h0;->O(III)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->y:I

    .line 117
    iget-object v2, p1, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->x:I

    iget v7, v7, Landroid/graphics/Point;->y:I

    invoke-static {v8, v2, v7}, Lcom/android/launcher3/h0;->P(III)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->x:I

    .line 118
    :cond_28
    iget v2, p0, Lcom/android/launcher3/X3;->x:I

    if-ge v3, v2, :cond_29

    goto :goto_18

    :cond_29
    move v3, v2

    :goto_18
    iput v3, p0, Lcom/android/launcher3/X3;->b:I

    .line 119
    iget-boolean v2, p1, Lcom/android/launcher3/h0;->N0:Z

    const v3, 0x7f0704ad

    const v7, 0x7f0704a9

    if-eqz v2, :cond_2a

    .line 120
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/android/launcher3/X3;->M:I

    .line 121
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/android/launcher3/X3;->N:I

    .line 122
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070bce

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->P:I

    .line 123
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070bca

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->Q:I

    goto :goto_19

    .line 124
    :cond_2a
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/android/launcher3/X3;->M:I

    .line 125
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/android/launcher3/X3;->N:I

    .line 126
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070bcd

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->P:I

    .line 127
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070bc9

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->Q:I

    .line 128
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070bcc

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->R:I

    .line 129
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070bcb

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->S:I

    .line 130
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070bcf

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->T:I

    .line 131
    :goto_19
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->s()Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 132
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0704ae

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/android/launcher3/X3;->M:I

    .line 133
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0704aa

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/android/launcher3/X3;->N:I

    :cond_2b
    const v2, 0x7f0c0063

    .line 134
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x42c80000    # 100.0f

    div-float/2addr v2, v3

    iput v2, p0, Lcom/android/launcher3/X3;->O:F

    .line 135
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    move-result v2

    if-eqz v2, :cond_2c

    const v2, 0x7f0c0065

    .line 136
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v3

    iput v2, p0, Lcom/android/launcher3/X3;->O:F

    .line 137
    :cond_2c
    iget-boolean v2, p2, Lcom/android/launcher3/r4;->Y:Z

    if-nez v2, :cond_2d

    invoke-static {}, Lm1/a;->a()Z

    move-result v2

    if-eqz v2, :cond_2f

    :cond_2d
    const v2, 0x7f0701c4

    .line 138
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->a0:I

    const v2, 0x7f0701bd

    .line 139
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/android/launcher3/X3;->Y:I

    const v3, 0x7f0704ba

    .line 140
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    iput v7, p1, Lcom/android/launcher3/h0;->E1:I

    .line 141
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->Z:I

    .line 142
    invoke-static {}, Lm1/a;->a()Z

    move-result v2

    const v7, 0x7f0701c5

    const v8, 0x7f0701c0

    if-eqz v2, :cond_2e

    .line 143
    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->a0:I

    .line 144
    invoke-virtual {v0, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->Y:I

    .line 145
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p1, Lcom/android/launcher3/h0;->E1:I

    .line 146
    invoke-virtual {v0, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->Z:I

    .line 147
    :cond_2e
    invoke-static {}, Lm1/a;->b()Z

    move-result v2

    if-eqz v2, :cond_2f

    .line 148
    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->a0:I

    .line 149
    invoke-virtual {v0, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/X3;->Y:I

    const v2, 0x7f0704be

    .line 150
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p1, Lcom/android/launcher3/h0;->E1:I

    .line 151
    invoke-virtual {v0, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/launcher3/X3;->Z:I

    .line 152
    :cond_2f
    iget v0, p1, Lcom/android/launcher3/h0;->U0:I

    iget v2, p2, Lcom/android/launcher3/r4;->Q:I

    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v7, 0x7f070361

    invoke-virtual {v3, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    add-int/2addr v2, v3

    mul-int/lit8 v2, v2, 0x2

    sub-int/2addr v0, v2

    .line 153
    iget-object v2, p1, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->y:I

    iget-object v3, p2, Lcom/android/launcher3/F1;->J0:[I

    aget v3, v3, v1

    add-int/2addr v3, v9

    invoke-static {v0, v2, v3}, Lcom/android/launcher3/h0;->O(III)I

    move-result v0

    iput v0, p0, Lcom/android/launcher3/X3;->b0:I

    .line 154
    iget-boolean v0, p1, Lcom/android/launcher3/h0;->N0:Z

    if-eqz v0, :cond_31

    .line 155
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    move-result v0

    if-eqz v0, :cond_30

    .line 156
    iget v0, p2, Lcom/android/launcher3/r4;->Q:I

    sub-int v0, p5, v0

    iget v2, p0, Lcom/android/launcher3/X3;->W:I

    sub-int/2addr v0, v2

    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070362

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    sub-int/2addr v0, v2

    .line 157
    iget-object v2, p1, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->y:I

    iget-object p2, p2, Lcom/android/launcher3/F1;->J0:[I

    aget p2, p2, v9

    add-int/2addr p2, v9

    invoke-static {v0, v2, p2}, Lcom/android/launcher3/h0;->O(III)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/X3;->b0:I

    goto :goto_1a

    .line 158
    :cond_30
    iget v0, p2, Lcom/android/launcher3/r4;->Q:I

    sub-int v0, p5, v0

    iget v2, p0, Lcom/android/launcher3/X3;->W:I

    sub-int/2addr v0, v2

    .line 159
    iget-object v2, p1, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->y:I

    iget-object p2, p2, Lcom/android/launcher3/F1;->J0:[I

    aget p2, p2, v9

    invoke-static {v0, v2, p2}, Lcom/android/launcher3/h0;->O(III)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/X3;->b0:I

    .line 160
    :cond_31
    :goto_1a
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f070188

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/X3;->w:I

    .line 161
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    move-result p2

    if-eqz p2, :cond_32

    const/high16 p2, 0x3f800000    # 1.0f

    .line 162
    iput p2, p0, Lcom/android/launcher3/X3;->K:F

    .line 163
    :cond_32
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0704b0

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/X3;->c0:I

    .line 164
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    iget-boolean v0, p0, Lcom/android/launcher3/X3;->X:Z

    if-eqz v0, :cond_33

    const v0, 0x7f0c0091

    goto :goto_1b

    :cond_33
    const v0, 0x7f0c0090

    :goto_1b
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p2

    int-to-float p2, p2

    invoke-static {p2}, Lcom/android/launcher3/N5;->T(F)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/X3;->d0:I

    .line 165
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0c008e

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p2

    int-to-float p2, p2

    invoke-static {p2}, Lcom/android/launcher3/N5;->T(F)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/X3;->e0:I

    .line 166
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    move-result p2

    if-eqz p2, :cond_35

    .line 167
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    iget-boolean v2, p0, Lcom/android/launcher3/X3;->X:Z

    if-eqz v2, :cond_34

    const v0, 0x7f0c008f

    :cond_34
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p2

    int-to-float p2, p2

    .line 168
    invoke-static {p2}, Lcom/android/launcher3/N5;->T(F)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/X3;->e0:I

    .line 169
    :cond_35
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/launcher3/resource/B;->s()Z

    move-result p2

    if-eqz p2, :cond_36

    .line 170
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0704b1

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/X3;->c0:I

    .line 171
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0704b5

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/X3;->e0:I

    .line 172
    :cond_36
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/launcher3/resource/B;->s()Z

    move-result p2

    if-eqz p2, :cond_37

    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    iget-boolean p1, p1, Lcom/android/launcher3/r4;->M:Z

    if-eqz p1, :cond_37

    .line 173
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0709ca

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/X3;->f0:I

    goto :goto_1d

    .line 174
    :cond_37
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget-boolean p2, p0, Lcom/android/launcher3/X3;->X:Z

    if-eqz p2, :cond_38

    const p2, 0x7f0709cb

    goto :goto_1c

    :cond_38
    const p2, 0x7f0709c9

    :goto_1c
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/X3;->f0:I

    .line 175
    :goto_1d
    invoke-static {}, Lx1/O;->C2()Z

    move-result p1

    if-nez p1, :cond_39

    invoke-static {}, Lx1/O;->l2()Z

    move-result p1

    if-nez p1, :cond_39

    invoke-static {}, Lx1/O;->k1()Z

    move-result p1

    if-eqz p1, :cond_3a

    .line 176
    :cond_39
    invoke-static {}, Lf1/b;->a()Z

    move-result p1

    if-nez p1, :cond_3b

    invoke-static {}, Lx1/O;->k1()Z

    move-result p1

    if-nez p1, :cond_3b

    :cond_3a
    move v1, v9

    :cond_3b
    iput-boolean v1, p0, Lcom/android/launcher3/X3;->B0:Z

    return-void
.end method

.method public C()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/X3;->L:Lcom/android/launcher3/X3$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/X3$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/X3;->L:Lcom/android/launcher3/X3$a;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/X3$a;->d()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public D()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/X3;->L:Lcom/android/launcher3/X3$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/X3$a;->d()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public E(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/content/res/Resources;)V
    .locals 7

    .line 1
    iget-boolean v0, p2, Lcom/android/launcher3/h0;->G0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const v0, 0x7f070b52

    .line 6
    .line 7
    .line 8
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const v0, 0x7f070b53

    .line 14
    .line 15
    .line 16
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-static {p3, v0}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    :goto_0
    iput v0, p2, Lcom/android/launcher3/h0;->P2:I

    .line 25
    .line 26
    const v0, 0x7f0703f0

    .line 27
    .line 28
    .line 29
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-static {p3, v0}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput v0, p0, Lcom/android/launcher3/X3;->w0:I

    .line 38
    .line 39
    const v0, 0x7f070961

    .line 40
    .line 41
    .line 42
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-static {p3, v0}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput v0, p0, Lcom/android/launcher3/X3;->k0:I

    .line 51
    .line 52
    const v0, 0x7f070962

    .line 53
    .line 54
    .line 55
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    invoke-static {p3, v0}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iput v0, p0, Lcom/android/launcher3/X3;->l0:I

    .line 64
    .line 65
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    const v1, 0x7f0703eb

    .line 70
    .line 71
    .line 72
    const v2, 0x7f070408

    .line 73
    .line 74
    .line 75
    const v3, 0x7f070b5f

    .line 76
    .line 77
    .line 78
    const v4, 0x7f070960

    .line 79
    .line 80
    .line 81
    const v5, 0x7f070409

    .line 82
    .line 83
    .line 84
    const v6, 0x7f070b37

    .line 85
    .line 86
    .line 87
    if-eqz v0, :cond_1

    .line 88
    .line 89
    invoke-virtual {p3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iput v0, p2, Lcom/android/launcher3/h0;->T2:I

    .line 94
    .line 95
    invoke-virtual {p3, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    invoke-static {p3, v0}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    iput v0, p2, Lcom/android/launcher3/h0;->S2:I

    .line 104
    .line 105
    iput v0, p0, Lcom/android/launcher3/X3;->v0:I

    .line 106
    .line 107
    invoke-virtual {p3, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    invoke-static {p3, v0}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    iput v0, p0, Lcom/android/launcher3/X3;->g0:I

    .line 116
    .line 117
    invoke-virtual {p3, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    invoke-static {p3, v0}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    iput v0, p0, Lcom/android/launcher3/X3;->h0:I

    .line 126
    .line 127
    invoke-virtual {p3, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    invoke-static {p3, v0}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    iput v0, p0, Lcom/android/launcher3/X3;->i0:I

    .line 136
    .line 137
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    invoke-static {p3, v0}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    iput v0, p0, Lcom/android/launcher3/X3;->j0:I

    .line 146
    .line 147
    iget-boolean v0, p2, Lcom/android/launcher3/h0;->N0:Z

    .line 148
    .line 149
    if-eqz v0, :cond_5

    .line 150
    .line 151
    invoke-virtual {p3, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    invoke-static {p3, v0}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    iput v0, p0, Lcom/android/launcher3/X3;->h0:I

    .line 160
    .line 161
    goto/16 :goto_3

    .line 162
    .line 163
    :cond_1
    invoke-virtual {p3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    invoke-static {p1, v0}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    iput v0, p2, Lcom/android/launcher3/h0;->T2:I

    .line 172
    .line 173
    invoke-virtual {p3, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    invoke-static {p3, v0}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    iput v0, p0, Lcom/android/launcher3/X3;->g0:I

    .line 182
    .line 183
    invoke-virtual {p3, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    invoke-static {p3, v0}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    iput v0, p0, Lcom/android/launcher3/X3;->h0:I

    .line 192
    .line 193
    invoke-virtual {p3, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    invoke-static {p3, v0}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    iput v0, p0, Lcom/android/launcher3/X3;->i0:I

    .line 202
    .line 203
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    invoke-static {p3, v0}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 208
    .line 209
    .line 210
    move-result v0

    .line 211
    iput v0, p0, Lcom/android/launcher3/X3;->j0:I

    .line 212
    .line 213
    iget-boolean v0, p2, Lcom/android/launcher3/h0;->N0:Z

    .line 214
    .line 215
    if-eqz v0, :cond_2

    .line 216
    .line 217
    invoke-virtual {p3, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    invoke-static {p3, v0}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    iput v0, p0, Lcom/android/launcher3/X3;->h0:I

    .line 226
    .line 227
    :cond_2
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->T0()Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    if-eqz v0, :cond_3

    .line 232
    .line 233
    iget v0, p2, Lcom/android/launcher3/h0;->O2:I

    .line 234
    .line 235
    goto :goto_1

    .line 236
    :cond_3
    const v0, 0x7f07095f

    .line 237
    .line 238
    .line 239
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 240
    .line 241
    .line 242
    move-result v0

    .line 243
    :goto_1
    iput v0, p2, Lcom/android/launcher3/h0;->U2:I

    .line 244
    .line 245
    invoke-virtual {p2}, Lcom/android/launcher3/X3;->b()Z

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    if-eqz v0, :cond_4

    .line 250
    .line 251
    invoke-virtual {p3, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 252
    .line 253
    .line 254
    move-result v0

    .line 255
    invoke-static {p3, v0}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    invoke-static {p2, p3}, Lx1/O;->V3(Lcom/android/launcher3/h0;Landroid/content/res/Resources;)Z

    .line 260
    .line 261
    .line 262
    move-result v1

    .line 263
    add-int/2addr v0, v1

    .line 264
    goto :goto_2

    .line 265
    :cond_4
    const v0, 0x7f070b5e

    .line 266
    .line 267
    .line 268
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 269
    .line 270
    .line 271
    move-result v0

    .line 272
    invoke-static {p3, v0}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 273
    .line 274
    .line 275
    move-result v0

    .line 276
    :goto_2
    iput v0, p2, Lcom/android/launcher3/h0;->S2:I

    .line 277
    .line 278
    const v0, 0x7f070966

    .line 279
    .line 280
    .line 281
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    invoke-static {p3, v0}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 286
    .line 287
    .line 288
    move-result v0

    .line 289
    iput v0, p0, Lcom/android/launcher3/X3;->v0:I

    .line 290
    .line 291
    :cond_5
    :goto_3
    invoke-virtual {p2}, Lcom/android/launcher3/X3;->b()Z

    .line 292
    .line 293
    .line 294
    move-result v0

    .line 295
    if-eqz v0, :cond_6

    .line 296
    .line 297
    const v0, 0x7f07096c

    .line 298
    .line 299
    .line 300
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 301
    .line 302
    .line 303
    move-result v0

    .line 304
    invoke-static {p1, v0}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 305
    .line 306
    .line 307
    move-result v0

    .line 308
    goto :goto_4

    .line 309
    :cond_6
    const v0, 0x7f070977

    .line 310
    .line 311
    .line 312
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 313
    .line 314
    .line 315
    move-result v0

    .line 316
    invoke-static {p1, v0}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 317
    .line 318
    .line 319
    move-result v0

    .line 320
    :goto_4
    iput v0, p2, Lcom/android/launcher3/h0;->Y2:I

    .line 321
    .line 322
    iput v0, p2, Lcom/android/launcher3/h0;->W2:I

    .line 323
    .line 324
    const v0, 0x7f07096b

    .line 325
    .line 326
    .line 327
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 328
    .line 329
    .line 330
    move-result v0

    .line 331
    invoke-static {p1, v0}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 332
    .line 333
    .line 334
    move-result v0

    .line 335
    iput v0, p0, Lcom/android/launcher3/X3;->x0:I

    .line 336
    .line 337
    const v0, 0x7f070969

    .line 338
    .line 339
    .line 340
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 341
    .line 342
    .line 343
    move-result v0

    .line 344
    invoke-static {p1, v0}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 345
    .line 346
    .line 347
    move-result v0

    .line 348
    iput v0, p0, Lcom/android/launcher3/X3;->y0:I

    .line 349
    .line 350
    const p0, 0x7f070968

    .line 351
    .line 352
    .line 353
    invoke-virtual {p3, p0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 354
    .line 355
    .line 356
    move-result p0

    .line 357
    invoke-static {p1, p0}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 358
    .line 359
    .line 360
    move-result p0

    .line 361
    iput p0, p2, Lcom/android/launcher3/h0;->X2:I

    .line 362
    .line 363
    return-void
.end method

.method public F(Lcom/android/launcher3/h0;Lcom/android/launcher3/F1;Landroid/content/res/Resources;)V
    .locals 2

    .line 1
    iget v0, p1, Lcom/android/launcher3/h0;->B1:I

    .line 2
    .line 3
    iput v0, p1, Lcom/android/launcher3/h0;->J2:I

    .line 4
    .line 5
    iget v0, p1, Lcom/android/launcher3/h0;->C1:I

    .line 6
    .line 7
    int-to-float v0, v0

    .line 8
    iput v0, p1, Lcom/android/launcher3/h0;->N2:F

    .line 9
    .line 10
    iget v0, p1, Lcom/android/launcher3/h0;->D1:I

    .line 11
    .line 12
    iput v0, p1, Lcom/android/launcher3/h0;->K2:I

    .line 13
    .line 14
    iget v0, p0, Lcom/android/launcher3/X3;->y:I

    .line 15
    .line 16
    iput v0, p1, Lcom/android/launcher3/h0;->H2:I

    .line 17
    .line 18
    iget-boolean v0, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    iget-object v0, p1, Lcom/android/launcher3/h0;->E2:Landroid/graphics/Rect;

    .line 23
    .line 24
    iget-boolean v1, p0, Lcom/android/launcher3/X3;->X:Z

    .line 25
    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    const v1, 0x7f0c000c

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const v1, 0x7f0c000b

    .line 33
    .line 34
    .line 35
    :goto_0
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    int-to-float v1, v1

    .line 40
    invoke-static {v1}, Lcom/android/launcher3/N5;->T(F)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 45
    .line 46
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 47
    .line 48
    const v0, 0x7f0c0006

    .line 49
    .line 50
    .line 51
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getInteger(I)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    int-to-float v0, v0

    .line 56
    invoke-static {v0}, Lcom/android/launcher3/N5;->i(F)I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iget-boolean p0, p0, Lcom/android/launcher3/X3;->X:Z

    .line 61
    .line 62
    if-eqz p0, :cond_1

    .line 63
    .line 64
    const p0, 0x7f0c0005

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    const p0, 0x7f0c0004

    .line 69
    .line 70
    .line 71
    :goto_1
    invoke-virtual {p3, p0}, Landroid/content/res/Resources;->getInteger(I)I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    int-to-float p0, p0

    .line 76
    invoke-static {p0}, Lcom/android/launcher3/N5;->i(F)I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    iget p3, p1, Lcom/android/launcher3/h0;->B1:I

    .line 81
    .line 82
    add-int/2addr v0, p3

    .line 83
    iget p3, p1, Lcom/android/launcher3/h0;->K2:I

    .line 84
    .line 85
    add-int/2addr v0, p3

    .line 86
    iget p3, p1, Lcom/android/launcher3/h0;->C1:I

    .line 87
    .line 88
    int-to-float p3, p3

    .line 89
    invoke-static {p3}, Lcom/android/launcher3/N5;->f(F)I

    .line 90
    .line 91
    .line 92
    move-result p3

    .line 93
    mul-int/lit8 p3, p3, 0x2

    .line 94
    .line 95
    add-int/2addr v0, p3

    .line 96
    add-int/2addr v0, p0

    .line 97
    iput v0, p1, Lcom/android/launcher3/h0;->H2:I

    .line 98
    .line 99
    iget p0, p1, Lcom/android/launcher3/h0;->T0:I

    .line 100
    .line 101
    iget-object p3, p1, Lcom/android/launcher3/h0;->E2:Landroid/graphics/Rect;

    .line 102
    .line 103
    iget v0, p3, Landroid/graphics/Rect;->left:I

    .line 104
    .line 105
    iget p3, p3, Landroid/graphics/Rect;->right:I

    .line 106
    .line 107
    add-int/2addr v0, p3

    .line 108
    sub-int/2addr p0, v0

    .line 109
    const/4 p3, 0x0

    .line 110
    iget p2, p2, Lcom/android/launcher3/F1;->H0:I

    .line 111
    .line 112
    invoke-static {p0, p3, p2}, Lcom/android/launcher3/h0;->P(III)I

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    iput p0, p1, Lcom/android/launcher3/h0;->I2:I

    .line 117
    .line 118
    return-void

    .line 119
    :cond_2
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    if-eqz p0, :cond_3

    .line 128
    .line 129
    iget-object p0, p1, Lcom/android/launcher3/h0;->E2:Landroid/graphics/Rect;

    .line 130
    .line 131
    const p1, 0x7f0700d9

    .line 132
    .line 133
    .line 134
    invoke-virtual {p3, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    iput p1, p0, Landroid/graphics/Rect;->right:I

    .line 139
    .line 140
    iput p1, p0, Landroid/graphics/Rect;->left:I

    .line 141
    .line 142
    return-void

    .line 143
    :cond_3
    iget-object p0, p1, Lcom/android/launcher3/h0;->q1:Landroid/graphics/Rect;

    .line 144
    .line 145
    iget p2, p0, Landroid/graphics/Rect;->left:I

    .line 146
    .line 147
    iget p0, p0, Landroid/graphics/Rect;->right:I

    .line 148
    .line 149
    add-int/2addr p2, p0

    .line 150
    div-int/lit8 p2, p2, 0x2

    .line 151
    .line 152
    const p0, 0x7f0700d8

    .line 153
    .line 154
    .line 155
    invoke-virtual {p3, p0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    iget-object p3, p1, Lcom/android/launcher3/h0;->E2:Landroid/graphics/Rect;

    .line 160
    .line 161
    iget p1, p1, Lcom/android/launcher3/h0;->m1:I

    .line 162
    .line 163
    add-int/2addr p1, p2

    .line 164
    add-int/2addr p1, p0

    .line 165
    iput p1, p3, Landroid/graphics/Rect;->right:I

    .line 166
    .line 167
    iput p1, p3, Landroid/graphics/Rect;->left:I

    .line 168
    .line 169
    return-void
.end method

.method public G(Lcom/android/launcher3/h0;Landroid/content/Context;)V
    .locals 6

    .line 1
    iget v0, p1, Lcom/android/launcher3/h0;->I1:I

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/X3;->y:I

    .line 4
    .line 5
    const/high16 v2, 0x3f800000    # 1.0f

    .line 6
    .line 7
    if-le v0, v1, :cond_0

    .line 8
    .line 9
    int-to-float v1, v1

    .line 10
    int-to-float v0, v0

    .line 11
    div-float/2addr v1, v0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v1, v2

    .line 14
    :goto_0
    iget v0, p1, Lcom/android/launcher3/h0;->H1:I

    .line 15
    .line 16
    iget v3, p0, Lcom/android/launcher3/X3;->b:I

    .line 17
    .line 18
    if-le v0, v3, :cond_1

    .line 19
    .line 20
    int-to-float v3, v3

    .line 21
    int-to-float v0, v0

    .line 22
    div-float/2addr v3, v0

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    move v3, v2

    .line 25
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v4, "updateAvailableDimensions_DeviceProfile: "

    .line 31
    .line 32
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v4, "-"

    .line 39
    .line 40
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget v5, p1, Lcom/android/launcher3/h0;->I1:I

    .line 50
    .line 51
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget v5, p0, Lcom/android/launcher3/X3;->y:I

    .line 58
    .line 59
    int-to-float v5, v5

    .line 60
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget v5, p1, Lcom/android/launcher3/h0;->H1:I

    .line 67
    .line 68
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    iget v4, p0, Lcom/android/launcher3/X3;->b:I

    .line 75
    .line 76
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    const-string v4, "MFVDeviceProfile"

    .line 84
    .line 85
    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_2

    .line 93
    .line 94
    iget-boolean p0, p0, Lcom/android/launcher3/X3;->X:Z

    .line 95
    .line 96
    if-eqz p0, :cond_2

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_2
    iget-object p0, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 100
    .line 101
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->M:Z

    .line 102
    .line 103
    if-eqz p0, :cond_3

    .line 104
    .line 105
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-eqz p0, :cond_3

    .line 114
    .line 115
    :goto_2
    return-void

    .line 116
    :cond_3
    cmpg-float p0, v1, v3

    .line 117
    .line 118
    if-gez p0, :cond_4

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_4
    move v1, v3

    .line 122
    :goto_3
    cmpg-float p0, v1, v2

    .line 123
    .line 124
    if-gez p0, :cond_5

    .line 125
    .line 126
    invoke-virtual {p1, v1, p2}, Lcom/android/launcher3/h0;->p1(FLandroid/content/Context;)V

    .line 127
    .line 128
    .line 129
    :cond_5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 132
    .line 133
    .line 134
    const-string p2, "Vertical screen= "

    .line 135
    .line 136
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    iget-boolean p2, p1, Lcom/android/launcher3/h0;->N0:Z

    .line 140
    .line 141
    xor-int/lit8 p2, p2, 0x1

    .line 142
    .line 143
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    const-string p2, " scale= "

    .line 147
    .line 148
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    const-string p2, " configIconSize= "

    .line 155
    .line 156
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    iget-object p2, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 160
    .line 161
    iget-object p2, p2, Lcom/android/launcher3/F1;->L0:[F

    .line 162
    .line 163
    iget v0, p1, Lcom/android/launcher3/h0;->a1:I

    .line 164
    .line 165
    aget p2, p2, v0

    .line 166
    .line 167
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    const-string p2, " iconSizePx= "

    .line 171
    .line 172
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    iget p2, p1, Lcom/android/launcher3/h0;->B1:I

    .line 176
    .line 177
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    const-string p2, " isTwoLineTitle= "

    .line 181
    .line 182
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    iget-object p2, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 186
    .line 187
    iget-boolean p2, p2, Lcom/android/launcher3/r4;->c:Z

    .line 188
    .line 189
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    const-string p2, " configIconTextSize= "

    .line 193
    .line 194
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    iget-object p2, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 198
    .line 199
    iget-object p2, p2, Lcom/android/launcher3/F1;->M0:[F

    .line 200
    .line 201
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    const-string p2, " iconTextSizePx= "

    .line 205
    .line 206
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    iget p1, p1, Lcom/android/launcher3/h0;->C1:I

    .line 210
    .line 211
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    invoke-static {v4, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    .line 220
    .line 221
    return-void
.end method

.method public H(Lcom/android/launcher3/h0;Landroid/content/res/Resources;)V
    .locals 7

    .line 1
    iget-boolean v0, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    move v0, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget v0, p0, Lcom/android/launcher3/X3;->D:I

    .line 9
    .line 10
    iget v2, p1, Lcom/android/launcher3/h0;->B1:I

    .line 11
    .line 12
    sub-int/2addr v0, v2

    .line 13
    div-int/lit8 v0, v0, 0x2

    .line 14
    .line 15
    :goto_0
    iput v0, p0, Lcom/android/launcher3/X3;->F:I

    .line 16
    .line 17
    iget v0, p1, Lcom/android/launcher3/h0;->B1:I

    .line 18
    .line 19
    int-to-float v0, v0

    .line 20
    const/high16 v2, 0x3e000000    # 0.125f

    .line 21
    .line 22
    mul-float/2addr v0, v2

    .line 23
    const/high16 v2, 0x40000000    # 2.0f

    .line 24
    .line 25
    div-float/2addr v0, v2

    .line 26
    iget v3, p1, Lcom/android/launcher3/h0;->I1:I

    .line 27
    .line 28
    iget v4, p0, Lcom/android/launcher3/X3;->s:I

    .line 29
    .line 30
    sub-int/2addr v3, v4

    .line 31
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->e0()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    int-to-float v4, v4

    .line 36
    const/high16 v5, 0x3f800000    # 1.0f

    .line 37
    .line 38
    mul-float/2addr v4, v5

    .line 39
    iget-object v5, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 40
    .line 41
    iget v6, v5, Lcom/android/launcher3/F1;->G0:I

    .line 42
    .line 43
    int-to-float v6, v6

    .line 44
    div-float/2addr v4, v6

    .line 45
    int-to-float v6, v3

    .line 46
    sub-float v6, v4, v6

    .line 47
    .line 48
    div-float/2addr v6, v2

    .line 49
    add-float/2addr v6, v0

    .line 50
    float-to-int v0, v6

    .line 51
    iput v0, p0, Lcom/android/launcher3/X3;->s:I

    .line 52
    .line 53
    add-int/2addr v0, v3

    .line 54
    int-to-float v0, v0

    .line 55
    cmpl-float v0, v0, v4

    .line 56
    .line 57
    if-lez v0, :cond_2

    .line 58
    .line 59
    iget-boolean v0, v5, Lcom/android/launcher3/r4;->c:Z

    .line 60
    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    iget v0, p0, Lcom/android/launcher3/X3;->w:I

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_1
    move v0, v1

    .line 67
    :goto_1
    float-to-int v2, v4

    .line 68
    add-int/2addr v2, v0

    .line 69
    sub-int/2addr v2, v3

    .line 70
    iput v2, p0, Lcom/android/launcher3/X3;->s:I

    .line 71
    .line 72
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    iput v0, p0, Lcom/android/launcher3/X3;->s:I

    .line 77
    .line 78
    :cond_2
    invoke-static {}, Lx1/O;->k1()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_3

    .line 83
    .line 84
    const v0, 0x7f070185

    .line 85
    .line 86
    .line 87
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    iput v0, p0, Lcom/android/launcher3/X3;->s:I

    .line 92
    .line 93
    :cond_3
    iget-object v0, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 94
    .line 95
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->M:Z

    .line 96
    .line 97
    if-eqz v0, :cond_4

    .line 98
    .line 99
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_4

    .line 108
    .line 109
    const v0, 0x7f070184

    .line 110
    .line 111
    .line 112
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    const v1, 0x7f070ab4

    .line 117
    .line 118
    .line 119
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    sub-int/2addr v0, v1

    .line 124
    iput v0, p0, Lcom/android/launcher3/X3;->s:I

    .line 125
    .line 126
    :cond_4
    iget v0, p0, Lcom/android/launcher3/X3;->s:I

    .line 127
    .line 128
    iget v1, p0, Lcom/android/launcher3/X3;->r:I

    .line 129
    .line 130
    add-int/2addr v0, v1

    .line 131
    const v1, 0x7f070bda

    .line 132
    .line 133
    .line 134
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    int-to-float v2, v2

    .line 139
    iget v3, p0, Lcom/android/launcher3/X3;->a:F

    .line 140
    .line 141
    mul-float/2addr v2, v3

    .line 142
    float-to-int v2, v2

    .line 143
    add-int/2addr v0, v2

    .line 144
    iput v0, p0, Lcom/android/launcher3/X3;->n0:I

    .line 145
    .line 146
    iget v0, p0, Lcom/android/launcher3/X3;->y:I

    .line 147
    .line 148
    iget v2, p1, Lcom/android/launcher3/h0;->B1:I

    .line 149
    .line 150
    sub-int/2addr v0, v2

    .line 151
    iget v2, p0, Lcom/android/launcher3/X3;->s:I

    .line 152
    .line 153
    sub-int/2addr v0, v2

    .line 154
    iget v2, p0, Lcom/android/launcher3/X3;->r:I

    .line 155
    .line 156
    add-int/2addr v0, v2

    .line 157
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 158
    .line 159
    .line 160
    move-result p2

    .line 161
    int-to-float p2, p2

    .line 162
    iget v1, p0, Lcom/android/launcher3/X3;->a:F

    .line 163
    .line 164
    mul-float/2addr p2, v1

    .line 165
    float-to-int p2, p2

    .line 166
    add-int/2addr v0, p2

    .line 167
    iput v0, p0, Lcom/android/launcher3/X3;->o0:I

    .line 168
    .line 169
    iget-boolean p2, p1, Lcom/android/launcher3/X3;->B0:Z

    .line 170
    .line 171
    if-eqz p2, :cond_5

    .line 172
    .line 173
    iget p2, p0, Lcom/android/launcher3/X3;->s:I

    .line 174
    .line 175
    iget v0, p0, Lcom/android/launcher3/X3;->r:I

    .line 176
    .line 177
    add-int v1, p2, v0

    .line 178
    .line 179
    iput v1, p0, Lcom/android/launcher3/X3;->s0:I

    .line 180
    .line 181
    iget v1, p0, Lcom/android/launcher3/X3;->y:I

    .line 182
    .line 183
    sub-int v2, v1, p2

    .line 184
    .line 185
    iget v3, p1, Lcom/android/launcher3/h0;->B1:I

    .line 186
    .line 187
    sub-int/2addr v2, v3

    .line 188
    iget p1, p1, Lcom/android/launcher3/h0;->D1:I

    .line 189
    .line 190
    sub-int/2addr v2, p1

    .line 191
    iput v2, p0, Lcom/android/launcher3/X3;->u0:I

    .line 192
    .line 193
    sub-int/2addr v1, p2

    .line 194
    sub-int/2addr v1, v3

    .line 195
    sub-int/2addr v1, p1

    .line 196
    add-int/2addr v1, v0

    .line 197
    iput v1, p0, Lcom/android/launcher3/X3;->t0:I

    .line 198
    .line 199
    :cond_5
    return-void
.end method

.method public I(Lcom/android/launcher3/h0;Landroid/content/res/Resources;F)V
    .locals 5

    .line 1
    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p2}, Lx1/O;->a0(Landroid/content/res/Resources;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 10
    .line 11
    iget v3, v2, Lcom/android/launcher3/r4;->E:I

    .line 12
    .line 13
    if-lez v3, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v2, v2, Lcom/android/launcher3/F1;->M0:[F

    .line 17
    .line 18
    iget v3, p1, Lcom/android/launcher3/h0;->a1:I

    .line 19
    .line 20
    aget v2, v2, v3

    .line 21
    .line 22
    const/high16 v3, 0x3f800000    # 1.0f

    .line 23
    .line 24
    invoke-static {v2, v0, v3}, Lcom/android/launcher3/N5;->W(FLandroid/util/DisplayMetrics;F)I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    :goto_0
    iput v3, p1, Lcom/android/launcher3/h0;->C1:I

    .line 29
    .line 30
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    iget-boolean v2, p0, Lcom/android/launcher3/X3;->X:Z

    .line 37
    .line 38
    if-eqz v2, :cond_1

    .line 39
    .line 40
    const/16 v2, 0x174

    .line 41
    .line 42
    if-lt v1, v2, :cond_1

    .line 43
    .line 44
    iget v1, p1, Lcom/android/launcher3/h0;->C1:I

    .line 45
    .line 46
    int-to-float v1, v1

    .line 47
    iget v2, p0, Lcom/android/launcher3/X3;->K:F

    .line 48
    .line 49
    mul-float/2addr v1, v2

    .line 50
    iget v2, p1, Lcom/android/launcher3/h0;->A1:F

    .line 51
    .line 52
    mul-float/2addr v1, v2

    .line 53
    float-to-int v1, v1

    .line 54
    iput v1, p1, Lcom/android/launcher3/h0;->C1:I

    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1}, Lcom/android/launcher3/resource/B;->s()Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_3

    .line 66
    .line 67
    iget-object v1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 68
    .line 69
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->M:Z

    .line 70
    .line 71
    if-nez v1, :cond_2

    .line 72
    .line 73
    const v1, 0x7f070cdf

    .line 74
    .line 75
    .line 76
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    iput v1, p1, Lcom/android/launcher3/h0;->C1:I

    .line 81
    .line 82
    :cond_2
    const v1, 0x7f0704bc

    .line 83
    .line 84
    .line 85
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    iput v1, p1, Lcom/android/launcher3/h0;->D1:I

    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_3
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->T0()Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-eqz v1, :cond_4

    .line 97
    .line 98
    iget v1, p1, Lcom/android/launcher3/h0;->C1:I

    .line 99
    .line 100
    int-to-float v1, v1

    .line 101
    iget v2, p0, Lcom/android/launcher3/X3;->K:F

    .line 102
    .line 103
    mul-float/2addr v1, v2

    .line 104
    goto :goto_1

    .line 105
    :cond_4
    iget v1, p1, Lcom/android/launcher3/h0;->C1:I

    .line 106
    .line 107
    int-to-float v1, v1

    .line 108
    :goto_1
    iget v2, p1, Lcom/android/launcher3/h0;->A1:F

    .line 109
    .line 110
    mul-float/2addr v1, v2

    .line 111
    float-to-int v1, v1

    .line 112
    iput v1, p1, Lcom/android/launcher3/h0;->C1:I

    .line 113
    .line 114
    :goto_2
    invoke-static {}, Lx1/O;->k1()Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-eqz v1, :cond_5

    .line 119
    .line 120
    const v1, 0x7f070ce0

    .line 121
    .line 122
    .line 123
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    iget v2, p1, Lcom/android/launcher3/h0;->A1:F

    .line 128
    .line 129
    mul-float/2addr v1, v2

    .line 130
    float-to-int v1, v1

    .line 131
    iput v1, p1, Lcom/android/launcher3/h0;->C1:I

    .line 132
    .line 133
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .line 137
    .line 138
    const-string v2, "updateIconSize_DeviceProfile: dm="

    .line 139
    .line 140
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    const-string v2, ",deviceProfile.iconScale="

    .line 147
    .line 148
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    iget v2, p1, Lcom/android/launcher3/h0;->A1:F

    .line 152
    .line 153
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    const-string v2, ",DisplayMetrics.DENSITY_DEVICE_STABLE="

    .line 157
    .line 158
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    sget v2, Landroid/util/DisplayMetrics;->DENSITY_DEVICE_STABLE:I

    .line 162
    .line 163
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    const-string v2, ",iconTextSizePx="

    .line 167
    .line 168
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    iget v2, p1, Lcom/android/launcher3/h0;->C1:I

    .line 172
    .line 173
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    const-string v2, "MFVDeviceProfile"

    .line 181
    .line 182
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    .line 184
    .line 185
    iget-object v1, p0, Lcom/android/launcher3/X3;->c:Ls1/m;

    .line 186
    .line 187
    if-nez v1, :cond_6

    .line 188
    .line 189
    new-instance v1, Ls1/m;

    .line 190
    .line 191
    invoke-direct {v1}, Ls1/m;-><init>()V

    .line 192
    .line 193
    .line 194
    iput-object v1, p0, Lcom/android/launcher3/X3;->c:Ls1/m;

    .line 195
    .line 196
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 197
    .line 198
    .line 199
    move-result v3

    .line 200
    invoke-virtual {v1, v3}, Ls1/m;->d(Z)V

    .line 201
    .line 202
    .line 203
    :cond_6
    iget-object v1, p0, Lcom/android/launcher3/X3;->c:Ls1/m;

    .line 204
    .line 205
    iget v3, p1, Lcom/android/launcher3/h0;->B1:I

    .line 206
    .line 207
    invoke-virtual {v1, v3}, Ls1/m;->e(I)V

    .line 208
    .line 209
    .line 210
    iget-object v1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 211
    .line 212
    iget v1, v1, Lcom/android/launcher3/r4;->O:F

    .line 213
    .line 214
    invoke-static {v1, v0}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    int-to-float v0, v0

    .line 219
    mul-float/2addr v0, p3

    .line 220
    float-to-int v0, v0

    .line 221
    iput v0, p0, Lcom/android/launcher3/X3;->G:I

    .line 222
    .line 223
    const v0, 0x7f070ab4

    .line 224
    .line 225
    .line 226
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 227
    .line 228
    .line 229
    move-result v0

    .line 230
    int-to-float v0, v0

    .line 231
    mul-float/2addr v0, p3

    .line 232
    float-to-int v0, v0

    .line 233
    iput v0, p0, Lcom/android/launcher3/X3;->p:I

    .line 234
    .line 235
    const v0, 0x7f070ab3

    .line 236
    .line 237
    .line 238
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 239
    .line 240
    .line 241
    move-result v0

    .line 242
    int-to-float v0, v0

    .line 243
    mul-float/2addr v0, p3

    .line 244
    float-to-int v0, v0

    .line 245
    iput v0, p0, Lcom/android/launcher3/X3;->q:I

    .line 246
    .line 247
    iget v1, p0, Lcom/android/launcher3/X3;->p:I

    .line 248
    .line 249
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    iput v0, p0, Lcom/android/launcher3/X3;->r:I

    .line 254
    .line 255
    iget-boolean v0, p0, Lcom/android/launcher3/X3;->X:Z

    .line 256
    .line 257
    if-eqz v0, :cond_7

    .line 258
    .line 259
    const v0, 0x7f070186

    .line 260
    .line 261
    .line 262
    goto :goto_3

    .line 263
    :cond_7
    const v0, 0x7f070184

    .line 264
    .line 265
    .line 266
    :goto_3
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    int-to-float v0, v0

    .line 271
    mul-float/2addr v0, p3

    .line 272
    float-to-int v0, v0

    .line 273
    iget v1, p0, Lcom/android/launcher3/X3;->r:I

    .line 274
    .line 275
    sub-int/2addr v0, v1

    .line 276
    iput v0, p0, Lcom/android/launcher3/X3;->s:I

    .line 277
    .line 278
    invoke-static {}, Lx1/O;->k1()Z

    .line 279
    .line 280
    .line 281
    move-result v0

    .line 282
    if-eqz v0, :cond_8

    .line 283
    .line 284
    const v0, 0x7f070185

    .line 285
    .line 286
    .line 287
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 288
    .line 289
    .line 290
    move-result v0

    .line 291
    int-to-float v0, v0

    .line 292
    mul-float/2addr v0, p3

    .line 293
    float-to-int v0, v0

    .line 294
    iget v1, p0, Lcom/android/launcher3/X3;->r:I

    .line 295
    .line 296
    sub-int/2addr v0, v1

    .line 297
    iput v0, p0, Lcom/android/launcher3/X3;->s:I

    .line 298
    .line 299
    :cond_8
    invoke-static {}, Lm1/a;->a()Z

    .line 300
    .line 301
    .line 302
    move-result v0

    .line 303
    if-eqz v0, :cond_9

    .line 304
    .line 305
    const v0, 0x7f0701bb

    .line 306
    .line 307
    .line 308
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 309
    .line 310
    .line 311
    move-result v0

    .line 312
    int-to-float v0, v0

    .line 313
    mul-float/2addr v0, p3

    .line 314
    float-to-int v0, v0

    .line 315
    iget v1, p0, Lcom/android/launcher3/X3;->r:I

    .line 316
    .line 317
    sub-int/2addr v0, v1

    .line 318
    iput v0, p0, Lcom/android/launcher3/X3;->s:I

    .line 319
    .line 320
    :cond_9
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 321
    .line 322
    .line 323
    move-result v0

    .line 324
    const/4 v1, 0x0

    .line 325
    if-eqz v0, :cond_e

    .line 326
    .line 327
    iput v1, p0, Lcom/android/launcher3/X3;->F:I

    .line 328
    .line 329
    iget v0, p0, Lcom/android/launcher3/X3;->D:I

    .line 330
    .line 331
    iget v3, p0, Lcom/android/launcher3/X3;->I:I

    .line 332
    .line 333
    add-int/2addr v0, v3

    .line 334
    iput v0, p0, Lcom/android/launcher3/X3;->E:I

    .line 335
    .line 336
    const v0, 0x7f07097f

    .line 337
    .line 338
    .line 339
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    iput v0, p0, Lcom/android/launcher3/X3;->d:I

    .line 344
    .line 345
    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 346
    .line 347
    .line 348
    move-result-object v0

    .line 349
    invoke-static {v0}, Lcom/android/launcher3/N5;->z(Landroid/util/DisplayMetrics;)Z

    .line 350
    .line 351
    .line 352
    move-result v0

    .line 353
    if-eqz v0, :cond_a

    .line 354
    .line 355
    const v0, 0x7f070994

    .line 356
    .line 357
    .line 358
    goto :goto_4

    .line 359
    :cond_a
    const v0, 0x7f070993

    .line 360
    .line 361
    .line 362
    :goto_4
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 363
    .line 364
    .line 365
    move-result v0

    .line 366
    iput v0, p0, Lcom/android/launcher3/X3;->e:I

    .line 367
    .line 368
    const v0, 0x7f0709c8

    .line 369
    .line 370
    .line 371
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 372
    .line 373
    .line 374
    move-result v0

    .line 375
    iput v0, p0, Lcom/android/launcher3/X3;->g:I

    .line 376
    .line 377
    const v0, 0x7f070521

    .line 378
    .line 379
    .line 380
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 381
    .line 382
    .line 383
    move-result v0

    .line 384
    iput v0, p0, Lcom/android/launcher3/X3;->j:I

    .line 385
    .line 386
    iget-boolean v0, p0, Lcom/android/launcher3/X3;->X:Z

    .line 387
    .line 388
    if-eqz v0, :cond_b

    .line 389
    .line 390
    const v0, 0x7f070afb

    .line 391
    .line 392
    .line 393
    :goto_5
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 394
    .line 395
    .line 396
    move-result v0

    .line 397
    goto :goto_6

    .line 398
    :cond_b
    const v0, 0x7f070afa

    .line 399
    .line 400
    .line 401
    goto :goto_5

    .line 402
    :goto_6
    iput v0, p0, Lcom/android/launcher3/X3;->f:I

    .line 403
    .line 404
    iget-boolean v0, p0, Lcom/android/launcher3/X3;->X:Z

    .line 405
    .line 406
    if-nez v0, :cond_c

    .line 407
    .line 408
    const v0, 0x7f070cec

    .line 409
    .line 410
    .line 411
    :goto_7
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 412
    .line 413
    .line 414
    move-result v0

    .line 415
    goto :goto_8

    .line 416
    :cond_c
    const v0, 0x7f070cf0

    .line 417
    .line 418
    .line 419
    goto :goto_7

    .line 420
    :goto_8
    iput v0, p0, Lcom/android/launcher3/X3;->z:I

    .line 421
    .line 422
    invoke-static {}, Lx1/O;->k1()Z

    .line 423
    .line 424
    .line 425
    move-result v0

    .line 426
    if-eqz v0, :cond_d

    .line 427
    .line 428
    const v0, 0x7f070ced

    .line 429
    .line 430
    .line 431
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 432
    .line 433
    .line 434
    move-result v0

    .line 435
    iput v0, p0, Lcom/android/launcher3/X3;->z:I

    .line 436
    .line 437
    :cond_d
    const-string v0, "dimen"

    .line 438
    .line 439
    const-string v3, "android"

    .line 440
    .line 441
    const-string v4, "status_bar_height_default"

    .line 442
    .line 443
    invoke-virtual {p2, v4, v0, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 444
    .line 445
    .line 446
    move-result v0

    .line 447
    if-lez v0, :cond_e

    .line 448
    .line 449
    iget-object v3, p0, Lcom/android/launcher3/X3;->L:Lcom/android/launcher3/X3$a;

    .line 450
    .line 451
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 452
    .line 453
    .line 454
    move-result v0

    .line 455
    iput v0, v3, Lcom/android/launcher3/X3$a;->d:I

    .line 456
    .line 457
    :cond_e
    iget v0, p1, Lcom/android/launcher3/h0;->B1:I

    .line 458
    .line 459
    iget v3, p0, Lcom/android/launcher3/X3;->q:I

    .line 460
    .line 461
    mul-int/lit8 v3, v3, 0x2

    .line 462
    .line 463
    add-int/2addr v0, v3

    .line 464
    iput v0, p1, Lcom/android/launcher3/h0;->H1:I

    .line 465
    .line 466
    iget-boolean v0, p0, Lcom/android/launcher3/X3;->X:Z

    .line 467
    .line 468
    if-eqz v0, :cond_f

    .line 469
    .line 470
    iget-object v0, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 471
    .line 472
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->T:Z

    .line 473
    .line 474
    if-nez v0, :cond_f

    .line 475
    .line 476
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 477
    .line 478
    .line 479
    move-result v0

    .line 480
    if-nez v0, :cond_f

    .line 481
    .line 482
    iput v1, p1, Lcom/android/launcher3/h0;->Y1:I

    .line 483
    .line 484
    goto :goto_9

    .line 485
    :cond_f
    iget v0, p1, Lcom/android/launcher3/h0;->C1:I

    .line 486
    .line 487
    iput v0, p1, Lcom/android/launcher3/h0;->Y1:I

    .line 488
    .line 489
    :goto_9
    iget v0, p1, Lcom/android/launcher3/h0;->B1:I

    .line 490
    .line 491
    iput v0, p1, Lcom/android/launcher3/h0;->X1:I

    .line 492
    .line 493
    iget-boolean v0, p0, Lcom/android/launcher3/X3;->X:Z

    .line 494
    .line 495
    if-eqz v0, :cond_10

    .line 496
    .line 497
    goto :goto_a

    .line 498
    :cond_10
    const v0, 0x7f070350

    .line 499
    .line 500
    .line 501
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 502
    .line 503
    .line 504
    move-result v0

    .line 505
    int-to-float v0, v0

    .line 506
    mul-float/2addr v0, p3

    .line 507
    float-to-int v1, v0

    .line 508
    :goto_a
    iput v1, p0, Lcom/android/launcher3/X3;->U:I

    .line 509
    .line 510
    const v0, 0x7f070bd9

    .line 511
    .line 512
    .line 513
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 514
    .line 515
    .line 516
    move-result v1

    .line 517
    iget v3, p0, Lcom/android/launcher3/X3;->r:I

    .line 518
    .line 519
    add-int/2addr v1, v3

    .line 520
    const v3, 0x7f070bda

    .line 521
    .line 522
    .line 523
    invoke-virtual {p2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 524
    .line 525
    .line 526
    move-result v4

    .line 527
    int-to-float v4, v4

    .line 528
    mul-float/2addr v4, p3

    .line 529
    float-to-int v4, v4

    .line 530
    add-int/2addr v1, v4

    .line 531
    iput v1, p0, Lcom/android/launcher3/X3;->n0:I

    .line 532
    .line 533
    iget v1, p0, Lcom/android/launcher3/X3;->x:I

    .line 534
    .line 535
    iget v4, p1, Lcom/android/launcher3/h0;->B1:I

    .line 536
    .line 537
    sub-int/2addr v1, v4

    .line 538
    iget v4, p0, Lcom/android/launcher3/X3;->r:I

    .line 539
    .line 540
    mul-int/lit8 v4, v4, 0x2

    .line 541
    .line 542
    add-int/2addr v1, v4

    .line 543
    invoke-virtual {p2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 544
    .line 545
    .line 546
    move-result v4

    .line 547
    int-to-float v4, v4

    .line 548
    mul-float/2addr v4, p3

    .line 549
    float-to-int v4, v4

    .line 550
    mul-int/lit8 v4, v4, 0x2

    .line 551
    .line 552
    add-int/2addr v1, v4

    .line 553
    div-int/lit8 v1, v1, 0x2

    .line 554
    .line 555
    iput v1, p0, Lcom/android/launcher3/X3;->m0:I

    .line 556
    .line 557
    iget v1, p0, Lcom/android/launcher3/X3;->y:I

    .line 558
    .line 559
    iget v4, p1, Lcom/android/launcher3/h0;->B1:I

    .line 560
    .line 561
    sub-int/2addr v1, v4

    .line 562
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 563
    .line 564
    .line 565
    move-result v0

    .line 566
    sub-int/2addr v1, v0

    .line 567
    iget v0, p0, Lcom/android/launcher3/X3;->r:I

    .line 568
    .line 569
    add-int/2addr v1, v0

    .line 570
    invoke-virtual {p2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 571
    .line 572
    .line 573
    move-result v0

    .line 574
    int-to-float v0, v0

    .line 575
    mul-float/2addr v0, p3

    .line 576
    float-to-int v0, v0

    .line 577
    add-int/2addr v1, v0

    .line 578
    iput v1, p0, Lcom/android/launcher3/X3;->o0:I

    .line 579
    .line 580
    iget v0, p0, Lcom/android/launcher3/X3;->r:I

    .line 581
    .line 582
    invoke-virtual {p2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 583
    .line 584
    .line 585
    move-result v1

    .line 586
    int-to-float v1, v1

    .line 587
    mul-float/2addr v1, p3

    .line 588
    const/high16 p3, 0x40000000    # 2.0f

    .line 589
    .line 590
    mul-float/2addr v1, p3

    .line 591
    float-to-int p3, v1

    .line 592
    add-int/2addr v0, p3

    .line 593
    iput v0, p0, Lcom/android/launcher3/X3;->p0:I

    .line 594
    .line 595
    iget-boolean p3, p1, Lcom/android/launcher3/X3;->B0:Z

    .line 596
    .line 597
    if-eqz p3, :cond_11

    .line 598
    .line 599
    iget p3, p0, Lcom/android/launcher3/X3;->s:I

    .line 600
    .line 601
    iget v0, p0, Lcom/android/launcher3/X3;->r:I

    .line 602
    .line 603
    add-int/2addr p3, v0

    .line 604
    iput p3, p0, Lcom/android/launcher3/X3;->s0:I

    .line 605
    .line 606
    const p3, 0x7f070c10

    .line 607
    .line 608
    .line 609
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 610
    .line 611
    .line 612
    move-result p2

    .line 613
    iput p2, p0, Lcom/android/launcher3/X3;->q0:I

    .line 614
    .line 615
    iget p3, p0, Lcom/android/launcher3/X3;->x:I

    .line 616
    .line 617
    mul-int/lit8 p2, p2, 0x2

    .line 618
    .line 619
    sub-int/2addr p3, p2

    .line 620
    iget p2, p1, Lcom/android/launcher3/h0;->B1:I

    .line 621
    .line 622
    sub-int/2addr p3, p2

    .line 623
    div-int/lit8 p3, p3, 0x2

    .line 624
    .line 625
    iget v0, p0, Lcom/android/launcher3/X3;->r:I

    .line 626
    .line 627
    add-int/2addr p3, v0

    .line 628
    iput p3, p0, Lcom/android/launcher3/X3;->r0:I

    .line 629
    .line 630
    iget p3, p0, Lcom/android/launcher3/X3;->y:I

    .line 631
    .line 632
    iget v1, p0, Lcom/android/launcher3/X3;->s:I

    .line 633
    .line 634
    sub-int v3, p3, v1

    .line 635
    .line 636
    sub-int/2addr v3, p2

    .line 637
    iget v4, p1, Lcom/android/launcher3/h0;->D1:I

    .line 638
    .line 639
    sub-int/2addr v3, v4

    .line 640
    iput v3, p0, Lcom/android/launcher3/X3;->u0:I

    .line 641
    .line 642
    sub-int/2addr p3, v1

    .line 643
    sub-int/2addr p3, p2

    .line 644
    sub-int/2addr p3, v4

    .line 645
    add-int/2addr p3, v0

    .line 646
    iput p3, p0, Lcom/android/launcher3/X3;->t0:I

    .line 647
    .line 648
    :cond_11
    new-instance p2, Ljava/lang/StringBuilder;

    .line 649
    .line 650
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 651
    .line 652
    .line 653
    const-string p3, "updateIconSize_DeviceProfile: landscape: "

    .line 654
    .line 655
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 656
    .line 657
    .line 658
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->N0:Z

    .line 659
    .line 660
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 661
    .line 662
    .line 663
    const-string p1, " ,titleWidgetPaddingTop: "

    .line 664
    .line 665
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 666
    .line 667
    .line 668
    iget p1, p0, Lcom/android/launcher3/X3;->n0:I

    .line 669
    .line 670
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 671
    .line 672
    .line 673
    const-string p1, " ,titleWidgetPaddingLeftRight: "

    .line 674
    .line 675
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 676
    .line 677
    .line 678
    iget p1, p0, Lcom/android/launcher3/X3;->m0:I

    .line 679
    .line 680
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 681
    .line 682
    .line 683
    const-string p1, " ,titleWidgetNameHeight: "

    .line 684
    .line 685
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 686
    .line 687
    .line 688
    iget p1, p0, Lcom/android/launcher3/X3;->o0:I

    .line 689
    .line 690
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 691
    .line 692
    .line 693
    const-string p1, " ,titleWidgetNamePaddingTop: "

    .line 694
    .line 695
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 696
    .line 697
    .line 698
    iget p1, p0, Lcom/android/launcher3/X3;->p0:I

    .line 699
    .line 700
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 701
    .line 702
    .line 703
    const-string p1, " ,transformFolderPaddingTop: "

    .line 704
    .line 705
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 706
    .line 707
    .line 708
    iget p1, p0, Lcom/android/launcher3/X3;->s0:I

    .line 709
    .line 710
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 711
    .line 712
    .line 713
    const-string p1, " ,transformFolderPaddingLeftRight: "

    .line 714
    .line 715
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 716
    .line 717
    .line 718
    iget p1, p0, Lcom/android/launcher3/X3;->q0:I

    .line 719
    .line 720
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 721
    .line 722
    .line 723
    const-string p1, " ,transformFolderContentMarginBottom: "

    .line 724
    .line 725
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 726
    .line 727
    .line 728
    iget p1, p0, Lcom/android/launcher3/X3;->t0:I

    .line 729
    .line 730
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 731
    .line 732
    .line 733
    const-string p1, " ,transformFolderNameHeight: "

    .line 734
    .line 735
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 736
    .line 737
    .line 738
    iget p0, p0, Lcom/android/launcher3/X3;->u0:I

    .line 739
    .line 740
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 741
    .line 742
    .line 743
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 744
    .line 745
    .line 746
    move-result-object p0

    .line 747
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 748
    .line 749
    .line 750
    return-void
.end method

.method public a(Lcom/android/launcher3/h0;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->c:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, p1, Lcom/android/launcher3/h0;->B1:I

    .line 8
    .line 9
    iget v1, p0, Lcom/android/launcher3/X3;->s:I

    .line 10
    .line 11
    add-int/2addr v0, v1

    .line 12
    iget v1, p1, Lcom/android/launcher3/h0;->D1:I

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    iget v1, p1, Lcom/android/launcher3/h0;->C1:I

    .line 16
    .line 17
    int-to-float v1, v1

    .line 18
    invoke-static {v1}, Lcom/android/launcher3/N5;->f(F)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    mul-int/lit8 v1, v1, 0x2

    .line 23
    .line 24
    add-int/2addr v0, v1

    .line 25
    iget v1, p0, Lcom/android/launcher3/X3;->w:I

    .line 26
    .line 27
    add-int/2addr v0, v1

    .line 28
    iput v0, p1, Lcom/android/launcher3/h0;->I1:I

    .line 29
    .line 30
    iget-object v0, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 31
    .line 32
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->M:Z

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    iget v0, p1, Lcom/android/launcher3/h0;->I1:I

    .line 47
    .line 48
    iget p0, p0, Lcom/android/launcher3/X3;->s:I

    .line 49
    .line 50
    add-int/2addr v0, p0

    .line 51
    iput v0, p1, Lcom/android/launcher3/h0;->I1:I

    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public b()Z
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/h0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    check-cast p0, Lcom/android/launcher3/h0;

    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->G0:Z

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 13
    .line 14
    iget p0, p0, Lcom/android/launcher3/r4;->p0:I

    .line 15
    .line 16
    const/4 v0, 0x2

    .line 17
    if-ne p0, v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    return v1

    .line 21
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_2
    return v1
.end method

.method protected c(Lcom/android/launcher3/h0;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 8
    .line 9
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->M:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget p1, p1, Lcom/android/launcher3/h0;->I1:I

    .line 24
    .line 25
    iput p1, p0, Lcom/android/launcher3/X3;->b0:I

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget v0, p0, Lcom/android/launcher3/X3;->b0:I

    .line 29
    .line 30
    iget p1, p1, Lcom/android/launcher3/h0;->I1:I

    .line 31
    .line 32
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    iput p1, p0, Lcom/android/launcher3/X3;->b0:I

    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method protected d(Lcom/android/launcher3/h0;Landroid/content/res/Resources;)V
    .locals 0

    .line 1
    invoke-static {}, Lm1/a;->a()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const p0, 0x7f0701b9

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2, p0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    float-to-int p0, p0

    .line 15
    iput p0, p1, Lcom/android/launcher3/h0;->X1:I

    .line 16
    .line 17
    const p0, 0x7f0701bc

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2, p0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    float-to-int p0, p0

    .line 25
    iput p0, p1, Lcom/android/launcher3/h0;->Y1:I

    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method protected e(Lcom/android/launcher3/h0;Landroid/content/res/Resources;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->M:Z

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const p0, 0x7f07034b

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2, p0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    float-to-int p0, p0

    .line 25
    iput p0, p1, Lcom/android/launcher3/h0;->Y1:I

    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method protected f(Lcom/android/launcher3/h0;)I
    .locals 0

    .line 1
    iget p0, p1, Lcom/android/launcher3/h0;->I1:I

    .line 2
    .line 3
    return p0
.end method

.method public g(Landroid/graphics/Point;)Landroid/graphics/Point;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Landroid/graphics/Point;

    .line 4
    .line 5
    invoke-direct {p1}, Landroid/graphics/Point;-><init>()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget v0, p0, Lcom/android/launcher3/X3;->x:I

    .line 9
    .line 10
    iput v0, p1, Landroid/graphics/Point;->x:I

    .line 11
    .line 12
    iget p0, p0, Lcom/android/launcher3/X3;->y:I

    .line 13
    .line 14
    iput p0, p1, Landroid/graphics/Point;->y:I

    .line 15
    .line 16
    return-object p1
.end method

.method public j()F
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/X3;->X:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/android/launcher3/X3;->a:F

    .line 6
    .line 7
    iget p0, p0, Lcom/android/launcher3/X3;->K:F

    .line 8
    .line 9
    mul-float/2addr v0, p0

    .line 10
    return v0

    .line 11
    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    .line 12
    .line 13
    return p0
.end method

.method public k(I)I
    .locals 0

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/X3;->D:I

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    iget p0, p0, Lcom/android/launcher3/X3;->E:I

    .line 7
    .line 8
    return p0
.end method

.method public l()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/X3;->a:F

    .line 2
    .line 3
    return p0
.end method

.method public m(I)I
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/X3;->p()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    add-int/2addr p1, v0

    .line 12
    iget v0, p0, Lcom/android/launcher3/X3;->o:I

    .line 13
    .line 14
    iget v1, p0, Lcom/android/launcher3/X3;->n:I

    .line 15
    .line 16
    sub-int/2addr v0, v1

    .line 17
    iget p0, p0, Lcom/android/launcher3/X3;->B:I

    .line 18
    .line 19
    add-int/2addr v0, p0

    .line 20
    div-int/lit8 v0, v0, 0x2

    .line 21
    .line 22
    :goto_0
    sub-int/2addr p1, v0

    .line 23
    return p1

    .line 24
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/X3;->X:Z

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    if-lez p1, :cond_1

    .line 29
    .line 30
    iget p0, p0, Lcom/android/launcher3/X3;->k:I

    .line 31
    .line 32
    mul-int/lit8 p0, p0, -0x1

    .line 33
    .line 34
    return p0

    .line 35
    :cond_1
    iget p0, p0, Lcom/android/launcher3/X3;->j:I

    .line 36
    .line 37
    return p0

    .line 38
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/X3;->p()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iget v0, p0, Lcom/android/launcher3/X3;->o:I

    .line 43
    .line 44
    iget v1, p0, Lcom/android/launcher3/X3;->n:I

    .line 45
    .line 46
    sub-int/2addr v0, v1

    .line 47
    iget p0, p0, Lcom/android/launcher3/X3;->B:I

    .line 48
    .line 49
    add-int/2addr v0, p0

    .line 50
    div-int/lit8 v0, v0, 0x2

    .line 51
    .line 52
    goto :goto_0
.end method

.method public n()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/X3;->X:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/X3;->e:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    iget p0, p0, Lcom/android/launcher3/X3;->d:I

    .line 9
    .line 10
    return p0
.end method

.method public o(Lcom/android/launcher3/h0;Landroid/widget/FrameLayout$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 3

    .line 1
    iget-boolean v0, p1, Lcom/android/launcher3/h0;->N0:Z

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget v2, p0, Lcom/android/launcher3/X3;->e:I

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v2, v1

    .line 10
    :goto_0
    iput v2, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget v2, p1, Lcom/android/launcher3/h0;->U0:I

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    iget v2, p0, Lcom/android/launcher3/X3;->d:I

    .line 18
    .line 19
    :goto_1
    iput v2, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 20
    .line 21
    const/16 v2, 0x50

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x5

    .line 26
    goto :goto_2

    .line 27
    :cond_2
    move v0, v2

    .line 28
    :goto_2
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 29
    .line 30
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_3

    .line 35
    .line 36
    iget-boolean v0, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 37
    .line 38
    if-eqz v0, :cond_4

    .line 39
    .line 40
    :cond_3
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->N0:Z

    .line 41
    .line 42
    if-eqz p1, :cond_4

    .line 43
    .line 44
    iput v1, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 45
    .line 46
    iget p0, p0, Lcom/android/launcher3/X3;->e:I

    .line 47
    .line 48
    iput p0, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 49
    .line 50
    iput v2, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 51
    .line 52
    :cond_4
    return-object p2
.end method

.method public p()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/X3;->E:I

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/X3;->A:I

    .line 4
    .line 5
    div-int/lit8 v1, v1, 0x2

    .line 6
    .line 7
    add-int/2addr v0, v1

    .line 8
    iget p0, p0, Lcom/android/launcher3/X3;->B:I

    .line 9
    .line 10
    add-int/2addr v0, p0

    .line 11
    return v0
.end method

.method public q()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/X3;->L:Lcom/android/launcher3/X3$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/X3$a;->a()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public r(Lcom/android/launcher3/h0;)I
    .locals 6

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->T0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object v0, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 10
    .line 11
    iget v1, v0, Lcom/android/launcher3/r4;->Q:I

    .line 12
    .line 13
    iget v2, p0, Lcom/android/launcher3/X3;->c0:I

    .line 14
    .line 15
    add-int/2addr v2, v1

    .line 16
    iget v3, p0, Lcom/android/launcher3/X3;->d0:I

    .line 17
    .line 18
    add-int/2addr v2, v3

    .line 19
    iget v3, p0, Lcom/android/launcher3/X3;->e0:I

    .line 20
    .line 21
    add-int/2addr v2, v3

    .line 22
    int-to-float v2, v2

    .line 23
    iget v3, p0, Lcom/android/launcher3/X3;->y:I

    .line 24
    .line 25
    iget v0, v0, Lcom/android/launcher3/F1;->G0:I

    .line 26
    .line 27
    mul-int v4, v3, v0

    .line 28
    .line 29
    int-to-float v4, v4

    .line 30
    iget v5, p1, Lcom/android/launcher3/X3;->O:F

    .line 31
    .line 32
    mul-float/2addr v4, v5

    .line 33
    add-float/2addr v2, v4

    .line 34
    iget p0, p0, Lcom/android/launcher3/X3;->f0:I

    .line 35
    .line 36
    int-to-float p0, p0

    .line 37
    add-float/2addr v2, p0

    .line 38
    float-to-int p0, v2

    .line 39
    iget-object p1, p1, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 40
    .line 41
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 42
    .line 43
    add-int/2addr v1, p1

    .line 44
    mul-int/2addr v3, v0

    .line 45
    add-int/2addr v1, v3

    .line 46
    sub-int/2addr p0, v1

    .line 47
    return p0
.end method

.method public s(Lcom/android/launcher3/C2;)I
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, v0, Lcom/android/launcher3/X3;->O:F

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Lcom/android/launcher3/V4;->getNormalChildHeight()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    int-to-float v2, v2

    .line 16
    mul-float/2addr v1, v2

    .line 17
    float-to-int v1, v1

    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget-object v2, v2, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    if-eqz v3, :cond_2

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Lcom/android/launcher3/Workspace;->getExpectedHeight()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    int-to-float p1, p1

    .line 39
    iget v0, v0, Lcom/android/launcher3/X3;->O:F

    .line 40
    .line 41
    const/high16 v1, 0x3f800000    # 1.0f

    .line 42
    .line 43
    sub-float/2addr v1, v0

    .line 44
    mul-float/2addr p1, v1

    .line 45
    const/high16 v1, 0x40000000    # 2.0f

    .line 46
    .line 47
    div-float/2addr p1, v1

    .line 48
    iget-object v1, v3, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 49
    .line 50
    iget v1, v1, Lcom/android/launcher3/r4;->Q:I

    .line 51
    .line 52
    iget-object v2, v3, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 53
    .line 54
    iget v2, v2, Landroid/graphics/Rect;->top:I

    .line 55
    .line 56
    add-int/2addr v2, v1

    .line 57
    int-to-float v2, v2

    .line 58
    mul-float/2addr v2, v0

    .line 59
    add-float/2addr p1, v2

    .line 60
    float-to-int p1, p1

    .line 61
    iget v0, p0, Lcom/android/launcher3/X3;->c0:I

    .line 62
    .line 63
    add-int/2addr v1, v0

    .line 64
    iget v0, p0, Lcom/android/launcher3/X3;->d0:I

    .line 65
    .line 66
    add-int/2addr v1, v0

    .line 67
    iget v0, p0, Lcom/android/launcher3/X3;->e0:I

    .line 68
    .line 69
    add-int/2addr v1, v0

    .line 70
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_0

    .line 75
    .line 76
    iget-boolean v0, p0, Lcom/android/launcher3/X3;->X:Z

    .line 77
    .line 78
    if-eqz v0, :cond_0

    .line 79
    .line 80
    sub-int v0, v1, p1

    .line 81
    .line 82
    iget p0, p0, Lcom/android/launcher3/X3;->e0:I

    .line 83
    .line 84
    :goto_0
    add-int/2addr v0, p0

    .line 85
    goto :goto_1

    .line 86
    :cond_0
    sub-int v0, v1, p1

    .line 87
    .line 88
    iget p0, p0, Lcom/android/launcher3/X3;->c0:I

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :goto_1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-nez p0, :cond_1

    .line 96
    .line 97
    sub-int/2addr v1, p1

    .line 98
    return v1

    .line 99
    :cond_1
    return v0

    .line 100
    :cond_2
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNormalChildHeight()I

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    sub-int/2addr p0, v1

    .line 109
    iget p1, v2, Landroid/graphics/Rect;->top:I

    .line 110
    .line 111
    sub-int/2addr p0, p1

    .line 112
    div-int/lit8 p0, p0, 0x2

    .line 113
    .line 114
    neg-int p0, p0

    .line 115
    return p0
.end method

.method public t()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/X3;->N:I

    .line 2
    .line 3
    return p0
.end method

.method public u()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/X3;->M:I

    .line 2
    .line 3
    return p0
.end method

.method public v()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/X3;->Q:I

    .line 2
    .line 3
    return p0
.end method

.method public w()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/X3;->S:I

    .line 2
    .line 3
    return p0
.end method

.method public x()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/X3;->R:I

    .line 2
    .line 3
    return p0
.end method

.method public y()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/X3;->P:I

    .line 2
    .line 3
    return p0
.end method

.method public z()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/X3;->T:I

    .line 2
    .line 3
    return p0
.end method
