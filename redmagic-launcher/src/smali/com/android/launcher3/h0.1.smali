.class public Lcom/android/launcher3/h0;
.super Lcom/android/launcher3/X3;
.source "DeviceProfile.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/h0$b;,
        Lcom/android/launcher3/h0$a;
    }
.end annotation


# static fields
.field public static final A3:Landroid/graphics/PointF;

.field public static final B3:Lcom/android/launcher3/h0$b;

.field public static final C3:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Lcom/android/launcher3/h0;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public A1:F

.field public A2:F

.field public B1:I

.field public B2:F

.field public final C0:Lcom/android/launcher3/F1;

.field public C1:I

.field public C2:Landroid/graphics/Point;

.field private final D0:Lcom/android/launcher3/util/Z$c;

.field public D1:I

.field public D2:I

.field private final E0:Landroid/util/DisplayMetrics;

.field protected E1:I

.field public E2:Landroid/graphics/Rect;

.field private final F0:Lcom/android/launcher3/util/w0;

.field public F1:Z

.field public F2:I

.field public final G0:Z

.field public G1:F

.field public G2:I

.field public final H0:Z

.field public H1:I

.field public H2:I

.field public final I0:Z

.field public I1:I

.field public I2:I

.field public final J0:Z

.field public J1:I

.field public J2:I

.field public final K0:Z

.field public K1:I

.field public K2:I

.field public L0:Z

.field public final L1:I

.field public L2:I

.field public final M0:Z

.field public final M1:I

.field public final M2:I

.field public final N0:Z

.field public final N1:F

.field public N2:F

.field public final O0:Z

.field public O1:I

.field public O2:I

.field public final P0:Z

.field public P1:I

.field public P2:I

.field public final Q0:Z

.field public Q1:I

.field public Q2:I

.field public final R0:I

.field public R1:I

.field public R2:I

.field public final S0:I

.field public S1:Landroid/graphics/Point;

.field public S2:I

.field public final T0:I

.field public T1:I

.field public T2:I

.field public final U0:I

.field public U1:I

.field public U2:I

.field public final V0:I

.field public V1:I

.field public final V2:I

.field public final W0:I

.field public W1:I

.field public W2:I

.field public final X0:I

.field public X1:I

.field public X2:I

.field public final Y0:F

.field public Y1:I

.field public Y2:I

.field private final Z0:Z

.field public Z1:I

.field public Z2:I

.field protected final a1:I

.field public a2:I

.field private final a3:Lcom/android/launcher3/h0$b;

.field private final b1:Z

.field public b2:I

.field public b3:I

.field private c1:LH1/c;

.field private c2:I

.field public c3:I

.field private d1:LH1/c;

.field private d2:I

.field public d3:I

.field private e1:LH1/c;

.field public final e2:Z

.field public e3:I

.field private f1:LH1/c;

.field public f2:I

.field public f3:I

.field private g1:LH1/c;

.field public g2:I

.field public g3:I

.field private h1:LH1/c;

.field public h2:I

.field public h3:I

.field private i1:LH1/b;

.field public i2:I

.field public i3:I

.field private j1:LH1/a;

.field public j2:I

.field public j3:I

.field private k1:LH1/a;

.field public k2:I

.field private final k3:Landroid/graphics/Rect;

.field public final l1:I

.field public l2:I

.field public final l3:Landroid/graphics/Rect;

.field public m1:I

.field public final m2:I

.field public final m3:Landroid/graphics/Rect;

.field public n1:I

.field public final n2:I

.field public final n3:Ls1/m;

.field public o1:I

.field public o2:I

.field public final o3:Ls1/m;

.field public p1:Landroid/graphics/Point;

.field public final p2:I

.field public p3:Z

.field public q1:Landroid/graphics/Rect;

.field public final q2:I

.field public q3:Z

.field public final r1:I

.field private final r2:I

.field public final r3:I

.field public final s1:F

.field public s2:I

.field public final s3:I

.field public final t1:I

.field private final t2:I

.field public final t3:I

.field private final u1:I

.field private final u2:I

.field public final u3:I

.field private v1:I

.field private final v2:I

.field private final v3:I

.field public w1:I

.field private final w2:I

.field public final w3:Z

.field public x1:I

.field public x2:I

.field public final x3:Z

.field public final y1:I

.field public y2:I

.field public y3:I

.field private final z1:I

.field public z2:I

.field public z3:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/PointF;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-direct {v0, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/h0;->A3:Landroid/graphics/PointF;

    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/e0;

    .line 11
    .line 12
    invoke-direct {v0}, Lcom/android/launcher3/e0;-><init>()V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lcom/android/launcher3/h0;->B3:Lcom/android/launcher3/h0$b;

    .line 16
    .line 17
    new-instance v0, Lcom/android/launcher3/f0;

    .line 18
    .line 19
    invoke-direct {v0}, Lcom/android/launcher3/f0;-><init>()V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lcom/android/launcher3/h0;->C3:Ljava/util/function/Consumer;

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/X3;-><init>()V

    .line 2
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/h0;->q1:Landroid/graphics/Rect;

    const/4 v0, -0x1

    .line 3
    iput v0, p0, Lcom/android/launcher3/h0;->K1:I

    .line 4
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/h0;->E2:Landroid/graphics/Rect;

    .line 5
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 6
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 7
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/h0;->m3:Landroid/graphics/Rect;

    const v0, 0x3e11c6d2    # 0.14236f

    .line 8
    iput v0, p0, Lcom/android/launcher3/h0;->z3:F

    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 10
    iput-object v0, p0, Lcom/android/launcher3/h0;->D0:Lcom/android/launcher3/util/Z$c;

    .line 11
    iput-object v0, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 12
    iput-object v0, p0, Lcom/android/launcher3/h0;->F0:Lcom/android/launcher3/util/w0;

    const/4 v1, 0x0

    .line 13
    iput-boolean v1, p0, Lcom/android/launcher3/h0;->G0:Z

    .line 14
    iput-boolean v1, p0, Lcom/android/launcher3/h0;->H0:Z

    .line 15
    iput-boolean v1, p0, Lcom/android/launcher3/h0;->I0:Z

    .line 16
    iput-boolean v1, p0, Lcom/android/launcher3/h0;->J0:Z

    .line 17
    iput-boolean v1, p0, Lcom/android/launcher3/h0;->K0:Z

    .line 18
    iput-boolean v1, p0, Lcom/android/launcher3/h0;->L0:Z

    .line 19
    iput-boolean v1, p0, Lcom/android/launcher3/h0;->M0:Z

    .line 20
    iput-boolean v1, p0, Lcom/android/launcher3/h0;->N0:Z

    .line 21
    iput-boolean v1, p0, Lcom/android/launcher3/h0;->O0:Z

    .line 22
    iput-boolean v1, p0, Lcom/android/launcher3/h0;->P0:Z

    .line 23
    iput-boolean v1, p0, Lcom/android/launcher3/h0;->Q0:Z

    .line 24
    iput v1, p0, Lcom/android/launcher3/h0;->R0:I

    .line 25
    iput v1, p0, Lcom/android/launcher3/h0;->S0:I

    .line 26
    iput v1, p0, Lcom/android/launcher3/h0;->T0:I

    .line 27
    iput v1, p0, Lcom/android/launcher3/h0;->U0:I

    .line 28
    iput v1, p0, Lcom/android/launcher3/h0;->V0:I

    .line 29
    iput v1, p0, Lcom/android/launcher3/h0;->W0:I

    .line 30
    iput v1, p0, Lcom/android/launcher3/h0;->X0:I

    const/high16 v2, 0x3f800000    # 1.0f

    .line 31
    iput v2, p0, Lcom/android/launcher3/h0;->Y0:F

    .line 32
    iput-boolean v1, p0, Lcom/android/launcher3/h0;->Z0:Z

    .line 33
    iput v1, p0, Lcom/android/launcher3/h0;->a1:I

    .line 34
    iput-boolean v1, p0, Lcom/android/launcher3/h0;->b1:Z

    .line 35
    iput v1, p0, Lcom/android/launcher3/h0;->l1:I

    .line 36
    iput v1, p0, Lcom/android/launcher3/h0;->r1:I

    const/4 v2, 0x0

    .line 37
    iput v2, p0, Lcom/android/launcher3/h0;->s1:F

    .line 38
    iput v1, p0, Lcom/android/launcher3/h0;->t1:I

    .line 39
    iput v1, p0, Lcom/android/launcher3/h0;->u1:I

    .line 40
    iput v1, p0, Lcom/android/launcher3/h0;->y1:I

    .line 41
    iput v1, p0, Lcom/android/launcher3/h0;->z1:I

    .line 42
    iput v1, p0, Lcom/android/launcher3/h0;->L1:I

    .line 43
    iput v1, p0, Lcom/android/launcher3/h0;->M1:I

    .line 44
    iput v2, p0, Lcom/android/launcher3/h0;->N1:F

    .line 45
    iput-boolean v1, p0, Lcom/android/launcher3/h0;->e2:Z

    .line 46
    iput v1, p0, Lcom/android/launcher3/h0;->m2:I

    .line 47
    iput v1, p0, Lcom/android/launcher3/h0;->n2:I

    .line 48
    iput v1, p0, Lcom/android/launcher3/h0;->o2:I

    .line 49
    iput v1, p0, Lcom/android/launcher3/h0;->p2:I

    .line 50
    iput v1, p0, Lcom/android/launcher3/h0;->q2:I

    .line 51
    iput v1, p0, Lcom/android/launcher3/h0;->r2:I

    .line 52
    iput v1, p0, Lcom/android/launcher3/h0;->s2:I

    .line 53
    iput v1, p0, Lcom/android/launcher3/h0;->t2:I

    .line 54
    iput v1, p0, Lcom/android/launcher3/h0;->u2:I

    .line 55
    iput v1, p0, Lcom/android/launcher3/h0;->v2:I

    .line 56
    iput v1, p0, Lcom/android/launcher3/h0;->j2:I

    .line 57
    iput v1, p0, Lcom/android/launcher3/h0;->w2:I

    .line 58
    iput v1, p0, Lcom/android/launcher3/h0;->M2:I

    .line 59
    iput v1, p0, Lcom/android/launcher3/h0;->T2:I

    .line 60
    iput v1, p0, Lcom/android/launcher3/h0;->U2:I

    .line 61
    iput v1, p0, Lcom/android/launcher3/h0;->V2:I

    .line 62
    iput-object v0, p0, Lcom/android/launcher3/h0;->a3:Lcom/android/launcher3/h0$b;

    .line 63
    iput-object v0, p0, Lcom/android/launcher3/h0;->n3:Ls1/m;

    .line 64
    iput-object v0, p0, Lcom/android/launcher3/h0;->o3:Ls1/m;

    .line 65
    iput v1, p0, Lcom/android/launcher3/h0;->r3:I

    .line 66
    iput v1, p0, Lcom/android/launcher3/h0;->s3:I

    .line 67
    iput v1, p0, Lcom/android/launcher3/h0;->t3:I

    .line 68
    iput v1, p0, Lcom/android/launcher3/h0;->u3:I

    .line 69
    iput v1, p0, Lcom/android/launcher3/h0;->v3:I

    .line 70
    iput-boolean v1, p0, Lcom/android/launcher3/h0;->w3:Z

    .line 71
    iput-boolean v1, p0, Lcom/android/launcher3/h0;->x3:Z

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/android/launcher3/F1;Lcom/android/launcher3/util/Z$c;Lcom/android/launcher3/util/window/d;Ln1/C;Lcom/android/launcher3/util/p3;Landroid/util/SparseArray;ZZZZLcom/android/launcher3/h0$b;Ljava/util/function/Consumer;Z)V
    .locals 33
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/android/launcher3/F1;",
            "Lcom/android/launcher3/util/Z$c;",
            "Lcom/android/launcher3/util/window/d;",
            "Ln1/C;",
            "Lcom/android/launcher3/util/p3;",
            "Landroid/util/SparseArray<",
            "Ls1/m;",
            ">;ZZZZ",
            "Lcom/android/launcher3/h0$b;",
            "Ljava/util/function/Consumer<",
            "Lcom/android/launcher3/h0;",
            ">;Z)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v2, p2

    move-object/from16 v1, p3

    move-object/from16 v3, p6

    move/from16 v6, p8

    move/from16 v4, p10

    move/from16 v5, p11

    move/from16 v7, p14

    .line 72
    invoke-direct {v0}, Lcom/android/launcher3/X3;-><init>()V

    .line 73
    new-instance v8, Landroid/graphics/Rect;

    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    iput-object v8, v0, Lcom/android/launcher3/h0;->q1:Landroid/graphics/Rect;

    const/4 v8, -0x1

    .line 74
    iput v8, v0, Lcom/android/launcher3/h0;->K1:I

    .line 75
    new-instance v9, Landroid/graphics/Rect;

    invoke-direct {v9}, Landroid/graphics/Rect;-><init>()V

    iput-object v9, v0, Lcom/android/launcher3/h0;->E2:Landroid/graphics/Rect;

    .line 76
    new-instance v9, Landroid/graphics/Rect;

    invoke-direct {v9}, Landroid/graphics/Rect;-><init>()V

    iput-object v9, v0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 77
    new-instance v10, Landroid/graphics/Rect;

    invoke-direct {v10}, Landroid/graphics/Rect;-><init>()V

    iput-object v10, v0, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 78
    new-instance v10, Landroid/graphics/Rect;

    invoke-direct {v10}, Landroid/graphics/Rect;-><init>()V

    iput-object v10, v0, Lcom/android/launcher3/h0;->m3:Landroid/graphics/Rect;

    const v10, 0x3e11c6d2    # 0.14236f

    .line 79
    iput v10, v0, Lcom/android/launcher3/h0;->z3:F

    .line 80
    iput-object v2, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 81
    invoke-virtual {v3}, Lcom/android/launcher3/util/p3;->b()Z

    move-result v10

    iput-boolean v10, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 82
    iput-boolean v6, v0, Lcom/android/launcher3/h0;->O0:Z

    move/from16 v11, p9

    .line 83
    iput-boolean v11, v0, Lcom/android/launcher3/h0;->I0:Z

    .line 84
    iput-boolean v4, v0, Lcom/android/launcher3/h0;->J0:Z

    .line 85
    iput-boolean v5, v0, Lcom/android/launcher3/h0;->P0:Z

    .line 86
    iget-object v11, v3, Lcom/android/launcher3/util/p3;->a:Landroid/graphics/Rect;

    iget v12, v11, Landroid/graphics/Rect;->left:I

    iput v12, v0, Lcom/android/launcher3/h0;->R0:I

    .line 87
    iget v11, v11, Landroid/graphics/Rect;->top:I

    iput v11, v0, Lcom/android/launcher3/h0;->S0:I

    .line 88
    iget v11, v3, Lcom/android/launcher3/util/p3;->d:I

    iput v11, v0, Lcom/android/launcher3/h0;->X0:I

    .line 89
    iget-object v11, v3, Lcom/android/launcher3/util/p3;->b:Landroid/graphics/Rect;

    invoke-virtual {v9, v11}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 90
    iget v11, v2, Lcom/android/launcher3/F1;->n1:I

    const/4 v13, 0x0

    if-eq v11, v8, :cond_0

    iget v11, v2, Lcom/android/launcher3/F1;->q1:I

    if-eq v11, v8, :cond_0

    iget v11, v2, Lcom/android/launcher3/F1;->s1:I

    if-eq v11, v8, :cond_0

    iget v11, v2, Lcom/android/launcher3/F1;->u1:I

    if-eq v11, v8, :cond_0

    iget v11, v2, Lcom/android/launcher3/F1;->w1:I

    if-eq v11, v8, :cond_0

    iget v11, v2, Lcom/android/launcher3/F1;->y1:I

    if-eq v11, v8, :cond_0

    const/4 v11, 0x1

    goto :goto_0

    :cond_0
    move v11, v13

    :goto_0
    iput-boolean v11, v0, Lcom/android/launcher3/h0;->b1:Z

    .line 91
    iget-boolean v14, v2, Lcom/android/launcher3/F1;->l1:Z

    if-eqz v14, :cond_1

    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    move-result v14

    if-nez v14, :cond_1

    if-nez v6, :cond_1

    const/4 v14, 0x1

    goto :goto_1

    :cond_1
    move v14, v13

    :goto_1
    iput-boolean v14, v0, Lcom/android/launcher3/h0;->Z0:Z

    .line 92
    iput-object v1, v0, Lcom/android/launcher3/h0;->D0:Lcom/android/launcher3/util/Z$c;

    .line 93
    invoke-virtual {v1, v3}, Lcom/android/launcher3/util/Z$c;->q(Lcom/android/launcher3/util/p3;)Z

    move-result v15

    iput-boolean v15, v0, Lcom/android/launcher3/h0;->G0:Z

    xor-int/lit8 v8, v15, 0x1

    .line 94
    iput-boolean v8, v0, Lcom/android/launcher3/h0;->H0:Z

    if-eqz v15, :cond_2

    if-eqz v4, :cond_2

    const/4 v8, 0x1

    goto :goto_2

    :cond_2
    move v8, v13

    .line 95
    :goto_2
    iput-boolean v8, v0, Lcom/android/launcher3/h0;->K0:Z

    .line 96
    invoke-static {}, LH2/c;->q()Z

    move-result v16

    if-nez v16, :cond_3

    .line 97
    invoke-static {}, LH2/c;->b()Z

    move-result v16

    if-eqz v16, :cond_3

    invoke-static {}, LH2/c;->c()Z

    .line 98
    :cond_3
    iput-boolean v13, v0, Lcom/android/launcher3/h0;->p3:Z

    .line 99
    iget-boolean v12, v2, Lcom/android/launcher3/F1;->C1:Z

    if-nez v12, :cond_5

    .line 100
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    move-result v12

    if-nez v12, :cond_5

    if-eqz v15, :cond_4

    if-eqz v10, :cond_4

    goto :goto_4

    :cond_4
    const/4 v12, 0x1

    :goto_3
    move-object/from16 v13, p1

    goto :goto_5

    :cond_5
    :goto_4
    const/4 v12, 0x2

    goto :goto_3

    .line 101
    :goto_5
    invoke-static {v13, v1, v12, v3}, Lcom/android/launcher3/h0;->m0(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;ILcom/android/launcher3/util/p3;)Landroid/content/Context;

    move-result-object v1

    .line 102
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const/4 v13, 0x0

    invoke-static {v1, v12, v13}, Lx1/O;->D(Landroid/content/Context;Landroid/content/res/Resources;Z)V

    .line 103
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    .line 104
    invoke-virtual {v12}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v13

    iput-object v13, v0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 105
    new-instance v4, Lcom/android/launcher3/util/w0;

    invoke-direct {v4, v12}, Lcom/android/launcher3/util/w0;-><init>(Landroid/content/res/Resources;)V

    iput-object v4, v0, Lcom/android/launcher3/h0;->F0:Lcom/android/launcher3/util/w0;

    .line 106
    iget-object v4, v3, Lcom/android/launcher3/util/p3;->a:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    iput v4, v0, Lcom/android/launcher3/h0;->T0:I

    .line 107
    iget-object v5, v3, Lcom/android/launcher3/util/p3;->a:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v5

    iput v5, v0, Lcom/android/launcher3/h0;->U0:I

    .line 108
    iget-object v3, v3, Lcom/android/launcher3/util/p3;->c:Landroid/graphics/Point;

    iget v6, v3, Landroid/graphics/Point;->x:I

    iput v6, v0, Lcom/android/launcher3/h0;->V0:I

    .line 109
    iget v3, v3, Landroid/graphics/Point;->y:I

    iput v3, v0, Lcom/android/launcher3/h0;->W0:I

    .line 110
    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v3

    int-to-float v3, v3

    move/from16 v16, v3

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    int-to-float v3, v3

    div-float v3, v16, v3

    iput v3, v0, Lcom/android/launcher3/h0;->Y0:F

    move/from16 p1, v3

    const/4 v3, 0x3

    if-eqz v8, :cond_7

    if-eqz v10, :cond_6

    .line 111
    iput v3, v0, Lcom/android/launcher3/h0;->a1:I

    goto :goto_6

    :cond_6
    const/4 v3, 0x2

    .line 112
    iput v3, v0, Lcom/android/launcher3/h0;->a1:I

    goto :goto_6

    :cond_7
    if-eqz v10, :cond_8

    const/4 v3, 0x1

    .line 113
    iput v3, v0, Lcom/android/launcher3/h0;->a1:I

    goto :goto_6

    :cond_8
    const/4 v3, 0x0

    .line 114
    iput v3, v0, Lcom/android/launcher3/h0;->a1:I

    .line 115
    :goto_6
    iput-boolean v7, v0, Lcom/android/launcher3/h0;->x3:Z

    .line 116
    iget-object v3, v2, Lcom/android/launcher3/F1;->b1:[F

    move-object/from16 v16, v3

    iget v3, v0, Lcom/android/launcher3/h0;->a1:I

    aget v3, v16, v3

    invoke-static {v3, v13}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    move-result v3

    move/from16 v20, v6

    const v6, 0x7f070c1d

    .line 117
    invoke-virtual {v12, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    int-to-float v7, v3

    const v16, 0x3f6b851f    # 0.92f

    mul-float v7, v7, v16

    move/from16 p6, v7

    const v7, 0x7f070c21

    .line 118
    invoke-virtual {v12, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    const/16 v16, 0x2

    mul-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    add-float v7, p6, v7

    .line 119
    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    mul-int/lit8 v16, v6, 0x2

    move/from16 v22, v8

    add-int v8, v7, v16

    .line 120
    iput v8, v0, Lcom/android/launcher3/h0;->v3:I

    .line 121
    iget-boolean v8, v0, Lcom/android/launcher3/h0;->p3:Z

    if-nez v8, :cond_9

    const/4 v8, 0x0

    .line 122
    iput v8, v0, Lcom/android/launcher3/h0;->t3:I

    iput v8, v0, Lcom/android/launcher3/h0;->s3:I

    iput v8, v0, Lcom/android/launcher3/h0;->r3:I

    iput v8, v0, Lcom/android/launcher3/h0;->u3:I

    .line 123
    iput-boolean v8, v0, Lcom/android/launcher3/h0;->w3:Z

    goto :goto_7

    :cond_9
    const/4 v8, 0x0

    if-eqz p14, :cond_a

    .line 124
    iput v3, v0, Lcom/android/launcher3/h0;->u3:I

    .line 125
    iput v7, v0, Lcom/android/launcher3/h0;->r3:I

    const v3, 0x7f070c24

    .line 126
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->s3:I

    .line 127
    iput v6, v0, Lcom/android/launcher3/h0;->t3:I

    .line 128
    iput-boolean v8, v0, Lcom/android/launcher3/h0;->w3:Z

    goto :goto_7

    :cond_a
    const v3, 0x7f070b9a

    .line 129
    invoke-static {v12, v3}, LA/h;->g(Landroid/content/res/Resources;I)F

    move-result v3

    invoke-static {v3, v13}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->u3:I

    const v3, 0x7f070baf

    .line 130
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->r3:I

    const v3, 0x7f070bb6

    .line 131
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->s3:I

    const/4 v3, 0x0

    .line 132
    iput v3, v0, Lcom/android/launcher3/h0;->t3:I

    .line 133
    iget-object v3, v2, Lcom/android/launcher3/F1;->c1:[Z

    iget v6, v0, Lcom/android/launcher3/h0;->a1:I

    aget-boolean v3, v3, v6

    iput-boolean v3, v0, Lcom/android/launcher3/h0;->w3:Z

    .line 134
    :goto_7
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v3, 0x0

    goto :goto_8

    :cond_b
    const v3, 0x7f0702e7

    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    :goto_8
    iput v3, v0, Lcom/android/launcher3/h0;->r1:I

    const v6, 0x7f070cde

    .line 135
    invoke-virtual {v12, v6}, Landroid/content/res/Resources;->getFloat(I)F

    move-result v6

    iput v6, v0, Lcom/android/launcher3/h0;->s1:F

    .line 136
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    move-result v7

    if-eqz v7, :cond_c

    const/4 v7, 0x0

    goto :goto_9

    :cond_c
    const v7, 0x7f070401

    invoke-virtual {v12, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    :goto_9
    iput v7, v0, Lcom/android/launcher3/h0;->n1:I

    .line 137
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    move-result v7

    if-eqz v7, :cond_d

    const/4 v7, 0x0

    goto :goto_a

    :cond_d
    const v7, 0x7f070405

    invoke-virtual {v12, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    :goto_a
    iput v7, v0, Lcom/android/launcher3/h0;->o1:I

    const/high16 v7, 0x3fc00000    # 1.5f

    if-eqz v15, :cond_e

    if-nez v10, :cond_e

    cmpl-float v8, p1, v7

    if-lez v8, :cond_e

    const/4 v8, 0x1

    goto :goto_b

    :cond_e
    const/4 v8, 0x0

    .line 138
    :goto_b
    div-int/lit8 v16, v5, 0x6

    move/from16 p6, v7

    .line 139
    iget v7, v9, Landroid/graphics/Rect;->top:I

    if-eqz v8, :cond_f

    goto :goto_c

    :cond_f
    const/16 v16, 0x0

    :goto_c
    add-int v7, v7, v16

    if-eqz v15, :cond_10

    const/4 v3, 0x0

    :cond_10
    add-int/2addr v7, v3

    .line 140
    iput v7, v0, Lcom/android/launcher3/h0;->x2:I

    const v3, 0x7f0c0028

    .line 141
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->y2:I

    const v3, 0x7f0c0027

    .line 142
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->z2:I

    .line 143
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->e1()Z

    move-result v3

    const/high16 v7, 0x3f800000    # 1.0f

    if-eqz v3, :cond_14

    .line 144
    iput v6, v0, Lcom/android/launcher3/h0;->A2:F

    .line 145
    invoke-static {}, Lcom/android/launcher3/y0;->b()Z

    move-result v3

    if-eqz v3, :cond_11

    const/high16 v3, 0x40000000    # 2.0f

    .line 146
    iput v3, v0, Lcom/android/launcher3/h0;->B2:F

    goto :goto_d

    :cond_11
    if-eqz p10, :cond_13

    .line 147
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    move-result v3

    if-eqz v3, :cond_12

    const v3, 0x3e99999a    # 0.3f

    .line 148
    iput v3, v0, Lcom/android/launcher3/h0;->B2:F

    goto :goto_d

    .line 149
    :cond_12
    iput v7, v0, Lcom/android/launcher3/h0;->B2:F

    goto :goto_d

    :cond_13
    const v3, 0x7f07022a

    .line 150
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getFloat(I)F

    move-result v24

    mul-float v23, v24, v6

    const/high16 v27, 0x3f800000    # 1.0f

    .line 151
    sget-object v28, LJ0/h;->q:Landroid/view/animation/Interpolator;

    const/high16 v25, 0x3f800000    # 1.0f

    const/16 v26, 0x0

    invoke-static/range {v23 .. v28}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->B2:F

    goto :goto_d

    .line 152
    :cond_14
    iput v7, v0, Lcom/android/launcher3/h0;->A2:F

    const/4 v3, 0x0

    .line 153
    iput v3, v0, Lcom/android/launcher3/h0;->B2:F

    :goto_d
    const v3, 0x7f070353

    .line 154
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getFloat(I)F

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->N1:F

    .line 155
    iget-object v3, v2, Lcom/android/launcher3/F1;->J0:[I

    iget v6, v0, Lcom/android/launcher3/h0;->a1:I

    aget v3, v3, v6

    iput v3, v0, Lcom/android/launcher3/h0;->L1:I

    .line 156
    iget-object v7, v2, Lcom/android/launcher3/F1;->K0:[I

    aget v6, v7, v6

    iput v6, v0, Lcom/android/launcher3/h0;->M1:I

    if-eqz v14, :cond_15

    .line 157
    iget v7, v2, Lcom/android/launcher3/F1;->U0:I

    const/4 v8, -0x1

    if-eq v7, v8, :cond_15

    .line 158
    sget-object v8, Lcom/android/launcher3/x5;->H0:[I

    invoke-virtual {v1, v7, v8}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v7

    move/from16 p10, v3

    const/4 v8, 0x1

    const/4 v14, 0x0

    .line 159
    invoke-virtual {v7, v8, v14}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->W1:I

    const/4 v3, 0x2

    .line 160
    invoke-virtual {v7, v3, v14}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v8

    iput v8, v0, Lcom/android/launcher3/h0;->V1:I

    const/4 v3, 0x4

    .line 161
    invoke-virtual {v7, v3, v14}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->U1:I

    .line 162
    invoke-virtual {v7, v14, v14}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    .line 163
    new-instance v8, Landroid/graphics/Point;

    invoke-direct {v8, v3, v3}, Landroid/graphics/Point;-><init>(II)V

    iput-object v8, v0, Lcom/android/launcher3/h0;->S1:Landroid/graphics/Point;

    const/4 v3, 0x3

    .line 164
    invoke-virtual {v7, v3, v14}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v8

    iput v8, v0, Lcom/android/launcher3/h0;->P1:I

    .line 165
    invoke-virtual {v7}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_e

    :cond_15
    move/from16 p10, v3

    const/4 v14, 0x0

    if-nez v11, :cond_16

    .line 166
    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3, v14, v14}, Landroid/graphics/Point;-><init>(II)V

    iput-object v3, v0, Lcom/android/launcher3/h0;->S1:Landroid/graphics/Point;

    const v3, 0x7f07034e

    .line 167
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->P1:I

    const v3, 0x7f070367

    .line 168
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->U1:I

    .line 169
    :cond_16
    :goto_e
    new-instance v3, Landroid/graphics/Point;

    iget-object v7, v2, Lcom/android/launcher3/F1;->a1:[Landroid/graphics/PointF;

    iget v8, v0, Lcom/android/launcher3/h0;->a1:I

    aget-object v7, v7, v8

    iget v7, v7, Landroid/graphics/PointF;->x:F

    .line 170
    invoke-static {v7, v13}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    move-result v7

    iget-object v8, v2, Lcom/android/launcher3/F1;->a1:[Landroid/graphics/PointF;

    iget v14, v0, Lcom/android/launcher3/h0;->a1:I

    aget-object v8, v8, v14

    iget v8, v8, Landroid/graphics/PointF;->y:F

    .line 171
    invoke-static {v8, v13}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    move-result v8

    invoke-direct {v3, v7, v8}, Landroid/graphics/Point;-><init>(II)V

    iput-object v3, v0, Lcom/android/launcher3/h0;->C2:Landroid/graphics/Point;

    .line 172
    invoke-direct {v0, v1}, Lcom/android/launcher3/h0;->W0(Landroid/content/Context;)V

    const v3, 0x7f070cf4

    .line 173
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->y1:I

    const v7, 0x7f070cf7

    .line 174
    invoke-virtual {v12, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    iput v7, v0, Lcom/android/launcher3/h0;->z1:I

    if-nez v11, :cond_18

    .line 175
    iget v7, v2, Lcom/android/launcher3/F1;->V0:I

    const/4 v8, -0x1

    if-eq v7, v8, :cond_17

    .line 176
    sget-object v8, Lcom/android/launcher3/x5;->Q:[I

    invoke-virtual {v1, v7, v8}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v7

    :goto_f
    const/4 v8, 0x0

    goto :goto_10

    :cond_17
    const v7, 0x7f150160

    .line 177
    sget-object v8, Lcom/android/launcher3/x5;->Q:[I

    invoke-virtual {v1, v7, v8}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v7

    goto :goto_f

    .line 178
    :goto_10
    invoke-virtual {v7, v8, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v14

    iput v14, v0, Lcom/android/launcher3/h0;->E1:I

    .line 179
    invoke-virtual {v7}, Landroid/content/res/TypedArray;->recycle()V

    :cond_18
    const v7, 0x7f0702e6

    .line 180
    invoke-virtual {v12, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    iput v7, v0, Lcom/android/launcher3/h0;->b3:I

    if-eqz v15, :cond_19

    if-nez v10, :cond_19

    cmpg-float v7, p1, p6

    if-gez v7, :cond_19

    const/4 v7, 0x1

    goto :goto_11

    :cond_19
    const/4 v7, 0x0

    :goto_11
    if-eqz v7, :cond_1a

    const/4 v8, 0x0

    goto :goto_12

    :cond_1a
    const v8, 0x7f0702dd

    .line 181
    invoke-virtual {v12, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    :goto_12
    iput v8, v0, Lcom/android/launcher3/h0;->c3:I

    if-eqz v7, :cond_1b

    const v8, 0x7f0702d2

    .line 182
    invoke-virtual {v12, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    goto :goto_13

    :cond_1b
    const v8, 0x7f0702d1

    .line 183
    invoke-virtual {v12, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    :goto_13
    iput v8, v0, Lcom/android/launcher3/h0;->d3:I

    const v8, 0x7f0702da

    .line 184
    invoke-virtual {v12, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v0, Lcom/android/launcher3/h0;->e3:I

    const v8, 0x7f0702dc

    .line 185
    invoke-virtual {v12, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v0, Lcom/android/launcher3/h0;->f3:I

    const v8, 0x7f0702d3

    .line 186
    invoke-virtual {v12, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v0, Lcom/android/launcher3/h0;->g3:I

    const v8, 0x7f0702d6

    .line 187
    invoke-virtual {v12, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v0, Lcom/android/launcher3/h0;->h3:I

    const v8, 0x7f0702d8

    .line 188
    invoke-virtual {v12, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v0, Lcom/android/launcher3/h0;->i3:I

    const v8, 0x7f0702d9

    .line 189
    invoke-virtual {v12, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v0, Lcom/android/launcher3/h0;->j3:I

    const v8, 0x7f0702ee

    .line 190
    invoke-virtual {v12, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v0, Lcom/android/launcher3/h0;->t1:I

    const v8, 0x7f0702e5

    .line 191
    invoke-virtual {v12, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v0, Lcom/android/launcher3/h0;->J1:I

    const v8, 0x7f070a1b

    .line 192
    invoke-virtual {v12, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v0, Lcom/android/launcher3/h0;->p2:I

    const v14, 0x7f070a1a

    .line 193
    invoke-virtual {v12, v14}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v14

    iput v14, v0, Lcom/android/launcher3/h0;->r2:I

    const/16 v16, 0x2

    mul-int/lit8 v14, v14, 0x2

    sub-int v14, v8, v14

    .line 194
    iput v14, v0, Lcom/android/launcher3/h0;->q2:I

    .line 195
    iget-object v14, v2, Lcom/android/launcher3/F1;->H1:[Z

    if-eqz v22, :cond_1c

    aget-boolean v17, v14, v16

    if-nez v17, :cond_1d

    const/16 v16, 0x3

    aget-boolean v14, v14, v16

    goto :goto_14

    :cond_1c
    const/16 v16, 0x0

    aget-boolean v17, v14, v16

    if-nez v17, :cond_1d

    const/16 v16, 0x1

    aget-boolean v14, v14, v16

    .line 196
    :cond_1d
    :goto_14
    invoke-direct {v0, v2}, Lcom/android/launcher3/h0;->Q0(Lcom/android/launcher3/F1;)Z

    move-result v8

    iput-boolean v8, v0, Lcom/android/launcher3/h0;->M0:Z

    .line 197
    iget-boolean v8, v0, Lcom/android/launcher3/h0;->p3:Z

    if-eqz v8, :cond_1e

    if-nez p11, :cond_1e

    const/4 v8, 0x1

    goto :goto_15

    :cond_1e
    const/4 v8, 0x0

    :goto_15
    iput-boolean v8, v0, Lcom/android/launcher3/h0;->e2:Z

    if-eqz v22, :cond_1f

    .line 198
    iget v14, v2, Lcom/android/launcher3/F1;->e1:I

    goto :goto_16

    :cond_1f
    iget v14, v2, Lcom/android/launcher3/F1;->d1:I

    :goto_16
    iput v14, v0, Lcom/android/launcher3/h0;->a2:I

    .line 199
    iget v14, v2, Lcom/android/launcher3/F1;->H0:I

    iput v14, v0, Lcom/android/launcher3/h0;->c2:I

    if-eqz v22, :cond_20

    .line 200
    iget v14, v2, Lcom/android/launcher3/F1;->j1:I

    goto :goto_17

    :cond_20
    iget v14, v2, Lcom/android/launcher3/F1;->h1:I

    :goto_17
    iput v14, v0, Lcom/android/launcher3/h0;->M2:I

    move/from16 p1, v3

    const v3, 0x7f07082b

    .line 201
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    if-eqz v11, :cond_26

    move/from16 p4, v3

    int-to-float v3, v4

    move/from16 v16, v3

    int-to-float v3, v5

    div-float v3, v16, v3

    move/from16 v26, v6

    .line 202
    new-instance v6, Lcom/android/launcher3/util/W1;

    move/from16 p6, v7

    if-eqz v22, :cond_21

    .line 203
    iget v7, v2, Lcom/android/launcher3/F1;->v1:I

    goto :goto_18

    :cond_21
    iget v7, v2, Lcom/android/launcher3/F1;->u1:I

    :goto_18
    invoke-direct {v6, v1, v7}, Lcom/android/launcher3/util/W1;-><init>(Landroid/content/Context;I)V

    .line 204
    invoke-static {v6}, LH1/f;->a(Lcom/android/launcher3/util/W1;)LH1/f;

    move-result-object v6

    .line 205
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    move-result v7

    if-eqz v7, :cond_22

    sget-object v7, LH1/j$b;->h:LH1/j$b;

    invoke-virtual {v6, v3, v7, v4}, LH1/f;->b(FLH1/j$b;I)LH1/b;

    move-result-object v6

    goto :goto_19

    .line 206
    :cond_22
    sget-object v7, LH1/j$b;->g:LH1/j$b;

    invoke-virtual {v6, v3, v7, v5}, LH1/f;->b(FLH1/j$b;I)LH1/b;

    move-result-object v6

    :goto_19
    iput-object v6, v0, Lcom/android/launcher3/h0;->i1:LH1/b;

    .line 207
    invoke-virtual {v6}, LH1/b;->b()I

    move-result v6

    iput v6, v0, Lcom/android/launcher3/h0;->i2:I

    .line 208
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    move-result v6

    if-eqz v6, :cond_23

    const/4 v6, 0x0

    goto :goto_1a

    :cond_23
    iget-object v6, v0, Lcom/android/launcher3/h0;->i1:LH1/b;

    invoke-virtual {v6}, LH1/b;->a()I

    move-result v6

    .line 209
    :goto_1a
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    move-result v7

    if-eqz v7, :cond_24

    iget-object v7, v0, Lcom/android/launcher3/h0;->i1:LH1/b;

    invoke-virtual {v7}, LH1/b;->a()I

    move-result v7

    goto :goto_1b

    :cond_24
    const/4 v7, 0x0

    :goto_1b
    iput v7, v0, Lcom/android/launcher3/h0;->m2:I

    const/4 v7, 0x0

    .line 210
    iput v7, v0, Lcom/android/launcher3/h0;->n2:I

    .line 211
    new-instance v7, Lcom/android/launcher3/util/W1;

    if-eqz v22, :cond_25

    move/from16 p1, v6

    .line 212
    iget v6, v2, Lcom/android/launcher3/F1;->x1:I

    goto :goto_1c

    :cond_25
    move/from16 p1, v6

    .line 213
    iget v6, v2, Lcom/android/launcher3/F1;->w1:I

    :goto_1c
    invoke-direct {v7, v1, v6}, Lcom/android/launcher3/util/W1;-><init>(Landroid/content/Context;I)V

    .line 214
    invoke-static {v7}, LH1/i;->a(Lcom/android/launcher3/util/W1;)LH1/i;

    move-result-object v6

    .line 215
    invoke-virtual {v6, v3, v5}, LH1/i;->b(FI)LH1/a;

    move-result-object v3

    iput-object v3, v0, Lcom/android/launcher3/h0;->j1:LH1/a;

    move/from16 v6, p1

    goto :goto_1e

    :cond_26
    move/from16 p4, v3

    move/from16 v26, v6

    move/from16 p6, v7

    .line 216
    iget-object v3, v2, Lcom/android/launcher3/F1;->g1:[F

    iget v6, v0, Lcom/android/launcher3/h0;->a1:I

    aget v3, v3, v6

    invoke-static {v3, v13}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->i2:I

    .line 217
    iget-object v3, v2, Lcom/android/launcher3/F1;->f1:[F

    iget v6, v0, Lcom/android/launcher3/h0;->a1:I

    aget v3, v3, v6

    invoke-static {v3, v13}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    move-result v6

    .line 218
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    move-result v3

    if-eqz v3, :cond_27

    move/from16 v3, p1

    goto :goto_1d

    :cond_27
    const/4 v3, 0x0

    :goto_1d
    iput v3, v0, Lcom/android/launcher3/h0;->m2:I

    const v3, 0x7f0702ea

    .line 219
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->n2:I

    .line 220
    :goto_1e
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    move-result v3

    if-nez v3, :cond_2b

    .line 221
    iget v3, v9, Landroid/graphics/Rect;->bottom:I

    add-int v7, v3, p4

    if-le v7, v6, :cond_2a

    .line 222
    iget v7, v0, Lcom/android/launcher3/h0;->i2:I

    sub-int v6, v3, v6

    sub-int v6, v7, v6

    if-lez v6, :cond_29

    move/from16 v16, v3

    mul-int/lit8 v3, p4, 0x2

    if-ge v6, v3, :cond_28

    const/4 v3, 0x2

    .line 223
    div-int/2addr v6, v3

    .line 224
    iput v6, v0, Lcom/android/launcher3/h0;->i2:I

    move v3, v6

    goto :goto_20

    :cond_28
    sub-int v7, v7, p4

    .line 225
    iput v7, v0, Lcom/android/launcher3/h0;->i2:I

    goto :goto_1f

    :cond_29
    move/from16 v16, v3

    :goto_1f
    move/from16 v3, p4

    :goto_20
    add-int v3, v16, v3

    .line 226
    iput v3, v0, Lcom/android/launcher3/h0;->g2:I

    goto :goto_21

    .line 227
    :cond_2a
    iput v6, v0, Lcom/android/launcher3/h0;->g2:I

    :cond_2b
    :goto_21
    if-eqz p6, :cond_2c

    const v3, 0x7f070a93

    .line 228
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    goto :goto_22

    :cond_2c
    const v3, 0x7f070a92

    .line 229
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    :goto_22
    iput v3, v0, Lcom/android/launcher3/h0;->l2:I

    if-eqz v11, :cond_2d

    .line 230
    iget-object v3, v0, Lcom/android/launcher3/h0;->j1:LH1/a;

    invoke-virtual {v3}, LH1/a;->b()I

    move-result v3

    invoke-direct {v0, v3}, Lcom/android/launcher3/h0;->n1(I)V

    goto :goto_23

    .line 231
    :cond_2d
    iget-object v3, v2, Lcom/android/launcher3/F1;->L0:[F

    iget v6, v0, Lcom/android/launcher3/h0;->a1:I

    aget v3, v3, v6

    invoke-static {v3, v13}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    move-result v3

    invoke-direct {v0, v3}, Lcom/android/launcher3/h0;->n1(I)V

    :goto_23
    if-eqz v8, :cond_2e

    if-eqz v15, :cond_2e

    .line 232
    iget v3, v2, Lcom/android/launcher3/F1;->T0:I

    .line 233
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->j2:I

    const v3, 0x7f070ba2

    .line 234
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    const/16 v16, 0x3

    mul-int/lit8 v3, v3, 0x3

    const v6, 0x7f070b74

    .line 235
    invoke-virtual {v12, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    const/16 v16, 0x2

    mul-int/lit8 v6, v6, 0x2

    add-int/2addr v3, v6

    iput v3, v0, Lcom/android/launcher3/h0;->k2:I

    .line 236
    iget v6, v0, Lcom/android/launcher3/h0;->j2:I

    add-int/2addr v3, v6

    iput v3, v0, Lcom/android/launcher3/h0;->h2:I

    :cond_2e
    const v3, 0x7f07016a

    .line 237
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->w2:I

    if-eqz v11, :cond_35

    .line 238
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    move-result v3

    if-eqz v3, :cond_2f

    iget v13, v0, Lcom/android/launcher3/h0;->f2:I

    goto :goto_24

    :cond_2f
    const/4 v13, 0x0

    :goto_24
    sub-int v6, v20, v13

    .line 239
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->H0()I

    move-result v3

    iget v7, v2, Lcom/android/launcher3/F1;->H0:I

    mul-int/2addr v3, v7

    .line 240
    iget v7, v9, Landroid/graphics/Rect;->top:I

    sub-int v7, v5, v7

    .line 241
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    move-result v13

    if-eqz v13, :cond_30

    const/4 v13, 0x0

    goto :goto_25

    :cond_30
    iget v13, v0, Lcom/android/launcher3/h0;->f2:I

    :goto_25
    sub-int/2addr v7, v13

    int-to-float v13, v4

    move/from16 p1, v4

    int-to-float v4, v5

    div-float/2addr v13, v4

    .line 242
    new-instance v4, Lcom/android/launcher3/util/W1;

    move/from16 p3, v5

    if-eqz v22, :cond_31

    .line 243
    iget v5, v2, Lcom/android/launcher3/F1;->p1:I

    goto :goto_26

    :cond_31
    iget v5, v2, Lcom/android/launcher3/F1;->n1:I

    :goto_26
    invoke-direct {v4, v1, v5}, Lcom/android/launcher3/util/W1;-><init>(Landroid/content/Context;I)V

    sget-object v5, LH1/j$a$a;->j:LH1/j$a$a;

    .line 244
    invoke-static {v4, v5}, LH1/p;->a(Lcom/android/launcher3/util/W1;LH1/j$a$a;)LH1/p;

    move-result-object v4

    .line 245
    sget-object v5, LH1/j$b;->h:LH1/j$b;

    invoke-virtual {v4, v13, v5, v3, v6}, LH1/p;->b(FLH1/j$b;II)LH1/c;

    move-result-object v3

    iput-object v3, v0, Lcom/android/launcher3/h0;->c1:LH1/c;

    .line 246
    sget-object v3, LH1/j$b;->g:LH1/j$b;

    iget v6, v2, Lcom/android/launcher3/F1;->G0:I

    invoke-virtual {v4, v13, v3, v6, v7}, LH1/p;->b(FLH1/j$b;II)LH1/c;

    move-result-object v4

    iput-object v4, v0, Lcom/android/launcher3/h0;->d1:LH1/c;

    .line 247
    new-instance v4, Lcom/android/launcher3/util/W1;

    if-eqz v22, :cond_32

    .line 248
    iget v6, v2, Lcom/android/launcher3/F1;->r1:I

    goto :goto_27

    :cond_32
    iget v6, v2, Lcom/android/launcher3/F1;->q1:I

    :goto_27
    invoke-direct {v4, v1, v6}, Lcom/android/launcher3/util/W1;-><init>(Landroid/content/Context;I)V

    sget-object v6, LH1/j$a$a;->h:LH1/j$a$a;

    .line 249
    invoke-static {v4, v6}, LH1/p;->a(Lcom/android/launcher3/util/W1;LH1/j$a$a;)LH1/p;

    move-result-object v27

    .line 250
    iget-object v4, v0, Lcom/android/launcher3/h0;->c1:LH1/c;

    move-object/from16 v21, v4

    move-object/from16 v18, v5

    move/from16 v17, v13

    move/from16 v19, v14

    move-object/from16 v16, v27

    invoke-virtual/range {v16 .. v21}, LH1/p;->c(FLH1/j$b;IILH1/c;)LH1/c;

    move-result-object v4

    move/from16 v24, v17

    iput-object v4, v0, Lcom/android/launcher3/h0;->e1:LH1/c;

    .line 251
    iget v4, v2, Lcom/android/launcher3/F1;->i1:I

    iget v5, v9, Landroid/graphics/Rect;->top:I

    sub-int v31, p3, v5

    iget-object v5, v0, Lcom/android/launcher3/h0;->d1:LH1/c;

    move-object/from16 v29, v3

    move/from16 v30, v4

    move-object/from16 v32, v5

    move/from16 v28, v24

    invoke-virtual/range {v27 .. v32}, LH1/p;->c(FLH1/j$b;IILH1/c;)LH1/c;

    move-result-object v3

    iput-object v3, v0, Lcom/android/launcher3/h0;->f1:LH1/c;

    .line 252
    new-instance v3, Lcom/android/launcher3/util/W1;

    if-eqz v22, :cond_33

    .line 253
    iget v4, v2, Lcom/android/launcher3/F1;->t1:I

    goto :goto_28

    :cond_33
    iget v4, v2, Lcom/android/launcher3/F1;->s1:I

    :goto_28
    invoke-direct {v3, v1, v4}, Lcom/android/launcher3/util/W1;-><init>(Landroid/content/Context;I)V

    sget-object v4, LH1/j$a$a;->i:LH1/j$a$a;

    .line 254
    invoke-static {v3, v4}, LH1/p;->a(Lcom/android/launcher3/util/W1;LH1/j$a$a;)LH1/p;

    move-result-object v23

    .line 255
    iget-object v3, v0, Lcom/android/launcher3/h0;->c1:LH1/c;

    .line 256
    invoke-virtual {v3}, LH1/c;->a()I

    move-result v27

    iget-object v3, v0, Lcom/android/launcher3/h0;->c1:LH1/c;

    move-object/from16 v28, v3

    move-object/from16 v25, v18

    .line 257
    invoke-virtual/range {v23 .. v28}, LH1/p;->c(FLH1/j$b;IILH1/c;)LH1/c;

    move-result-object v3

    iput-object v3, v0, Lcom/android/launcher3/h0;->g1:LH1/c;

    .line 258
    iget-object v3, v0, Lcom/android/launcher3/h0;->d1:LH1/c;

    .line 259
    invoke-virtual {v3}, LH1/c;->a()I

    move-result v27

    iget-object v3, v0, Lcom/android/launcher3/h0;->d1:LH1/c;

    move/from16 v26, p10

    move-object/from16 v28, v3

    move-object/from16 v25, v29

    .line 260
    invoke-virtual/range {v23 .. v28}, LH1/p;->c(FLH1/j$b;IILH1/c;)LH1/c;

    move-result-object v3

    move/from16 v13, v24

    iput-object v3, v0, Lcom/android/launcher3/h0;->h1:LH1/c;

    .line 261
    new-instance v3, Lcom/android/launcher3/util/W1;

    if-eqz v22, :cond_34

    .line 262
    iget v4, v2, Lcom/android/launcher3/F1;->z1:I

    goto :goto_29

    .line 263
    :cond_34
    iget v4, v2, Lcom/android/launcher3/F1;->y1:I

    :goto_29
    invoke-direct {v3, v1, v4}, Lcom/android/launcher3/util/W1;-><init>(Landroid/content/Context;I)V

    .line 264
    invoke-static {v3}, LH1/i;->a(Lcom/android/launcher3/util/W1;)LH1/i;

    move-result-object v3

    .line 265
    iget-object v4, v0, Lcom/android/launcher3/h0;->f1:LH1/c;

    .line 266
    invoke-virtual {v4}, LH1/c;->a()I

    move-result v4

    iget-object v5, v0, Lcom/android/launcher3/h0;->j1:LH1/a;

    .line 267
    invoke-virtual {v3, v13, v4, v5}, LH1/i;->c(FILH1/a;)LH1/a;

    move-result-object v3

    iput-object v3, v0, Lcom/android/launcher3/h0;->k1:LH1/a;

    goto :goto_2a

    :cond_35
    move/from16 p1, v4

    move/from16 p3, v5

    .line 268
    :goto_2a
    invoke-direct {v0, v2, v12}, Lcom/android/launcher3/h0;->o0(Lcom/android/launcher3/F1;Landroid/content/res/Resources;)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->m1:I

    .line 269
    iput v3, v0, Lcom/android/launcher3/h0;->l1:I

    const v3, 0x7f070997

    .line 270
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->O2:I

    .line 271
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    move-result v3

    if-eqz v3, :cond_36

    const v3, 0x7f070b48

    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    goto :goto_2b

    :cond_36
    const v3, 0x7f070b51

    .line 272
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    :goto_2b
    iput v3, v0, Lcom/android/launcher3/h0;->P2:I

    const v3, 0x7f070b3e

    .line 273
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->Q2:I

    const v3, 0x7f070b3f

    .line 274
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->R2:I

    .line 275
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    move-result v3

    if-eqz v3, :cond_37

    const/4 v13, 0x0

    goto :goto_2c

    :cond_37
    iget v3, v0, Lcom/android/launcher3/h0;->P2:I

    iget v4, v0, Lcom/android/launcher3/h0;->O2:I

    add-int v13, v3, v4

    :goto_2c
    iput v13, v0, Lcom/android/launcher3/h0;->S2:I

    .line 276
    invoke-static {}, Lcom/android/launcher3/y0;->j0()Z

    move-result v3

    if-eqz v3, :cond_38

    const/4 v13, 0x0

    goto :goto_2d

    :cond_38
    const v3, 0x7f07095e

    .line 277
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v13

    :goto_2d
    iput v13, v0, Lcom/android/launcher3/h0;->U2:I

    const v3, 0x7f070977

    .line 278
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->W2:I

    const v3, 0x7f070959

    .line 279
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->V2:I

    const v3, 0x7f07095a

    .line 280
    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, v0, Lcom/android/launcher3/h0;->T2:I

    .line 281
    invoke-super {v0, v1, v0, v12}, Lcom/android/launcher3/X3;->E(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/content/res/Resources;)V

    .line 282
    invoke-direct {v0, v2}, Lcom/android/launcher3/h0;->c0(Lcom/android/launcher3/F1;)Landroid/graphics/Point;

    move-result-object v3

    iput-object v3, v0, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    move-object v3, v1

    move-object/from16 v1, p0

    move/from16 v4, p1

    move/from16 v5, p3

    move/from16 v6, p8

    .line 283
    invoke-super/range {v0 .. v6}, Lcom/android/launcher3/X3;->B(Lcom/android/launcher3/h0;Lcom/android/launcher3/F1;Landroid/content/Context;IIZ)V

    const v1, 0x7f070a8f

    .line 284
    invoke-virtual {v12, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, v0, Lcom/android/launcher3/h0;->Z2:I

    .line 285
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v1

    const-string v4, "bool"

    const-string v6, "android"

    const-string v7, "config_leftRightSplitInPortrait"

    invoke-virtual {v1, v7, v4, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_39

    .line 286
    invoke-virtual {v12, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    if-eqz v1, :cond_39

    if-eqz v15, :cond_39

    const/16 v16, 0x1

    xor-int/lit8 v1, v10, 0x1

    .line 287
    iput-boolean v1, v0, Lcom/android/launcher3/h0;->Q0:Z

    goto :goto_2e

    .line 288
    :cond_39
    iput-boolean v10, v0, Lcom/android/launcher3/h0;->Q0:Z

    .line 289
    :goto_2e
    invoke-virtual {v0, v3}, Lcom/android/launcher3/h0;->k1(Landroid/content/Context;)I

    move-result v1

    iput v1, v0, Lcom/android/launcher3/h0;->u1:I

    .line 290
    invoke-direct {v0, v3, v2, v1}, Lcom/android/launcher3/h0;->N(Landroid/content/Context;Lcom/android/launcher3/F1;I)V

    if-eqz v22, :cond_3a

    .line 291
    iget-object v1, v0, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    iget v1, v1, Landroid/graphics/Point;->x:I

    const/4 v3, 0x2

    div-int/lit8 v13, v1, 0x2

    goto :goto_2f

    :cond_3a
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    move-result v1

    if-eqz v1, :cond_3b

    const/4 v13, 0x0

    goto :goto_2f

    :cond_3b
    const v1, 0x7f0701a1

    invoke-virtual {v12, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v13

    .line 292
    :goto_2f
    invoke-static {}, Lx1/O;->k1()Z

    move-result v1

    if-eqz v1, :cond_3c

    .line 293
    new-instance v1, Landroid/graphics/Rect;

    const v2, 0x7f070c41

    invoke-virtual {v12, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    add-int/2addr v2, v13

    invoke-direct {v1, v13, v2, v13, v13}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v1, v0, Lcom/android/launcher3/h0;->q1:Landroid/graphics/Rect;

    goto :goto_30

    .line 294
    :cond_3c
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1, v13, v13, v13, v13}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v1, v0, Lcom/android/launcher3/h0;->q1:Landroid/graphics/Rect;

    .line 295
    :goto_30
    invoke-direct {v0}, Lcom/android/launcher3/h0;->r1()V

    .line 296
    invoke-direct {v0, v12}, Lcom/android/launcher3/h0;->l1(Landroid/content/res/Resources;)V

    const v1, 0x7f070828

    .line 297
    invoke-virtual {v12, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, v0, Lcom/android/launcher3/h0;->t2:I

    const v1, 0x7f070829

    .line 298
    invoke-virtual {v12, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, v0, Lcom/android/launcher3/h0;->u2:I

    if-eqz v8, :cond_3d

    const v1, 0x7f0706d0

    .line 299
    invoke-virtual {v12, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    goto :goto_31

    :cond_3d
    const v1, 0x7fffffff

    :goto_31
    iput v1, v0, Lcom/android/launcher3/h0;->v2:I

    .line 300
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->V0()V

    if-eqz v11, :cond_3e

    .line 301
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    move-result v1

    if-eqz v1, :cond_3e

    .line 302
    iget-object v1, v0, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    iget v1, v1, Landroid/graphics/Point;->y:I

    iput v1, v0, Lcom/android/launcher3/h0;->s2:I

    .line 303
    :cond_3e
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->e1()Z

    move-result v1

    if-eqz v1, :cond_3f

    .line 304
    iget-object v1, v0, Lcom/android/launcher3/h0;->E2:Landroid/graphics/Rect;

    iget v2, v9, Landroid/graphics/Rect;->top:I

    iput v2, v1, Landroid/graphics/Rect;->top:I

    .line 305
    iput v5, v0, Lcom/android/launcher3/h0;->D2:I

    goto :goto_32

    .line 306
    :cond_3f
    iget-object v1, v0, Lcom/android/launcher3/h0;->E2:Landroid/graphics/Rect;

    const/4 v3, 0x0

    iput v3, v1, Landroid/graphics/Rect;->top:I

    .line 307
    iput v5, v0, Lcom/android/launcher3/h0;->D2:I

    :goto_32
    const v1, 0x7f0c0026

    .line 308
    invoke-virtual {v12, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, v0, Lcom/android/launcher3/h0;->F2:I

    const v1, 0x7f0c0025

    .line 309
    invoke-virtual {v12, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, v0, Lcom/android/launcher3/h0;->G2:I

    const v1, 0x7f0702c1

    .line 310
    invoke-virtual {v12, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, v0, Lcom/android/launcher3/h0;->y3:I

    move-object/from16 v1, p12

    .line 311
    iput-object v1, v0, Lcom/android/launcher3/h0;->a3:Lcom/android/launcher3/h0$b;

    move-object/from16 v1, p13

    .line 312
    invoke-interface {v1, v0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 313
    iget-object v1, v0, Lcom/android/launcher3/X3;->c:Ls1/m;

    iput-object v1, v0, Lcom/android/launcher3/h0;->n3:Ls1/m;

    .line 314
    iget-object v1, v0, Lcom/android/launcher3/X3;->c:Ls1/m;

    iput-object v1, v0, Lcom/android/launcher3/h0;->o3:Ls1/m;

    return-void
.end method

.method private B0(I)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/h0;->W1:I

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/h0;->X1:I

    .line 4
    .line 5
    sub-int/2addr v0, v1

    .line 6
    sub-int/2addr v0, p1

    .line 7
    div-int/lit8 v0, v0, 0x3

    .line 8
    .line 9
    invoke-direct {p0, v1}, Lcom/android/launcher3/h0;->x0(I)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    sub-int/2addr v1, p0

    .line 14
    div-int/lit8 v1, v1, 0x2

    .line 15
    .line 16
    sub-int/2addr v0, v1

    .line 17
    const/4 p0, 0x0

    .line 18
    invoke-static {p0, v0}, Ljava/lang/Math;->max(II)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method private C0()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/h0;->B1:I

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/h0;->E1:I

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/h0;->D0(II)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private D0(II)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/h0;->x0(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    sub-int/2addr p1, p0

    .line 6
    div-int/lit8 p1, p1, 0x2

    .line 7
    .line 8
    sub-int/2addr p2, p1

    .line 9
    const/4 p0, 0x0

    .line 10
    invoke-static {p0, p2}, Ljava/lang/Math;->max(II)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public static synthetic J(Landroid/graphics/PointF;Lcom/android/launcher3/model/data/y;)Landroid/graphics/PointF;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic K(Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic L(Lcom/android/launcher3/model/data/y;)Landroid/graphics/PointF;
    .locals 0

    .line 1
    sget-object p0, Lcom/android/launcher3/h0;->A3:Landroid/graphics/PointF;

    .line 2
    .line 3
    return-object p0
.end method

.method private L0(Landroid/content/Context;)I
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/h0;->s0(Landroid/content/Context;)Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget v0, p0, Lcom/android/launcher3/h0;->U0:I

    .line 6
    .line 7
    iget v1, p1, Landroid/graphics/Rect;->top:I

    .line 8
    .line 9
    sub-int/2addr v0, v1

    .line 10
    iget v1, p1, Landroid/graphics/Rect;->bottom:I

    .line 11
    .line 12
    sub-int/2addr v0, v1

    .line 13
    iget v1, p0, Lcom/android/launcher3/h0;->s2:I

    .line 14
    .line 15
    iget v2, p0, Lcom/android/launcher3/h0;->a2:I

    .line 16
    .line 17
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/h0;->O(III)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget p0, p0, Lcom/android/launcher3/h0;->B1:I

    .line 22
    .line 23
    sub-int/2addr v0, p0

    .line 24
    div-int/lit8 v0, v0, 0x2

    .line 25
    .line 26
    iget p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 27
    .line 28
    add-int/2addr v0, p0

    .line 29
    return v0
.end method

.method private N(Landroid/content/Context;Lcom/android/launcher3/F1;I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->b1:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/launcher3/h0;->d1:LH1/c;

    .line 6
    .line 7
    invoke-virtual {p1}, LH1/c;->f()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/android/launcher3/h0;->w1:I

    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/h0;->d1:LH1/c;

    .line 14
    .line 15
    invoke-virtual {p1}, LH1/c;->c()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iput p1, p0, Lcom/android/launcher3/h0;->x1:I

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->Z0:Z

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget p2, p2, Lcom/android/launcher3/F1;->m1:I

    .line 27
    .line 28
    const/4 v0, -0x1

    .line 29
    if-eq p2, v0, :cond_1

    .line 30
    .line 31
    int-to-float p3, p3

    .line 32
    iget v0, p0, Lcom/android/launcher3/h0;->G1:F

    .line 33
    .line 34
    div-float/2addr p3, v0

    .line 35
    float-to-int p3, p3

    .line 36
    new-instance v0, Lcom/android/launcher3/d0;

    .line 37
    .line 38
    invoke-direct {v0, p1, p2}, Lcom/android/launcher3/d0;-><init>(Landroid/content/Context;I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, p3}, Lcom/android/launcher3/d0;->b(I)Lcom/android/launcher3/d0$a;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Lcom/android/launcher3/d0$a;->c()I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    iput p2, p0, Lcom/android/launcher3/h0;->v1:I

    .line 50
    .line 51
    invoke-virtual {p1, p3}, Lcom/android/launcher3/d0$a;->e(I)I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    invoke-virtual {p1, p3}, Lcom/android/launcher3/d0$a;->d(I)I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    int-to-float p2, p2

    .line 60
    iget p3, p0, Lcom/android/launcher3/h0;->G1:F

    .line 61
    .line 62
    mul-float/2addr p2, p3

    .line 63
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    iput p2, p0, Lcom/android/launcher3/h0;->w1:I

    .line 68
    .line 69
    int-to-float p1, p1

    .line 70
    iget p2, p0, Lcom/android/launcher3/h0;->G1:F

    .line 71
    .line 72
    mul-float/2addr p1, p2

    .line 73
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    iput p1, p0, Lcom/android/launcher3/h0;->x1:I

    .line 78
    .line 79
    :cond_1
    return-void
.end method

.method public static O(III)I
    .locals 1

    .line 1
    add-int/lit8 v0, p2, -0x1

    .line 2
    .line 3
    mul-int/2addr v0, p1

    .line 4
    sub-int/2addr p0, v0

    .line 5
    div-int/2addr p0, p2

    .line 6
    return p0
.end method

.method private O0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->T:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget v0, p0, Lcom/android/launcher3/h0;->C1:I

    .line 9
    .line 10
    int-to-float v0, v0

    .line 11
    invoke-static {v0}, Lcom/android/launcher3/N5;->f(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-float v0, v0

    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->k0()Landroid/graphics/Point;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 21
    .line 22
    iget v2, p0, Lcom/android/launcher3/h0;->B1:I

    .line 23
    .line 24
    sub-int/2addr v1, v2

    .line 25
    iget v3, p0, Lcom/android/launcher3/h0;->D1:I

    .line 26
    .line 27
    sub-int/2addr v1, v3

    .line 28
    int-to-float v1, v1

    .line 29
    sub-float/2addr v1, v0

    .line 30
    cmpg-float v0, v1, v0

    .line 31
    .line 32
    if-gez v0, :cond_1

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput v0, p0, Lcom/android/launcher3/h0;->C1:I

    .line 36
    .line 37
    iput v0, p0, Lcom/android/launcher3/h0;->D1:I

    .line 38
    .line 39
    invoke-direct {p0, v2}, Lcom/android/launcher3/h0;->v0(I)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iput v0, p0, Lcom/android/launcher3/h0;->I1:I

    .line 44
    .line 45
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->N0:Z

    .line 46
    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->O0:Z

    .line 50
    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    iget v0, p0, Lcom/android/launcher3/h0;->B1:I

    .line 54
    .line 55
    iget v1, p0, Lcom/android/launcher3/X3;->s:I

    .line 56
    .line 57
    add-int/2addr v0, v1

    .line 58
    int-to-float v0, v0

    .line 59
    const/high16 v1, 0x3f900000    # 1.125f

    .line 60
    .line 61
    mul-float/2addr v0, v1

    .line 62
    float-to-double v0, v0

    .line 63
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 64
    .line 65
    .line 66
    move-result-wide v0

    .line 67
    double-to-int v0, v0

    .line 68
    iput v0, p0, Lcom/android/launcher3/h0;->I1:I

    .line 69
    .line 70
    :cond_1
    :goto_0
    return-void
.end method

.method public static P(III)I
    .locals 1

    .line 1
    add-int/lit8 v0, p2, -0x1

    .line 2
    .line 3
    mul-int/2addr v0, p1

    .line 4
    sub-int/2addr p0, v0

    .line 5
    div-int/2addr p0, p2

    .line 6
    return p0
.end method

.method private P0(Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    iget p0, p2, Landroid/graphics/Rect;->left:I

    .line 2
    .line 3
    iget v0, p1, Landroid/graphics/Rect;->left:I

    .line 4
    .line 5
    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    iput p0, p2, Landroid/graphics/Rect;->left:I

    .line 10
    .line 11
    iget v0, p1, Landroid/graphics/Rect;->left:I

    .line 12
    .line 13
    sub-int/2addr v0, p0

    .line 14
    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 15
    .line 16
    invoke-static {}, Lx1/O;->k1()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    iget p0, p2, Landroid/graphics/Rect;->top:I

    .line 23
    .line 24
    iget v0, p1, Landroid/graphics/Rect;->top:I

    .line 25
    .line 26
    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    iput p0, p2, Landroid/graphics/Rect;->top:I

    .line 31
    .line 32
    :cond_0
    iget p0, p1, Landroid/graphics/Rect;->top:I

    .line 33
    .line 34
    iget v0, p2, Landroid/graphics/Rect;->top:I

    .line 35
    .line 36
    sub-int/2addr p0, v0

    .line 37
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 38
    .line 39
    iget p0, p2, Landroid/graphics/Rect;->right:I

    .line 40
    .line 41
    iget v0, p1, Landroid/graphics/Rect;->right:I

    .line 42
    .line 43
    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    iput p0, p2, Landroid/graphics/Rect;->right:I

    .line 48
    .line 49
    iget v0, p1, Landroid/graphics/Rect;->right:I

    .line 50
    .line 51
    sub-int/2addr v0, p0

    .line 52
    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 53
    .line 54
    iget p0, p2, Landroid/graphics/Rect;->bottom:I

    .line 55
    .line 56
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 57
    .line 58
    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    iput p0, p2, Landroid/graphics/Rect;->bottom:I

    .line 63
    .line 64
    iget p2, p1, Landroid/graphics/Rect;->bottom:I

    .line 65
    .line 66
    sub-int/2addr p2, p0

    .line 67
    iput p2, p1, Landroid/graphics/Rect;->bottom:I

    .line 68
    .line 69
    return-void
.end method

.method private Q(FI)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/h0;->a2:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, -0x1

    .line 4
    .line 5
    add-int/2addr v1, p2

    .line 6
    if-gtz v1, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    iget p2, p0, Lcom/android/launcher3/h0;->B1:I

    .line 11
    .line 12
    mul-int/2addr p2, v0

    .line 13
    int-to-float p2, p2

    .line 14
    sub-float/2addr p1, p2

    .line 15
    float-to-int p1, p1

    .line 16
    div-int/2addr p1, v1

    .line 17
    iget p0, p0, Lcom/android/launcher3/h0;->v2:I

    .line 18
    .line 19
    invoke-static {p1, p0}, Ljava/lang/Math;->min(II)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method private Q0(Lcom/android/launcher3/F1;)Z
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/F1;->H1:[Z

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    aget-boolean v1, v0, v1

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    const/4 v3, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    const/4 v1, 0x3

    .line 11
    aget-boolean v1, v0, v1

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v1, v3

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    move v1, v2

    .line 19
    :goto_1
    aget-boolean v4, v0, v3

    .line 20
    .line 21
    if-nez v4, :cond_3

    .line 22
    .line 23
    aget-boolean v4, v0, v2

    .line 24
    .line 25
    if-eqz v4, :cond_2

    .line 26
    .line 27
    goto :goto_2

    .line 28
    :cond_2
    move v4, v3

    .line 29
    goto :goto_3

    .line 30
    :cond_3
    :goto_2
    move v4, v2

    .line 31
    :goto_3
    iget-boolean v5, p0, Lcom/android/launcher3/h0;->K0:Z

    .line 32
    .line 33
    if-eqz v5, :cond_4

    .line 34
    .line 35
    goto :goto_4

    .line 36
    :cond_4
    move v1, v4

    .line 37
    :goto_4
    if-eqz v1, :cond_5

    .line 38
    .line 39
    iget v1, p0, Lcom/android/launcher3/h0;->p2:I

    .line 40
    .line 41
    if-lez v1, :cond_5

    .line 42
    .line 43
    move v1, v2

    .line 44
    goto :goto_5

    .line 45
    :cond_5
    move v1, v3

    .line 46
    :goto_5
    iget-boolean v4, p0, Lcom/android/launcher3/h0;->Z0:Z

    .line 47
    .line 48
    if-eqz v4, :cond_6

    .line 49
    .line 50
    iget p0, p0, Lcom/android/launcher3/h0;->a1:I

    .line 51
    .line 52
    aget-boolean p0, v0, p0

    .line 53
    .line 54
    if-eqz p0, :cond_6

    .line 55
    .line 56
    if-nez v1, :cond_7

    .line 57
    .line 58
    :cond_6
    iget-boolean p0, p1, Lcom/android/launcher3/F1;->C1:Z

    .line 59
    .line 60
    if-eqz p0, :cond_8

    .line 61
    .line 62
    :cond_7
    return v2

    .line 63
    :cond_8
    return v3
.end method

.method private R(I)I
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/h0;->B1:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/launcher3/h0;->x0(I)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    sub-int/2addr v0, v1

    .line 8
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->M0:Z

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->H0()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget-object v2, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 17
    .line 18
    iget v2, v2, Lcom/android/launcher3/F1;->H0:I

    .line 19
    .line 20
    mul-int/2addr v1, v2

    .line 21
    invoke-direct {p0, v1}, Lcom/android/launcher3/h0;->w0(I)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iget v2, p0, Lcom/android/launcher3/h0;->B1:I

    .line 26
    .line 27
    iget p0, p0, Lcom/android/launcher3/h0;->a2:I

    .line 28
    .line 29
    mul-int/2addr v2, p0

    .line 30
    sub-int/2addr v1, v2

    .line 31
    mul-int/2addr p1, p0

    .line 32
    sub-int/2addr v1, p1

    .line 33
    sub-int/2addr v1, v0

    .line 34
    return v1

    .line 35
    :cond_0
    iget p1, p0, Lcom/android/launcher3/h0;->c2:I

    .line 36
    .line 37
    invoke-direct {p0, p1}, Lcom/android/launcher3/h0;->w0(I)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    sub-int/2addr p0, v0

    .line 42
    return p0
.end method

.method private T(Ljava/lang/String;Landroid/graphics/PointF;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object p0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 2
    .line 3
    iget v0, p2, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget p2, p2, Landroid/graphics/PointF;->y:F

    .line 10
    .line 11
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    filled-new-array {p1, v0, p2}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string p2, "\t%s: PointF(%.1f, %.1f)dp"

    .line 20
    .line 21
    invoke-static {p0, p2, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method private U0(Ljava/lang/String;F)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "\t"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p1, ": "

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string p1, "px ("

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 28
    .line 29
    iget p0, p0, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 30
    .line 31
    invoke-static {p2, p0}, Lcom/android/launcher3/N5;->j(FI)F

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string p0, "dp)"

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method private W()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->M0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/android/launcher3/h0;->o2:I

    .line 6
    .line 7
    iget p0, p0, Lcom/android/launcher3/h0;->s2:I

    .line 8
    .line 9
    add-int/2addr v0, p0

    .line 10
    return v0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method private W0(Landroid/content/Context;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 2
    .line 3
    iget v0, v0, Lcom/android/launcher3/F1;->k1:I

    .line 4
    .line 5
    const/4 v1, -0x1

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const v0, 0x7f15000d

    .line 10
    .line 11
    .line 12
    :goto_0
    sget-object v1, Lcom/android/launcher3/x5;->m:[I

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p0, p0, Lcom/android/launcher3/h0;->E2:Landroid/graphics/Rect;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p1, v0, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput v0, p0, Landroid/graphics/Rect;->right:I

    .line 26
    .line 27
    iput v0, p0, Landroid/graphics/Rect;->left:I

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private c0(Lcom/android/launcher3/F1;)Landroid/graphics/Point;
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/h0;->d0(Lcom/android/launcher3/F1;F)Landroid/graphics/Point;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private d0(Lcom/android/launcher3/F1;F)Landroid/graphics/Point;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->b1:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/launcher3/h0;->c1:LH1/c;

    .line 6
    .line 7
    invoke-virtual {p1}, LH1/c;->d()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p0, p0, Lcom/android/launcher3/h0;->d1:LH1/c;

    .line 12
    .line 13
    invoke-virtual {p0}, LH1/c;->d()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->Z0:Z

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p1, Lcom/android/launcher3/F1;->S0:[Landroid/graphics/PointF;

    .line 23
    .line 24
    iget v1, p0, Lcom/android/launcher3/h0;->a1:I

    .line 25
    .line 26
    aget-object v0, v0, v1

    .line 27
    .line 28
    iget v0, v0, Landroid/graphics/PointF;->x:F

    .line 29
    .line 30
    iget-object v1, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 31
    .line 32
    invoke-static {v0, v1, p2}, Lc2/a;->f(FLandroid/util/DisplayMetrics;F)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget-object p1, p1, Lcom/android/launcher3/F1;->S0:[Landroid/graphics/PointF;

    .line 37
    .line 38
    iget v1, p0, Lcom/android/launcher3/h0;->a1:I

    .line 39
    .line 40
    aget-object p1, p1, v1

    .line 41
    .line 42
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 43
    .line 44
    iget-object p0, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 45
    .line 46
    invoke-static {p1, p0, p2}, Lc2/a;->f(FLandroid/util/DisplayMetrics;F)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    move p1, v0

    .line 51
    goto :goto_0

    .line 52
    :cond_1
    const/4 p1, 0x0

    .line 53
    move p0, p1

    .line 54
    :goto_0
    new-instance p2, Landroid/graphics/Point;

    .line 55
    .line 56
    invoke-direct {p2, p1, p0}, Landroid/graphics/Point;-><init>(II)V

    .line 57
    .line 58
    .line 59
    return-object p2
.end method

.method private f0()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/h0;->I1:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 4
    .line 5
    iget v1, v1, Lcom/android/launcher3/F1;->G0:I

    .line 6
    .line 7
    mul-int/2addr v0, v1

    .line 8
    iget-object v2, p0, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 9
    .line 10
    iget v2, v2, Landroid/graphics/Point;->y:I

    .line 11
    .line 12
    add-int/lit8 v1, v1, -0x1

    .line 13
    .line 14
    mul-int/2addr v2, v1

    .line 15
    add-int/2addr v0, v2

    .line 16
    iget-object p0, p0, Lcom/android/launcher3/h0;->q1:Landroid/graphics/Rect;

    .line 17
    .line 18
    iget v1, p0, Landroid/graphics/Rect;->top:I

    .line 19
    .line 20
    add-int/2addr v0, v1

    .line 21
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 22
    .line 23
    add-int/2addr v0, p0

    .line 24
    return v0
.end method

.method private h1(Landroid/content/Context;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-super {p0, p0, v0, p1}, Lcom/android/launcher3/X3;->F(Lcom/android/launcher3/h0;Lcom/android/launcher3/F1;Landroid/content/res/Resources;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private i1(FLandroid/content/res/Resources;)V
    .locals 6

    .line 1
    new-instance v0, Landroid/graphics/Point;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/android/launcher3/F1;->a1:[Landroid/graphics/PointF;

    .line 6
    .line 7
    iget v2, p0, Lcom/android/launcher3/h0;->a1:I

    .line 8
    .line 9
    aget-object v1, v1, v2

    .line 10
    .line 11
    iget v1, v1, Landroid/graphics/PointF;->x:F

    .line 12
    .line 13
    iget-object v2, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 14
    .line 15
    invoke-static {v1, v2, p1}, Lc2/a;->f(FLandroid/util/DisplayMetrics;F)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget-object v2, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 20
    .line 21
    iget-object v2, v2, Lcom/android/launcher3/F1;->a1:[Landroid/graphics/PointF;

    .line 22
    .line 23
    iget v3, p0, Lcom/android/launcher3/h0;->a1:I

    .line 24
    .line 25
    aget-object v2, v2, v3

    .line 26
    .line 27
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 28
    .line 29
    iget-object v3, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 30
    .line 31
    invoke-static {v2, v3, p1}, Lc2/a;->f(FLandroid/util/DisplayMetrics;F)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-direct {v0, v1, v2}, Landroid/graphics/Point;-><init>(II)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/android/launcher3/h0;->C2:Landroid/graphics/Point;

    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/android/launcher3/F1;->X0:[Landroid/graphics/PointF;

    .line 43
    .line 44
    iget v1, p0, Lcom/android/launcher3/h0;->a1:I

    .line 45
    .line 46
    aget-object v0, v0, v1

    .line 47
    .line 48
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 49
    .line 50
    iget-object v1, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 51
    .line 52
    invoke-static {v0, v1}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iget-object v1, p0, Lcom/android/launcher3/h0;->C2:Landroid/graphics/Point;

    .line 57
    .line 58
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 59
    .line 60
    add-int/2addr v0, v1

    .line 61
    iput v0, p0, Lcom/android/launcher3/h0;->H2:I

    .line 62
    .line 63
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->Z0:Z

    .line 64
    .line 65
    if-eqz v0, :cond_3

    .line 66
    .line 67
    iget-object p2, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 68
    .line 69
    iget-object p2, p2, Lcom/android/launcher3/F1;->Y0:[F

    .line 70
    .line 71
    iget v0, p0, Lcom/android/launcher3/h0;->a1:I

    .line 72
    .line 73
    aget p2, p2, v0

    .line 74
    .line 75
    iget-object v0, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 76
    .line 77
    invoke-static {p2, v0}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    iput p2, p0, Lcom/android/launcher3/h0;->J2:I

    .line 82
    .line 83
    iget-object p2, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 84
    .line 85
    iget-object p2, p2, Lcom/android/launcher3/F1;->Z0:[F

    .line 86
    .line 87
    iget v0, p0, Lcom/android/launcher3/h0;->a1:I

    .line 88
    .line 89
    aget p2, p2, v0

    .line 90
    .line 91
    iget-object v0, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 92
    .line 93
    invoke-static {p2, v0}, Lcom/android/launcher3/N5;->U(FLandroid/util/DisplayMetrics;)I

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    int-to-float p2, p2

    .line 98
    iput p2, p0, Lcom/android/launcher3/h0;->N2:F

    .line 99
    .line 100
    invoke-direct {p0}, Lcom/android/launcher3/h0;->C0()I

    .line 101
    .line 102
    .line 103
    move-result p2

    .line 104
    iput p2, p0, Lcom/android/launcher3/h0;->K2:I

    .line 105
    .line 106
    iget-object p2, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 107
    .line 108
    iget-object p2, p2, Lcom/android/launcher3/F1;->X0:[Landroid/graphics/PointF;

    .line 109
    .line 110
    iget v0, p0, Lcom/android/launcher3/h0;->a1:I

    .line 111
    .line 112
    aget-object p2, p2, v0

    .line 113
    .line 114
    iget p2, p2, Landroid/graphics/PointF;->x:F

    .line 115
    .line 116
    iget-object v0, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 117
    .line 118
    invoke-static {p2, v0, p1}, Lc2/a;->f(FLandroid/util/DisplayMetrics;F)I

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    iput p1, p0, Lcom/android/launcher3/h0;->I2:I

    .line 123
    .line 124
    iget p2, p0, Lcom/android/launcher3/h0;->J2:I

    .line 125
    .line 126
    if-ge p1, p2, :cond_1

    .line 127
    .line 128
    iget-object v0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 129
    .line 130
    iget v0, v0, Lcom/android/launcher3/F1;->h1:I

    .line 131
    .line 132
    add-int/lit8 v1, v0, -0x1

    .line 133
    .line 134
    sub-int v2, p2, p1

    .line 135
    .line 136
    mul-int/2addr v2, v0

    .line 137
    iget-object v3, p0, Lcom/android/launcher3/h0;->C2:Landroid/graphics/Point;

    .line 138
    .line 139
    iget v4, v3, Landroid/graphics/Point;->x:I

    .line 140
    .line 141
    mul-int v5, v4, v1

    .line 142
    .line 143
    if-lt v5, v2, :cond_0

    .line 144
    .line 145
    iput p2, p0, Lcom/android/launcher3/h0;->I2:I

    .line 146
    .line 147
    div-int/2addr v2, v1

    .line 148
    sub-int/2addr v4, v2

    .line 149
    iput v4, v3, Landroid/graphics/Point;->x:I

    .line 150
    .line 151
    goto :goto_0

    .line 152
    :cond_0
    mul-int/2addr p1, v0

    .line 153
    mul-int/2addr v4, v1

    .line 154
    add-int/2addr p1, v4

    .line 155
    div-int/2addr p1, v0

    .line 156
    iput p1, p0, Lcom/android/launcher3/h0;->I2:I

    .line 157
    .line 158
    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    iput p1, p0, Lcom/android/launcher3/h0;->J2:I

    .line 163
    .line 164
    iget-object p1, p0, Lcom/android/launcher3/h0;->C2:Landroid/graphics/Point;

    .line 165
    .line 166
    const/4 p2, 0x0

    .line 167
    iput p2, p1, Landroid/graphics/Point;->x:I

    .line 168
    .line 169
    :cond_1
    :goto_0
    iget p1, p0, Lcom/android/launcher3/h0;->J2:I

    .line 170
    .line 171
    iget p2, p0, Lcom/android/launcher3/h0;->N2:F

    .line 172
    .line 173
    invoke-static {p2}, Lcom/android/launcher3/N5;->f(F)I

    .line 174
    .line 175
    .line 176
    move-result p2

    .line 177
    add-int/2addr p1, p2

    .line 178
    iget-object p2, p0, Lcom/android/launcher3/h0;->C2:Landroid/graphics/Point;

    .line 179
    .line 180
    iget p2, p2, Landroid/graphics/Point;->y:I

    .line 181
    .line 182
    add-int/2addr p1, p2

    .line 183
    iget p2, p0, Lcom/android/launcher3/h0;->H2:I

    .line 184
    .line 185
    if-ge p2, p1, :cond_2

    .line 186
    .line 187
    iput p1, p0, Lcom/android/launcher3/h0;->H2:I

    .line 188
    .line 189
    :cond_2
    return-void

    .line 190
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 191
    .line 192
    iget-object v1, v0, Lcom/android/launcher3/F1;->Y0:[F

    .line 193
    .line 194
    iget v2, p0, Lcom/android/launcher3/h0;->a1:I

    .line 195
    .line 196
    aget v1, v1, v2

    .line 197
    .line 198
    iget-object v0, v0, Lcom/android/launcher3/F1;->Z0:[F

    .line 199
    .line 200
    aget v0, v0, v2

    .line 201
    .line 202
    iget-object v2, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 203
    .line 204
    invoke-static {v1, v2, p1}, Lc2/a;->f(FLandroid/util/DisplayMetrics;F)I

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    const/4 v2, 0x1

    .line 209
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    iput v1, p0, Lcom/android/launcher3/h0;->J2:I

    .line 214
    .line 215
    iget-object v1, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 216
    .line 217
    invoke-static {v0, v1}, Lcom/android/launcher3/N5;->U(FLandroid/util/DisplayMetrics;)I

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    int-to-float v0, v0

    .line 222
    mul-float/2addr v0, p1

    .line 223
    float-to-int p1, v0

    .line 224
    int-to-float p1, p1

    .line 225
    iput p1, p0, Lcom/android/launcher3/h0;->N2:F

    .line 226
    .line 227
    const p1, 0x7f0700d3

    .line 228
    .line 229
    .line 230
    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 231
    .line 232
    .line 233
    move-result p1

    .line 234
    iput p1, p0, Lcom/android/launcher3/h0;->K2:I

    .line 235
    .line 236
    iget p2, p0, Lcom/android/launcher3/h0;->J2:I

    .line 237
    .line 238
    mul-int/lit8 p1, p1, 0x2

    .line 239
    .line 240
    add-int/2addr p2, p1

    .line 241
    iput p2, p0, Lcom/android/launcher3/h0;->I2:I

    .line 242
    .line 243
    return-void
.end method

.method private j0()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->H0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 6
    .line 7
    iget v1, v1, Lcom/android/launcher3/F1;->H0:I

    .line 8
    .line 9
    mul-int/2addr v0, v1

    .line 10
    iget v1, p0, Lcom/android/launcher3/h0;->H1:I

    .line 11
    .line 12
    mul-int/2addr v1, v0

    .line 13
    iget-object v2, p0, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 14
    .line 15
    iget v2, v2, Landroid/graphics/Point;->x:I

    .line 16
    .line 17
    add-int/lit8 v0, v0, -0x1

    .line 18
    .line 19
    mul-int/2addr v2, v0

    .line 20
    add-int/2addr v1, v2

    .line 21
    iget-object p0, p0, Lcom/android/launcher3/h0;->q1:Landroid/graphics/Rect;

    .line 22
    .line 23
    iget v0, p0, Landroid/graphics/Rect;->left:I

    .line 24
    .line 25
    add-int/2addr v1, v0

    .line 26
    iget p0, p0, Landroid/graphics/Rect;->right:I

    .line 27
    .line 28
    add-int/2addr v1, p0

    .line 29
    return v1
.end method

.method private j1()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/h0;->k1:LH1/a;

    .line 2
    .line 3
    invoke-virtual {v0}, LH1/a;->b()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Lcom/android/launcher3/h0;->J2:I

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/h0;->k1:LH1/a;

    .line 10
    .line 11
    invoke-virtual {v0}, LH1/a;->c()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-float v0, v0

    .line 16
    iput v0, p0, Lcom/android/launcher3/h0;->N2:F

    .line 17
    .line 18
    iget v0, p0, Lcom/android/launcher3/h0;->J2:I

    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/launcher3/h0;->k1:LH1/a;

    .line 21
    .line 22
    invoke-virtual {v1}, LH1/a;->a()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/h0;->D0(II)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iput v0, p0, Lcom/android/launcher3/h0;->K2:I

    .line 31
    .line 32
    new-instance v0, Landroid/graphics/Point;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/h0;->e1:LH1/c;

    .line 35
    .line 36
    invoke-virtual {v1}, LH1/c;->d()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iget-object v2, p0, Lcom/android/launcher3/h0;->f1:LH1/c;

    .line 41
    .line 42
    invoke-virtual {v2}, LH1/c;->d()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-direct {v0, v1, v2}, Landroid/graphics/Point;-><init>(II)V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Lcom/android/launcher3/h0;->C2:Landroid/graphics/Point;

    .line 50
    .line 51
    iget-object v0, p0, Lcom/android/launcher3/h0;->f1:LH1/c;

    .line 52
    .line 53
    invoke-virtual {v0}, LH1/c;->b()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iput v0, p0, Lcom/android/launcher3/h0;->H2:I

    .line 58
    .line 59
    iget-object v0, p0, Lcom/android/launcher3/h0;->e1:LH1/c;

    .line 60
    .line 61
    invoke-virtual {v0}, LH1/c;->b()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iput v0, p0, Lcom/android/launcher3/h0;->I2:I

    .line 66
    .line 67
    iget-object v0, p0, Lcom/android/launcher3/h0;->C2:Landroid/graphics/Point;

    .line 68
    .line 69
    iget v0, v0, Landroid/graphics/Point;->x:I

    .line 70
    .line 71
    div-int/lit8 v0, v0, 0x2

    .line 72
    .line 73
    iget-object v1, p0, Lcom/android/launcher3/h0;->E2:Landroid/graphics/Rect;

    .line 74
    .line 75
    iget-object v2, p0, Lcom/android/launcher3/h0;->e1:LH1/c;

    .line 76
    .line 77
    invoke-virtual {v2}, LH1/c;->f()I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    sub-int/2addr v2, v0

    .line 82
    iput v2, v1, Landroid/graphics/Rect;->left:I

    .line 83
    .line 84
    iget-object v1, p0, Lcom/android/launcher3/h0;->E2:Landroid/graphics/Rect;

    .line 85
    .line 86
    iget-object v2, p0, Lcom/android/launcher3/h0;->e1:LH1/c;

    .line 87
    .line 88
    invoke-virtual {v2}, LH1/c;->c()I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    sub-int/2addr v2, v0

    .line 93
    iput v2, v1, Landroid/graphics/Rect;->right:I

    .line 94
    .line 95
    iget v0, p0, Lcom/android/launcher3/h0;->I2:I

    .line 96
    .line 97
    iget v1, p0, Lcom/android/launcher3/h0;->J2:I

    .line 98
    .line 99
    if-ge v0, v1, :cond_0

    .line 100
    .line 101
    iget-object v1, p0, Lcom/android/launcher3/h0;->F0:Lcom/android/launcher3/util/w0;

    .line 102
    .line 103
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/w0;->a(I)I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    iput v0, p0, Lcom/android/launcher3/h0;->J2:I

    .line 108
    .line 109
    :cond_0
    new-instance v0, Lcom/android/launcher3/util/D;

    .line 110
    .line 111
    iget v1, p0, Lcom/android/launcher3/h0;->J2:I

    .line 112
    .line 113
    iget v2, p0, Lcom/android/launcher3/h0;->K2:I

    .line 114
    .line 115
    iget v3, p0, Lcom/android/launcher3/h0;->N2:F

    .line 116
    .line 117
    float-to-int v3, v3

    .line 118
    invoke-direct {v0, v1, v2, v3}, Lcom/android/launcher3/util/D;-><init>(III)V

    .line 119
    .line 120
    .line 121
    iget v1, p0, Lcom/android/launcher3/h0;->H2:I

    .line 122
    .line 123
    invoke-virtual {v0}, Lcom/android/launcher3/util/D;->a()I

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    if-ge v1, v2, :cond_3

    .line 128
    .line 129
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->T0()Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-eqz v1, :cond_1

    .line 134
    .line 135
    iget v1, p0, Lcom/android/launcher3/h0;->H2:I

    .line 136
    .line 137
    iget v2, p0, Lcom/android/launcher3/h0;->J2:I

    .line 138
    .line 139
    if-ge v1, v2, :cond_2

    .line 140
    .line 141
    iget-object v2, p0, Lcom/android/launcher3/h0;->F0:Lcom/android/launcher3/util/w0;

    .line 142
    .line 143
    invoke-virtual {v2, v1}, Lcom/android/launcher3/util/w0;->a(I)I

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/D;->f(I)V

    .line 148
    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_1
    iget v1, p0, Lcom/android/launcher3/h0;->H2:I

    .line 152
    .line 153
    iget-object v2, p0, Lcom/android/launcher3/h0;->F0:Lcom/android/launcher3/util/w0;

    .line 154
    .line 155
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/util/D;->e(ILcom/android/launcher3/util/w0;)I

    .line 156
    .line 157
    .line 158
    :cond_2
    :goto_0
    invoke-virtual {v0}, Lcom/android/launcher3/util/D;->c()I

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    iput v1, p0, Lcom/android/launcher3/h0;->J2:I

    .line 163
    .line 164
    invoke-virtual {v0}, Lcom/android/launcher3/util/D;->b()I

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    iput v1, p0, Lcom/android/launcher3/h0;->K2:I

    .line 169
    .line 170
    invoke-virtual {v0}, Lcom/android/launcher3/util/D;->d()I

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    int-to-float v0, v0

    .line 175
    iput v0, p0, Lcom/android/launcher3/h0;->N2:F

    .line 176
    .line 177
    :cond_3
    iget v0, p0, Lcom/android/launcher3/h0;->H2:I

    .line 178
    .line 179
    iget-object v1, p0, Lcom/android/launcher3/h0;->f1:LH1/c;

    .line 180
    .line 181
    invoke-virtual {v1}, LH1/c;->d()I

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    add-int/2addr v0, v1

    .line 186
    iput v0, p0, Lcom/android/launcher3/h0;->H2:I

    .line 187
    .line 188
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->T0()Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-eqz v0, :cond_4

    .line 193
    .line 194
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->M()V

    .line 195
    .line 196
    .line 197
    :cond_4
    return-void
.end method

.method private l1(Landroid/content/res/Resources;)V
    .locals 6

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/h0;->m1(FLandroid/content/res/Resources;)V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->b1:Z

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->K0()Landroid/graphics/Point;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget v2, p0, Lcom/android/launcher3/h0;->W1:I

    .line 16
    .line 17
    iget v3, p0, Lcom/android/launcher3/h0;->L1:I

    .line 18
    .line 19
    mul-int/2addr v2, v3

    .line 20
    add-int/lit8 v3, v3, -0x1

    .line 21
    .line 22
    iget-object v4, p0, Lcom/android/launcher3/h0;->S1:Landroid/graphics/Point;

    .line 23
    .line 24
    iget v4, v4, Landroid/graphics/Point;->y:I

    .line 25
    .line 26
    mul-int/2addr v3, v4

    .line 27
    add-int/2addr v2, v3

    .line 28
    iget v3, p0, Lcom/android/launcher3/h0;->P1:I

    .line 29
    .line 30
    add-int/2addr v2, v3

    .line 31
    iget v3, p0, Lcom/android/launcher3/h0;->U1:I

    .line 32
    .line 33
    add-int/2addr v2, v3

    .line 34
    int-to-float v2, v2

    .line 35
    iget v3, p0, Lcom/android/launcher3/h0;->W0:I

    .line 36
    .line 37
    iget v4, v1, Landroid/graphics/Point;->y:I

    .line 38
    .line 39
    sub-int/2addr v3, v4

    .line 40
    iget-object v4, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 41
    .line 42
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->M:Z

    .line 43
    .line 44
    if-eqz v4, :cond_1

    .line 45
    .line 46
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-virtual {v4}, Lcom/android/launcher3/resource/B;->s()Z

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    if-eqz v4, :cond_1

    .line 55
    .line 56
    iget v3, p0, Lcom/android/launcher3/h0;->I1:I

    .line 57
    .line 58
    mul-int/lit8 v3, v3, 0x3

    .line 59
    .line 60
    :cond_1
    int-to-float v3, v3

    .line 61
    div-float/2addr v3, v2

    .line 62
    iget v2, p0, Lcom/android/launcher3/h0;->V1:I

    .line 63
    .line 64
    iget v4, p0, Lcom/android/launcher3/h0;->M1:I

    .line 65
    .line 66
    mul-int/2addr v2, v4

    .line 67
    add-int/lit8 v4, v4, -0x1

    .line 68
    .line 69
    iget-object v5, p0, Lcom/android/launcher3/h0;->S1:Landroid/graphics/Point;

    .line 70
    .line 71
    iget v5, v5, Landroid/graphics/Point;->x:I

    .line 72
    .line 73
    mul-int/2addr v4, v5

    .line 74
    add-int/2addr v2, v4

    .line 75
    iget v4, p0, Lcom/android/launcher3/h0;->T1:I

    .line 76
    .line 77
    mul-int/lit8 v4, v4, 0x2

    .line 78
    .line 79
    add-int/2addr v2, v4

    .line 80
    int-to-float v2, v2

    .line 81
    iget v4, p0, Lcom/android/launcher3/h0;->V0:I

    .line 82
    .line 83
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 84
    .line 85
    sub-int/2addr v4, v1

    .line 86
    int-to-float v1, v4

    .line 87
    div-float/2addr v1, v2

    .line 88
    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    cmpg-float v0, v1, v0

    .line 93
    .line 94
    if-gez v0, :cond_3

    .line 95
    .line 96
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->G0:Z

    .line 97
    .line 98
    if-nez v0, :cond_3

    .line 99
    .line 100
    iget-object v0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 101
    .line 102
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->M:Z

    .line 103
    .line 104
    if-eqz v0, :cond_2

    .line 105
    .line 106
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-nez v0, :cond_3

    .line 115
    .line 116
    :cond_2
    invoke-direct {p0, v1, p1}, Lcom/android/launcher3/h0;->m1(FLandroid/content/res/Resources;)V

    .line 117
    .line 118
    .line 119
    :cond_3
    :goto_0
    return-void
.end method

.method private static m0(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;ILcom/android/launcher3/util/p3;)Landroid/content/Context;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/res/Configuration;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 12
    .line 13
    .line 14
    iput p2, v0, Landroid/content/res/Configuration;->orientation:I

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/android/launcher3/util/Z$c;->l()I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    iput p2, v0, Landroid/content/res/Configuration;->densityDpi:I

    .line 21
    .line 22
    invoke-virtual {p1, p3}, Lcom/android/launcher3/util/Z$c;->v(Lcom/android/launcher3/util/p3;)F

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    float-to-int p1, p1

    .line 27
    iput p1, v0, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/content/Context;->createConfigurationContext(Landroid/content/res/Configuration;)Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method private m1(FLandroid/content/res/Resources;)V
    .locals 4

    .line 1
    const/high16 v0, 0x41800000    # 16.0f

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 4
    .line 5
    invoke-static {v0, v1, p1}, Lcom/android/launcher3/N5;->V(FLandroid/util/DisplayMetrics;F)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->b1:Z

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/h0;->j1:LH1/a;

    .line 14
    .line 15
    invoke-virtual {p1}, LH1/a;->b()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iput p1, p0, Lcom/android/launcher3/h0;->X1:I

    .line 20
    .line 21
    iget-object p1, p0, Lcom/android/launcher3/h0;->j1:LH1/a;

    .line 22
    .line 23
    invoke-virtual {p1}, LH1/a;->c()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iput p1, p0, Lcom/android/launcher3/h0;->Y1:I

    .line 28
    .line 29
    int-to-float p1, p1

    .line 30
    iget p2, p0, Lcom/android/launcher3/h0;->N1:F

    .line 31
    .line 32
    mul-float/2addr p1, p2

    .line 33
    float-to-int p1, p1

    .line 34
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    iput p1, p0, Lcom/android/launcher3/h0;->O1:I

    .line 39
    .line 40
    iget p1, p0, Lcom/android/launcher3/h0;->Y1:I

    .line 41
    .line 42
    int-to-float p1, p1

    .line 43
    invoke-static {p1}, Lcom/android/launcher3/N5;->f(F)I

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/android/launcher3/h0;->g1:LH1/c;

    .line 47
    .line 48
    invoke-virtual {p1}, LH1/c;->b()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    iput p1, p0, Lcom/android/launcher3/h0;->V1:I

    .line 53
    .line 54
    iget-object p1, p0, Lcom/android/launcher3/h0;->h1:LH1/c;

    .line 55
    .line 56
    invoke-virtual {p1}, LH1/c;->b()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    iput p1, p0, Lcom/android/launcher3/h0;->W1:I

    .line 61
    .line 62
    iget-object p1, p0, Lcom/android/launcher3/h0;->h1:LH1/c;

    .line 63
    .line 64
    invoke-virtual {p1}, LH1/c;->f()I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    iput p1, p0, Lcom/android/launcher3/h0;->U1:I

    .line 69
    .line 70
    iget-object p1, p0, Lcom/android/launcher3/h0;->h1:LH1/c;

    .line 71
    .line 72
    invoke-virtual {p1}, LH1/c;->c()I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    iput p1, p0, Lcom/android/launcher3/h0;->P1:I

    .line 77
    .line 78
    new-instance p1, Landroid/graphics/Point;

    .line 79
    .line 80
    iget-object p2, p0, Lcom/android/launcher3/h0;->g1:LH1/c;

    .line 81
    .line 82
    invoke-virtual {p2}, LH1/c;->d()I

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    iget-object v1, p0, Lcom/android/launcher3/h0;->h1:LH1/c;

    .line 87
    .line 88
    invoke-virtual {v1}, LH1/c;->d()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    invoke-direct {p1, p2, v1}, Landroid/graphics/Point;-><init>(II)V

    .line 93
    .line 94
    .line 95
    iput-object p1, p0, Lcom/android/launcher3/h0;->S1:Landroid/graphics/Point;

    .line 96
    .line 97
    iget-object p1, p0, Lcom/android/launcher3/h0;->g1:LH1/c;

    .line 98
    .line 99
    invoke-virtual {p1}, LH1/c;->f()I

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    iput p1, p0, Lcom/android/launcher3/h0;->T1:I

    .line 104
    .line 105
    iget p1, p0, Lcom/android/launcher3/h0;->V1:I

    .line 106
    .line 107
    iget p2, p0, Lcom/android/launcher3/h0;->X1:I

    .line 108
    .line 109
    if-ge p1, p2, :cond_0

    .line 110
    .line 111
    iget-object p2, p0, Lcom/android/launcher3/h0;->F0:Lcom/android/launcher3/util/w0;

    .line 112
    .line 113
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/w0;->a(I)I

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    iput p1, p0, Lcom/android/launcher3/h0;->X1:I

    .line 118
    .line 119
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/h0;->j1:LH1/a;

    .line 120
    .line 121
    invoke-virtual {p1}, LH1/a;->a()I

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    iput p1, p0, Lcom/android/launcher3/h0;->Z1:I

    .line 126
    .line 127
    new-instance p2, Lcom/android/launcher3/util/D;

    .line 128
    .line 129
    iget v1, p0, Lcom/android/launcher3/h0;->X1:I

    .line 130
    .line 131
    iget v2, p0, Lcom/android/launcher3/h0;->Y1:I

    .line 132
    .line 133
    invoke-direct {p2, v1, p1, v2}, Lcom/android/launcher3/util/D;-><init>(III)V

    .line 134
    .line 135
    .line 136
    iget p1, p0, Lcom/android/launcher3/h0;->W1:I

    .line 137
    .line 138
    iget-object v1, p0, Lcom/android/launcher3/h0;->F0:Lcom/android/launcher3/util/w0;

    .line 139
    .line 140
    invoke-virtual {p2, p1, v1}, Lcom/android/launcher3/util/D;->e(ILcom/android/launcher3/util/w0;)I

    .line 141
    .line 142
    .line 143
    invoke-virtual {p2}, Lcom/android/launcher3/util/D;->c()I

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    iput p1, p0, Lcom/android/launcher3/h0;->X1:I

    .line 148
    .line 149
    invoke-virtual {p2}, Lcom/android/launcher3/util/D;->b()I

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    iput p1, p0, Lcom/android/launcher3/h0;->Z1:I

    .line 154
    .line 155
    invoke-virtual {p2}, Lcom/android/launcher3/util/D;->d()I

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    iput p1, p0, Lcom/android/launcher3/h0;->Y1:I

    .line 160
    .line 161
    int-to-float p1, p1

    .line 162
    iget p2, p0, Lcom/android/launcher3/h0;->N1:F

    .line 163
    .line 164
    mul-float/2addr p1, p2

    .line 165
    float-to-int p1, p1

    .line 166
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    iput p1, p0, Lcom/android/launcher3/h0;->O1:I

    .line 171
    .line 172
    return-void

    .line 173
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 174
    .line 175
    iget-object v2, v1, Lcom/android/launcher3/F1;->L0:[F

    .line 176
    .line 177
    iget v3, p0, Lcom/android/launcher3/h0;->a1:I

    .line 178
    .line 179
    aget v2, v2, v3

    .line 180
    .line 181
    iget-object v1, v1, Lcom/android/launcher3/F1;->M0:[F

    .line 182
    .line 183
    aget v1, v1, v3

    .line 184
    .line 185
    iget-object v3, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 186
    .line 187
    invoke-static {v2, v3, p1}, Lc2/a;->f(FLandroid/util/DisplayMetrics;F)I

    .line 188
    .line 189
    .line 190
    move-result v2

    .line 191
    const/4 v3, 0x1

    .line 192
    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    iput v2, p0, Lcom/android/launcher3/h0;->X1:I

    .line 197
    .line 198
    iget-object v2, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 199
    .line 200
    invoke-static {v1, v2, p1}, Lcom/android/launcher3/N5;->W(FLandroid/util/DisplayMetrics;F)I

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    iput v1, p0, Lcom/android/launcher3/h0;->Y1:I

    .line 205
    .line 206
    int-to-float v1, v1

    .line 207
    iget v2, p0, Lcom/android/launcher3/h0;->N1:F

    .line 208
    .line 209
    mul-float/2addr v1, v2

    .line 210
    float-to-int v1, v1

    .line 211
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    iput v0, p0, Lcom/android/launcher3/h0;->O1:I

    .line 216
    .line 217
    iget v0, p0, Lcom/android/launcher3/h0;->Y1:I

    .line 218
    .line 219
    int-to-float v0, v0

    .line 220
    invoke-static {v0}, Lcom/android/launcher3/N5;->f(F)I

    .line 221
    .line 222
    .line 223
    move-result v0

    .line 224
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->Z0:Z

    .line 225
    .line 226
    if-eqz v1, :cond_3

    .line 227
    .line 228
    iget-object v1, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 229
    .line 230
    iget v1, v1, Lcom/android/launcher3/F1;->U0:I

    .line 231
    .line 232
    const/4 v2, -0x1

    .line 233
    if-ne v1, v2, :cond_2

    .line 234
    .line 235
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->k0()Landroid/graphics/Point;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 240
    .line 241
    int-to-float v1, v1

    .line 242
    mul-float/2addr v1, p1

    .line 243
    invoke-static {v1}, Lc2/a;->g(F)I

    .line 244
    .line 245
    .line 246
    move-result v1

    .line 247
    iput v1, p0, Lcom/android/launcher3/h0;->V1:I

    .line 248
    .line 249
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->k0()Landroid/graphics/Point;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 254
    .line 255
    int-to-float v1, v1

    .line 256
    mul-float/2addr v1, p1

    .line 257
    invoke-static {v1}, Lc2/a;->g(F)I

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    iput v1, p0, Lcom/android/launcher3/h0;->W1:I

    .line 262
    .line 263
    goto :goto_0

    .line 264
    :cond_2
    iget v1, p0, Lcom/android/launcher3/h0;->V1:I

    .line 265
    .line 266
    int-to-float v1, v1

    .line 267
    mul-float/2addr v1, p1

    .line 268
    invoke-static {v1}, Lc2/a;->g(F)I

    .line 269
    .line 270
    .line 271
    move-result v1

    .line 272
    iput v1, p0, Lcom/android/launcher3/h0;->V1:I

    .line 273
    .line 274
    iget v1, p0, Lcom/android/launcher3/h0;->W1:I

    .line 275
    .line 276
    int-to-float v1, v1

    .line 277
    mul-float/2addr v1, p1

    .line 278
    invoke-static {v1}, Lc2/a;->g(F)I

    .line 279
    .line 280
    .line 281
    move-result v1

    .line 282
    iput v1, p0, Lcom/android/launcher3/h0;->W1:I

    .line 283
    .line 284
    :goto_0
    invoke-direct {p0, v0}, Lcom/android/launcher3/h0;->B0(I)I

    .line 285
    .line 286
    .line 287
    move-result v0

    .line 288
    iput v0, p0, Lcom/android/launcher3/h0;->Z1:I

    .line 289
    .line 290
    new-instance v1, Lcom/android/launcher3/util/D;

    .line 291
    .line 292
    iget v2, p0, Lcom/android/launcher3/h0;->X1:I

    .line 293
    .line 294
    iget v3, p0, Lcom/android/launcher3/h0;->Y1:I

    .line 295
    .line 296
    invoke-direct {v1, v2, v0, v3}, Lcom/android/launcher3/util/D;-><init>(III)V

    .line 297
    .line 298
    .line 299
    iget v0, p0, Lcom/android/launcher3/h0;->W1:I

    .line 300
    .line 301
    iget-object v2, p0, Lcom/android/launcher3/h0;->F0:Lcom/android/launcher3/util/w0;

    .line 302
    .line 303
    invoke-virtual {v1, v0, v2}, Lcom/android/launcher3/util/D;->e(ILcom/android/launcher3/util/w0;)I

    .line 304
    .line 305
    .line 306
    invoke-virtual {v1}, Lcom/android/launcher3/util/D;->c()I

    .line 307
    .line 308
    .line 309
    move-result v0

    .line 310
    iput v0, p0, Lcom/android/launcher3/h0;->X1:I

    .line 311
    .line 312
    invoke-virtual {v1}, Lcom/android/launcher3/util/D;->b()I

    .line 313
    .line 314
    .line 315
    move-result v0

    .line 316
    iput v0, p0, Lcom/android/launcher3/h0;->Z1:I

    .line 317
    .line 318
    invoke-virtual {v1}, Lcom/android/launcher3/util/D;->d()I

    .line 319
    .line 320
    .line 321
    move-result v0

    .line 322
    iput v0, p0, Lcom/android/launcher3/h0;->Y1:I

    .line 323
    .line 324
    iget v0, p0, Lcom/android/launcher3/h0;->U1:I

    .line 325
    .line 326
    int-to-float v0, v0

    .line 327
    mul-float/2addr v0, p1

    .line 328
    invoke-static {v0}, Lc2/a;->g(F)I

    .line 329
    .line 330
    .line 331
    move-result v0

    .line 332
    iput v0, p0, Lcom/android/launcher3/h0;->U1:I

    .line 333
    .line 334
    new-instance v0, Landroid/graphics/Point;

    .line 335
    .line 336
    iget-object v1, p0, Lcom/android/launcher3/h0;->S1:Landroid/graphics/Point;

    .line 337
    .line 338
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 339
    .line 340
    int-to-float v1, v1

    .line 341
    mul-float/2addr v1, p1

    .line 342
    invoke-static {v1}, Lc2/a;->g(F)I

    .line 343
    .line 344
    .line 345
    move-result v1

    .line 346
    iget-object v2, p0, Lcom/android/launcher3/h0;->S1:Landroid/graphics/Point;

    .line 347
    .line 348
    iget v2, v2, Landroid/graphics/Point;->y:I

    .line 349
    .line 350
    int-to-float v2, v2

    .line 351
    mul-float/2addr v2, p1

    .line 352
    invoke-static {v2}, Lc2/a;->g(F)I

    .line 353
    .line 354
    .line 355
    move-result v2

    .line 356
    invoke-direct {v0, v1, v2}, Landroid/graphics/Point;-><init>(II)V

    .line 357
    .line 358
    .line 359
    iput-object v0, p0, Lcom/android/launcher3/h0;->S1:Landroid/graphics/Point;

    .line 360
    .line 361
    iget v0, p0, Lcom/android/launcher3/h0;->P1:I

    .line 362
    .line 363
    int-to-float v0, v0

    .line 364
    mul-float/2addr v0, p1

    .line 365
    invoke-static {v0}, Lc2/a;->g(F)I

    .line 366
    .line 367
    .line 368
    move-result p1

    .line 369
    iput p1, p0, Lcom/android/launcher3/h0;->P1:I

    .line 370
    .line 371
    iget-object p1, p0, Lcom/android/launcher3/h0;->S1:Landroid/graphics/Point;

    .line 372
    .line 373
    iget p1, p1, Landroid/graphics/Point;->x:I

    .line 374
    .line 375
    iput p1, p0, Lcom/android/launcher3/h0;->T1:I

    .line 376
    .line 377
    goto/16 :goto_1

    .line 378
    .line 379
    :cond_3
    const v1, 0x7f070349

    .line 380
    .line 381
    .line 382
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 383
    .line 384
    .line 385
    move-result v1

    .line 386
    int-to-float v1, v1

    .line 387
    mul-float/2addr v1, p1

    .line 388
    float-to-int v1, v1

    .line 389
    const v2, 0x7f07034a

    .line 390
    .line 391
    .line 392
    invoke-virtual {p2, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 393
    .line 394
    .line 395
    move-result v2

    .line 396
    int-to-float v2, v2

    .line 397
    mul-float/2addr v2, p1

    .line 398
    float-to-int v2, v2

    .line 399
    iget v3, p0, Lcom/android/launcher3/h0;->X1:I

    .line 400
    .line 401
    mul-int/lit8 v1, v1, 0x2

    .line 402
    .line 403
    add-int/2addr v1, v3

    .line 404
    iput v1, p0, Lcom/android/launcher3/h0;->V1:I

    .line 405
    .line 406
    mul-int/lit8 v2, v2, 0x2

    .line 407
    .line 408
    add-int/2addr v3, v2

    .line 409
    add-int/2addr v3, v0

    .line 410
    iput v3, p0, Lcom/android/launcher3/h0;->W1:I

    .line 411
    .line 412
    iget-object v1, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 413
    .line 414
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->M:Z

    .line 415
    .line 416
    if-eqz v1, :cond_4

    .line 417
    .line 418
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 419
    .line 420
    .line 421
    move-result-object v1

    .line 422
    invoke-virtual {v1}, Lcom/android/launcher3/resource/B;->s()Z

    .line 423
    .line 424
    .line 425
    move-result v1

    .line 426
    if-eqz v1, :cond_4

    .line 427
    .line 428
    iget v1, p0, Lcom/android/launcher3/h0;->X1:I

    .line 429
    .line 430
    add-int/2addr v1, v2

    .line 431
    mul-int/lit8 v2, v0, 0x2

    .line 432
    .line 433
    add-int/2addr v1, v2

    .line 434
    iput v1, p0, Lcom/android/launcher3/h0;->W1:I

    .line 435
    .line 436
    :cond_4
    iget v1, p0, Lcom/android/launcher3/h0;->U1:I

    .line 437
    .line 438
    int-to-float v1, v1

    .line 439
    mul-float/2addr v1, p1

    .line 440
    invoke-static {v1}, Lc2/a;->g(F)I

    .line 441
    .line 442
    .line 443
    move-result v1

    .line 444
    iput v1, p0, Lcom/android/launcher3/h0;->U1:I

    .line 445
    .line 446
    const v1, 0x7f07034c

    .line 447
    .line 448
    .line 449
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 450
    .line 451
    .line 452
    move-result v1

    .line 453
    iput v1, p0, Lcom/android/launcher3/h0;->T1:I

    .line 454
    .line 455
    const v1, 0x7f07034e

    .line 456
    .line 457
    .line 458
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 459
    .line 460
    .line 461
    move-result v1

    .line 462
    int-to-float v1, v1

    .line 463
    mul-float/2addr v1, p1

    .line 464
    invoke-static {v1}, Lc2/a;->g(F)I

    .line 465
    .line 466
    .line 467
    move-result p1

    .line 468
    iput p1, p0, Lcom/android/launcher3/h0;->P1:I

    .line 469
    .line 470
    invoke-direct {p0, v0}, Lcom/android/launcher3/h0;->B0(I)I

    .line 471
    .line 472
    .line 473
    move-result p1

    .line 474
    iput p1, p0, Lcom/android/launcher3/h0;->Z1:I

    .line 475
    .line 476
    iget-object p1, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 477
    .line 478
    iget-boolean p1, p1, Lcom/android/launcher3/r4;->M:Z

    .line 479
    .line 480
    if-eqz p1, :cond_5

    .line 481
    .line 482
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 483
    .line 484
    .line 485
    move-result-object p1

    .line 486
    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->s()Z

    .line 487
    .line 488
    .line 489
    move-result p1

    .line 490
    if-eqz p1, :cond_5

    .line 491
    .line 492
    iget p1, p0, Lcom/android/launcher3/h0;->W1:I

    .line 493
    .line 494
    iget v1, p0, Lcom/android/launcher3/h0;->X1:I

    .line 495
    .line 496
    sub-int/2addr p1, v1

    .line 497
    mul-int/lit8 v0, v0, 0x2

    .line 498
    .line 499
    sub-int/2addr p1, v0

    .line 500
    div-int/lit8 p1, p1, 0x3

    .line 501
    .line 502
    const/4 v0, 0x0

    .line 503
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 504
    .line 505
    .line 506
    move-result p1

    .line 507
    iput p1, p0, Lcom/android/launcher3/h0;->Z1:I

    .line 508
    .line 509
    :cond_5
    :goto_1
    invoke-super {p0, p0, p2}, Lcom/android/launcher3/X3;->e(Lcom/android/launcher3/h0;Landroid/content/res/Resources;)V

    .line 510
    .line 511
    .line 512
    invoke-super {p0, p0, p2}, Lcom/android/launcher3/X3;->d(Lcom/android/launcher3/h0;Landroid/content/res/Resources;)V

    .line 513
    .line 514
    .line 515
    return-void
.end method

.method private n1(I)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/h0;->v0(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/android/launcher3/h0;->b2:I

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->T0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget v0, p0, Lcom/android/launcher3/h0;->m2:I

    .line 14
    .line 15
    add-int/2addr p1, v0

    .line 16
    iget v0, p0, Lcom/android/launcher3/h0;->n2:I

    .line 17
    .line 18
    add-int/2addr p1, v0

    .line 19
    iput p1, p0, Lcom/android/launcher3/h0;->f2:I

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->M0:Z

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget v0, p0, Lcom/android/launcher3/h0;->q2:I

    .line 27
    .line 28
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iget v0, p0, Lcom/android/launcher3/h0;->g2:I

    .line 33
    .line 34
    add-int/2addr p1, v0

    .line 35
    iput p1, p0, Lcom/android/launcher3/h0;->f2:I

    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iget v0, p0, Lcom/android/launcher3/h0;->i2:I

    .line 39
    .line 40
    add-int/2addr p1, v0

    .line 41
    iget v0, p0, Lcom/android/launcher3/h0;->q2:I

    .line 42
    .line 43
    add-int/2addr p1, v0

    .line 44
    iget v0, p0, Lcom/android/launcher3/h0;->g2:I

    .line 45
    .line 46
    add-int/2addr p1, v0

    .line 47
    iput p1, p0, Lcom/android/launcher3/h0;->f2:I

    .line 48
    .line 49
    return-void
.end method

.method private o0(Lcom/android/launcher3/F1;Landroid/content/res/Resources;)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->b1:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/h0;->c1:LH1/c;

    .line 6
    .line 7
    invoke-virtual {p0}, LH1/c;->f()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->T0()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->Z0:Z

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    iget-object p1, p1, Lcom/android/launcher3/F1;->W0:[F

    .line 25
    .line 26
    iget p2, p0, Lcom/android/launcher3/h0;->a1:I

    .line 27
    .line 28
    aget p1, p1, p2

    .line 29
    .line 30
    iget-object p0, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 31
    .line 32
    invoke-static {p1, p0}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0

    .line 37
    :cond_2
    const p0, 0x7f0702eb

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2, p0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0
.end method

.method private o1(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/android/launcher3/h0;->c2:I

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/launcher3/h0;->w0(I)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput p1, p0, Lcom/android/launcher3/h0;->d2:I

    .line 8
    .line 9
    int-to-float p1, p1

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/h0;->Q(FI)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput p1, p0, Lcom/android/launcher3/h0;->s2:I

    .line 16
    .line 17
    return-void
.end method

.method private r0()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->p3:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->M0:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget v0, p0, Lcom/android/launcher3/h0;->f2:I

    .line 11
    .line 12
    iget p0, p0, Lcom/android/launcher3/h0;->b2:I

    .line 13
    .line 14
    :goto_0
    sub-int/2addr v0, p0

    .line 15
    return v0

    .line 16
    :cond_1
    :goto_1
    iget v0, p0, Lcom/android/launcher3/h0;->g2:I

    .line 17
    .line 18
    iget v1, p0, Lcom/android/launcher3/h0;->b2:I

    .line 19
    .line 20
    iget p0, p0, Lcom/android/launcher3/h0;->B1:I

    .line 21
    .line 22
    sub-int/2addr v1, p0

    .line 23
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    div-int/lit8 p0, p0, 0x2

    .line 28
    .line 29
    goto :goto_0
.end method

.method private r1()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->T0()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_3

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->b1:Z

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/h0;->d1:LH1/c;

    .line 15
    .line 16
    invoke-virtual {v1}, LH1/c;->f()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 21
    .line 22
    iget-object v1, p0, Lcom/android/launcher3/h0;->d1:LH1/c;

    .line 23
    .line 24
    invoke-virtual {v1}, LH1/c;->c()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iget-object v3, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 29
    .line 30
    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    .line 31
    .line 32
    sub-int/2addr v1, v3

    .line 33
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->S0()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_0

    .line 44
    .line 45
    iget v1, p0, Lcom/android/launcher3/h0;->f2:I

    .line 46
    .line 47
    iget-object v3, p0, Lcom/android/launcher3/h0;->c1:LH1/c;

    .line 48
    .line 49
    invoke-virtual {v3}, LH1/c;->c()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    add-int/2addr v1, v3

    .line 54
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 55
    .line 56
    iget-object v1, p0, Lcom/android/launcher3/h0;->c1:LH1/c;

    .line 57
    .line 58
    invoke-virtual {v1}, LH1/c;->f()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/h0;->c1:LH1/c;

    .line 66
    .line 67
    invoke-virtual {v1}, LH1/c;->f()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 72
    .line 73
    iget v1, p0, Lcom/android/launcher3/h0;->f2:I

    .line 74
    .line 75
    iget-object v3, p0, Lcom/android/launcher3/h0;->c1:LH1/c;

    .line 76
    .line 77
    invoke-virtual {v3}, LH1/c;->c()I

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    add-int/2addr v1, v3

    .line 82
    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    iput v2, v0, Landroid/graphics/Rect;->top:I

    .line 86
    .line 87
    iget v1, p0, Lcom/android/launcher3/h0;->r1:I

    .line 88
    .line 89
    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->S0()Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-eqz v1, :cond_2

    .line 96
    .line 97
    iget v1, p0, Lcom/android/launcher3/h0;->f2:I

    .line 98
    .line 99
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 100
    .line 101
    iget v1, p0, Lcom/android/launcher3/h0;->m2:I

    .line 102
    .line 103
    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_2
    iget v1, p0, Lcom/android/launcher3/h0;->m2:I

    .line 107
    .line 108
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 109
    .line 110
    iget v1, p0, Lcom/android/launcher3/h0;->f2:I

    .line 111
    .line 112
    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 113
    .line 114
    :goto_0
    iget v1, p0, Lcom/android/launcher3/X3;->V:I

    .line 115
    .line 116
    iget v3, p0, Lcom/android/launcher3/X3;->x:I

    .line 117
    .line 118
    iget v4, p0, Lcom/android/launcher3/X3;->W:I

    .line 119
    .line 120
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 121
    .line 122
    .line 123
    goto :goto_4

    .line 124
    :cond_3
    iget v1, p0, Lcom/android/launcher3/h0;->f2:I

    .line 125
    .line 126
    iget v3, p0, Lcom/android/launcher3/h0;->x1:I

    .line 127
    .line 128
    add-int/2addr v1, v3

    .line 129
    iget-object v3, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 130
    .line 131
    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    .line 132
    .line 133
    sub-int/2addr v1, v3

    .line 134
    iget-boolean v3, p0, Lcom/android/launcher3/h0;->b1:Z

    .line 135
    .line 136
    if-nez v3, :cond_4

    .line 137
    .line 138
    iget v3, p0, Lcom/android/launcher3/h0;->y1:I

    .line 139
    .line 140
    iget v4, p0, Lcom/android/launcher3/h0;->z1:I

    .line 141
    .line 142
    sub-int/2addr v3, v4

    .line 143
    add-int/2addr v1, v3

    .line 144
    :cond_4
    iget v3, p0, Lcom/android/launcher3/h0;->w1:I

    .line 145
    .line 146
    iget-boolean v4, p0, Lcom/android/launcher3/h0;->Z0:Z

    .line 147
    .line 148
    if-eqz v4, :cond_5

    .line 149
    .line 150
    move v4, v2

    .line 151
    goto :goto_1

    .line 152
    :cond_5
    iget v4, p0, Lcom/android/launcher3/h0;->r1:I

    .line 153
    .line 154
    :goto_1
    add-int/2addr v3, v4

    .line 155
    iget v4, p0, Lcom/android/launcher3/h0;->m1:I

    .line 156
    .line 157
    iget-object v5, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 158
    .line 159
    iget-boolean v5, v5, Lcom/android/launcher3/F1;->C1:Z

    .line 160
    .line 161
    if-eqz v5, :cond_8

    .line 162
    .line 163
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->S0()Z

    .line 164
    .line 165
    .line 166
    move-result v4

    .line 167
    if-eqz v4, :cond_6

    .line 168
    .line 169
    iget v4, p0, Lcom/android/launcher3/h0;->m1:I

    .line 170
    .line 171
    goto :goto_2

    .line 172
    :cond_6
    move v4, v2

    .line 173
    :goto_2
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->S0()Z

    .line 174
    .line 175
    .line 176
    move-result v5

    .line 177
    if-eqz v5, :cond_7

    .line 178
    .line 179
    goto :goto_3

    .line 180
    :cond_7
    iget v2, p0, Lcom/android/launcher3/h0;->m1:I

    .line 181
    .line 182
    goto :goto_3

    .line 183
    :cond_8
    move v2, v4

    .line 184
    :goto_3
    invoke-virtual {v0, v4, v3, v2, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 185
    .line 186
    .line 187
    :goto_4
    iget-object v1, p0, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 188
    .line 189
    iget-object v2, p0, Lcom/android/launcher3/h0;->q1:Landroid/graphics/Rect;

    .line 190
    .line 191
    invoke-direct {p0, v1, v2}, Lcom/android/launcher3/h0;->P0(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 192
    .line 193
    .line 194
    invoke-super {p0, p0, v0}, Lcom/android/launcher3/X3;->A(Lcom/android/launcher3/h0;Landroid/graphics/Rect;)V

    .line 195
    .line 196
    .line 197
    return-void
.end method

.method private t0()I
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/h0;->W()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/android/launcher3/h0;->B1:I

    .line 6
    .line 7
    iget v2, p0, Lcom/android/launcher3/h0;->a2:I

    .line 8
    .line 9
    mul-int/2addr v1, v2

    .line 10
    iget v3, p0, Lcom/android/launcher3/h0;->s2:I

    .line 11
    .line 12
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->e2:Z

    .line 13
    .line 14
    xor-int/lit8 p0, p0, 0x1

    .line 15
    .line 16
    sub-int/2addr v2, p0

    .line 17
    mul-int/2addr v3, v2

    .line 18
    add-int/2addr v1, v3

    .line 19
    add-int/2addr v1, v0

    .line 20
    return v1
.end method

.method private v0(I)I
    .locals 0

    .line 1
    int-to-float p0, p1

    .line 2
    invoke-static {}, Lcom/android/launcher3/folder/a;->c()F

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    mul-float/2addr p0, p1

    .line 7
    float-to-double p0, p0

    .line 8
    invoke-static {p0, p1}, Ljava/lang/Math;->ceil(D)D

    .line 9
    .line 10
    .line 11
    move-result-wide p0

    .line 12
    double-to-int p0, p0

    .line 13
    return p0
.end method

.method private w0(I)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->k0()Landroid/graphics/Point;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Landroid/graphics/Point;->x:I

    .line 6
    .line 7
    mul-int/2addr v0, p1

    .line 8
    add-int/lit8 p1, p1, -0x1

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 11
    .line 12
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 13
    .line 14
    mul-int/2addr p1, v1

    .line 15
    add-int/2addr v0, p1

    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->b0()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    sub-int/2addr v0, p0

    .line 21
    return v0
.end method

.method private x0(I)I
    .locals 0

    .line 1
    const p0, 0x3f6b851f    # 0.92f

    .line 2
    .line 3
    .line 4
    int-to-float p1, p1

    .line 5
    mul-float/2addr p1, p0

    .line 6
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method


# virtual methods
.method public A0(Landroid/content/Context;Lcom/android/launcher3/util/p3;)Lcom/android/launcher3/h0;
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/h0;->f1(Landroid/content/Context;)Lcom/android/launcher3/h0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p2}, Lcom/android/launcher3/h0$a;->i(Lcom/android/launcher3/util/p3;)Lcom/android/launcher3/h0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p2, v0}, Lcom/android/launcher3/h0$a;->f(Z)Lcom/android/launcher3/h0$a;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p2}, Lcom/android/launcher3/h0$a;->a()Lcom/android/launcher3/h0;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->N0:Z

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object p0, p2, Lcom/android/launcher3/X3;->z0:Landroid/graphics/PointF;

    .line 29
    .line 30
    const v0, 0x3f19999a    # 0.6f

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0, v0}, Landroid/graphics/PointF;->set(FF)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p2, Lcom/android/launcher3/X3;->z0:Landroid/graphics/PointF;

    .line 37
    .line 38
    invoke-static {p0, p2, p1}, Lx1/O;->Y4(Landroid/graphics/PointF;Lcom/android/launcher3/h0;Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    return-object p2

    .line 42
    :cond_0
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->k0()Landroid/graphics/Point;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget v0, v0, Landroid/graphics/Point;->x:I

    .line 47
    .line 48
    int-to-float v0, v0

    .line 49
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->k0()Landroid/graphics/Point;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 54
    .line 55
    int-to-float v1, v1

    .line 56
    div-float/2addr v0, v1

    .line 57
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->k0()Landroid/graphics/Point;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 62
    .line 63
    int-to-float v1, v1

    .line 64
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->k0()Landroid/graphics/Point;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 69
    .line 70
    int-to-float p0, p0

    .line 71
    div-float/2addr v1, p0

    .line 72
    const/high16 p0, 0x3f800000    # 1.0f

    .line 73
    .line 74
    cmpl-float v2, v0, p0

    .line 75
    .line 76
    if-nez v2, :cond_1

    .line 77
    .line 78
    cmpl-float p0, v1, p0

    .line 79
    .line 80
    if-eqz p0, :cond_2

    .line 81
    .line 82
    :cond_1
    new-instance p0, Landroid/graphics/PointF;

    .line 83
    .line 84
    invoke-direct {p0, v0, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p2, p1}, Lcom/android/launcher3/h0;->f1(Landroid/content/Context;)Lcom/android/launcher3/h0$a;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    new-instance p2, Lcom/android/launcher3/g0;

    .line 92
    .line 93
    invoke-direct {p2, p0}, Lcom/android/launcher3/g0;-><init>(Landroid/graphics/PointF;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, p2}, Lcom/android/launcher3/h0$a;->h(Lcom/android/launcher3/h0$b;)Lcom/android/launcher3/h0$a;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p0}, Lcom/android/launcher3/h0$a;->a()Lcom/android/launcher3/h0;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    :cond_2
    invoke-direct {p2}, Lcom/android/launcher3/h0;->O0()V

    .line 105
    .line 106
    .line 107
    return-object p2
.end method

.method public E0()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->G0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    iget v0, p0, Lcom/android/launcher3/h0;->U2:I

    .line 14
    .line 15
    iget p0, p0, Lcom/android/launcher3/h0;->T2:I

    .line 16
    .line 17
    add-int/2addr v0, p0

    .line 18
    return v0
.end method

.method public F0()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->p3:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/h0;->v3:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 9
    .line 10
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 11
    .line 12
    return p0
.end method

.method public G0()I
    .locals 0

    .line 1
    invoke-super {p0, p0}, Lcom/android/launcher3/X3;->r(Lcom/android/launcher3/h0;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public H0()I
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->K0:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x2

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x1

    .line 8
    return p0
.end method

.method public I0()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->M0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/h0;->r0()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget v1, p0, Lcom/android/launcher3/h0;->p2:I

    .line 10
    .line 11
    iget p0, p0, Lcom/android/launcher3/h0;->b2:I

    .line 12
    .line 13
    sub-int/2addr v1, p0

    .line 14
    div-int/lit8 v1, v1, 0x2

    .line 15
    .line 16
    sub-int/2addr v0, v1

    .line 17
    return v0

    .line 18
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->p3:Z

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget v0, p0, Lcom/android/launcher3/h0;->f2:I

    .line 23
    .line 24
    iget v1, p0, Lcom/android/launcher3/h0;->p2:I

    .line 25
    .line 26
    sub-int/2addr v0, v1

    .line 27
    iget p0, p0, Lcom/android/launcher3/h0;->r2:I

    .line 28
    .line 29
    add-int/2addr v0, p0

    .line 30
    return v0

    .line 31
    :cond_1
    iget v0, p0, Lcom/android/launcher3/h0;->g2:I

    .line 32
    .line 33
    iget p0, p0, Lcom/android/launcher3/h0;->r2:I

    .line 34
    .line 35
    sub-int/2addr v0, p0

    .line 36
    return v0
.end method

.method public J0()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/h0;->r3:I

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/h0;->B1:I

    .line 4
    .line 5
    sub-int/2addr v0, v1

    .line 6
    div-int/lit8 v0, v0, 0x2

    .line 7
    .line 8
    iget v2, p0, Lcom/android/launcher3/h0;->b2:I

    .line 9
    .line 10
    sub-int/2addr v2, v1

    .line 11
    div-int/lit8 v2, v2, 0x2

    .line 12
    .line 13
    iget v1, p0, Lcom/android/launcher3/h0;->o1:I

    .line 14
    .line 15
    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-direct {p0}, Lcom/android/launcher3/h0;->r0()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    add-int/2addr p0, v1

    .line 24
    sub-int/2addr p0, v0

    .line 25
    return p0
.end method

.method public K0()Landroid/graphics/Point;
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Point;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 4
    .line 5
    iget v1, p0, Landroid/graphics/Rect;->left:I

    .line 6
    .line 7
    iget v2, p0, Landroid/graphics/Rect;->right:I

    .line 8
    .line 9
    add-int/2addr v1, v2

    .line 10
    iget v2, p0, Landroid/graphics/Rect;->top:I

    .line 11
    .line 12
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 13
    .line 14
    add-int/2addr v2, p0

    .line 15
    invoke-direct {v0, v1, v2}, Landroid/graphics/Point;-><init>(II)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public M()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/h0;->N2:F

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/N5;->f(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lcom/android/launcher3/h0;->J2:I

    .line 8
    .line 9
    iget v2, p0, Lcom/android/launcher3/h0;->K2:I

    .line 10
    .line 11
    add-int/2addr v1, v2

    .line 12
    add-int/2addr v1, v0

    .line 13
    mul-int/lit8 v0, v0, 0x2

    .line 14
    .line 15
    add-int/2addr v1, v0

    .line 16
    iput v1, p0, Lcom/android/launcher3/h0;->H2:I

    .line 17
    .line 18
    return-void
.end method

.method public M0()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->T0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Lcom/android/launcher3/h0;->U0:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    iget p0, p0, Lcom/android/launcher3/h0;->T0:I

    .line 11
    .line 12
    return p0
.end method

.method public N0(Landroid/content/Context;)F
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/h0;->g0(Landroid/content/Context;)F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->h0()F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    sub-float/2addr p1, v0

    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->e0()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    int-to-float v0, v0

    .line 15
    div-float/2addr p1, v0

    .line 16
    const/high16 v0, 0x3f800000    # 1.0f

    .line 17
    .line 18
    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iget v0, p0, Lcom/android/launcher3/h0;->V0:I

    .line 23
    .line 24
    int-to-float v1, v0

    .line 25
    mul-float/2addr v1, p1

    .line 26
    iget p0, p0, Lcom/android/launcher3/h0;->t1:I

    .line 27
    .line 28
    mul-int/lit8 p0, p0, 0x2

    .line 29
    .line 30
    sub-int/2addr v0, p0

    .line 31
    int-to-float p0, v0

    .line 32
    cmpl-float v0, v1, p0

    .line 33
    .line 34
    if-lez v0, :cond_0

    .line 35
    .line 36
    div-float/2addr p0, v1

    .line 37
    mul-float/2addr p1, p0

    .line 38
    :cond_0
    return p1
.end method

.method public R0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->Z0:Z

    .line 2
    .line 3
    return p0
.end method

.method public S(Landroid/content/Context;)Lcom/android/launcher3/h0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/h0;->f1(Landroid/content/Context;)Lcom/android/launcher3/h0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/h0$a;->a()Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public S0()Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/h0;->X0:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-ne v0, v1, :cond_1

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->T0()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 13
    .line 14
    iget-boolean p0, p0, Lcom/android/launcher3/F1;->C1:Z

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    :cond_0
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_1
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public T0()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->N0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->I0:Z

    .line 6
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

.method public U(Landroid/content/Context;Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "DeviceProfile:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "\t1 dp = "

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 35
    .line 36
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v1, " px"

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v1, "\tisTablet:"

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->G0:Z

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    new-instance v0, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v1, "\tisPhone:"

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->H0:Z

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    new-instance v0, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string v1, "\ttransposeLayoutWithOrientation:"

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->I0:Z

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    new-instance v0, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    const-string v1, "\tisGestureMode:"

    .line 137
    .line 138
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->P0:Z

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    new-instance v0, Ljava/lang/StringBuilder;

    .line 154
    .line 155
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    const-string v1, "\tisLandscape:"

    .line 162
    .line 163
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->N0:Z

    .line 167
    .line 168
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    new-instance v0, Ljava/lang/StringBuilder;

    .line 179
    .line 180
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    const-string v1, "\tisMultiWindowMode:"

    .line 187
    .line 188
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->O0:Z

    .line 192
    .line 193
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    new-instance v0, Ljava/lang/StringBuilder;

    .line 204
    .line 205
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    const-string v1, "\tisTwoPanels:"

    .line 212
    .line 213
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->K0:Z

    .line 217
    .line 218
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    new-instance v0, Ljava/lang/StringBuilder;

    .line 229
    .line 230
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 231
    .line 232
    .line 233
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    const-string v1, "\tisLeftRightSplit:"

    .line 237
    .line 238
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->Q0:Z

    .line 242
    .line 243
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    new-instance v0, Ljava/lang/StringBuilder;

    .line 254
    .line 255
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 256
    .line 257
    .line 258
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    iget v1, p0, Lcom/android/launcher3/h0;->R0:I

    .line 262
    .line 263
    int-to-float v1, v1

    .line 264
    const-string v2, "windowX"

    .line 265
    .line 266
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v1

    .line 270
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 278
    .line 279
    .line 280
    new-instance v0, Ljava/lang/StringBuilder;

    .line 281
    .line 282
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 283
    .line 284
    .line 285
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    iget v1, p0, Lcom/android/launcher3/h0;->S0:I

    .line 289
    .line 290
    int-to-float v1, v1

    .line 291
    const-string v2, "windowY"

    .line 292
    .line 293
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v1

    .line 297
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    new-instance v0, Ljava/lang/StringBuilder;

    .line 308
    .line 309
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 310
    .line 311
    .line 312
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 313
    .line 314
    .line 315
    iget v1, p0, Lcom/android/launcher3/h0;->T0:I

    .line 316
    .line 317
    int-to-float v1, v1

    .line 318
    const-string v2, "widthPx"

    .line 319
    .line 320
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v1

    .line 324
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    new-instance v0, Ljava/lang/StringBuilder;

    .line 335
    .line 336
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 337
    .line 338
    .line 339
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    iget v1, p0, Lcom/android/launcher3/h0;->U0:I

    .line 343
    .line 344
    int-to-float v1, v1

    .line 345
    const-string v2, "heightPx"

    .line 346
    .line 347
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 348
    .line 349
    .line 350
    move-result-object v1

    .line 351
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object v0

    .line 358
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 359
    .line 360
    .line 361
    new-instance v0, Ljava/lang/StringBuilder;

    .line 362
    .line 363
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 364
    .line 365
    .line 366
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 367
    .line 368
    .line 369
    iget v1, p0, Lcom/android/launcher3/h0;->V0:I

    .line 370
    .line 371
    int-to-float v1, v1

    .line 372
    const-string v2, "availableWidthPx"

    .line 373
    .line 374
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object v1

    .line 378
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 379
    .line 380
    .line 381
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object v0

    .line 385
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 386
    .line 387
    .line 388
    new-instance v0, Ljava/lang/StringBuilder;

    .line 389
    .line 390
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 391
    .line 392
    .line 393
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 394
    .line 395
    .line 396
    iget v1, p0, Lcom/android/launcher3/h0;->W0:I

    .line 397
    .line 398
    int-to-float v1, v1

    .line 399
    const-string v2, "availableHeightPx"

    .line 400
    .line 401
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object v1

    .line 405
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 406
    .line 407
    .line 408
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 409
    .line 410
    .line 411
    move-result-object v0

    .line 412
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 413
    .line 414
    .line 415
    new-instance v0, Ljava/lang/StringBuilder;

    .line 416
    .line 417
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 418
    .line 419
    .line 420
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 421
    .line 422
    .line 423
    iget-object v1, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 424
    .line 425
    iget v1, v1, Landroid/graphics/Rect;->left:I

    .line 426
    .line 427
    int-to-float v1, v1

    .line 428
    const-string v2, "mInsets.left"

    .line 429
    .line 430
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 431
    .line 432
    .line 433
    move-result-object v1

    .line 434
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 435
    .line 436
    .line 437
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 438
    .line 439
    .line 440
    move-result-object v0

    .line 441
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 442
    .line 443
    .line 444
    new-instance v0, Ljava/lang/StringBuilder;

    .line 445
    .line 446
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 447
    .line 448
    .line 449
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 450
    .line 451
    .line 452
    iget-object v1, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 453
    .line 454
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 455
    .line 456
    int-to-float v1, v1

    .line 457
    const-string v2, "mInsets.top"

    .line 458
    .line 459
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 460
    .line 461
    .line 462
    move-result-object v1

    .line 463
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 464
    .line 465
    .line 466
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 467
    .line 468
    .line 469
    move-result-object v0

    .line 470
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 471
    .line 472
    .line 473
    new-instance v0, Ljava/lang/StringBuilder;

    .line 474
    .line 475
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 476
    .line 477
    .line 478
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 479
    .line 480
    .line 481
    iget-object v1, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 482
    .line 483
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 484
    .line 485
    int-to-float v1, v1

    .line 486
    const-string v2, "mInsets.right"

    .line 487
    .line 488
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 489
    .line 490
    .line 491
    move-result-object v1

    .line 492
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 493
    .line 494
    .line 495
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 496
    .line 497
    .line 498
    move-result-object v0

    .line 499
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 500
    .line 501
    .line 502
    new-instance v0, Ljava/lang/StringBuilder;

    .line 503
    .line 504
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 505
    .line 506
    .line 507
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 508
    .line 509
    .line 510
    iget-object v1, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 511
    .line 512
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 513
    .line 514
    int-to-float v1, v1

    .line 515
    const-string v2, "mInsets.bottom"

    .line 516
    .line 517
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 518
    .line 519
    .line 520
    move-result-object v1

    .line 521
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 522
    .line 523
    .line 524
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 525
    .line 526
    .line 527
    move-result-object v0

    .line 528
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 529
    .line 530
    .line 531
    new-instance v0, Ljava/lang/StringBuilder;

    .line 532
    .line 533
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 534
    .line 535
    .line 536
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 537
    .line 538
    .line 539
    const-string v1, "\taspectRatio:"

    .line 540
    .line 541
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 542
    .line 543
    .line 544
    iget v1, p0, Lcom/android/launcher3/h0;->Y0:F

    .line 545
    .line 546
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 547
    .line 548
    .line 549
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 550
    .line 551
    .line 552
    move-result-object v0

    .line 553
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 554
    .line 555
    .line 556
    new-instance v0, Ljava/lang/StringBuilder;

    .line 557
    .line 558
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 559
    .line 560
    .line 561
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 562
    .line 563
    .line 564
    const-string v1, "\tisResponsiveGrid:"

    .line 565
    .line 566
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 567
    .line 568
    .line 569
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->b1:Z

    .line 570
    .line 571
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 572
    .line 573
    .line 574
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 575
    .line 576
    .line 577
    move-result-object v0

    .line 578
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 579
    .line 580
    .line 581
    new-instance v0, Ljava/lang/StringBuilder;

    .line 582
    .line 583
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 584
    .line 585
    .line 586
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 587
    .line 588
    .line 589
    const-string v1, "\tisScalableGrid:"

    .line 590
    .line 591
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 592
    .line 593
    .line 594
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->Z0:Z

    .line 595
    .line 596
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 597
    .line 598
    .line 599
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 600
    .line 601
    .line 602
    move-result-object v0

    .line 603
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 604
    .line 605
    .line 606
    new-instance v0, Ljava/lang/StringBuilder;

    .line 607
    .line 608
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 609
    .line 610
    .line 611
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 612
    .line 613
    .line 614
    const-string v1, "\tinv.numRows:"

    .line 615
    .line 616
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 617
    .line 618
    .line 619
    iget-object v1, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 620
    .line 621
    iget v1, v1, Lcom/android/launcher3/F1;->G0:I

    .line 622
    .line 623
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 624
    .line 625
    .line 626
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 627
    .line 628
    .line 629
    move-result-object v0

    .line 630
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 631
    .line 632
    .line 633
    new-instance v0, Ljava/lang/StringBuilder;

    .line 634
    .line 635
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 636
    .line 637
    .line 638
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 639
    .line 640
    .line 641
    const-string v1, "\tinv.numColumns: "

    .line 642
    .line 643
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 644
    .line 645
    .line 646
    iget-object v1, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 647
    .line 648
    iget v1, v1, Lcom/android/launcher3/F1;->H0:I

    .line 649
    .line 650
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 651
    .line 652
    .line 653
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 654
    .line 655
    .line 656
    move-result-object v0

    .line 657
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 658
    .line 659
    .line 660
    new-instance v0, Ljava/lang/StringBuilder;

    .line 661
    .line 662
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 663
    .line 664
    .line 665
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 666
    .line 667
    .line 668
    const-string v1, "\tinv.numSearchContainerColumns: "

    .line 669
    .line 670
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 671
    .line 672
    .line 673
    iget-object v1, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 674
    .line 675
    iget v1, v1, Lcom/android/launcher3/F1;->I0:I

    .line 676
    .line 677
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 678
    .line 679
    .line 680
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 681
    .line 682
    .line 683
    move-result-object v0

    .line 684
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 685
    .line 686
    .line 687
    new-instance v0, Ljava/lang/StringBuilder;

    .line 688
    .line 689
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 690
    .line 691
    .line 692
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 693
    .line 694
    .line 695
    iget-object v1, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 696
    .line 697
    iget-object v1, v1, Lcom/android/launcher3/F1;->R0:[Landroid/graphics/PointF;

    .line 698
    .line 699
    iget v2, p0, Lcom/android/launcher3/h0;->a1:I

    .line 700
    .line 701
    aget-object v1, v1, v2

    .line 702
    .line 703
    const-string v2, "minCellSize"

    .line 704
    .line 705
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->T(Ljava/lang/String;Landroid/graphics/PointF;)Ljava/lang/String;

    .line 706
    .line 707
    .line 708
    move-result-object v1

    .line 709
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 710
    .line 711
    .line 712
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 713
    .line 714
    .line 715
    move-result-object v0

    .line 716
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 717
    .line 718
    .line 719
    new-instance v0, Ljava/lang/StringBuilder;

    .line 720
    .line 721
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 722
    .line 723
    .line 724
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 725
    .line 726
    .line 727
    iget v1, p0, Lcom/android/launcher3/h0;->H1:I

    .line 728
    .line 729
    int-to-float v1, v1

    .line 730
    const-string v2, "cellWidthPx"

    .line 731
    .line 732
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 733
    .line 734
    .line 735
    move-result-object v1

    .line 736
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 737
    .line 738
    .line 739
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 740
    .line 741
    .line 742
    move-result-object v0

    .line 743
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 744
    .line 745
    .line 746
    new-instance v0, Ljava/lang/StringBuilder;

    .line 747
    .line 748
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 749
    .line 750
    .line 751
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 752
    .line 753
    .line 754
    iget v1, p0, Lcom/android/launcher3/h0;->I1:I

    .line 755
    .line 756
    int-to-float v1, v1

    .line 757
    const-string v2, "cellHeightPx"

    .line 758
    .line 759
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 760
    .line 761
    .line 762
    move-result-object v1

    .line 763
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 764
    .line 765
    .line 766
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 767
    .line 768
    .line 769
    move-result-object v0

    .line 770
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 771
    .line 772
    .line 773
    new-instance v0, Ljava/lang/StringBuilder;

    .line 774
    .line 775
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 776
    .line 777
    .line 778
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 779
    .line 780
    .line 781
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->k0()Landroid/graphics/Point;

    .line 782
    .line 783
    .line 784
    move-result-object v1

    .line 785
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 786
    .line 787
    int-to-float v1, v1

    .line 788
    const-string v2, "getCellSize().x"

    .line 789
    .line 790
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 791
    .line 792
    .line 793
    move-result-object v1

    .line 794
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 795
    .line 796
    .line 797
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 798
    .line 799
    .line 800
    move-result-object v0

    .line 801
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 802
    .line 803
    .line 804
    new-instance v0, Ljava/lang/StringBuilder;

    .line 805
    .line 806
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 807
    .line 808
    .line 809
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 810
    .line 811
    .line 812
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->k0()Landroid/graphics/Point;

    .line 813
    .line 814
    .line 815
    move-result-object v1

    .line 816
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 817
    .line 818
    int-to-float v1, v1

    .line 819
    const-string v2, "getCellSize().y"

    .line 820
    .line 821
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 822
    .line 823
    .line 824
    move-result-object v1

    .line 825
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 826
    .line 827
    .line 828
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 829
    .line 830
    .line 831
    move-result-object v0

    .line 832
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 833
    .line 834
    .line 835
    new-instance v0, Ljava/lang/StringBuilder;

    .line 836
    .line 837
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 838
    .line 839
    .line 840
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 841
    .line 842
    .line 843
    iget-object v1, p0, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 844
    .line 845
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 846
    .line 847
    int-to-float v1, v1

    .line 848
    const-string v2, "cellLayoutBorderSpacePx Horizontal"

    .line 849
    .line 850
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 851
    .line 852
    .line 853
    move-result-object v1

    .line 854
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 855
    .line 856
    .line 857
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 858
    .line 859
    .line 860
    move-result-object v0

    .line 861
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 862
    .line 863
    .line 864
    new-instance v0, Ljava/lang/StringBuilder;

    .line 865
    .line 866
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 867
    .line 868
    .line 869
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 870
    .line 871
    .line 872
    iget-object v1, p0, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 873
    .line 874
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 875
    .line 876
    int-to-float v1, v1

    .line 877
    const-string v2, "cellLayoutBorderSpacePx Vertical"

    .line 878
    .line 879
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 880
    .line 881
    .line 882
    move-result-object v1

    .line 883
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 884
    .line 885
    .line 886
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 887
    .line 888
    .line 889
    move-result-object v0

    .line 890
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 891
    .line 892
    .line 893
    new-instance v0, Ljava/lang/StringBuilder;

    .line 894
    .line 895
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 896
    .line 897
    .line 898
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 899
    .line 900
    .line 901
    iget-object v1, p0, Lcom/android/launcher3/h0;->q1:Landroid/graphics/Rect;

    .line 902
    .line 903
    iget v1, v1, Landroid/graphics/Rect;->left:I

    .line 904
    .line 905
    int-to-float v1, v1

    .line 906
    const-string v2, "cellLayoutPaddingPx.left"

    .line 907
    .line 908
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 909
    .line 910
    .line 911
    move-result-object v1

    .line 912
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 913
    .line 914
    .line 915
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 916
    .line 917
    .line 918
    move-result-object v0

    .line 919
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 920
    .line 921
    .line 922
    new-instance v0, Ljava/lang/StringBuilder;

    .line 923
    .line 924
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 925
    .line 926
    .line 927
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 928
    .line 929
    .line 930
    iget-object v1, p0, Lcom/android/launcher3/h0;->q1:Landroid/graphics/Rect;

    .line 931
    .line 932
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 933
    .line 934
    int-to-float v1, v1

    .line 935
    const-string v2, "cellLayoutPaddingPx.top"

    .line 936
    .line 937
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 938
    .line 939
    .line 940
    move-result-object v1

    .line 941
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 942
    .line 943
    .line 944
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 945
    .line 946
    .line 947
    move-result-object v0

    .line 948
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 949
    .line 950
    .line 951
    new-instance v0, Ljava/lang/StringBuilder;

    .line 952
    .line 953
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 954
    .line 955
    .line 956
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 957
    .line 958
    .line 959
    iget-object v1, p0, Lcom/android/launcher3/h0;->q1:Landroid/graphics/Rect;

    .line 960
    .line 961
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 962
    .line 963
    int-to-float v1, v1

    .line 964
    const-string v2, "cellLayoutPaddingPx.right"

    .line 965
    .line 966
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 967
    .line 968
    .line 969
    move-result-object v1

    .line 970
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 971
    .line 972
    .line 973
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 974
    .line 975
    .line 976
    move-result-object v0

    .line 977
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 978
    .line 979
    .line 980
    new-instance v0, Ljava/lang/StringBuilder;

    .line 981
    .line 982
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 983
    .line 984
    .line 985
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 986
    .line 987
    .line 988
    iget-object v1, p0, Lcom/android/launcher3/h0;->q1:Landroid/graphics/Rect;

    .line 989
    .line 990
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 991
    .line 992
    int-to-float v1, v1

    .line 993
    const-string v2, "cellLayoutPaddingPx.bottom"

    .line 994
    .line 995
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 996
    .line 997
    .line 998
    move-result-object v1

    .line 999
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1000
    .line 1001
    .line 1002
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1003
    .line 1004
    .line 1005
    move-result-object v0

    .line 1006
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1007
    .line 1008
    .line 1009
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1010
    .line 1011
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1012
    .line 1013
    .line 1014
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1015
    .line 1016
    .line 1017
    iget v1, p0, Lcom/android/launcher3/h0;->B1:I

    .line 1018
    .line 1019
    int-to-float v1, v1

    .line 1020
    const-string v2, "iconSizePx"

    .line 1021
    .line 1022
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1023
    .line 1024
    .line 1025
    move-result-object v1

    .line 1026
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1027
    .line 1028
    .line 1029
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1030
    .line 1031
    .line 1032
    move-result-object v0

    .line 1033
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1034
    .line 1035
    .line 1036
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1037
    .line 1038
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1039
    .line 1040
    .line 1041
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1042
    .line 1043
    .line 1044
    iget v1, p0, Lcom/android/launcher3/h0;->C1:I

    .line 1045
    .line 1046
    int-to-float v1, v1

    .line 1047
    const-string v2, "iconTextSizePx"

    .line 1048
    .line 1049
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1050
    .line 1051
    .line 1052
    move-result-object v1

    .line 1053
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1054
    .line 1055
    .line 1056
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1057
    .line 1058
    .line 1059
    move-result-object v0

    .line 1060
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1061
    .line 1062
    .line 1063
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1064
    .line 1065
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1066
    .line 1067
    .line 1068
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1069
    .line 1070
    .line 1071
    iget v1, p0, Lcom/android/launcher3/h0;->D1:I

    .line 1072
    .line 1073
    int-to-float v1, v1

    .line 1074
    const-string v2, "iconDrawablePaddingPx"

    .line 1075
    .line 1076
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1077
    .line 1078
    .line 1079
    move-result-object v1

    .line 1080
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1081
    .line 1082
    .line 1083
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1084
    .line 1085
    .line 1086
    move-result-object v0

    .line 1087
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1088
    .line 1089
    .line 1090
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1091
    .line 1092
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1093
    .line 1094
    .line 1095
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1096
    .line 1097
    .line 1098
    const-string v1, "\tnumFolderRows: "

    .line 1099
    .line 1100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1101
    .line 1102
    .line 1103
    iget v1, p0, Lcom/android/launcher3/h0;->L1:I

    .line 1104
    .line 1105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1106
    .line 1107
    .line 1108
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1109
    .line 1110
    .line 1111
    move-result-object v0

    .line 1112
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1113
    .line 1114
    .line 1115
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1116
    .line 1117
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1118
    .line 1119
    .line 1120
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1121
    .line 1122
    .line 1123
    const-string v1, "\tnumFolderColumns: "

    .line 1124
    .line 1125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1126
    .line 1127
    .line 1128
    iget v1, p0, Lcom/android/launcher3/h0;->M1:I

    .line 1129
    .line 1130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1131
    .line 1132
    .line 1133
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1134
    .line 1135
    .line 1136
    move-result-object v0

    .line 1137
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1138
    .line 1139
    .line 1140
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1141
    .line 1142
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1143
    .line 1144
    .line 1145
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1146
    .line 1147
    .line 1148
    iget v1, p0, Lcom/android/launcher3/h0;->V1:I

    .line 1149
    .line 1150
    int-to-float v1, v1

    .line 1151
    const-string v2, "folderCellWidthPx"

    .line 1152
    .line 1153
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1154
    .line 1155
    .line 1156
    move-result-object v1

    .line 1157
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1158
    .line 1159
    .line 1160
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1161
    .line 1162
    .line 1163
    move-result-object v0

    .line 1164
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1165
    .line 1166
    .line 1167
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1168
    .line 1169
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1170
    .line 1171
    .line 1172
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1173
    .line 1174
    .line 1175
    iget v1, p0, Lcom/android/launcher3/h0;->W1:I

    .line 1176
    .line 1177
    int-to-float v1, v1

    .line 1178
    const-string v2, "folderCellHeightPx"

    .line 1179
    .line 1180
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1181
    .line 1182
    .line 1183
    move-result-object v1

    .line 1184
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1185
    .line 1186
    .line 1187
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1188
    .line 1189
    .line 1190
    move-result-object v0

    .line 1191
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1192
    .line 1193
    .line 1194
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1195
    .line 1196
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1197
    .line 1198
    .line 1199
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1200
    .line 1201
    .line 1202
    iget v1, p0, Lcom/android/launcher3/h0;->X1:I

    .line 1203
    .line 1204
    int-to-float v1, v1

    .line 1205
    const-string v2, "folderChildIconSizePx"

    .line 1206
    .line 1207
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1208
    .line 1209
    .line 1210
    move-result-object v1

    .line 1211
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1212
    .line 1213
    .line 1214
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1215
    .line 1216
    .line 1217
    move-result-object v0

    .line 1218
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1219
    .line 1220
    .line 1221
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1222
    .line 1223
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1224
    .line 1225
    .line 1226
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1227
    .line 1228
    .line 1229
    iget v1, p0, Lcom/android/launcher3/h0;->Y1:I

    .line 1230
    .line 1231
    int-to-float v1, v1

    .line 1232
    const-string v2, "folderChildTextSizePx"

    .line 1233
    .line 1234
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1235
    .line 1236
    .line 1237
    move-result-object v1

    .line 1238
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1239
    .line 1240
    .line 1241
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1242
    .line 1243
    .line 1244
    move-result-object v0

    .line 1245
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1246
    .line 1247
    .line 1248
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1249
    .line 1250
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1251
    .line 1252
    .line 1253
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1254
    .line 1255
    .line 1256
    iget v1, p0, Lcom/android/launcher3/h0;->Z1:I

    .line 1257
    .line 1258
    int-to-float v1, v1

    .line 1259
    const-string v2, "folderChildDrawablePaddingPx"

    .line 1260
    .line 1261
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1262
    .line 1263
    .line 1264
    move-result-object v1

    .line 1265
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1266
    .line 1267
    .line 1268
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1269
    .line 1270
    .line 1271
    move-result-object v0

    .line 1272
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1273
    .line 1274
    .line 1275
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1276
    .line 1277
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1278
    .line 1279
    .line 1280
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1281
    .line 1282
    .line 1283
    iget-object v1, p0, Lcom/android/launcher3/h0;->S1:Landroid/graphics/Point;

    .line 1284
    .line 1285
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 1286
    .line 1287
    int-to-float v1, v1

    .line 1288
    const-string v2, "folderCellLayoutBorderSpacePx.x"

    .line 1289
    .line 1290
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1291
    .line 1292
    .line 1293
    move-result-object v1

    .line 1294
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1295
    .line 1296
    .line 1297
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1298
    .line 1299
    .line 1300
    move-result-object v0

    .line 1301
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1302
    .line 1303
    .line 1304
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1305
    .line 1306
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1307
    .line 1308
    .line 1309
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1310
    .line 1311
    .line 1312
    iget-object v1, p0, Lcom/android/launcher3/h0;->S1:Landroid/graphics/Point;

    .line 1313
    .line 1314
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 1315
    .line 1316
    int-to-float v1, v1

    .line 1317
    const-string v2, "folderCellLayoutBorderSpacePx.y"

    .line 1318
    .line 1319
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1320
    .line 1321
    .line 1322
    move-result-object v1

    .line 1323
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1324
    .line 1325
    .line 1326
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1327
    .line 1328
    .line 1329
    move-result-object v0

    .line 1330
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1331
    .line 1332
    .line 1333
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1334
    .line 1335
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1336
    .line 1337
    .line 1338
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1339
    .line 1340
    .line 1341
    iget v1, p0, Lcom/android/launcher3/h0;->T1:I

    .line 1342
    .line 1343
    int-to-float v1, v1

    .line 1344
    const-string v2, "folderContentPaddingLeftRight"

    .line 1345
    .line 1346
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1347
    .line 1348
    .line 1349
    move-result-object v1

    .line 1350
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1351
    .line 1352
    .line 1353
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1354
    .line 1355
    .line 1356
    move-result-object v0

    .line 1357
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1358
    .line 1359
    .line 1360
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1361
    .line 1362
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1363
    .line 1364
    .line 1365
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1366
    .line 1367
    .line 1368
    iget v1, p0, Lcom/android/launcher3/h0;->U1:I

    .line 1369
    .line 1370
    int-to-float v1, v1

    .line 1371
    const-string v2, "folderTopPadding"

    .line 1372
    .line 1373
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1374
    .line 1375
    .line 1376
    move-result-object v1

    .line 1377
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1378
    .line 1379
    .line 1380
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1381
    .line 1382
    .line 1383
    move-result-object v0

    .line 1384
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1385
    .line 1386
    .line 1387
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1388
    .line 1389
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1390
    .line 1391
    .line 1392
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1393
    .line 1394
    .line 1395
    iget v1, p0, Lcom/android/launcher3/h0;->P1:I

    .line 1396
    .line 1397
    int-to-float v1, v1

    .line 1398
    const-string v2, "folderFooterHeight"

    .line 1399
    .line 1400
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1401
    .line 1402
    .line 1403
    move-result-object v1

    .line 1404
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1405
    .line 1406
    .line 1407
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1408
    .line 1409
    .line 1410
    move-result-object v0

    .line 1411
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1412
    .line 1413
    .line 1414
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1415
    .line 1416
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1417
    .line 1418
    .line 1419
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1420
    .line 1421
    .line 1422
    iget v1, p0, Lcom/android/launcher3/h0;->x2:I

    .line 1423
    .line 1424
    int-to-float v1, v1

    .line 1425
    const-string v2, "bottomSheetTopPadding"

    .line 1426
    .line 1427
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1428
    .line 1429
    .line 1430
    move-result-object v1

    .line 1431
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1432
    .line 1433
    .line 1434
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1435
    .line 1436
    .line 1437
    move-result-object v0

    .line 1438
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1439
    .line 1440
    .line 1441
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1442
    .line 1443
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1444
    .line 1445
    .line 1446
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1447
    .line 1448
    .line 1449
    const-string v1, "\tbottomSheetOpenDuration: "

    .line 1450
    .line 1451
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1452
    .line 1453
    .line 1454
    iget v1, p0, Lcom/android/launcher3/h0;->y2:I

    .line 1455
    .line 1456
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1457
    .line 1458
    .line 1459
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1460
    .line 1461
    .line 1462
    move-result-object v0

    .line 1463
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1464
    .line 1465
    .line 1466
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1467
    .line 1468
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1469
    .line 1470
    .line 1471
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1472
    .line 1473
    .line 1474
    const-string v1, "\tbottomSheetCloseDuration: "

    .line 1475
    .line 1476
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1477
    .line 1478
    .line 1479
    iget v1, p0, Lcom/android/launcher3/h0;->z2:I

    .line 1480
    .line 1481
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1482
    .line 1483
    .line 1484
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1485
    .line 1486
    .line 1487
    move-result-object v0

    .line 1488
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1489
    .line 1490
    .line 1491
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1492
    .line 1493
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1494
    .line 1495
    .line 1496
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1497
    .line 1498
    .line 1499
    const-string v1, "\tbottomSheetWorkspaceScale: "

    .line 1500
    .line 1501
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1502
    .line 1503
    .line 1504
    iget v1, p0, Lcom/android/launcher3/h0;->A2:F

    .line 1505
    .line 1506
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 1507
    .line 1508
    .line 1509
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1510
    .line 1511
    .line 1512
    move-result-object v0

    .line 1513
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1514
    .line 1515
    .line 1516
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1517
    .line 1518
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1519
    .line 1520
    .line 1521
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1522
    .line 1523
    .line 1524
    const-string v1, "\tbottomSheetDepth: "

    .line 1525
    .line 1526
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1527
    .line 1528
    .line 1529
    iget v1, p0, Lcom/android/launcher3/h0;->B2:F

    .line 1530
    .line 1531
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 1532
    .line 1533
    .line 1534
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1535
    .line 1536
    .line 1537
    move-result-object v0

    .line 1538
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1539
    .line 1540
    .line 1541
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1542
    .line 1543
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1544
    .line 1545
    .line 1546
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1547
    .line 1548
    .line 1549
    iget v1, p0, Lcom/android/launcher3/h0;->D2:I

    .line 1550
    .line 1551
    int-to-float v1, v1

    .line 1552
    const-string v2, "allAppsShiftRange"

    .line 1553
    .line 1554
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1555
    .line 1556
    .line 1557
    move-result-object v1

    .line 1558
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1559
    .line 1560
    .line 1561
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1562
    .line 1563
    .line 1564
    move-result-object v0

    .line 1565
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1566
    .line 1567
    .line 1568
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1569
    .line 1570
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1571
    .line 1572
    .line 1573
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1574
    .line 1575
    .line 1576
    const-string v1, "\tallAppsOpenDuration: "

    .line 1577
    .line 1578
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1579
    .line 1580
    .line 1581
    iget v1, p0, Lcom/android/launcher3/h0;->F2:I

    .line 1582
    .line 1583
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1584
    .line 1585
    .line 1586
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1587
    .line 1588
    .line 1589
    move-result-object v0

    .line 1590
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1591
    .line 1592
    .line 1593
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1594
    .line 1595
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1596
    .line 1597
    .line 1598
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1599
    .line 1600
    .line 1601
    const-string v1, "\tallAppsCloseDuration: "

    .line 1602
    .line 1603
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1604
    .line 1605
    .line 1606
    iget v1, p0, Lcom/android/launcher3/h0;->G2:I

    .line 1607
    .line 1608
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1609
    .line 1610
    .line 1611
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1612
    .line 1613
    .line 1614
    move-result-object v0

    .line 1615
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1616
    .line 1617
    .line 1618
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1619
    .line 1620
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1621
    .line 1622
    .line 1623
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1624
    .line 1625
    .line 1626
    iget v1, p0, Lcom/android/launcher3/h0;->J2:I

    .line 1627
    .line 1628
    int-to-float v1, v1

    .line 1629
    const-string v2, "allAppsIconSizePx"

    .line 1630
    .line 1631
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1632
    .line 1633
    .line 1634
    move-result-object v1

    .line 1635
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1636
    .line 1637
    .line 1638
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1639
    .line 1640
    .line 1641
    move-result-object v0

    .line 1642
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1643
    .line 1644
    .line 1645
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1646
    .line 1647
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1648
    .line 1649
    .line 1650
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1651
    .line 1652
    .line 1653
    const-string v1, "allAppsIconTextSizePx"

    .line 1654
    .line 1655
    iget v2, p0, Lcom/android/launcher3/h0;->N2:F

    .line 1656
    .line 1657
    invoke-direct {p0, v1, v2}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1658
    .line 1659
    .line 1660
    move-result-object v1

    .line 1661
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1662
    .line 1663
    .line 1664
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1665
    .line 1666
    .line 1667
    move-result-object v0

    .line 1668
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1669
    .line 1670
    .line 1671
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1672
    .line 1673
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1674
    .line 1675
    .line 1676
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1677
    .line 1678
    .line 1679
    iget v1, p0, Lcom/android/launcher3/h0;->K2:I

    .line 1680
    .line 1681
    int-to-float v1, v1

    .line 1682
    const-string v2, "allAppsIconDrawablePaddingPx"

    .line 1683
    .line 1684
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1685
    .line 1686
    .line 1687
    move-result-object v1

    .line 1688
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1689
    .line 1690
    .line 1691
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1692
    .line 1693
    .line 1694
    move-result-object v0

    .line 1695
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1696
    .line 1697
    .line 1698
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1699
    .line 1700
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1701
    .line 1702
    .line 1703
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1704
    .line 1705
    .line 1706
    iget v1, p0, Lcom/android/launcher3/h0;->H2:I

    .line 1707
    .line 1708
    int-to-float v1, v1

    .line 1709
    const-string v2, "allAppsCellHeightPx"

    .line 1710
    .line 1711
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1712
    .line 1713
    .line 1714
    move-result-object v1

    .line 1715
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1716
    .line 1717
    .line 1718
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1719
    .line 1720
    .line 1721
    move-result-object v0

    .line 1722
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1723
    .line 1724
    .line 1725
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1726
    .line 1727
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1728
    .line 1729
    .line 1730
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1731
    .line 1732
    .line 1733
    iget v1, p0, Lcom/android/launcher3/h0;->I2:I

    .line 1734
    .line 1735
    int-to-float v1, v1

    .line 1736
    const-string v2, "allAppsCellWidthPx"

    .line 1737
    .line 1738
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1739
    .line 1740
    .line 1741
    move-result-object v1

    .line 1742
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1743
    .line 1744
    .line 1745
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1746
    .line 1747
    .line 1748
    move-result-object v0

    .line 1749
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1750
    .line 1751
    .line 1752
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1753
    .line 1754
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1755
    .line 1756
    .line 1757
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1758
    .line 1759
    .line 1760
    iget-object v1, p0, Lcom/android/launcher3/h0;->C2:Landroid/graphics/Point;

    .line 1761
    .line 1762
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 1763
    .line 1764
    int-to-float v1, v1

    .line 1765
    const-string v2, "allAppsBorderSpacePxX"

    .line 1766
    .line 1767
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1768
    .line 1769
    .line 1770
    move-result-object v1

    .line 1771
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1772
    .line 1773
    .line 1774
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1775
    .line 1776
    .line 1777
    move-result-object v0

    .line 1778
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1779
    .line 1780
    .line 1781
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1782
    .line 1783
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1784
    .line 1785
    .line 1786
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1787
    .line 1788
    .line 1789
    iget-object v1, p0, Lcom/android/launcher3/h0;->C2:Landroid/graphics/Point;

    .line 1790
    .line 1791
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 1792
    .line 1793
    int-to-float v1, v1

    .line 1794
    const-string v2, "allAppsBorderSpacePxY"

    .line 1795
    .line 1796
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1797
    .line 1798
    .line 1799
    move-result-object v1

    .line 1800
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1801
    .line 1802
    .line 1803
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1804
    .line 1805
    .line 1806
    move-result-object v0

    .line 1807
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1808
    .line 1809
    .line 1810
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1811
    .line 1812
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1813
    .line 1814
    .line 1815
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1816
    .line 1817
    .line 1818
    const-string v1, "\tnumShownAllAppsColumns: "

    .line 1819
    .line 1820
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1821
    .line 1822
    .line 1823
    iget v1, p0, Lcom/android/launcher3/h0;->M2:I

    .line 1824
    .line 1825
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1826
    .line 1827
    .line 1828
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1829
    .line 1830
    .line 1831
    move-result-object v0

    .line 1832
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1833
    .line 1834
    .line 1835
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1836
    .line 1837
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1838
    .line 1839
    .line 1840
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1841
    .line 1842
    .line 1843
    iget-object v1, p0, Lcom/android/launcher3/h0;->E2:Landroid/graphics/Rect;

    .line 1844
    .line 1845
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 1846
    .line 1847
    int-to-float v1, v1

    .line 1848
    const-string v2, "allAppsPadding.top"

    .line 1849
    .line 1850
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1851
    .line 1852
    .line 1853
    move-result-object v1

    .line 1854
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1855
    .line 1856
    .line 1857
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1858
    .line 1859
    .line 1860
    move-result-object v0

    .line 1861
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1862
    .line 1863
    .line 1864
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1865
    .line 1866
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1867
    .line 1868
    .line 1869
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1870
    .line 1871
    .line 1872
    iget-object v1, p0, Lcom/android/launcher3/h0;->E2:Landroid/graphics/Rect;

    .line 1873
    .line 1874
    iget v1, v1, Landroid/graphics/Rect;->left:I

    .line 1875
    .line 1876
    int-to-float v1, v1

    .line 1877
    const-string v2, "allAppsPadding.left"

    .line 1878
    .line 1879
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1880
    .line 1881
    .line 1882
    move-result-object v1

    .line 1883
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1884
    .line 1885
    .line 1886
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1887
    .line 1888
    .line 1889
    move-result-object v0

    .line 1890
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1891
    .line 1892
    .line 1893
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1894
    .line 1895
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1896
    .line 1897
    .line 1898
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1899
    .line 1900
    .line 1901
    iget-object v1, p0, Lcom/android/launcher3/h0;->E2:Landroid/graphics/Rect;

    .line 1902
    .line 1903
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 1904
    .line 1905
    int-to-float v1, v1

    .line 1906
    const-string v2, "allAppsPadding.right"

    .line 1907
    .line 1908
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1909
    .line 1910
    .line 1911
    move-result-object v1

    .line 1912
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1913
    .line 1914
    .line 1915
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1916
    .line 1917
    .line 1918
    move-result-object v0

    .line 1919
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1920
    .line 1921
    .line 1922
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1923
    .line 1924
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1925
    .line 1926
    .line 1927
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1928
    .line 1929
    .line 1930
    iget v1, p0, Lcom/android/launcher3/h0;->L2:I

    .line 1931
    .line 1932
    int-to-float v1, v1

    .line 1933
    const-string v2, "allAppsLeftRightMargin"

    .line 1934
    .line 1935
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1936
    .line 1937
    .line 1938
    move-result-object v1

    .line 1939
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1940
    .line 1941
    .line 1942
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1943
    .line 1944
    .line 1945
    move-result-object v0

    .line 1946
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1947
    .line 1948
    .line 1949
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1950
    .line 1951
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1952
    .line 1953
    .line 1954
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1955
    .line 1956
    .line 1957
    iget v1, p0, Lcom/android/launcher3/h0;->f2:I

    .line 1958
    .line 1959
    int-to-float v1, v1

    .line 1960
    const-string v2, "hotseatBarSizePx"

    .line 1961
    .line 1962
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 1963
    .line 1964
    .line 1965
    move-result-object v1

    .line 1966
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1967
    .line 1968
    .line 1969
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1970
    .line 1971
    .line 1972
    move-result-object v0

    .line 1973
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1974
    .line 1975
    .line 1976
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1977
    .line 1978
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1979
    .line 1980
    .line 1981
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1982
    .line 1983
    .line 1984
    const-string v1, "\tmHotseatColumnSpan: "

    .line 1985
    .line 1986
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1987
    .line 1988
    .line 1989
    iget v1, p0, Lcom/android/launcher3/h0;->c2:I

    .line 1990
    .line 1991
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1992
    .line 1993
    .line 1994
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1995
    .line 1996
    .line 1997
    move-result-object v0

    .line 1998
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1999
    .line 2000
    .line 2001
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2002
    .line 2003
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2004
    .line 2005
    .line 2006
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2007
    .line 2008
    .line 2009
    iget v1, p0, Lcom/android/launcher3/h0;->d2:I

    .line 2010
    .line 2011
    int-to-float v1, v1

    .line 2012
    const-string v2, "mHotseatWidthPx"

    .line 2013
    .line 2014
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2015
    .line 2016
    .line 2017
    move-result-object v1

    .line 2018
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2019
    .line 2020
    .line 2021
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2022
    .line 2023
    .line 2024
    move-result-object v0

    .line 2025
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2026
    .line 2027
    .line 2028
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2029
    .line 2030
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2031
    .line 2032
    .line 2033
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2034
    .line 2035
    .line 2036
    iget v1, p0, Lcom/android/launcher3/h0;->b2:I

    .line 2037
    .line 2038
    int-to-float v1, v1

    .line 2039
    const-string v2, "hotseatCellHeightPx"

    .line 2040
    .line 2041
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2042
    .line 2043
    .line 2044
    move-result-object v1

    .line 2045
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2046
    .line 2047
    .line 2048
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2049
    .line 2050
    .line 2051
    move-result-object v0

    .line 2052
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2053
    .line 2054
    .line 2055
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2056
    .line 2057
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2058
    .line 2059
    .line 2060
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2061
    .line 2062
    .line 2063
    iget v1, p0, Lcom/android/launcher3/h0;->g2:I

    .line 2064
    .line 2065
    int-to-float v1, v1

    .line 2066
    const-string v2, "hotseatBarBottomSpacePx"

    .line 2067
    .line 2068
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2069
    .line 2070
    .line 2071
    move-result-object v1

    .line 2072
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2073
    .line 2074
    .line 2075
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2076
    .line 2077
    .line 2078
    move-result-object v0

    .line 2079
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2080
    .line 2081
    .line 2082
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2083
    .line 2084
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2085
    .line 2086
    .line 2087
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2088
    .line 2089
    .line 2090
    iget v1, p0, Lcom/android/launcher3/h0;->m2:I

    .line 2091
    .line 2092
    int-to-float v1, v1

    .line 2093
    const-string v2, "mHotseatBarEdgePaddingPx"

    .line 2094
    .line 2095
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2096
    .line 2097
    .line 2098
    move-result-object v1

    .line 2099
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2100
    .line 2101
    .line 2102
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2103
    .line 2104
    .line 2105
    move-result-object v0

    .line 2106
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2107
    .line 2108
    .line 2109
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2110
    .line 2111
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2112
    .line 2113
    .line 2114
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2115
    .line 2116
    .line 2117
    iget v1, p0, Lcom/android/launcher3/h0;->n2:I

    .line 2118
    .line 2119
    int-to-float v1, v1

    .line 2120
    const-string v2, "mHotseatBarWorkspaceSpacePx"

    .line 2121
    .line 2122
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2123
    .line 2124
    .line 2125
    move-result-object v1

    .line 2126
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2127
    .line 2128
    .line 2129
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2130
    .line 2131
    .line 2132
    move-result-object v0

    .line 2133
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2134
    .line 2135
    .line 2136
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2137
    .line 2138
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2139
    .line 2140
    .line 2141
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2142
    .line 2143
    .line 2144
    iget v1, p0, Lcom/android/launcher3/h0;->j2:I

    .line 2145
    .line 2146
    int-to-float v1, v1

    .line 2147
    const-string v2, "inlineNavButtonsEndSpacingPx"

    .line 2148
    .line 2149
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2150
    .line 2151
    .line 2152
    move-result-object v1

    .line 2153
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2154
    .line 2155
    .line 2156
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2157
    .line 2158
    .line 2159
    move-result-object v0

    .line 2160
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2161
    .line 2162
    .line 2163
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2164
    .line 2165
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2166
    .line 2167
    .line 2168
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2169
    .line 2170
    .line 2171
    iget v1, p0, Lcom/android/launcher3/h0;->k2:I

    .line 2172
    .line 2173
    int-to-float v1, v1

    .line 2174
    const-string v2, "navButtonsLayoutWidthPx"

    .line 2175
    .line 2176
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2177
    .line 2178
    .line 2179
    move-result-object v1

    .line 2180
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2181
    .line 2182
    .line 2183
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2184
    .line 2185
    .line 2186
    move-result-object v0

    .line 2187
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2188
    .line 2189
    .line 2190
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2191
    .line 2192
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2193
    .line 2194
    .line 2195
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2196
    .line 2197
    .line 2198
    iget v1, p0, Lcom/android/launcher3/h0;->h2:I

    .line 2199
    .line 2200
    int-to-float v1, v1

    .line 2201
    const-string v2, "hotseatBarEndOffset"

    .line 2202
    .line 2203
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2204
    .line 2205
    .line 2206
    move-result-object v1

    .line 2207
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2208
    .line 2209
    .line 2210
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2211
    .line 2212
    .line 2213
    move-result-object v0

    .line 2214
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2215
    .line 2216
    .line 2217
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2218
    .line 2219
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2220
    .line 2221
    .line 2222
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2223
    .line 2224
    .line 2225
    iget v1, p0, Lcom/android/launcher3/h0;->i2:I

    .line 2226
    .line 2227
    int-to-float v1, v1

    .line 2228
    const-string v2, "hotseatQsbSpace"

    .line 2229
    .line 2230
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2231
    .line 2232
    .line 2233
    move-result-object v1

    .line 2234
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2235
    .line 2236
    .line 2237
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2238
    .line 2239
    .line 2240
    move-result-object v0

    .line 2241
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2242
    .line 2243
    .line 2244
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2245
    .line 2246
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2247
    .line 2248
    .line 2249
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2250
    .line 2251
    .line 2252
    iget v1, p0, Lcom/android/launcher3/h0;->p2:I

    .line 2253
    .line 2254
    int-to-float v1, v1

    .line 2255
    const-string v2, "hotseatQsbHeight"

    .line 2256
    .line 2257
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2258
    .line 2259
    .line 2260
    move-result-object v1

    .line 2261
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2262
    .line 2263
    .line 2264
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2265
    .line 2266
    .line 2267
    move-result-object v0

    .line 2268
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2269
    .line 2270
    .line 2271
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2272
    .line 2273
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2274
    .line 2275
    .line 2276
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2277
    .line 2278
    .line 2279
    iget v1, p0, Lcom/android/launcher3/h0;->l2:I

    .line 2280
    .line 2281
    int-to-float v1, v1

    .line 2282
    const-string v2, "springLoadedHotseatBarTopMarginPx"

    .line 2283
    .line 2284
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2285
    .line 2286
    .line 2287
    move-result-object v1

    .line 2288
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2289
    .line 2290
    .line 2291
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2292
    .line 2293
    .line 2294
    move-result-object v0

    .line 2295
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2296
    .line 2297
    .line 2298
    invoke-virtual {p0, p1}, Lcom/android/launcher3/h0;->s0(Landroid/content/Context;)Landroid/graphics/Rect;

    .line 2299
    .line 2300
    .line 2301
    move-result-object v0

    .line 2302
    new-instance v1, Ljava/lang/StringBuilder;

    .line 2303
    .line 2304
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 2305
    .line 2306
    .line 2307
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2308
    .line 2309
    .line 2310
    iget v2, v0, Landroid/graphics/Rect;->top:I

    .line 2311
    .line 2312
    int-to-float v2, v2

    .line 2313
    const-string v3, "getHotseatLayoutPadding(context).top"

    .line 2314
    .line 2315
    invoke-direct {p0, v3, v2}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2316
    .line 2317
    .line 2318
    move-result-object v2

    .line 2319
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2320
    .line 2321
    .line 2322
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2323
    .line 2324
    .line 2325
    move-result-object v1

    .line 2326
    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2327
    .line 2328
    .line 2329
    new-instance v1, Ljava/lang/StringBuilder;

    .line 2330
    .line 2331
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 2332
    .line 2333
    .line 2334
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2335
    .line 2336
    .line 2337
    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 2338
    .line 2339
    int-to-float v2, v2

    .line 2340
    const-string v3, "getHotseatLayoutPadding(context).bottom"

    .line 2341
    .line 2342
    invoke-direct {p0, v3, v2}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2343
    .line 2344
    .line 2345
    move-result-object v2

    .line 2346
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2347
    .line 2348
    .line 2349
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2350
    .line 2351
    .line 2352
    move-result-object v1

    .line 2353
    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2354
    .line 2355
    .line 2356
    new-instance v1, Ljava/lang/StringBuilder;

    .line 2357
    .line 2358
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 2359
    .line 2360
    .line 2361
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2362
    .line 2363
    .line 2364
    iget v2, v0, Landroid/graphics/Rect;->left:I

    .line 2365
    .line 2366
    int-to-float v2, v2

    .line 2367
    const-string v3, "getHotseatLayoutPadding(context).left"

    .line 2368
    .line 2369
    invoke-direct {p0, v3, v2}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2370
    .line 2371
    .line 2372
    move-result-object v2

    .line 2373
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2374
    .line 2375
    .line 2376
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2377
    .line 2378
    .line 2379
    move-result-object v1

    .line 2380
    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2381
    .line 2382
    .line 2383
    new-instance v1, Ljava/lang/StringBuilder;

    .line 2384
    .line 2385
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 2386
    .line 2387
    .line 2388
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2389
    .line 2390
    .line 2391
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 2392
    .line 2393
    int-to-float v0, v0

    .line 2394
    const-string v2, "getHotseatLayoutPadding(context).right"

    .line 2395
    .line 2396
    invoke-direct {p0, v2, v0}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2397
    .line 2398
    .line 2399
    move-result-object v0

    .line 2400
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2401
    .line 2402
    .line 2403
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2404
    .line 2405
    .line 2406
    move-result-object v0

    .line 2407
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2408
    .line 2409
    .line 2410
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2411
    .line 2412
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2413
    .line 2414
    .line 2415
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2416
    .line 2417
    .line 2418
    const-string v1, "\tnumShownHotseatIcons: "

    .line 2419
    .line 2420
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2421
    .line 2422
    .line 2423
    iget v1, p0, Lcom/android/launcher3/h0;->a2:I

    .line 2424
    .line 2425
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 2426
    .line 2427
    .line 2428
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2429
    .line 2430
    .line 2431
    move-result-object v0

    .line 2432
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2433
    .line 2434
    .line 2435
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2436
    .line 2437
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2438
    .line 2439
    .line 2440
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2441
    .line 2442
    .line 2443
    iget v1, p0, Lcom/android/launcher3/h0;->s2:I

    .line 2444
    .line 2445
    int-to-float v1, v1

    .line 2446
    const-string v2, "hotseatBorderSpace"

    .line 2447
    .line 2448
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2449
    .line 2450
    .line 2451
    move-result-object v1

    .line 2452
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2453
    .line 2454
    .line 2455
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2456
    .line 2457
    .line 2458
    move-result-object v0

    .line 2459
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2460
    .line 2461
    .line 2462
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2463
    .line 2464
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2465
    .line 2466
    .line 2467
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2468
    .line 2469
    .line 2470
    const-string v1, "\tisQsbInline: "

    .line 2471
    .line 2472
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2473
    .line 2474
    .line 2475
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->M0:Z

    .line 2476
    .line 2477
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 2478
    .line 2479
    .line 2480
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2481
    .line 2482
    .line 2483
    move-result-object v0

    .line 2484
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2485
    .line 2486
    .line 2487
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2488
    .line 2489
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2490
    .line 2491
    .line 2492
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2493
    .line 2494
    .line 2495
    iget v1, p0, Lcom/android/launcher3/h0;->o2:I

    .line 2496
    .line 2497
    int-to-float v1, v1

    .line 2498
    const-string v2, "hotseatQsbWidth"

    .line 2499
    .line 2500
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2501
    .line 2502
    .line 2503
    move-result-object v1

    .line 2504
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2505
    .line 2506
    .line 2507
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2508
    .line 2509
    .line 2510
    move-result-object v0

    .line 2511
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2512
    .line 2513
    .line 2514
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2515
    .line 2516
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2517
    .line 2518
    .line 2519
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2520
    .line 2521
    .line 2522
    const-string v1, "\tisTaskbarPresent:"

    .line 2523
    .line 2524
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2525
    .line 2526
    .line 2527
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->p3:Z

    .line 2528
    .line 2529
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 2530
    .line 2531
    .line 2532
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2533
    .line 2534
    .line 2535
    move-result-object v0

    .line 2536
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2537
    .line 2538
    .line 2539
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2540
    .line 2541
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2542
    .line 2543
    .line 2544
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2545
    .line 2546
    .line 2547
    const-string v1, "\tisTaskbarPresentInApps:"

    .line 2548
    .line 2549
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2550
    .line 2551
    .line 2552
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->q3:Z

    .line 2553
    .line 2554
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 2555
    .line 2556
    .line 2557
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2558
    .line 2559
    .line 2560
    move-result-object v0

    .line 2561
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2562
    .line 2563
    .line 2564
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2565
    .line 2566
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2567
    .line 2568
    .line 2569
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2570
    .line 2571
    .line 2572
    iget v1, p0, Lcom/android/launcher3/h0;->r3:I

    .line 2573
    .line 2574
    int-to-float v1, v1

    .line 2575
    const-string v2, "taskbarHeight"

    .line 2576
    .line 2577
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2578
    .line 2579
    .line 2580
    move-result-object v1

    .line 2581
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2582
    .line 2583
    .line 2584
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2585
    .line 2586
    .line 2587
    move-result-object v0

    .line 2588
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2589
    .line 2590
    .line 2591
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2592
    .line 2593
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2594
    .line 2595
    .line 2596
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2597
    .line 2598
    .line 2599
    iget v1, p0, Lcom/android/launcher3/h0;->s3:I

    .line 2600
    .line 2601
    int-to-float v1, v1

    .line 2602
    const-string v2, "stashedTaskbarHeight"

    .line 2603
    .line 2604
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2605
    .line 2606
    .line 2607
    move-result-object v1

    .line 2608
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2609
    .line 2610
    .line 2611
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2612
    .line 2613
    .line 2614
    move-result-object v0

    .line 2615
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2616
    .line 2617
    .line 2618
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2619
    .line 2620
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2621
    .line 2622
    .line 2623
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2624
    .line 2625
    .line 2626
    iget v1, p0, Lcom/android/launcher3/h0;->t3:I

    .line 2627
    .line 2628
    int-to-float v1, v1

    .line 2629
    const-string v2, "taskbarBottomMargin"

    .line 2630
    .line 2631
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2632
    .line 2633
    .line 2634
    move-result-object v1

    .line 2635
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2636
    .line 2637
    .line 2638
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2639
    .line 2640
    .line 2641
    move-result-object v0

    .line 2642
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2643
    .line 2644
    .line 2645
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2646
    .line 2647
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2648
    .line 2649
    .line 2650
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2651
    .line 2652
    .line 2653
    iget v1, p0, Lcom/android/launcher3/h0;->u3:I

    .line 2654
    .line 2655
    int-to-float v1, v1

    .line 2656
    const-string v2, "taskbarIconSize"

    .line 2657
    .line 2658
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2659
    .line 2660
    .line 2661
    move-result-object v1

    .line 2662
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2663
    .line 2664
    .line 2665
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2666
    .line 2667
    .line 2668
    move-result-object v0

    .line 2669
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2670
    .line 2671
    .line 2672
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2673
    .line 2674
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2675
    .line 2676
    .line 2677
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2678
    .line 2679
    .line 2680
    iget v1, p0, Lcom/android/launcher3/h0;->m1:I

    .line 2681
    .line 2682
    int-to-float v1, v1

    .line 2683
    const-string v2, "desiredWorkspaceHorizontalMarginPx"

    .line 2684
    .line 2685
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2686
    .line 2687
    .line 2688
    move-result-object v1

    .line 2689
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2690
    .line 2691
    .line 2692
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2693
    .line 2694
    .line 2695
    move-result-object v0

    .line 2696
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2697
    .line 2698
    .line 2699
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2700
    .line 2701
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2702
    .line 2703
    .line 2704
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2705
    .line 2706
    .line 2707
    iget-object v1, p0, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 2708
    .line 2709
    iget v1, v1, Landroid/graphics/Rect;->left:I

    .line 2710
    .line 2711
    int-to-float v1, v1

    .line 2712
    const-string v2, "workspacePadding.left"

    .line 2713
    .line 2714
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2715
    .line 2716
    .line 2717
    move-result-object v1

    .line 2718
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2719
    .line 2720
    .line 2721
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2722
    .line 2723
    .line 2724
    move-result-object v0

    .line 2725
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2726
    .line 2727
    .line 2728
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2729
    .line 2730
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2731
    .line 2732
    .line 2733
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2734
    .line 2735
    .line 2736
    iget-object v1, p0, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 2737
    .line 2738
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 2739
    .line 2740
    int-to-float v1, v1

    .line 2741
    const-string v2, "workspacePadding.top"

    .line 2742
    .line 2743
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2744
    .line 2745
    .line 2746
    move-result-object v1

    .line 2747
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2748
    .line 2749
    .line 2750
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2751
    .line 2752
    .line 2753
    move-result-object v0

    .line 2754
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2755
    .line 2756
    .line 2757
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2758
    .line 2759
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2760
    .line 2761
    .line 2762
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2763
    .line 2764
    .line 2765
    iget-object v1, p0, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 2766
    .line 2767
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 2768
    .line 2769
    int-to-float v1, v1

    .line 2770
    const-string v2, "workspacePadding.right"

    .line 2771
    .line 2772
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2773
    .line 2774
    .line 2775
    move-result-object v1

    .line 2776
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2777
    .line 2778
    .line 2779
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2780
    .line 2781
    .line 2782
    move-result-object v0

    .line 2783
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2784
    .line 2785
    .line 2786
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2787
    .line 2788
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2789
    .line 2790
    .line 2791
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2792
    .line 2793
    .line 2794
    iget-object v1, p0, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 2795
    .line 2796
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 2797
    .line 2798
    int-to-float v1, v1

    .line 2799
    const-string v2, "workspacePadding.bottom"

    .line 2800
    .line 2801
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2802
    .line 2803
    .line 2804
    move-result-object v1

    .line 2805
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2806
    .line 2807
    .line 2808
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2809
    .line 2810
    .line 2811
    move-result-object v0

    .line 2812
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2813
    .line 2814
    .line 2815
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2816
    .line 2817
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2818
    .line 2819
    .line 2820
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2821
    .line 2822
    .line 2823
    const-string v1, "iconScale"

    .line 2824
    .line 2825
    iget v2, p0, Lcom/android/launcher3/h0;->A1:F

    .line 2826
    .line 2827
    invoke-direct {p0, v1, v2}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2828
    .line 2829
    .line 2830
    move-result-object v1

    .line 2831
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2832
    .line 2833
    .line 2834
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2835
    .line 2836
    .line 2837
    move-result-object v0

    .line 2838
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2839
    .line 2840
    .line 2841
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2842
    .line 2843
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2844
    .line 2845
    .line 2846
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2847
    .line 2848
    .line 2849
    const-string v1, "cellScaleToFit "

    .line 2850
    .line 2851
    iget v2, p0, Lcom/android/launcher3/h0;->G1:F

    .line 2852
    .line 2853
    invoke-direct {p0, v1, v2}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2854
    .line 2855
    .line 2856
    move-result-object v1

    .line 2857
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2858
    .line 2859
    .line 2860
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2861
    .line 2862
    .line 2863
    move-result-object v0

    .line 2864
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2865
    .line 2866
    .line 2867
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2868
    .line 2869
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2870
    .line 2871
    .line 2872
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2873
    .line 2874
    .line 2875
    iget v1, p0, Lcom/android/launcher3/h0;->u1:I

    .line 2876
    .line 2877
    int-to-float v1, v1

    .line 2878
    const-string v2, "extraSpace"

    .line 2879
    .line 2880
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2881
    .line 2882
    .line 2883
    move-result-object v1

    .line 2884
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2885
    .line 2886
    .line 2887
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2888
    .line 2889
    .line 2890
    move-result-object v0

    .line 2891
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2892
    .line 2893
    .line 2894
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2895
    .line 2896
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2897
    .line 2898
    .line 2899
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2900
    .line 2901
    .line 2902
    iget v1, p0, Lcom/android/launcher3/h0;->u1:I

    .line 2903
    .line 2904
    int-to-float v1, v1

    .line 2905
    iget v2, p0, Lcom/android/launcher3/h0;->A1:F

    .line 2906
    .line 2907
    div-float/2addr v1, v2

    .line 2908
    const-string v2, "unscaled extraSpace"

    .line 2909
    .line 2910
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2911
    .line 2912
    .line 2913
    move-result-object v1

    .line 2914
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2915
    .line 2916
    .line 2917
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2918
    .line 2919
    .line 2920
    move-result-object v0

    .line 2921
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2922
    .line 2923
    .line 2924
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2925
    .line 2926
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2927
    .line 2928
    .line 2929
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2930
    .line 2931
    .line 2932
    iget v1, p0, Lcom/android/launcher3/h0;->v1:I

    .line 2933
    .line 2934
    int-to-float v1, v1

    .line 2935
    const-string v2, "maxEmptySpace"

    .line 2936
    .line 2937
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2938
    .line 2939
    .line 2940
    move-result-object v1

    .line 2941
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2942
    .line 2943
    .line 2944
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2945
    .line 2946
    .line 2947
    move-result-object v0

    .line 2948
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2949
    .line 2950
    .line 2951
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2952
    .line 2953
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2954
    .line 2955
    .line 2956
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2957
    .line 2958
    .line 2959
    iget v1, p0, Lcom/android/launcher3/h0;->w1:I

    .line 2960
    .line 2961
    int-to-float v1, v1

    .line 2962
    const-string v2, "workspaceTopPadding"

    .line 2963
    .line 2964
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2965
    .line 2966
    .line 2967
    move-result-object v1

    .line 2968
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2969
    .line 2970
    .line 2971
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2972
    .line 2973
    .line 2974
    move-result-object v0

    .line 2975
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2976
    .line 2977
    .line 2978
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2979
    .line 2980
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2981
    .line 2982
    .line 2983
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2984
    .line 2985
    .line 2986
    iget v1, p0, Lcom/android/launcher3/h0;->x1:I

    .line 2987
    .line 2988
    int-to-float v1, v1

    .line 2989
    const-string v2, "workspaceBottomPadding"

    .line 2990
    .line 2991
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 2992
    .line 2993
    .line 2994
    move-result-object v1

    .line 2995
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2996
    .line 2997
    .line 2998
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2999
    .line 3000
    .line 3001
    move-result-object v0

    .line 3002
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3003
    .line 3004
    .line 3005
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3006
    .line 3007
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3008
    .line 3009
    .line 3010
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3011
    .line 3012
    .line 3013
    iget v1, p0, Lcom/android/launcher3/h0;->O2:I

    .line 3014
    .line 3015
    int-to-float v1, v1

    .line 3016
    const-string v2, "overviewTaskMarginPx"

    .line 3017
    .line 3018
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 3019
    .line 3020
    .line 3021
    move-result-object v1

    .line 3022
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3023
    .line 3024
    .line 3025
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3026
    .line 3027
    .line 3028
    move-result-object v0

    .line 3029
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3030
    .line 3031
    .line 3032
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3033
    .line 3034
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3035
    .line 3036
    .line 3037
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3038
    .line 3039
    .line 3040
    iget v1, p0, Lcom/android/launcher3/h0;->P2:I

    .line 3041
    .line 3042
    int-to-float v1, v1

    .line 3043
    const-string v2, "overviewTaskIconSizePx"

    .line 3044
    .line 3045
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 3046
    .line 3047
    .line 3048
    move-result-object v1

    .line 3049
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3050
    .line 3051
    .line 3052
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3053
    .line 3054
    .line 3055
    move-result-object v0

    .line 3056
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3057
    .line 3058
    .line 3059
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3060
    .line 3061
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3062
    .line 3063
    .line 3064
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3065
    .line 3066
    .line 3067
    iget v1, p0, Lcom/android/launcher3/h0;->Q2:I

    .line 3068
    .line 3069
    int-to-float v1, v1

    .line 3070
    const-string v2, "overviewTaskIconDrawableSizePx"

    .line 3071
    .line 3072
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 3073
    .line 3074
    .line 3075
    move-result-object v1

    .line 3076
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3077
    .line 3078
    .line 3079
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3080
    .line 3081
    .line 3082
    move-result-object v0

    .line 3083
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3084
    .line 3085
    .line 3086
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3087
    .line 3088
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3089
    .line 3090
    .line 3091
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3092
    .line 3093
    .line 3094
    iget v1, p0, Lcom/android/launcher3/h0;->R2:I

    .line 3095
    .line 3096
    int-to-float v1, v1

    .line 3097
    const-string v2, "overviewTaskIconDrawableSizeGridPx"

    .line 3098
    .line 3099
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 3100
    .line 3101
    .line 3102
    move-result-object v1

    .line 3103
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3104
    .line 3105
    .line 3106
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3107
    .line 3108
    .line 3109
    move-result-object v0

    .line 3110
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3111
    .line 3112
    .line 3113
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3114
    .line 3115
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3116
    .line 3117
    .line 3118
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3119
    .line 3120
    .line 3121
    iget v1, p0, Lcom/android/launcher3/h0;->S2:I

    .line 3122
    .line 3123
    int-to-float v1, v1

    .line 3124
    const-string v2, "overviewTaskThumbnailTopMarginPx"

    .line 3125
    .line 3126
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 3127
    .line 3128
    .line 3129
    move-result-object v1

    .line 3130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3131
    .line 3132
    .line 3133
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3134
    .line 3135
    .line 3136
    move-result-object v0

    .line 3137
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3138
    .line 3139
    .line 3140
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3141
    .line 3142
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3143
    .line 3144
    .line 3145
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3146
    .line 3147
    .line 3148
    iget v1, p0, Lcom/android/launcher3/h0;->U2:I

    .line 3149
    .line 3150
    int-to-float v1, v1

    .line 3151
    const-string v2, "overviewActionsTopMarginPx"

    .line 3152
    .line 3153
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 3154
    .line 3155
    .line 3156
    move-result-object v1

    .line 3157
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3158
    .line 3159
    .line 3160
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3161
    .line 3162
    .line 3163
    move-result-object v0

    .line 3164
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3165
    .line 3166
    .line 3167
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3168
    .line 3169
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3170
    .line 3171
    .line 3172
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3173
    .line 3174
    .line 3175
    iget v1, p0, Lcom/android/launcher3/h0;->T2:I

    .line 3176
    .line 3177
    int-to-float v1, v1

    .line 3178
    const-string v2, "overviewActionsHeight"

    .line 3179
    .line 3180
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 3181
    .line 3182
    .line 3183
    move-result-object v1

    .line 3184
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3185
    .line 3186
    .line 3187
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3188
    .line 3189
    .line 3190
    move-result-object v0

    .line 3191
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3192
    .line 3193
    .line 3194
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3195
    .line 3196
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3197
    .line 3198
    .line 3199
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3200
    .line 3201
    .line 3202
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->F0()I

    .line 3203
    .line 3204
    .line 3205
    move-result v1

    .line 3206
    int-to-float v1, v1

    .line 3207
    const-string v2, "overviewActionsClaimedSpaceBelow"

    .line 3208
    .line 3209
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 3210
    .line 3211
    .line 3212
    move-result-object v1

    .line 3213
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3214
    .line 3215
    .line 3216
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3217
    .line 3218
    .line 3219
    move-result-object v0

    .line 3220
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3221
    .line 3222
    .line 3223
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3224
    .line 3225
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3226
    .line 3227
    .line 3228
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3229
    .line 3230
    .line 3231
    iget v1, p0, Lcom/android/launcher3/h0;->V2:I

    .line 3232
    .line 3233
    int-to-float v1, v1

    .line 3234
    const-string v2, "overviewActionsButtonSpacing"

    .line 3235
    .line 3236
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 3237
    .line 3238
    .line 3239
    move-result-object v1

    .line 3240
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3241
    .line 3242
    .line 3243
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3244
    .line 3245
    .line 3246
    move-result-object v0

    .line 3247
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3248
    .line 3249
    .line 3250
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3251
    .line 3252
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3253
    .line 3254
    .line 3255
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3256
    .line 3257
    .line 3258
    iget v1, p0, Lcom/android/launcher3/h0;->W2:I

    .line 3259
    .line 3260
    int-to-float v1, v1

    .line 3261
    const-string v2, "overviewPageSpacing"

    .line 3262
    .line 3263
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 3264
    .line 3265
    .line 3266
    move-result-object v1

    .line 3267
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3268
    .line 3269
    .line 3270
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3271
    .line 3272
    .line 3273
    move-result-object v0

    .line 3274
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3275
    .line 3276
    .line 3277
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3278
    .line 3279
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3280
    .line 3281
    .line 3282
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3283
    .line 3284
    .line 3285
    iget v1, p0, Lcom/android/launcher3/h0;->X2:I

    .line 3286
    .line 3287
    int-to-float v1, v1

    .line 3288
    const-string v2, "overviewRowSpacing"

    .line 3289
    .line 3290
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 3291
    .line 3292
    .line 3293
    move-result-object v1

    .line 3294
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3295
    .line 3296
    .line 3297
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3298
    .line 3299
    .line 3300
    move-result-object v0

    .line 3301
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3302
    .line 3303
    .line 3304
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3305
    .line 3306
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3307
    .line 3308
    .line 3309
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3310
    .line 3311
    .line 3312
    iget v1, p0, Lcom/android/launcher3/h0;->Y2:I

    .line 3313
    .line 3314
    int-to-float v1, v1

    .line 3315
    const-string v2, "overviewGridSideMargin"

    .line 3316
    .line 3317
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 3318
    .line 3319
    .line 3320
    move-result-object v1

    .line 3321
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3322
    .line 3323
    .line 3324
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3325
    .line 3326
    .line 3327
    move-result-object v0

    .line 3328
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3329
    .line 3330
    .line 3331
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3332
    .line 3333
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3334
    .line 3335
    .line 3336
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3337
    .line 3338
    .line 3339
    iget v1, p0, Lcom/android/launcher3/h0;->c3:I

    .line 3340
    .line 3341
    int-to-float v1, v1

    .line 3342
    const-string v2, "dropTargetBarTopMarginPx"

    .line 3343
    .line 3344
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 3345
    .line 3346
    .line 3347
    move-result-object v1

    .line 3348
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3349
    .line 3350
    .line 3351
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3352
    .line 3353
    .line 3354
    move-result-object v0

    .line 3355
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3356
    .line 3357
    .line 3358
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3359
    .line 3360
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3361
    .line 3362
    .line 3363
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3364
    .line 3365
    .line 3366
    iget v1, p0, Lcom/android/launcher3/h0;->b3:I

    .line 3367
    .line 3368
    int-to-float v1, v1

    .line 3369
    const-string v2, "dropTargetBarSizePx"

    .line 3370
    .line 3371
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 3372
    .line 3373
    .line 3374
    move-result-object v1

    .line 3375
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3376
    .line 3377
    .line 3378
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3379
    .line 3380
    .line 3381
    move-result-object v0

    .line 3382
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3383
    .line 3384
    .line 3385
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3386
    .line 3387
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3388
    .line 3389
    .line 3390
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3391
    .line 3392
    .line 3393
    iget v1, p0, Lcom/android/launcher3/h0;->d3:I

    .line 3394
    .line 3395
    int-to-float v1, v1

    .line 3396
    const-string v2, "dropTargetBarBottomMarginPx"

    .line 3397
    .line 3398
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 3399
    .line 3400
    .line 3401
    move-result-object v1

    .line 3402
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3403
    .line 3404
    .line 3405
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3406
    .line 3407
    .line 3408
    move-result-object v0

    .line 3409
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3410
    .line 3411
    .line 3412
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3413
    .line 3414
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3415
    .line 3416
    .line 3417
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3418
    .line 3419
    .line 3420
    const-string v1, "getCellLayoutSpringLoadShrunkTop()"

    .line 3421
    .line 3422
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->h0()F

    .line 3423
    .line 3424
    .line 3425
    move-result v2

    .line 3426
    invoke-direct {p0, v1, v2}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 3427
    .line 3428
    .line 3429
    move-result-object v1

    .line 3430
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3431
    .line 3432
    .line 3433
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3434
    .line 3435
    .line 3436
    move-result-object v0

    .line 3437
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3438
    .line 3439
    .line 3440
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3441
    .line 3442
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3443
    .line 3444
    .line 3445
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3446
    .line 3447
    .line 3448
    const-string v1, "getCellLayoutSpringLoadShrunkBottom()"

    .line 3449
    .line 3450
    invoke-virtual {p0, p1}, Lcom/android/launcher3/h0;->g0(Landroid/content/Context;)F

    .line 3451
    .line 3452
    .line 3453
    move-result v2

    .line 3454
    invoke-direct {p0, v1, v2}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 3455
    .line 3456
    .line 3457
    move-result-object v1

    .line 3458
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3459
    .line 3460
    .line 3461
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3462
    .line 3463
    .line 3464
    move-result-object v0

    .line 3465
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3466
    .line 3467
    .line 3468
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3469
    .line 3470
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3471
    .line 3472
    .line 3473
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3474
    .line 3475
    .line 3476
    iget v1, p0, Lcom/android/launcher3/h0;->t1:I

    .line 3477
    .line 3478
    int-to-float v1, v1

    .line 3479
    const-string v2, "workspaceSpringLoadedMinNextPageVisiblePx"

    .line 3480
    .line 3481
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 3482
    .line 3483
    .line 3484
    move-result-object v1

    .line 3485
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3486
    .line 3487
    .line 3488
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3489
    .line 3490
    .line 3491
    move-result-object v0

    .line 3492
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3493
    .line 3494
    .line 3495
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3496
    .line 3497
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3498
    .line 3499
    .line 3500
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3501
    .line 3502
    .line 3503
    const-string v1, "getWorkspaceSpringLoadScale()"

    .line 3504
    .line 3505
    invoke-virtual {p0, p1}, Lcom/android/launcher3/h0;->N0(Landroid/content/Context;)F

    .line 3506
    .line 3507
    .line 3508
    move-result p1

    .line 3509
    invoke-direct {p0, v1, p1}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 3510
    .line 3511
    .line 3512
    move-result-object p1

    .line 3513
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3514
    .line 3515
    .line 3516
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3517
    .line 3518
    .line 3519
    move-result-object p1

    .line 3520
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3521
    .line 3522
    .line 3523
    new-instance p1, Ljava/lang/StringBuilder;

    .line 3524
    .line 3525
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 3526
    .line 3527
    .line 3528
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3529
    .line 3530
    .line 3531
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->e0()I

    .line 3532
    .line 3533
    .line 3534
    move-result v0

    .line 3535
    int-to-float v0, v0

    .line 3536
    const-string v1, "getCellLayoutHeight()"

    .line 3537
    .line 3538
    invoke-direct {p0, v1, v0}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 3539
    .line 3540
    .line 3541
    move-result-object v0

    .line 3542
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3543
    .line 3544
    .line 3545
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3546
    .line 3547
    .line 3548
    move-result-object p1

    .line 3549
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3550
    .line 3551
    .line 3552
    new-instance p1, Ljava/lang/StringBuilder;

    .line 3553
    .line 3554
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 3555
    .line 3556
    .line 3557
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3558
    .line 3559
    .line 3560
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->i0()I

    .line 3561
    .line 3562
    .line 3563
    move-result v0

    .line 3564
    int-to-float v0, v0

    .line 3565
    const-string v1, "getCellLayoutWidth()"

    .line 3566
    .line 3567
    invoke-direct {p0, v1, v0}, Lcom/android/launcher3/h0;->U0(Ljava/lang/String;F)Ljava/lang/String;

    .line 3568
    .line 3569
    .line 3570
    move-result-object v0

    .line 3571
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3572
    .line 3573
    .line 3574
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3575
    .line 3576
    .line 3577
    move-result-object p1

    .line 3578
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3579
    .line 3580
    .line 3581
    iget-boolean p1, p0, Lcom/android/launcher3/h0;->b1:Z

    .line 3582
    .line 3583
    if-eqz p1, :cond_0

    .line 3584
    .line 3585
    new-instance p1, Ljava/lang/StringBuilder;

    .line 3586
    .line 3587
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 3588
    .line 3589
    .line 3590
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3591
    .line 3592
    .line 3593
    const-string v0, "\tmResponsiveWorkspaceHeightSpec:"

    .line 3594
    .line 3595
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3596
    .line 3597
    .line 3598
    iget-object v0, p0, Lcom/android/launcher3/h0;->d1:LH1/c;

    .line 3599
    .line 3600
    invoke-virtual {v0}, LH1/c;->toString()Ljava/lang/String;

    .line 3601
    .line 3602
    .line 3603
    move-result-object v0

    .line 3604
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3605
    .line 3606
    .line 3607
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3608
    .line 3609
    .line 3610
    move-result-object p1

    .line 3611
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3612
    .line 3613
    .line 3614
    new-instance p1, Ljava/lang/StringBuilder;

    .line 3615
    .line 3616
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 3617
    .line 3618
    .line 3619
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3620
    .line 3621
    .line 3622
    const-string v0, "\tmResponsiveWorkspaceWidthSpec:"

    .line 3623
    .line 3624
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3625
    .line 3626
    .line 3627
    iget-object v0, p0, Lcom/android/launcher3/h0;->c1:LH1/c;

    .line 3628
    .line 3629
    invoke-virtual {v0}, LH1/c;->toString()Ljava/lang/String;

    .line 3630
    .line 3631
    .line 3632
    move-result-object v0

    .line 3633
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3634
    .line 3635
    .line 3636
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3637
    .line 3638
    .line 3639
    move-result-object p1

    .line 3640
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3641
    .line 3642
    .line 3643
    new-instance p1, Ljava/lang/StringBuilder;

    .line 3644
    .line 3645
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 3646
    .line 3647
    .line 3648
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3649
    .line 3650
    .line 3651
    const-string v0, "\tmResponsiveAllAppsHeightSpec:"

    .line 3652
    .line 3653
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3654
    .line 3655
    .line 3656
    iget-object v0, p0, Lcom/android/launcher3/h0;->f1:LH1/c;

    .line 3657
    .line 3658
    invoke-virtual {v0}, LH1/c;->toString()Ljava/lang/String;

    .line 3659
    .line 3660
    .line 3661
    move-result-object v0

    .line 3662
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3663
    .line 3664
    .line 3665
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3666
    .line 3667
    .line 3668
    move-result-object p1

    .line 3669
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3670
    .line 3671
    .line 3672
    new-instance p1, Ljava/lang/StringBuilder;

    .line 3673
    .line 3674
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 3675
    .line 3676
    .line 3677
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3678
    .line 3679
    .line 3680
    const-string v0, "\tmResponsiveAllAppsWidthSpec:"

    .line 3681
    .line 3682
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3683
    .line 3684
    .line 3685
    iget-object v0, p0, Lcom/android/launcher3/h0;->e1:LH1/c;

    .line 3686
    .line 3687
    invoke-virtual {v0}, LH1/c;->toString()Ljava/lang/String;

    .line 3688
    .line 3689
    .line 3690
    move-result-object v0

    .line 3691
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3692
    .line 3693
    .line 3694
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3695
    .line 3696
    .line 3697
    move-result-object p1

    .line 3698
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3699
    .line 3700
    .line 3701
    new-instance p1, Ljava/lang/StringBuilder;

    .line 3702
    .line 3703
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 3704
    .line 3705
    .line 3706
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3707
    .line 3708
    .line 3709
    const-string v0, "\tmResponsiveFolderHeightSpec:"

    .line 3710
    .line 3711
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3712
    .line 3713
    .line 3714
    iget-object v0, p0, Lcom/android/launcher3/h0;->h1:LH1/c;

    .line 3715
    .line 3716
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 3717
    .line 3718
    .line 3719
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3720
    .line 3721
    .line 3722
    move-result-object p1

    .line 3723
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3724
    .line 3725
    .line 3726
    new-instance p1, Ljava/lang/StringBuilder;

    .line 3727
    .line 3728
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 3729
    .line 3730
    .line 3731
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3732
    .line 3733
    .line 3734
    const-string v0, "\tmResponsiveFolderWidthSpec:"

    .line 3735
    .line 3736
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3737
    .line 3738
    .line 3739
    iget-object v0, p0, Lcom/android/launcher3/h0;->g1:LH1/c;

    .line 3740
    .line 3741
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 3742
    .line 3743
    .line 3744
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3745
    .line 3746
    .line 3747
    move-result-object p1

    .line 3748
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3749
    .line 3750
    .line 3751
    new-instance p1, Ljava/lang/StringBuilder;

    .line 3752
    .line 3753
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 3754
    .line 3755
    .line 3756
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3757
    .line 3758
    .line 3759
    const-string v0, "\tmResponsiveHotseatSpec:"

    .line 3760
    .line 3761
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3762
    .line 3763
    .line 3764
    iget-object v0, p0, Lcom/android/launcher3/h0;->i1:LH1/b;

    .line 3765
    .line 3766
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 3767
    .line 3768
    .line 3769
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3770
    .line 3771
    .line 3772
    move-result-object p1

    .line 3773
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3774
    .line 3775
    .line 3776
    new-instance p1, Ljava/lang/StringBuilder;

    .line 3777
    .line 3778
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 3779
    .line 3780
    .line 3781
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3782
    .line 3783
    .line 3784
    const-string v0, "\tmResponsiveWorkspaceCellSpec:"

    .line 3785
    .line 3786
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3787
    .line 3788
    .line 3789
    iget-object v0, p0, Lcom/android/launcher3/h0;->j1:LH1/a;

    .line 3790
    .line 3791
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 3792
    .line 3793
    .line 3794
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3795
    .line 3796
    .line 3797
    move-result-object p1

    .line 3798
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3799
    .line 3800
    .line 3801
    new-instance p1, Ljava/lang/StringBuilder;

    .line 3802
    .line 3803
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 3804
    .line 3805
    .line 3806
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3807
    .line 3808
    .line 3809
    const-string p2, "\tmResponsiveAllAppsCellSpec:"

    .line 3810
    .line 3811
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3812
    .line 3813
    .line 3814
    iget-object p0, p0, Lcom/android/launcher3/h0;->k1:LH1/a;

    .line 3815
    .line 3816
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 3817
    .line 3818
    .line 3819
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3820
    .line 3821
    .line 3822
    move-result-object p0

    .line 3823
    invoke-virtual {p3, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3824
    .line 3825
    .line 3826
    :cond_0
    return-void
.end method

.method public V()Landroid/graphics/Rect;
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->T0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Landroid/graphics/Rect;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 10
    .line 11
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 12
    .line 13
    iget v3, p0, Lcom/android/launcher3/h0;->b3:I

    .line 14
    .line 15
    add-int/2addr v3, v2

    .line 16
    iget v4, p0, Lcom/android/launcher3/h0;->r1:I

    .line 17
    .line 18
    add-int/2addr v3, v4

    .line 19
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 20
    .line 21
    iget v5, p0, Lcom/android/launcher3/h0;->V0:I

    .line 22
    .line 23
    add-int/2addr v2, v5

    .line 24
    iget v5, p0, Lcom/android/launcher3/h0;->f2:I

    .line 25
    .line 26
    sub-int/2addr v2, v5

    .line 27
    sub-int/2addr v2, v4

    .line 28
    iget p0, p0, Lcom/android/launcher3/h0;->W0:I

    .line 29
    .line 30
    add-int/2addr p0, v1

    .line 31
    invoke-direct {v0, v3, v1, v2, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 32
    .line 33
    .line 34
    return-object v0

    .line 35
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->p3:Z

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget v0, p0, Lcom/android/launcher3/h0;->r3:I

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iget v0, p0, Lcom/android/launcher3/h0;->f2:I

    .line 43
    .line 44
    :goto_0
    new-instance v1, Landroid/graphics/Rect;

    .line 45
    .line 46
    iget-object v2, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 47
    .line 48
    iget v3, v2, Landroid/graphics/Rect;->left:I

    .line 49
    .line 50
    iget v4, p0, Lcom/android/launcher3/h0;->r1:I

    .line 51
    .line 52
    add-int v5, v3, v4

    .line 53
    .line 54
    iget v2, v2, Landroid/graphics/Rect;->top:I

    .line 55
    .line 56
    iget v6, p0, Lcom/android/launcher3/h0;->b3:I

    .line 57
    .line 58
    add-int/2addr v6, v2

    .line 59
    add-int/2addr v6, v4

    .line 60
    iget v7, p0, Lcom/android/launcher3/h0;->V0:I

    .line 61
    .line 62
    add-int/2addr v3, v7

    .line 63
    sub-int/2addr v3, v4

    .line 64
    iget v7, p0, Lcom/android/launcher3/h0;->W0:I

    .line 65
    .line 66
    add-int/2addr v2, v7

    .line 67
    sub-int/2addr v2, v0

    .line 68
    iget p0, p0, Lcom/android/launcher3/h0;->y1:I

    .line 69
    .line 70
    sub-int/2addr v2, p0

    .line 71
    sub-int/2addr v2, v4

    .line 72
    invoke-direct {v1, v5, v6, v3, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 73
    .line 74
    .line 75
    return-object v1
.end method

.method public V0()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->Z0:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_3

    .line 6
    .line 7
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 8
    .line 9
    iget v0, v0, Lcom/android/launcher3/F1;->H0:I

    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/android/launcher3/h0;->o1(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->H0()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 19
    .line 20
    iget v2, v1, Lcom/android/launcher3/F1;->H0:I

    .line 21
    .line 22
    mul-int/2addr v0, v2

    .line 23
    iget-boolean v2, p0, Lcom/android/launcher3/h0;->K0:Z

    .line 24
    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    iget v1, v1, Lcom/android/launcher3/F1;->e1:I

    .line 28
    .line 29
    invoke-direct {p0, v1}, Lcom/android/launcher3/h0;->o1(I)V

    .line 30
    .line 31
    .line 32
    :goto_0
    iget v1, p0, Lcom/android/launcher3/h0;->s2:I

    .line 33
    .line 34
    iget v2, p0, Lcom/android/launcher3/h0;->t2:I

    .line 35
    .line 36
    if-ge v1, v2, :cond_1

    .line 37
    .line 38
    iget v1, p0, Lcom/android/launcher3/h0;->c2:I

    .line 39
    .line 40
    if-ge v1, v0, :cond_1

    .line 41
    .line 42
    add-int/lit8 v1, v1, 0x2

    .line 43
    .line 44
    invoke-direct {p0, v1}, Lcom/android/launcher3/h0;->o1(I)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->M0:Z

    .line 49
    .line 50
    const/4 v2, 0x1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    invoke-direct {p0, v0}, Lcom/android/launcher3/h0;->w0(I)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iget v1, p0, Lcom/android/launcher3/h0;->u2:I

    .line 58
    .line 59
    iget v3, p0, Lcom/android/launcher3/h0;->s2:I

    .line 60
    .line 61
    add-int/2addr v1, v3

    .line 62
    iget v3, p0, Lcom/android/launcher3/h0;->d2:I

    .line 63
    .line 64
    :goto_1
    add-int/2addr v1, v3

    .line 65
    if-le v1, v0, :cond_2

    .line 66
    .line 67
    iget v1, p0, Lcom/android/launcher3/h0;->c2:I

    .line 68
    .line 69
    if-le v1, v2, :cond_2

    .line 70
    .line 71
    add-int/lit8 v1, v1, -0x1

    .line 72
    .line 73
    invoke-direct {p0, v1}, Lcom/android/launcher3/h0;->o1(I)V

    .line 74
    .line 75
    .line 76
    iget v1, p0, Lcom/android/launcher3/h0;->u2:I

    .line 77
    .line 78
    iget v3, p0, Lcom/android/launcher3/h0;->s2:I

    .line 79
    .line 80
    add-int/2addr v1, v3

    .line 81
    iget v3, p0, Lcom/android/launcher3/h0;->d2:I

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    iget v0, p0, Lcom/android/launcher3/h0;->s2:I

    .line 85
    .line 86
    invoke-direct {p0, v0}, Lcom/android/launcher3/h0;->R(I)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    iput v0, p0, Lcom/android/launcher3/h0;->o2:I

    .line 91
    .line 92
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->e2:Z

    .line 93
    .line 94
    if-nez v1, :cond_3

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_3
    iget v1, p0, Lcom/android/launcher3/h0;->j2:I

    .line 98
    .line 99
    iget v3, p0, Lcom/android/launcher3/h0;->V0:I

    .line 100
    .line 101
    sub-int/2addr v3, v1

    .line 102
    iget v1, p0, Lcom/android/launcher3/h0;->h2:I

    .line 103
    .line 104
    sub-int/2addr v3, v1

    .line 105
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->M0:Z

    .line 106
    .line 107
    const/4 v4, 0x0

    .line 108
    if-eqz v1, :cond_4

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_4
    move v0, v4

    .line 112
    :goto_2
    sub-int v0, v3, v0

    .line 113
    .line 114
    int-to-float v0, v0

    .line 115
    add-int/2addr v1, v2

    .line 116
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/h0;->Q(FI)I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    iput v0, p0, Lcom/android/launcher3/h0;->s2:I

    .line 121
    .line 122
    iget v1, p0, Lcom/android/launcher3/h0;->t2:I

    .line 123
    .line 124
    if-lt v0, v1, :cond_5

    .line 125
    .line 126
    goto :goto_3

    .line 127
    :cond_5
    iput v1, p0, Lcom/android/launcher3/h0;->s2:I

    .line 128
    .line 129
    invoke-direct {p0}, Lcom/android/launcher3/h0;->t0()I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->M0:Z

    .line 134
    .line 135
    if-eqz v1, :cond_7

    .line 136
    .line 137
    iget v5, p0, Lcom/android/launcher3/h0;->o2:I

    .line 138
    .line 139
    sub-int/2addr v0, v3

    .line 140
    sub-int/2addr v5, v0

    .line 141
    iput v5, p0, Lcom/android/launcher3/h0;->o2:I

    .line 142
    .line 143
    iget v0, p0, Lcom/android/launcher3/h0;->u2:I

    .line 144
    .line 145
    if-lt v5, v0, :cond_6

    .line 146
    .line 147
    goto :goto_3

    .line 148
    :cond_6
    iput v0, p0, Lcom/android/launcher3/h0;->o2:I

    .line 149
    .line 150
    :cond_7
    if-eqz v1, :cond_8

    .line 151
    .line 152
    iget v4, p0, Lcom/android/launcher3/h0;->o2:I

    .line 153
    .line 154
    :cond_8
    sub-int/2addr v3, v4

    .line 155
    :cond_9
    iget v0, p0, Lcom/android/launcher3/h0;->a2:I

    .line 156
    .line 157
    sub-int/2addr v0, v2

    .line 158
    iput v0, p0, Lcom/android/launcher3/h0;->a2:I

    .line 159
    .line 160
    int-to-float v0, v3

    .line 161
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->M0:Z

    .line 162
    .line 163
    add-int/2addr v1, v2

    .line 164
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/h0;->Q(FI)I

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    iput v0, p0, Lcom/android/launcher3/h0;->s2:I

    .line 169
    .line 170
    iget v1, p0, Lcom/android/launcher3/h0;->t2:I

    .line 171
    .line 172
    if-ge v0, v1, :cond_a

    .line 173
    .line 174
    iget v0, p0, Lcom/android/launcher3/h0;->a2:I

    .line 175
    .line 176
    if-gt v0, v2, :cond_9

    .line 177
    .line 178
    :cond_a
    :goto_3
    return-void
.end method

.method public X(Landroid/content/Context;)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->T0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 8
    .line 9
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 10
    .line 11
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 12
    .line 13
    :goto_0
    add-int/2addr v1, v0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/h0;->E2:Landroid/graphics/Rect;

    .line 16
    .line 17
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 18
    .line 19
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 20
    .line 21
    add-int/2addr v1, v0

    .line 22
    iget v0, p0, Lcom/android/launcher3/h0;->L2:I

    .line 23
    .line 24
    mul-int/lit8 v0, v0, 0x2

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :goto_1
    iget v0, p0, Lcom/android/launcher3/h0;->V0:I

    .line 28
    .line 29
    sub-int/2addr v0, v1

    .line 30
    const/4 v1, 0x0

    .line 31
    iget v2, p0, Lcom/android/launcher3/h0;->M2:I

    .line 32
    .line 33
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/h0;->P(III)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iget v1, p0, Lcom/android/launcher3/h0;->J2:I

    .line 38
    .line 39
    invoke-direct {p0, v1}, Lcom/android/launcher3/h0;->x0(I)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    sub-int/2addr v0, v1

    .line 44
    div-int/lit8 v0, v0, 0x2

    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-static {p1}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_1

    .line 55
    .line 56
    iget-object p0, p0, Lcom/android/launcher3/h0;->E2:Landroid/graphics/Rect;

    .line 57
    .line 58
    iget p0, p0, Landroid/graphics/Rect;->right:I

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/h0;->E2:Landroid/graphics/Rect;

    .line 62
    .line 63
    iget p0, p0, Landroid/graphics/Rect;->left:I

    .line 64
    .line 65
    :goto_2
    add-int/2addr p0, v0

    .line 66
    return p0
.end method

.method public X0(Landroid/content/Context;Z)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->b1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/h0;->a1(Landroid/content/Context;Z)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public Y(Lcom/android/launcher3/model/data/y;)Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/h0;->a3:Lcom/android/launcher3/h0$b;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/android/launcher3/h0$b;->a(Lcom/android/launcher3/model/data/y;)Landroid/graphics/PointF;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Y0(Landroid/content/Context;)Z
    .locals 0

    .line 1
    invoke-static {}, LH2/c;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-boolean p0, p0, Lcom/android/launcher3/util/C1;->g:Z

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public Z()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->b1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget v0, p0, Lcom/android/launcher3/h0;->f2:I

    .line 8
    .line 9
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->M0:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget v1, p0, Lcom/android/launcher3/h0;->q2:I

    .line 16
    .line 17
    :goto_0
    sub-int/2addr v0, v1

    .line 18
    iget v1, p0, Lcom/android/launcher3/h0;->i2:I

    .line 19
    .line 20
    sub-int/2addr v0, v1

    .line 21
    iget v1, p0, Lcom/android/launcher3/h0;->b2:I

    .line 22
    .line 23
    div-int/lit8 v2, v1, 0x2

    .line 24
    .line 25
    sub-int/2addr v0, v2

    .line 26
    iget p0, p0, Lcom/android/launcher3/h0;->B1:I

    .line 27
    .line 28
    sub-int/2addr v1, p0

    .line 29
    div-int/lit8 v1, v1, 0x2

    .line 30
    .line 31
    add-int/2addr v0, v1

    .line 32
    return v0

    .line 33
    :cond_1
    iget v0, p0, Lcom/android/launcher3/h0;->f2:I

    .line 34
    .line 35
    iget p0, p0, Lcom/android/launcher3/h0;->q2:I

    .line 36
    .line 37
    div-int/lit8 p0, p0, 0x2

    .line 38
    .line 39
    sub-int/2addr v0, p0

    .line 40
    return v0
.end method

.method public Z0(Landroid/content/Context;)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->M0:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/h0;->s0(Landroid/content/Context;)Landroid/graphics/Rect;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget v0, p1, Landroid/graphics/Rect;->left:I

    .line 12
    .line 13
    iget p1, p1, Landroid/graphics/Rect;->right:I

    .line 14
    .line 15
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iget p0, p0, Lcom/android/launcher3/h0;->w2:I

    .line 20
    .line 21
    if-gt p1, p0, :cond_1

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    return v1
.end method

.method public a0(I)I
    .locals 0

    .line 1
    invoke-super {p0, p0}, Lcom/android/launcher3/X3;->f(Lcom/android/launcher3/h0;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public a1(Landroid/content/Context;Z)Z
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/h0;->Z0(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

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

.method public b0()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->k0()Landroid/graphics/Point;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Landroid/graphics/Point;->x:I

    .line 6
    .line 7
    iget p0, p0, Lcom/android/launcher3/h0;->B1:I

    .line 8
    .line 9
    sub-int/2addr v0, p0

    .line 10
    return v0
.end method

.method public b1()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->M0:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->P0:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public c1()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->b1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    return p0
.end method

.method public d1()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->T0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public e0()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->P0:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 6
    .line 7
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->M:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget v0, p0, Lcom/android/launcher3/h0;->W0:I

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->K0()Landroid/graphics/Point;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 28
    .line 29
    sub-int/2addr v0, v1

    .line 30
    iget-object p0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 31
    .line 32
    iget p0, p0, Lcom/android/launcher3/r4;->R:I

    .line 33
    .line 34
    :goto_0
    add-int/2addr v0, p0

    .line 35
    return v0

    .line 36
    :cond_0
    iget v0, p0, Lcom/android/launcher3/h0;->W0:I

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->K0()Landroid/graphics/Point;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 43
    .line 44
    sub-int/2addr v0, v1

    .line 45
    iget-object p0, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 46
    .line 47
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 48
    .line 49
    goto :goto_0
.end method

.method public e1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->G0:Z

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Lcom/android/launcher3/y0;->c()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public f1(Landroid/content/Context;)Lcom/android/launcher3/h0$a;
    .locals 6

    .line 1
    new-instance v0, Lcom/android/launcher3/util/p3;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/h0;->T0:I

    .line 4
    .line 5
    iget v2, p0, Lcom/android/launcher3/h0;->U0:I

    .line 6
    .line 7
    iget v3, p0, Lcom/android/launcher3/h0;->V0:I

    .line 8
    .line 9
    iget v4, p0, Lcom/android/launcher3/h0;->W0:I

    .line 10
    .line 11
    iget v5, p0, Lcom/android/launcher3/h0;->X0:I

    .line 12
    .line 13
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/util/p3;-><init>(IIIII)V

    .line 14
    .line 15
    .line 16
    iget-object v1, v0, Lcom/android/launcher3/util/p3;->a:Landroid/graphics/Rect;

    .line 17
    .line 18
    iget v2, p0, Lcom/android/launcher3/h0;->R0:I

    .line 19
    .line 20
    iget v3, p0, Lcom/android/launcher3/h0;->S0:I

    .line 21
    .line 22
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 23
    .line 24
    .line 25
    iget-object v1, v0, Lcom/android/launcher3/util/p3;->b:Landroid/graphics/Rect;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 30
    .line 31
    .line 32
    new-instance v1, Landroid/util/SparseArray;

    .line 33
    .line 34
    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    .line 35
    .line 36
    .line 37
    iget v2, p0, Lcom/android/launcher3/h0;->B1:I

    .line 38
    .line 39
    iget-object v3, p0, Lcom/android/launcher3/h0;->n3:Ls1/m;

    .line 40
    .line 41
    invoke-virtual {v1, v2, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    iget v2, p0, Lcom/android/launcher3/h0;->J2:I

    .line 45
    .line 46
    iget-object v3, p0, Lcom/android/launcher3/h0;->o3:Ls1/m;

    .line 47
    .line 48
    invoke-virtual {v1, v2, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    iget-object v2, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 52
    .line 53
    iget-object v3, p0, Lcom/android/launcher3/h0;->D0:Lcom/android/launcher3/util/Z$c;

    .line 54
    .line 55
    invoke-virtual {v2, p1, v3}, Lcom/android/launcher3/F1;->J0(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;)Lcom/android/launcher3/h0$a;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1, v0}, Lcom/android/launcher3/h0$a;->i(Lcom/android/launcher3/util/p3;)Lcom/android/launcher3/h0$a;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->J0:Z

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Lcom/android/launcher3/h0$a;->d(Z)Lcom/android/launcher3/h0$a;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->O0:Z

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Lcom/android/launcher3/h0$a;->f(Z)Lcom/android/launcher3/h0$a;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1, v1}, Lcom/android/launcher3/h0$a;->b(Landroid/util/SparseArray;)Lcom/android/launcher3/h0$a;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->P0:Z

    .line 80
    .line 81
    invoke-virtual {p1, p0}, Lcom/android/launcher3/h0$a;->c(Z)Lcom/android/launcher3/h0$a;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0
.end method

.method public g0(Landroid/content/Context;)F
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/h0;->f2:I

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/h0;->l2:I

    .line 4
    .line 5
    add-int/2addr v0, v1

    .line 6
    iget v1, p0, Lcom/android/launcher3/h0;->U0:I

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->T0()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    invoke-direct {p0, p1}, Lcom/android/launcher3/h0;->L0(Landroid/content/Context;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    :cond_0
    sub-int/2addr v1, v0

    .line 19
    int-to-float p0, v1

    .line 20
    return p0
.end method

.method public g1()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "isTablet:"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->G0:Z

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", isMultiDisplay:"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->J0:Z

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, ", widthPx:"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget v1, p0, Lcom/android/launcher3/h0;->T0:I

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v1, ", heightPx:"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget v1, p0, Lcom/android/launcher3/h0;->U0:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v1, ", insets:"

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v1, ", rotationHint:"

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget p0, p0, Lcom/android/launcher3/h0;->X0:I

    .line 62
    .line 63
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method

.method public h0()F
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 2
    .line 3
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 4
    .line 5
    iget v1, p0, Lcom/android/launcher3/h0;->c3:I

    .line 6
    .line 7
    add-int/2addr v0, v1

    .line 8
    iget v1, p0, Lcom/android/launcher3/h0;->b3:I

    .line 9
    .line 10
    add-int/2addr v0, v1

    .line 11
    iget p0, p0, Lcom/android/launcher3/h0;->d3:I

    .line 12
    .line 13
    add-int/2addr v0, p0

    .line 14
    int-to-float p0, v0

    .line 15
    return p0
.end method

.method public i0()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/h0;->V0:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->K0()Landroid/graphics/Point;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 8
    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->H0()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    div-int/2addr v0, p0

    .line 15
    return v0
.end method

.method public k0()Landroid/graphics/Point;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/h0;->l0(Landroid/graphics/Point;)Landroid/graphics/Point;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public k1(Landroid/content/Context;)I
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->Z0:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->b1:Z

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->T0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    move v0, v2

    .line 18
    goto :goto_0

    .line 19
    :cond_1
    move v0, v1

    .line 20
    :goto_0
    iput-boolean v0, p0, Lcom/android/launcher3/h0;->F1:Z

    .line 21
    .line 22
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->b1:Z

    .line 23
    .line 24
    const/high16 v3, 0x3f800000    # 1.0f

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/h0;->j1:LH1/a;

    .line 29
    .line 30
    invoke-virtual {v0}, LH1/a;->b()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput v0, p0, Lcom/android/launcher3/h0;->B1:I

    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/launcher3/h0;->j1:LH1/a;

    .line 37
    .line 38
    invoke-virtual {v0}, LH1/a;->c()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/android/launcher3/h0;->C1:I

    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/launcher3/h0;->j1:LH1/a;

    .line 45
    .line 46
    invoke-virtual {v0}, LH1/a;->a()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput v0, p0, Lcom/android/launcher3/h0;->E1:I

    .line 51
    .line 52
    invoke-virtual {p0, v3, p1}, Lcom/android/launcher3/h0;->p1(FLandroid/content/Context;)V

    .line 53
    .line 54
    .line 55
    invoke-direct {p0}, Lcom/android/launcher3/h0;->r1()V

    .line 56
    .line 57
    .line 58
    return v1

    .line 59
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 60
    .line 61
    iget-object v4, v0, Lcom/android/launcher3/F1;->L0:[F

    .line 62
    .line 63
    iget v5, p0, Lcom/android/launcher3/h0;->a1:I

    .line 64
    .line 65
    aget v4, v4, v5

    .line 66
    .line 67
    iget-object v0, v0, Lcom/android/launcher3/F1;->M0:[F

    .line 68
    .line 69
    aget v0, v0, v5

    .line 70
    .line 71
    iget-object v5, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 72
    .line 73
    invoke-static {v4, v5}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    iput v4, p0, Lcom/android/launcher3/h0;->B1:I

    .line 82
    .line 83
    iget-object v4, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 84
    .line 85
    invoke-static {v0, v4}, Lcom/android/launcher3/N5;->U(FLandroid/util/DisplayMetrics;)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    iput v0, p0, Lcom/android/launcher3/h0;->C1:I

    .line 90
    .line 91
    invoke-virtual {p0, v3, p1}, Lcom/android/launcher3/h0;->p1(FLandroid/content/Context;)V

    .line 92
    .line 93
    .line 94
    invoke-direct {p0}, Lcom/android/launcher3/h0;->r1()V

    .line 95
    .line 96
    .line 97
    invoke-direct {p0}, Lcom/android/launcher3/h0;->f0()I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    int-to-float v0, v0

    .line 102
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->e0()I

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    int-to-float v5, v4

    .line 107
    sub-float v6, v5, v0

    .line 108
    .line 109
    const/4 v7, 0x0

    .line 110
    invoke-static {v7, v6}, Ljava/lang/Math;->max(FF)F

    .line 111
    .line 112
    .line 113
    move-result v6

    .line 114
    div-float/2addr v5, v0

    .line 115
    cmpg-float v0, v5, v3

    .line 116
    .line 117
    if-ltz v0, :cond_4

    .line 118
    .line 119
    iget-object v0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 120
    .line 121
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->M:Z

    .line 122
    .line 123
    if-eqz v0, :cond_3

    .line 124
    .line 125
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-eqz v0, :cond_3

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_3
    move v0, v1

    .line 137
    goto :goto_2

    .line 138
    :cond_4
    :goto_1
    move v0, v2

    .line 139
    :goto_2
    iget-boolean v7, p0, Lcom/android/launcher3/h0;->Z0:Z

    .line 140
    .line 141
    if-eqz v7, :cond_5

    .line 142
    .line 143
    invoke-direct {p0}, Lcom/android/launcher3/h0;->j0()I

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    iget v3, p0, Lcom/android/launcher3/h0;->m1:I

    .line 148
    .line 149
    mul-int/lit8 v3, v3, 0x2

    .line 150
    .line 151
    add-int/2addr v0, v3

    .line 152
    int-to-float v0, v0

    .line 153
    iget v3, p0, Lcom/android/launcher3/h0;->V0:I

    .line 154
    .line 155
    int-to-float v3, v3

    .line 156
    div-float/2addr v3, v0

    .line 157
    goto :goto_3

    .line 158
    :cond_5
    move v2, v0

    .line 159
    :goto_3
    if-eqz v2, :cond_7

    .line 160
    .line 161
    iget-object v0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 162
    .line 163
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->M:Z

    .line 164
    .line 165
    if-eqz v0, :cond_6

    .line 166
    .line 167
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    if-eqz v0, :cond_6

    .line 176
    .line 177
    goto :goto_4

    .line 178
    :cond_6
    invoke-static {v3, v5}, Ljava/lang/Math;->min(FF)F

    .line 179
    .line 180
    .line 181
    move-result v5

    .line 182
    :goto_4
    invoke-virtual {p0, v5, p1}, Lcom/android/launcher3/h0;->p1(FLandroid/content/Context;)V

    .line 183
    .line 184
    .line 185
    invoke-direct {p0}, Lcom/android/launcher3/h0;->f0()I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    sub-int/2addr v4, v0

    .line 190
    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    int-to-float v6, v0

    .line 195
    :cond_7
    invoke-super {p0, p0, p1}, Lcom/android/launcher3/X3;->G(Lcom/android/launcher3/h0;Landroid/content/Context;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    invoke-super {p0, p0, p1}, Lcom/android/launcher3/X3;->H(Lcom/android/launcher3/h0;Landroid/content/res/Resources;)V

    .line 203
    .line 204
    .line 205
    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    .line 206
    .line 207
    .line 208
    move-result p0

    .line 209
    return p0
.end method

.method public l0(Landroid/graphics/Point;)Landroid/graphics/Point;
    .locals 3

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
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->i0()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Lcom/android/launcher3/h0;->q1:Landroid/graphics/Rect;

    .line 13
    .line 14
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 15
    .line 16
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 17
    .line 18
    add-int/2addr v2, v1

    .line 19
    sub-int/2addr v0, v2

    .line 20
    iget-object v1, p0, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 21
    .line 22
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 23
    .line 24
    iget-object v2, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 25
    .line 26
    iget v2, v2, Lcom/android/launcher3/F1;->H0:I

    .line 27
    .line 28
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/h0;->P(III)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p1, Landroid/graphics/Point;->x:I

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->e0()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget-object v1, p0, Lcom/android/launcher3/h0;->q1:Landroid/graphics/Rect;

    .line 39
    .line 40
    iget v2, v1, Landroid/graphics/Rect;->top:I

    .line 41
    .line 42
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 43
    .line 44
    add-int/2addr v2, v1

    .line 45
    sub-int/2addr v0, v2

    .line 46
    iget-object v1, p0, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 47
    .line 48
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 49
    .line 50
    iget-object p0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 51
    .line 52
    iget p0, p0, Lcom/android/launcher3/F1;->G0:I

    .line 53
    .line 54
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/h0;->O(III)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    iput p0, p1, Landroid/graphics/Point;->y:I

    .line 59
    .line 60
    return-object p1
.end method

.method public n0()Lcom/android/launcher3/util/Z$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/h0;->D0:Lcom/android/launcher3/util/Z$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public p0(Landroid/content/Context;)F
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->c1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/h0;->Z0(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget p1, p0, Lcom/android/launcher3/h0;->B1:I

    .line 15
    .line 16
    iget v0, p0, Lcom/android/launcher3/h0;->a2:I

    .line 17
    .line 18
    mul-int v1, p1, v0

    .line 19
    .line 20
    iget p0, p0, Lcom/android/launcher3/h0;->s2:I

    .line 21
    .line 22
    add-int/lit8 v2, v0, -0x1

    .line 23
    .line 24
    mul-int/2addr p0, v2

    .line 25
    add-int/2addr v1, p0

    .line 26
    mul-int/lit8 p0, p1, 0x2

    .line 27
    .line 28
    sub-int/2addr v1, p0

    .line 29
    mul-int/2addr p1, v0

    .line 30
    sub-int/2addr v1, p1

    .line 31
    int-to-float p0, v1

    .line 32
    add-int/lit8 v0, v0, -0x1

    .line 33
    .line 34
    int-to-float p1, v0

    .line 35
    div-float/2addr p0, p1

    .line 36
    return p0

    .line 37
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public p1(FLandroid/content/Context;)V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->M:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    move v0, p1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 20
    .line 21
    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    :goto_0
    iput v0, p0, Lcom/android/launcher3/h0;->A1:F

    .line 26
    .line 27
    iput p1, p0, Lcom/android/launcher3/h0;->G1:F

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->T0()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iget-object v1, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 34
    .line 35
    invoke-direct {p0, v1, p1}, Lcom/android/launcher3/h0;->d0(Lcom/android/launcher3/F1;F)Landroid/graphics/Point;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, p0, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 40
    .line 41
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-super {p0, p0, v1, p1}, Lcom/android/launcher3/X3;->I(Lcom/android/launcher3/h0;Landroid/content/res/Resources;F)V

    .line 46
    .line 47
    .line 48
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->b1:Z

    .line 49
    .line 50
    const/4 v2, 0x0

    .line 51
    if-eqz v1, :cond_4

    .line 52
    .line 53
    iget-object v1, p0, Lcom/android/launcher3/h0;->c1:LH1/c;

    .line 54
    .line 55
    invoke-virtual {v1}, LH1/c;->b()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    iput v1, p0, Lcom/android/launcher3/h0;->H1:I

    .line 60
    .line 61
    iget-object v1, p0, Lcom/android/launcher3/h0;->d1:LH1/c;

    .line 62
    .line 63
    invoke-virtual {v1}, LH1/c;->b()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    iput v1, p0, Lcom/android/launcher3/h0;->I1:I

    .line 68
    .line 69
    iget v1, p0, Lcom/android/launcher3/h0;->H1:I

    .line 70
    .line 71
    iget v3, p0, Lcom/android/launcher3/h0;->B1:I

    .line 72
    .line 73
    if-ge v1, v3, :cond_1

    .line 74
    .line 75
    iget-object v3, p0, Lcom/android/launcher3/h0;->F0:Lcom/android/launcher3/util/w0;

    .line 76
    .line 77
    invoke-virtual {v3, v1}, Lcom/android/launcher3/util/w0;->a(I)I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    iput v1, p0, Lcom/android/launcher3/h0;->B1:I

    .line 82
    .line 83
    :cond_1
    if-eqz v0, :cond_2

    .line 84
    .line 85
    iput v2, p0, Lcom/android/launcher3/h0;->D1:I

    .line 86
    .line 87
    iput v2, p0, Lcom/android/launcher3/h0;->C1:I

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_2
    invoke-direct {p0}, Lcom/android/launcher3/h0;->C0()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    iput v1, p0, Lcom/android/launcher3/h0;->D1:I

    .line 95
    .line 96
    :goto_1
    new-instance v1, Lcom/android/launcher3/util/D;

    .line 97
    .line 98
    iget v3, p0, Lcom/android/launcher3/h0;->B1:I

    .line 99
    .line 100
    iget v4, p0, Lcom/android/launcher3/h0;->D1:I

    .line 101
    .line 102
    iget v5, p0, Lcom/android/launcher3/h0;->C1:I

    .line 103
    .line 104
    invoke-direct {v1, v3, v4, v5}, Lcom/android/launcher3/util/D;-><init>(III)V

    .line 105
    .line 106
    .line 107
    iget v3, p0, Lcom/android/launcher3/h0;->I1:I

    .line 108
    .line 109
    iget-object v4, p0, Lcom/android/launcher3/h0;->F0:Lcom/android/launcher3/util/w0;

    .line 110
    .line 111
    invoke-virtual {v1, v3, v4}, Lcom/android/launcher3/util/D;->e(ILcom/android/launcher3/util/w0;)I

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    invoke-virtual {v1}, Lcom/android/launcher3/util/D;->c()I

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    iput v4, p0, Lcom/android/launcher3/h0;->B1:I

    .line 120
    .line 121
    invoke-virtual {v1}, Lcom/android/launcher3/util/D;->b()I

    .line 122
    .line 123
    .line 124
    move-result v4

    .line 125
    iput v4, p0, Lcom/android/launcher3/h0;->D1:I

    .line 126
    .line 127
    invoke-virtual {v1}, Lcom/android/launcher3/util/D;->d()I

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    iput v1, p0, Lcom/android/launcher3/h0;->C1:I

    .line 132
    .line 133
    if-eqz v0, :cond_3

    .line 134
    .line 135
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->k0()Landroid/graphics/Point;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 140
    .line 141
    iget v3, p0, Lcom/android/launcher3/h0;->B1:I

    .line 142
    .line 143
    invoke-direct {p0, v3}, Lcom/android/launcher3/h0;->v0(I)I

    .line 144
    .line 145
    .line 146
    move-result v3

    .line 147
    sub-int/2addr v1, v3

    .line 148
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    div-int/lit8 v1, v1, 0x2

    .line 153
    .line 154
    iput v1, p0, Lcom/android/launcher3/h0;->K1:I

    .line 155
    .line 156
    goto/16 :goto_5

    .line 157
    .line 158
    :cond_3
    iget v1, p0, Lcom/android/launcher3/h0;->I1:I

    .line 159
    .line 160
    sub-int/2addr v1, v3

    .line 161
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    div-int/lit8 v1, v1, 0x2

    .line 166
    .line 167
    iput v1, p0, Lcom/android/launcher3/h0;->K1:I

    .line 168
    .line 169
    goto/16 :goto_5

    .line 170
    .line 171
    :cond_4
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->Z0:Z

    .line 172
    .line 173
    if-eqz v1, :cond_a

    .line 174
    .line 175
    invoke-direct {p0}, Lcom/android/launcher3/h0;->C0()I

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    int-to-float v1, v1

    .line 180
    iget v3, p0, Lcom/android/launcher3/h0;->A1:F

    .line 181
    .line 182
    mul-float/2addr v1, v3

    .line 183
    float-to-int v1, v1

    .line 184
    iput v1, p0, Lcom/android/launcher3/h0;->D1:I

    .line 185
    .line 186
    iget-object v1, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 187
    .line 188
    iget-object v1, v1, Lcom/android/launcher3/F1;->R0:[Landroid/graphics/PointF;

    .line 189
    .line 190
    iget v3, p0, Lcom/android/launcher3/h0;->a1:I

    .line 191
    .line 192
    aget-object v1, v1, v3

    .line 193
    .line 194
    iget v1, v1, Landroid/graphics/PointF;->x:F

    .line 195
    .line 196
    iget-object v3, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 197
    .line 198
    invoke-static {v1, v3, p1}, Lc2/a;->f(FLandroid/util/DisplayMetrics;F)I

    .line 199
    .line 200
    .line 201
    move-result v1

    .line 202
    iput v1, p0, Lcom/android/launcher3/h0;->H1:I

    .line 203
    .line 204
    iget-object v1, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 205
    .line 206
    iget-object v1, v1, Lcom/android/launcher3/F1;->R0:[Landroid/graphics/PointF;

    .line 207
    .line 208
    iget v3, p0, Lcom/android/launcher3/h0;->a1:I

    .line 209
    .line 210
    aget-object v1, v1, v3

    .line 211
    .line 212
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 213
    .line 214
    iget-object v3, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 215
    .line 216
    invoke-static {v1, v3, p1}, Lc2/a;->f(FLandroid/util/DisplayMetrics;F)I

    .line 217
    .line 218
    .line 219
    move-result v1

    .line 220
    iput v1, p0, Lcom/android/launcher3/h0;->I1:I

    .line 221
    .line 222
    iget v1, p0, Lcom/android/launcher3/h0;->H1:I

    .line 223
    .line 224
    iget v3, p0, Lcom/android/launcher3/h0;->B1:I

    .line 225
    .line 226
    if-ge v1, v3, :cond_6

    .line 227
    .line 228
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->H0()I

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    iget-object v3, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 233
    .line 234
    iget v3, v3, Lcom/android/launcher3/F1;->H0:I

    .line 235
    .line 236
    mul-int/2addr v1, v3

    .line 237
    add-int/lit8 v3, v1, -0x1

    .line 238
    .line 239
    iget v4, p0, Lcom/android/launcher3/h0;->B1:I

    .line 240
    .line 241
    iget v5, p0, Lcom/android/launcher3/h0;->H1:I

    .line 242
    .line 243
    sub-int v6, v4, v5

    .line 244
    .line 245
    mul-int/2addr v6, v1

    .line 246
    iget-object v7, p0, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 247
    .line 248
    iget v8, v7, Landroid/graphics/Point;->x:I

    .line 249
    .line 250
    mul-int v9, v8, v3

    .line 251
    .line 252
    if-lt v9, v6, :cond_5

    .line 253
    .line 254
    iput v4, p0, Lcom/android/launcher3/h0;->H1:I

    .line 255
    .line 256
    div-int/2addr v6, v3

    .line 257
    sub-int/2addr v8, v6

    .line 258
    iput v8, v7, Landroid/graphics/Point;->x:I

    .line 259
    .line 260
    goto :goto_2

    .line 261
    :cond_5
    mul-int/2addr v5, v1

    .line 262
    mul-int/2addr v8, v3

    .line 263
    add-int/2addr v5, v8

    .line 264
    div-int/2addr v5, v1

    .line 265
    iput v5, p0, Lcom/android/launcher3/h0;->H1:I

    .line 266
    .line 267
    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    .line 268
    .line 269
    .line 270
    move-result v1

    .line 271
    iput v1, p0, Lcom/android/launcher3/h0;->B1:I

    .line 272
    .line 273
    iget-object v1, p0, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 274
    .line 275
    iput v2, v1, Landroid/graphics/Point;->x:I

    .line 276
    .line 277
    :cond_6
    :goto_2
    iget v1, p0, Lcom/android/launcher3/h0;->D1:I

    .line 278
    .line 279
    iget v3, p0, Lcom/android/launcher3/h0;->C1:I

    .line 280
    .line 281
    int-to-float v3, v3

    .line 282
    invoke-static {v3}, Lcom/android/launcher3/N5;->f(F)I

    .line 283
    .line 284
    .line 285
    move-result v3

    .line 286
    add-int/2addr v1, v3

    .line 287
    iget v3, p0, Lcom/android/launcher3/h0;->B1:I

    .line 288
    .line 289
    add-int v4, v3, v1

    .line 290
    .line 291
    iget v5, p0, Lcom/android/launcher3/h0;->I1:I

    .line 292
    .line 293
    if-ge v5, v4, :cond_9

    .line 294
    .line 295
    iget-object v6, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 296
    .line 297
    iget v6, v6, Lcom/android/launcher3/F1;->G0:I

    .line 298
    .line 299
    add-int/lit8 v7, v6, -0x1

    .line 300
    .line 301
    sub-int v8, v4, v5

    .line 302
    .line 303
    mul-int/2addr v8, v6

    .line 304
    iget-object v9, p0, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 305
    .line 306
    iget v10, v9, Landroid/graphics/Point;->y:I

    .line 307
    .line 308
    mul-int v11, v10, v7

    .line 309
    .line 310
    if-lt v11, v8, :cond_7

    .line 311
    .line 312
    iput v4, p0, Lcom/android/launcher3/h0;->I1:I

    .line 313
    .line 314
    div-int/2addr v8, v7

    .line 315
    sub-int/2addr v10, v8

    .line 316
    iput v10, v9, Landroid/graphics/Point;->y:I

    .line 317
    .line 318
    goto :goto_4

    .line 319
    :cond_7
    mul-int/2addr v5, v6

    .line 320
    mul-int/2addr v10, v7

    .line 321
    add-int/2addr v5, v10

    .line 322
    div-int/2addr v5, v6

    .line 323
    iput v5, p0, Lcom/android/launcher3/h0;->I1:I

    .line 324
    .line 325
    iput v2, v9, Landroid/graphics/Point;->y:I

    .line 326
    .line 327
    iget v1, p0, Lcom/android/launcher3/h0;->D1:I

    .line 328
    .line 329
    sub-int v1, v4, v1

    .line 330
    .line 331
    if-gt v1, v5, :cond_8

    .line 332
    .line 333
    sub-int/2addr v4, v5

    .line 334
    iput v4, p0, Lcom/android/launcher3/h0;->D1:I

    .line 335
    .line 336
    goto :goto_3

    .line 337
    :cond_8
    iput v2, p0, Lcom/android/launcher3/h0;->D1:I

    .line 338
    .line 339
    int-to-float v4, v5

    .line 340
    int-to-float v1, v1

    .line 341
    div-float/2addr v4, v1

    .line 342
    int-to-float v1, v3

    .line 343
    mul-float/2addr v1, v4

    .line 344
    float-to-int v1, v1

    .line 345
    iput v1, p0, Lcom/android/launcher3/h0;->B1:I

    .line 346
    .line 347
    iget v1, p0, Lcom/android/launcher3/h0;->C1:I

    .line 348
    .line 349
    int-to-float v1, v1

    .line 350
    mul-float/2addr v1, v4

    .line 351
    float-to-int v1, v1

    .line 352
    iput v1, p0, Lcom/android/launcher3/h0;->C1:I

    .line 353
    .line 354
    :goto_3
    iget v1, p0, Lcom/android/launcher3/h0;->D1:I

    .line 355
    .line 356
    iget v3, p0, Lcom/android/launcher3/h0;->C1:I

    .line 357
    .line 358
    int-to-float v3, v3

    .line 359
    invoke-static {v3}, Lcom/android/launcher3/N5;->f(F)I

    .line 360
    .line 361
    .line 362
    move-result v3

    .line 363
    add-int/2addr v1, v3

    .line 364
    :goto_4
    iget v3, p0, Lcom/android/launcher3/h0;->B1:I

    .line 365
    .line 366
    add-int v4, v3, v1

    .line 367
    .line 368
    :cond_9
    iget v1, p0, Lcom/android/launcher3/h0;->I1:I

    .line 369
    .line 370
    sub-int/2addr v1, v4

    .line 371
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 372
    .line 373
    .line 374
    move-result v1

    .line 375
    div-int/lit8 v1, v1, 0x2

    .line 376
    .line 377
    iput v1, p0, Lcom/android/launcher3/h0;->K1:I

    .line 378
    .line 379
    iget v1, p0, Lcom/android/launcher3/h0;->l1:I

    .line 380
    .line 381
    int-to-float v1, v1

    .line 382
    mul-float/2addr v1, p1

    .line 383
    float-to-int v1, v1

    .line 384
    iput v1, p0, Lcom/android/launcher3/h0;->m1:I

    .line 385
    .line 386
    goto :goto_5

    .line 387
    :cond_a
    invoke-direct {p0}, Lcom/android/launcher3/h0;->C0()I

    .line 388
    .line 389
    .line 390
    move-result v1

    .line 391
    int-to-float v1, v1

    .line 392
    iget v3, p0, Lcom/android/launcher3/h0;->A1:F

    .line 393
    .line 394
    mul-float/2addr v1, v3

    .line 395
    float-to-int v1, v1

    .line 396
    iput v1, p0, Lcom/android/launcher3/h0;->D1:I

    .line 397
    .line 398
    iget v3, p0, Lcom/android/launcher3/h0;->B1:I

    .line 399
    .line 400
    add-int/2addr v1, v3

    .line 401
    iput v1, p0, Lcom/android/launcher3/h0;->H1:I

    .line 402
    .line 403
    invoke-direct {p0, v3}, Lcom/android/launcher3/h0;->v0(I)I

    .line 404
    .line 405
    .line 406
    move-result v1

    .line 407
    iget v3, p0, Lcom/android/launcher3/X3;->s:I

    .line 408
    .line 409
    add-int/2addr v1, v3

    .line 410
    iget v3, p0, Lcom/android/launcher3/h0;->C1:I

    .line 411
    .line 412
    int-to-float v3, v3

    .line 413
    invoke-static {v3}, Lcom/android/launcher3/N5;->f(F)I

    .line 414
    .line 415
    .line 416
    move-result v3

    .line 417
    add-int/2addr v1, v3

    .line 418
    iput v1, p0, Lcom/android/launcher3/h0;->I1:I

    .line 419
    .line 420
    invoke-super {p0, p0}, Lcom/android/launcher3/X3;->a(Lcom/android/launcher3/h0;)V

    .line 421
    .line 422
    .line 423
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->k0()Landroid/graphics/Point;

    .line 424
    .line 425
    .line 426
    move-result-object v1

    .line 427
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 428
    .line 429
    iget v3, p0, Lcom/android/launcher3/h0;->I1:I

    .line 430
    .line 431
    sub-int/2addr v1, v3

    .line 432
    div-int/lit8 v1, v1, 0x2

    .line 433
    .line 434
    iget-object v4, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 435
    .line 436
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->c:Z

    .line 437
    .line 438
    if-nez v4, :cond_b

    .line 439
    .line 440
    iget v4, p0, Lcom/android/launcher3/h0;->D1:I

    .line 441
    .line 442
    if-le v4, v1, :cond_b

    .line 443
    .line 444
    if-nez v0, :cond_b

    .line 445
    .line 446
    iget-boolean v5, p0, Lcom/android/launcher3/h0;->O0:Z

    .line 447
    .line 448
    if-nez v5, :cond_b

    .line 449
    .line 450
    sub-int/2addr v4, v1

    .line 451
    sub-int/2addr v3, v4

    .line 452
    iput v3, p0, Lcom/android/launcher3/h0;->I1:I

    .line 453
    .line 454
    iput v1, p0, Lcom/android/launcher3/h0;->D1:I

    .line 455
    .line 456
    :cond_b
    invoke-static {}, Lx1/O;->k1()Z

    .line 457
    .line 458
    .line 459
    move-result v1

    .line 460
    if-eqz v1, :cond_c

    .line 461
    .line 462
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 463
    .line 464
    .line 465
    move-result-object v1

    .line 466
    const v3, 0x7f0704bb

    .line 467
    .line 468
    .line 469
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 470
    .line 471
    .line 472
    move-result v1

    .line 473
    iput v1, p0, Lcom/android/launcher3/h0;->D1:I

    .line 474
    .line 475
    :cond_c
    :goto_5
    invoke-static {}, Lm1/a;->a()Z

    .line 476
    .line 477
    .line 478
    move-result v1

    .line 479
    if-eqz v1, :cond_e

    .line 480
    .line 481
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 482
    .line 483
    .line 484
    move-result-object v1

    .line 485
    const v3, 0x7f0701ba

    .line 486
    .line 487
    .line 488
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 489
    .line 490
    .line 491
    move-result v1

    .line 492
    iput v1, p0, Lcom/android/launcher3/h0;->B1:I

    .line 493
    .line 494
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 495
    .line 496
    .line 497
    move-result-object v1

    .line 498
    const v3, 0x7f0701c6

    .line 499
    .line 500
    .line 501
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 502
    .line 503
    .line 504
    move-result v1

    .line 505
    iput v1, p0, Lcom/android/launcher3/h0;->C1:I

    .line 506
    .line 507
    invoke-static {}, Lm1/a;->b()Z

    .line 508
    .line 509
    .line 510
    move-result v1

    .line 511
    if-eqz v1, :cond_d

    .line 512
    .line 513
    goto :goto_6

    .line 514
    :cond_d
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 515
    .line 516
    .line 517
    move-result-object v1

    .line 518
    const v3, 0x7f0704bd

    .line 519
    .line 520
    .line 521
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 522
    .line 523
    .line 524
    move-result v1

    .line 525
    iput v1, p0, Lcom/android/launcher3/h0;->D1:I

    .line 526
    .line 527
    :cond_e
    :goto_6
    iget-boolean v1, p0, Lcom/android/launcher3/h0;->b1:Z

    .line 528
    .line 529
    if-eqz v1, :cond_f

    .line 530
    .line 531
    invoke-direct {p0}, Lcom/android/launcher3/h0;->j1()V

    .line 532
    .line 533
    .line 534
    goto :goto_7

    .line 535
    :cond_f
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 536
    .line 537
    .line 538
    move-result-object v1

    .line 539
    invoke-direct {p0, p1, v1}, Lcom/android/launcher3/h0;->i1(FLandroid/content/res/Resources;)V

    .line 540
    .line 541
    .line 542
    :goto_7
    invoke-direct {p0, p2}, Lcom/android/launcher3/h0;->h1(Landroid/content/Context;)V

    .line 543
    .line 544
    .line 545
    if-eqz v0, :cond_10

    .line 546
    .line 547
    iget-boolean p1, p0, Lcom/android/launcher3/h0;->b1:Z

    .line 548
    .line 549
    if-nez p1, :cond_10

    .line 550
    .line 551
    invoke-direct {p0}, Lcom/android/launcher3/h0;->O0()V

    .line 552
    .line 553
    .line 554
    :cond_10
    iget-object p1, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 555
    .line 556
    iget-boolean p1, p1, Lcom/android/launcher3/F1;->B1:Z

    .line 557
    .line 558
    if-eqz p1, :cond_11

    .line 559
    .line 560
    iget p1, p0, Lcom/android/launcher3/h0;->H2:I

    .line 561
    .line 562
    iget p2, p0, Lcom/android/launcher3/h0;->N2:F

    .line 563
    .line 564
    invoke-static {p2}, Lcom/android/launcher3/N5;->f(F)I

    .line 565
    .line 566
    .line 567
    move-result p2

    .line 568
    add-int/2addr p1, p2

    .line 569
    iput p1, p0, Lcom/android/launcher3/h0;->H2:I

    .line 570
    .line 571
    :cond_11
    iget p1, p0, Lcom/android/launcher3/h0;->B1:I

    .line 572
    .line 573
    invoke-direct {p0, p1}, Lcom/android/launcher3/h0;->n1(I)V

    .line 574
    .line 575
    .line 576
    iget p1, p0, Lcom/android/launcher3/h0;->B1:I

    .line 577
    .line 578
    iput p1, p0, Lcom/android/launcher3/h0;->Q1:I

    .line 579
    .line 580
    div-int/lit8 v2, v2, 0x2

    .line 581
    .line 582
    iput v2, p0, Lcom/android/launcher3/h0;->R1:I

    .line 583
    .line 584
    iget-object p1, p0, Lcom/android/launcher3/h0;->E0:Landroid/util/DisplayMetrics;

    .line 585
    .line 586
    const/4 p2, 0x0

    .line 587
    invoke-static {p2, p1}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    .line 588
    .line 589
    .line 590
    move-result p1

    .line 591
    int-to-float p1, p1

    .line 592
    iget-object v0, p0, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 593
    .line 594
    iget v1, v0, Landroid/graphics/Point;->x:I

    .line 595
    .line 596
    int-to-float v2, v1

    .line 597
    cmpg-float v2, v2, p1

    .line 598
    .line 599
    if-ltz v2, :cond_13

    .line 600
    .line 601
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 602
    .line 603
    int-to-float v0, v0

    .line 604
    cmpg-float v0, v0, p1

    .line 605
    .line 606
    if-gez v0, :cond_12

    .line 607
    .line 608
    goto :goto_8

    .line 609
    :cond_12
    iget-object p1, p0, Lcom/android/launcher3/h0;->m3:Landroid/graphics/Rect;

    .line 610
    .line 611
    invoke-virtual {p1}, Landroid/graphics/Rect;->setEmpty()V

    .line 612
    .line 613
    .line 614
    goto :goto_9

    .line 615
    :cond_13
    :goto_8
    iget-object v0, p0, Lcom/android/launcher3/h0;->m3:Landroid/graphics/Rect;

    .line 616
    .line 617
    int-to-float v1, v1

    .line 618
    sub-float v1, p1, v1

    .line 619
    .line 620
    invoke-static {p2, v1}, Ljava/lang/Math;->max(FF)F

    .line 621
    .line 622
    .line 623
    move-result v1

    .line 624
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 625
    .line 626
    .line 627
    move-result v1

    .line 628
    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 629
    .line 630
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 631
    .line 632
    iget-object v0, p0, Lcom/android/launcher3/h0;->m3:Landroid/graphics/Rect;

    .line 633
    .line 634
    iget-object v1, p0, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 635
    .line 636
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 637
    .line 638
    int-to-float v1, v1

    .line 639
    sub-float/2addr p1, v1

    .line 640
    invoke-static {p2, p1}, Ljava/lang/Math;->max(FF)F

    .line 641
    .line 642
    .line 643
    move-result p1

    .line 644
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 645
    .line 646
    .line 647
    move-result p1

    .line 648
    iput p1, v0, Landroid/graphics/Rect;->bottom:I

    .line 649
    .line 650
    iput p1, v0, Landroid/graphics/Rect;->top:I

    .line 651
    .line 652
    :goto_9
    invoke-super {p0, p0}, Lcom/android/launcher3/X3;->c(Lcom/android/launcher3/h0;)V

    .line 653
    .line 654
    .line 655
    return-void
.end method

.method public q0(Landroid/content/Context;I)F
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/h0;->p0(Landroid/content/Context;)F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    cmpl-float v0, p1, v0

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return p1

    .line 11
    :cond_0
    iget v0, p0, Lcom/android/launcher3/h0;->s2:I

    .line 12
    .line 13
    int-to-float v0, v0

    .line 14
    sub-float/2addr p1, v0

    .line 15
    iget p0, p0, Lcom/android/launcher3/h0;->B1:I

    .line 16
    .line 17
    int-to-float p0, p0

    .line 18
    int-to-float p2, p2

    .line 19
    mul-float/2addr p2, p1

    .line 20
    add-float/2addr p0, p2

    .line 21
    return p0
.end method

.method public q1(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s0(Landroid/content/Context;)Landroid/graphics/Rect;
    .locals 9

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->T0()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz v1, :cond_2

    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 14
    .line 15
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/h0;->q1:Landroid/graphics/Rect;

    .line 18
    .line 19
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 20
    .line 21
    add-int/2addr p1, v1

    .line 22
    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iget-object v1, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 27
    .line 28
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 29
    .line 30
    iget-object v3, p0, Lcom/android/launcher3/h0;->q1:Landroid/graphics/Rect;

    .line 31
    .line 32
    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    .line 33
    .line 34
    add-int/2addr v1, v3

    .line 35
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->S0()Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-eqz v3, :cond_0

    .line 44
    .line 45
    iget-object v3, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 46
    .line 47
    iget v3, v3, Landroid/graphics/Rect;->left:I

    .line 48
    .line 49
    iget v4, p0, Lcom/android/launcher3/h0;->m2:I

    .line 50
    .line 51
    add-int/2addr v3, v4

    .line 52
    iget v4, p0, Lcom/android/launcher3/h0;->n2:I

    .line 53
    .line 54
    invoke-virtual {v0, v3, p1, v4, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    iget v3, p0, Lcom/android/launcher3/h0;->n2:I

    .line 59
    .line 60
    iget-object v4, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 61
    .line 62
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 63
    .line 64
    iget v5, p0, Lcom/android/launcher3/h0;->m2:I

    .line 65
    .line 66
    add-int/2addr v4, v5

    .line 67
    invoke-virtual {v0, v3, p1, v4, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 68
    .line 69
    .line 70
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 71
    .line 72
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 73
    .line 74
    if-lez p1, :cond_1

    .line 75
    .line 76
    iget-object v1, p0, Lcom/android/launcher3/X3;->A0:Landroid/graphics/Rect;

    .line 77
    .line 78
    iget-object p0, p0, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 79
    .line 80
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 81
    .line 82
    invoke-virtual {v1, v2, p1, v2, p0}, Landroid/graphics/Rect;->set(IIII)V

    .line 83
    .line 84
    .line 85
    :cond_1
    return-object v0

    .line 86
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 87
    .line 88
    iget-boolean v3, v1, Lcom/android/launcher3/F1;->C1:Z

    .line 89
    .line 90
    if-eqz v3, :cond_4

    .line 91
    .line 92
    invoke-direct {p0}, Lcom/android/launcher3/h0;->r0()I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    invoke-direct {p0}, Lcom/android/launcher3/h0;->t0()I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    invoke-direct {p0}, Lcom/android/launcher3/h0;->W()I

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    iget v4, p0, Lcom/android/launcher3/h0;->V0:I

    .line 105
    .line 106
    iget-object v5, p0, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 107
    .line 108
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    .line 109
    .line 110
    .line 111
    move-result v5

    .line 112
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 113
    .line 114
    .line 115
    move-result v5

    .line 116
    sub-int/2addr v4, v5

    .line 117
    iget-object v5, p0, Lcom/android/launcher3/h0;->q1:Landroid/graphics/Rect;

    .line 118
    .line 119
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 124
    .line 125
    .line 126
    move-result v5

    .line 127
    sub-int/2addr v4, v5

    .line 128
    sub-int/2addr v4, v2

    .line 129
    div-int/lit8 v4, v4, 0x2

    .line 130
    .line 131
    iget-object v2, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 132
    .line 133
    iget v5, v2, Landroid/graphics/Rect;->left:I

    .line 134
    .line 135
    add-int/2addr v5, v4

    .line 136
    iget-object v6, p0, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 137
    .line 138
    iget v7, v6, Landroid/graphics/Rect;->left:I

    .line 139
    .line 140
    add-int/2addr v5, v7

    .line 141
    iget-object v7, p0, Lcom/android/launcher3/h0;->q1:Landroid/graphics/Rect;

    .line 142
    .line 143
    iget v8, v7, Landroid/graphics/Rect;->left:I

    .line 144
    .line 145
    add-int/2addr v5, v8

    .line 146
    iget v8, p0, Lcom/android/launcher3/h0;->f2:I

    .line 147
    .line 148
    sub-int/2addr v8, v1

    .line 149
    iget p0, p0, Lcom/android/launcher3/h0;->b2:I

    .line 150
    .line 151
    sub-int/2addr v8, p0

    .line 152
    iget p0, v2, Landroid/graphics/Rect;->right:I

    .line 153
    .line 154
    add-int/2addr v4, p0

    .line 155
    iget p0, v6, Landroid/graphics/Rect;->right:I

    .line 156
    .line 157
    add-int/2addr v4, p0

    .line 158
    iget p0, v7, Landroid/graphics/Rect;->right:I

    .line 159
    .line 160
    add-int/2addr v4, p0

    .line 161
    invoke-virtual {v0, v5, v8, v4, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    invoke-static {p0}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 169
    .line 170
    .line 171
    move-result p0

    .line 172
    if-eqz p0, :cond_3

    .line 173
    .line 174
    iget p0, v0, Landroid/graphics/Rect;->right:I

    .line 175
    .line 176
    add-int/2addr p0, v3

    .line 177
    iput p0, v0, Landroid/graphics/Rect;->right:I

    .line 178
    .line 179
    return-object v0

    .line 180
    :cond_3
    iget p0, v0, Landroid/graphics/Rect;->left:I

    .line 181
    .line 182
    add-int/2addr p0, v3

    .line 183
    iput p0, v0, Landroid/graphics/Rect;->left:I

    .line 184
    .line 185
    return-object v0

    .line 186
    :cond_4
    iget-boolean v3, p0, Lcom/android/launcher3/h0;->p3:Z

    .line 187
    .line 188
    if-eqz v3, :cond_7

    .line 189
    .line 190
    invoke-direct {p0}, Lcom/android/launcher3/h0;->r0()I

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    iget v2, p0, Lcom/android/launcher3/h0;->f2:I

    .line 195
    .line 196
    sub-int/2addr v2, v1

    .line 197
    iget v3, p0, Lcom/android/launcher3/h0;->b2:I

    .line 198
    .line 199
    sub-int/2addr v2, v3

    .line 200
    invoke-direct {p0}, Lcom/android/launcher3/h0;->t0()I

    .line 201
    .line 202
    .line 203
    move-result v3

    .line 204
    iget v4, p0, Lcom/android/launcher3/h0;->h2:I

    .line 205
    .line 206
    if-lez v4, :cond_5

    .line 207
    .line 208
    iget v4, p0, Lcom/android/launcher3/h0;->j2:I

    .line 209
    .line 210
    iget v5, p0, Lcom/android/launcher3/h0;->V0:I

    .line 211
    .line 212
    sub-int/2addr v5, v3

    .line 213
    sub-int/2addr v5, v4

    .line 214
    iget v3, p0, Lcom/android/launcher3/h0;->s2:I

    .line 215
    .line 216
    add-int/2addr v5, v3

    .line 217
    goto :goto_1

    .line 218
    :cond_5
    iget v4, p0, Lcom/android/launcher3/h0;->V0:I

    .line 219
    .line 220
    sub-int/2addr v4, v3

    .line 221
    div-int/lit8 v4, v4, 0x2

    .line 222
    .line 223
    move v5, v4

    .line 224
    :goto_1
    invoke-direct {p0}, Lcom/android/launcher3/h0;->W()I

    .line 225
    .line 226
    .line 227
    move-result p0

    .line 228
    add-int/2addr v4, p0

    .line 229
    iput v2, v0, Landroid/graphics/Rect;->top:I

    .line 230
    .line 231
    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 232
    .line 233
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    invoke-static {p0}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 238
    .line 239
    .line 240
    move-result p0

    .line 241
    if-eqz p0, :cond_6

    .line 242
    .line 243
    iput v5, v0, Landroid/graphics/Rect;->left:I

    .line 244
    .line 245
    iput v4, v0, Landroid/graphics/Rect;->right:I

    .line 246
    .line 247
    return-object v0

    .line 248
    :cond_6
    iput v4, v0, Landroid/graphics/Rect;->left:I

    .line 249
    .line 250
    iput v5, v0, Landroid/graphics/Rect;->right:I

    .line 251
    .line 252
    return-object v0

    .line 253
    :cond_7
    iget-boolean p1, p0, Lcom/android/launcher3/h0;->Z0:Z

    .line 254
    .line 255
    if-eqz p1, :cond_8

    .line 256
    .line 257
    iget p1, p0, Lcom/android/launcher3/h0;->B1:I

    .line 258
    .line 259
    invoke-direct {p0, p1}, Lcom/android/launcher3/h0;->x0(I)I

    .line 260
    .line 261
    .line 262
    move-result v1

    .line 263
    sub-int/2addr p1, v1

    .line 264
    iget v1, p0, Lcom/android/launcher3/h0;->V0:I

    .line 265
    .line 266
    iget v3, p0, Lcom/android/launcher3/h0;->o2:I

    .line 267
    .line 268
    add-int/2addr v3, p1

    .line 269
    sub-int/2addr v1, v3

    .line 270
    div-int/lit8 v1, v1, 0x2

    .line 271
    .line 272
    invoke-direct {p0}, Lcom/android/launcher3/h0;->r0()I

    .line 273
    .line 274
    .line 275
    move-result p0

    .line 276
    invoke-virtual {v0, v1, v2, v1, p0}, Landroid/graphics/Rect;->set(IIII)V

    .line 277
    .line 278
    .line 279
    return-object v0

    .line 280
    :cond_8
    iget p1, p0, Lcom/android/launcher3/h0;->T0:I

    .line 281
    .line 282
    int-to-float v3, p1

    .line 283
    iget v1, v1, Lcom/android/launcher3/F1;->H0:I

    .line 284
    .line 285
    int-to-float v1, v1

    .line 286
    div-float/2addr v3, v1

    .line 287
    int-to-float p1, p1

    .line 288
    iget v1, p0, Lcom/android/launcher3/h0;->a2:I

    .line 289
    .line 290
    int-to-float v1, v1

    .line 291
    div-float/2addr p1, v1

    .line 292
    sub-float/2addr v3, p1

    .line 293
    const/high16 p1, 0x40000000    # 2.0f

    .line 294
    .line 295
    div-float/2addr v3, p1

    .line 296
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 297
    .line 298
    .line 299
    move-result p1

    .line 300
    iget-object v1, p0, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 301
    .line 302
    iget v3, v1, Landroid/graphics/Rect;->left:I

    .line 303
    .line 304
    add-int/2addr v3, p1

    .line 305
    iget-object v4, p0, Lcom/android/launcher3/h0;->q1:Landroid/graphics/Rect;

    .line 306
    .line 307
    iget v5, v4, Landroid/graphics/Rect;->left:I

    .line 308
    .line 309
    add-int/2addr v3, v5

    .line 310
    iget-object v5, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 311
    .line 312
    iget v6, v5, Landroid/graphics/Rect;->left:I

    .line 313
    .line 314
    add-int/2addr v3, v6

    .line 315
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 316
    .line 317
    add-int/2addr p1, v1

    .line 318
    iget v1, v4, Landroid/graphics/Rect;->right:I

    .line 319
    .line 320
    add-int/2addr p1, v1

    .line 321
    iget v1, v5, Landroid/graphics/Rect;->right:I

    .line 322
    .line 323
    add-int/2addr p1, v1

    .line 324
    invoke-direct {p0}, Lcom/android/launcher3/h0;->r0()I

    .line 325
    .line 326
    .line 327
    move-result p0

    .line 328
    invoke-virtual {v0, v3, v2, p1, p0}, Landroid/graphics/Rect;->set(IIII)V

    .line 329
    .line 330
    .line 331
    return-object v0
.end method

.method public u0(Landroid/content/Context;Z)I
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/h0;->Y0(Landroid/content/Context;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget p0, p0, Lcom/android/launcher3/h0;->k2:I

    .line 21
    .line 22
    neg-int p0, p0

    .line 23
    return p0

    .line 24
    :cond_0
    return v1

    .line 25
    :cond_1
    if-eqz p1, :cond_2

    .line 26
    .line 27
    return v1

    .line 28
    :cond_2
    iget p0, p0, Lcom/android/launcher3/h0;->k2:I

    .line 29
    .line 30
    return p0

    .line 31
    :cond_3
    return v1
.end method

.method public y0()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/h0;->k3:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public z0()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/h0;->W0:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/h0;->E2:Landroid/graphics/Rect;

    .line 4
    .line 5
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 6
    .line 7
    sub-int/2addr v0, v1

    .line 8
    int-to-float v0, v0

    .line 9
    iget p0, p0, Lcom/android/launcher3/h0;->H2:I

    .line 10
    .line 11
    int-to-float p0, p0

    .line 12
    div-float/2addr v0, p0

    .line 13
    float-to-double v0, v0

    .line 14
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    double-to-int p0, v0

    .line 19
    return p0
.end method
