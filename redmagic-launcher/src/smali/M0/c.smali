.class public final LM0/c;
.super Lcom/google/protobuf/y;
.source "ViewNode.java"

# interfaces
.implements Lcom/google/protobuf/U;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LM0/c$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/y<",
        "LM0/c;",
        "LM0/c$b;",
        ">;",
        "Lcom/google/protobuf/U;"
    }
.end annotation


# static fields
.field private static final A:LM0/c;

.field private static volatile B:Lcom/google/protobuf/c0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/c0<",
            "LM0/c;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private g:I

.field private h:I

.field private i:I

.field private j:Lcom/google/protobuf/A$j;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/A$j<",
            "LM0/c;",
            ">;"
        }
    .end annotation
.end field

.field private k:Ljava/lang/String;

.field private l:I

.field private m:I

.field private n:I

.field private o:I

.field private p:I

.field private q:I

.field private r:F

.field private s:F

.field private t:F

.field private u:F

.field private v:F

.field private w:Z

.field private x:Z

.field private y:I

.field private z:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LM0/c;

    .line 2
    .line 3
    invoke-direct {v0}, LM0/c;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LM0/c;->A:LM0/c;

    .line 7
    .line 8
    const-class v1, LM0/c;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/google/protobuf/y;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/y;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/y;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/google/protobuf/y;->emptyProtobufList()Lcom/google/protobuf/A$j;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, LM0/c;->j:Lcom/google/protobuf/A$j;

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    iput-object v0, p0, LM0/c;->k:Ljava/lang/String;

    .line 13
    .line 14
    const/high16 v0, 0x3f800000    # 1.0f

    .line 15
    .line 16
    iput v0, p0, LM0/c;->t:F

    .line 17
    .line 18
    iput v0, p0, LM0/c;->u:F

    .line 19
    .line 20
    iput v0, p0, LM0/c;->v:F

    .line 21
    .line 22
    return-void
.end method

.method private A(F)V
    .locals 2

    .line 1
    iget v0, p0, LM0/c;->g:I

    .line 2
    .line 3
    const/high16 v1, 0x20000

    .line 4
    .line 5
    or-int/2addr v0, v1

    .line 6
    iput v0, p0, LM0/c;->g:I

    .line 7
    .line 8
    iput p1, p0, LM0/c;->z:F

    .line 9
    .line 10
    return-void
.end method

.method private B(I)V
    .locals 1

    .line 1
    iget v0, p0, LM0/c;->g:I

    .line 2
    .line 3
    or-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    iput v0, p0, LM0/c;->g:I

    .line 6
    .line 7
    iput p1, p0, LM0/c;->i:I

    .line 8
    .line 9
    return-void
.end method

.method private C(I)V
    .locals 1

    .line 1
    iget v0, p0, LM0/c;->g:I

    .line 2
    .line 3
    or-int/lit8 v0, v0, 0x40

    .line 4
    .line 5
    iput v0, p0, LM0/c;->g:I

    .line 6
    .line 7
    iput p1, p0, LM0/c;->o:I

    .line 8
    .line 9
    return-void
.end method

.method private D(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget v0, p0, LM0/c;->g:I

    .line 5
    .line 6
    or-int/lit8 v0, v0, 0x4

    .line 7
    .line 8
    iput v0, p0, LM0/c;->g:I

    .line 9
    .line 10
    iput-object p1, p0, LM0/c;->k:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method private E(I)V
    .locals 1

    .line 1
    iget v0, p0, LM0/c;->g:I

    .line 2
    .line 3
    or-int/lit8 v0, v0, 0x8

    .line 4
    .line 5
    iput v0, p0, LM0/c;->g:I

    .line 6
    .line 7
    iput p1, p0, LM0/c;->l:I

    .line 8
    .line 9
    return-void
.end method

.method private F(F)V
    .locals 1

    .line 1
    iget v0, p0, LM0/c;->g:I

    .line 2
    .line 3
    or-int/lit16 v0, v0, 0x800

    .line 4
    .line 5
    iput v0, p0, LM0/c;->g:I

    .line 6
    .line 7
    iput p1, p0, LM0/c;->t:F

    .line 8
    .line 9
    return-void
.end method

.method private G(F)V
    .locals 1

    .line 1
    iget v0, p0, LM0/c;->g:I

    .line 2
    .line 3
    or-int/lit16 v0, v0, 0x1000

    .line 4
    .line 5
    iput v0, p0, LM0/c;->g:I

    .line 6
    .line 7
    iput p1, p0, LM0/c;->u:F

    .line 8
    .line 9
    return-void
.end method

.method private H(I)V
    .locals 1

    .line 1
    iget v0, p0, LM0/c;->g:I

    .line 2
    .line 3
    or-int/lit16 v0, v0, 0x80

    .line 4
    .line 5
    iput v0, p0, LM0/c;->g:I

    .line 6
    .line 7
    iput p1, p0, LM0/c;->p:I

    .line 8
    .line 9
    return-void
.end method

.method private I(I)V
    .locals 1

    .line 1
    iget v0, p0, LM0/c;->g:I

    .line 2
    .line 3
    or-int/lit16 v0, v0, 0x100

    .line 4
    .line 5
    iput v0, p0, LM0/c;->g:I

    .line 6
    .line 7
    iput p1, p0, LM0/c;->q:I

    .line 8
    .line 9
    return-void
.end method

.method private J(I)V
    .locals 1

    .line 1
    iget v0, p0, LM0/c;->g:I

    .line 2
    .line 3
    or-int/lit8 v0, v0, 0x10

    .line 4
    .line 5
    iput v0, p0, LM0/c;->g:I

    .line 6
    .line 7
    iput p1, p0, LM0/c;->m:I

    .line 8
    .line 9
    return-void
.end method

.method private K(F)V
    .locals 1

    .line 1
    iget v0, p0, LM0/c;->g:I

    .line 2
    .line 3
    or-int/lit16 v0, v0, 0x200

    .line 4
    .line 5
    iput v0, p0, LM0/c;->g:I

    .line 6
    .line 7
    iput p1, p0, LM0/c;->r:F

    .line 8
    .line 9
    return-void
.end method

.method private L(F)V
    .locals 1

    .line 1
    iget v0, p0, LM0/c;->g:I

    .line 2
    .line 3
    or-int/lit16 v0, v0, 0x400

    .line 4
    .line 5
    iput v0, p0, LM0/c;->g:I

    .line 6
    .line 7
    iput p1, p0, LM0/c;->s:F

    .line 8
    .line 9
    return-void
.end method

.method private M(I)V
    .locals 2

    .line 1
    iget v0, p0, LM0/c;->g:I

    .line 2
    .line 3
    const/high16 v1, 0x10000

    .line 4
    .line 5
    or-int/2addr v0, v1

    .line 6
    iput v0, p0, LM0/c;->g:I

    .line 7
    .line 8
    iput p1, p0, LM0/c;->y:I

    .line 9
    .line 10
    return-void
.end method

.method private N(I)V
    .locals 1

    .line 1
    iget v0, p0, LM0/c;->g:I

    .line 2
    .line 3
    or-int/lit8 v0, v0, 0x20

    .line 4
    .line 5
    iput v0, p0, LM0/c;->g:I

    .line 6
    .line 7
    iput p1, p0, LM0/c;->n:I

    .line 8
    .line 9
    return-void
.end method

.method private O(Z)V
    .locals 1

    .line 1
    iget v0, p0, LM0/c;->g:I

    .line 2
    .line 3
    or-int/lit16 v0, v0, 0x4000

    .line 4
    .line 5
    iput v0, p0, LM0/c;->g:I

    .line 6
    .line 7
    iput-boolean p1, p0, LM0/c;->w:Z

    .line 8
    .line 9
    return-void
.end method

.method static synthetic a()LM0/c;
    .locals 1

    .line 1
    sget-object v0, LM0/c;->A:LM0/c;

    .line 2
    .line 3
    return-object v0
.end method

.method static synthetic b(LM0/c;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/c;->y(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic c(LM0/c;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/c;->D(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic d(LM0/c;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/c;->E(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic e(LM0/c;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/c;->J(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic f(LM0/c;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/c;->N(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic g(LM0/c;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/c;->C(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic h(LM0/c;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/c;->H(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic i(LM0/c;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/c;->I(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic j(LM0/c;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/c;->K(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic k(LM0/c;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/c;->L(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic l(LM0/c;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/c;->B(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic m(LM0/c;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/c;->F(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic n(LM0/c;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/c;->G(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic o(LM0/c;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/c;->x(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic p(LM0/c;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/c;->O(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic q(LM0/c;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/c;->z(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic r(LM0/c;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/c;->M(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic s(LM0/c;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/c;->A(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic t(LM0/c;LM0/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/c;->u(LM0/c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private u(LM0/c;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, LM0/c;->v()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, LM0/c;->j:Lcom/google/protobuf/A$j;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private v()V
    .locals 2

    .line 1
    iget-object v0, p0, LM0/c;->j:Lcom/google/protobuf/A$j;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/protobuf/A$j;->h()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-static {v0}, Lcom/google/protobuf/y;->mutableCopy(Lcom/google/protobuf/A$j;)Lcom/google/protobuf/A$j;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, LM0/c;->j:Lcom/google/protobuf/A$j;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static w()LM0/c$b;
    .locals 1

    .line 1
    sget-object v0, LM0/c;->A:LM0/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/y;->createBuilder()Lcom/google/protobuf/y$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, LM0/c$b;

    .line 8
    .line 9
    return-object v0
.end method

.method private x(F)V
    .locals 1

    .line 1
    iget v0, p0, LM0/c;->g:I

    .line 2
    .line 3
    or-int/lit16 v0, v0, 0x2000

    .line 4
    .line 5
    iput v0, p0, LM0/c;->g:I

    .line 6
    .line 7
    iput p1, p0, LM0/c;->v:F

    .line 8
    .line 9
    return-void
.end method

.method private y(I)V
    .locals 1

    .line 1
    iget v0, p0, LM0/c;->g:I

    .line 2
    .line 3
    or-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, LM0/c;->g:I

    .line 6
    .line 7
    iput p1, p0, LM0/c;->h:I

    .line 8
    .line 9
    return-void
.end method

.method private z(Z)V
    .locals 2

    .line 1
    iget v0, p0, LM0/c;->g:I

    .line 2
    .line 3
    const v1, 0x8000

    .line 4
    .line 5
    .line 6
    or-int/2addr v0, v1

    .line 7
    iput v0, p0, LM0/c;->g:I

    .line 8
    .line 9
    iput-boolean p1, p0, LM0/c;->x:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/y$f;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 23

    .line 1
    sget-object v0, LM0/c$a;->a:[I

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    aget v0, v0, v1

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    packed-switch v0, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 16
    .line 17
    .line 18
    throw v0

    .line 19
    :pswitch_0
    return-object v1

    .line 20
    :pswitch_1
    const/4 v0, 0x1

    .line 21
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0

    .line 26
    :pswitch_2
    sget-object v0, LM0/c;->B:Lcom/google/protobuf/c0;

    .line 27
    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    const-class v1, LM0/c;

    .line 31
    .line 32
    monitor-enter v1

    .line 33
    :try_start_0
    sget-object v0, LM0/c;->B:Lcom/google/protobuf/c0;

    .line 34
    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    new-instance v0, Lcom/google/protobuf/y$b;

    .line 38
    .line 39
    sget-object v2, LM0/c;->A:LM0/c;

    .line 40
    .line 41
    invoke-direct {v0, v2}, Lcom/google/protobuf/y$b;-><init>(Lcom/google/protobuf/y;)V

    .line 42
    .line 43
    .line 44
    sput-object v0, LM0/c;->B:Lcom/google/protobuf/c0;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catchall_0
    move-exception v0

    .line 48
    goto :goto_1

    .line 49
    :cond_0
    :goto_0
    monitor-exit v1

    .line 50
    return-object v0

    .line 51
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    throw v0

    .line 53
    :cond_1
    return-object v0

    .line 54
    :pswitch_3
    sget-object v0, LM0/c;->A:LM0/c;

    .line 55
    .line 56
    return-object v0

    .line 57
    :pswitch_4
    const-string v2, "bitField0_"

    .line 58
    .line 59
    const-string v3, "classnameIndex_"

    .line 60
    .line 61
    const-string v4, "hashcode_"

    .line 62
    .line 63
    const-string v5, "children_"

    .line 64
    .line 65
    const-class v6, LM0/c;

    .line 66
    .line 67
    const-string v7, "id_"

    .line 68
    .line 69
    const-string v8, "left_"

    .line 70
    .line 71
    const-string v9, "top_"

    .line 72
    .line 73
    const-string v10, "width_"

    .line 74
    .line 75
    const-string v11, "height_"

    .line 76
    .line 77
    const-string v12, "scrollX_"

    .line 78
    .line 79
    const-string v13, "scrollY_"

    .line 80
    .line 81
    const-string v14, "translationX_"

    .line 82
    .line 83
    const-string v15, "translationY_"

    .line 84
    .line 85
    const-string v16, "scaleX_"

    .line 86
    .line 87
    const-string v17, "scaleY_"

    .line 88
    .line 89
    const-string v18, "alpha_"

    .line 90
    .line 91
    const-string v19, "willNotDraw_"

    .line 92
    .line 93
    const-string v20, "clipChildren_"

    .line 94
    .line 95
    const-string v21, "visibility_"

    .line 96
    .line 97
    const-string v22, "elevation_"

    .line 98
    .line 99
    filled-new-array/range {v2 .. v22}, [Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    const-string v1, "\u0001\u0013\u0000\u0001\u0001\u0013\u0013\u0000\u0001\u0000\u0001\u1004\u0000\u0002\u1004\u0001\u0003\u001b\u0004\u1008\u0002\u0005\u1004\u0003\u0006\u1004\u0004\u0007\u1004\u0005\u0008\u1004\u0006\t\u1004\u0007\n\u1004\u0008\u000b\u1001\t\u000c\u1001\n\r\u1001\u000b\u000e\u1001\u000c\u000f\u1001\r\u0010\u1007\u000e\u0011\u1007\u000f\u0012\u1004\u0010\u0013\u1001\u0011"

    .line 104
    .line 105
    sget-object v2, LM0/c;->A:LM0/c;

    .line 106
    .line 107
    invoke-static {v2, v1, v0}, Lcom/google/protobuf/y;->newMessageInfo(Lcom/google/protobuf/T;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    return-object v0

    .line 112
    :pswitch_5
    new-instance v0, LM0/c$b;

    .line 113
    .line 114
    invoke-direct {v0, v1}, LM0/c$b;-><init>(LM0/c$a;)V

    .line 115
    .line 116
    .line 117
    return-object v0

    .line 118
    :pswitch_6
    new-instance v0, LM0/c;

    .line 119
    .line 120
    invoke-direct {v0}, LM0/c;-><init>()V

    .line 121
    .line 122
    .line 123
    return-object v0

    .line 124
    nop

    .line 125
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
