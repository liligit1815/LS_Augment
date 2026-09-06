.class public final Lz1/o3;
.super Ljava/lang/Object;
.source "ModelTaskController.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lz1/o3$a;
    }
.end annotation


# static fields
.field public static final g:Lz1/o3$a;


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Ls1/P;

.field private final c:Lz1/y0;

.field private final d:Lz1/m;

.field private final e:Lcom/android/launcher3/D3;

.field private final f:Lcom/android/launcher3/util/p1;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lz1/o3$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lz1/o3$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lz1/o3;->g:Lz1/o3$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ls1/P;Lz1/y0;Lz1/m;Lcom/android/launcher3/D3;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "iconCache"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "dataModel"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "allAppsList"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "model"

    .line 22
    .line 23
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lz1/o3;->a:Landroid/content/Context;

    .line 30
    .line 31
    iput-object p2, p0, Lz1/o3;->b:Ls1/P;

    .line 32
    .line 33
    iput-object p3, p0, Lz1/o3;->c:Lz1/y0;

    .line 34
    .line 35
    iput-object p4, p0, Lz1/o3;->d:Lz1/m;

    .line 36
    .line 37
    iput-object p5, p0, Lz1/o3;->e:Lcom/android/launcher3/D3;

    .line 38
    .line 39
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 40
    .line 41
    iput-object p1, p0, Lz1/o3;->f:Lcom/android/launcher3/util/p1;

    .line 42
    .line 43
    return-void
.end method

.method private static final B(Ljava/util/HashMap;Lz1/y0$b;)V
    .locals 1

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, p0}, Lz1/y0$b;->K(Ljava/util/HashMap;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static final D(Lz1/y0$c;Lz1/y0$b;)V
    .locals 1

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, p0}, Lz1/y0$b;->z(Lz1/y0$c;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static final F(Ljava/util/List;Lz1/y0$b;)V
    .locals 1

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, p0}, Lz1/y0$b;->w(Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static final H(Ljava/util/Set;Lz1/y0$b;)V
    .locals 1

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, p0}, Lz1/y0$b;->E(Ljava/util/Set;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static final I(Lcom/android/launcher3/model/data/y;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 2
    .line 3
    return p0
.end method

.method private static final J(Lu4/l;Ljava/lang/Object;)I
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Number;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private static final K(Lz1/o3;I)Lz1/y0$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/o3;->c:Lz1/y0;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/y0;->b:Lcom/android/launcher3/util/A0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lz1/y0$c;

    .line 10
    .line 11
    return-object p0
.end method

.method private static final L(Lz1/y0$c;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->nonNull(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private static final M(Lu4/l;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private static final N(Lz1/o3;Lz1/y0$c;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lz1/o3;->C(Lz1/y0$c;)V

    .line 5
    .line 6
    .line 7
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 8
    .line 9
    return-object p0
.end method

.method private static final O(Lu4/l;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final Q(Lz1/y0$b;Ljava/util/function/Predicate;)V
    .locals 0

    .line 1
    check-cast p0, Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/C2;->I(Ljava/util/function/Predicate;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private static final R(Ljava/util/function/Predicate;Lz1/y0$b;)V
    .locals 1

    .line 1
    const-string v0, "c"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, p0}, Lz1/y0$b;->I(Ljava/util/function/Predicate;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static final S(Ljava/util/function/Predicate;Lz1/y0$b;)V
    .locals 1

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, p0}, Lz1/y0$b;->I(Ljava/util/function/Predicate;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static final U(Ljava/util/ArrayList;Lz1/y0$b;)V
    .locals 1

    .line 1
    const-string v0, "callbacks"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, p0}, Lz1/y0$b;->c(Ljava/util/ArrayList;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Lu4/l;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/o3;->O(Lu4/l;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final a0(Lcom/android/launcher3/D3$a;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lcom/android/launcher3/D3$a;->a(Lz1/y0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ljava/util/List;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/o3;->m0(Ljava/util/List;Lz1/y0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ljava/util/function/Predicate;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/o3;->R(Ljava/util/function/Predicate;Lz1/y0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final c0(Lcom/android/launcher3/D3$a;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p0, p1}, Lcom/android/launcher3/D3$a;->a(Lz1/y0$b;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic d(ZLz1/y0$b;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/o3;->g0(ZLz1/y0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ljava/util/HashMap;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/o3;->B(Ljava/util/HashMap;Lz1/y0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final e0(Ljava/util/HashMap;Lz1/y0$b;)V
    .locals 1

    .line 1
    const-string v0, "callbacks"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, p0}, Lz1/y0$b;->Y(Ljava/util/HashMap;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic f(Lz1/y0$c;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lz1/o3;->L(Lz1/y0$c;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic g(Ljava/util/HashMap;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/o3;->e0(Ljava/util/HashMap;Lz1/y0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final g0(ZLz1/y0$b;)V
    .locals 1

    .line 1
    const-string v0, "callbacks"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, p0}, Lz1/y0$b;->j(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic h(Ljava/util/List;ZLz1/y0$b;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lz1/o3;->k0(Ljava/util/List;ZLz1/y0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Ljava/util/List;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/o3;->F(Ljava/util/List;Lz1/y0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final i0(Ljava/util/List;Lz1/y0$b;)V
    .locals 1

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, p0}, Lz1/y0$b;->Z(Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic j(Ljava/util/Set;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/o3;->H(Ljava/util/Set;Lz1/y0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Lu4/l;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/o3;->M(Lu4/l;Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private static final k0(Ljava/util/List;ZLz1/y0$b;)V
    .locals 1

    .line 1
    const-string v0, "callbacks"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p2, p0, p1}, Lz1/y0$b;->t(Ljava/util/List;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic l(Lz1/y0$b;Ljava/util/function/Predicate;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/o3;->Q(Lz1/y0$b;Ljava/util/function/Predicate;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Lz1/y0$c;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/o3;->D(Lz1/y0$c;Lz1/y0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final m0(Ljava/util/List;Lz1/y0$b;)V
    .locals 1

    .line 1
    const-string v0, "callbacks"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, p0}, Lz1/y0$b;->k(Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic n(Lcom/android/launcher3/D3$a;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/o3;->a0(Lcom/android/launcher3/D3$a;Lz1/y0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Lu4/l;Ljava/lang/Object;)I
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/o3;->J(Lu4/l;Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic p(Lz1/o3;Lz1/y0$c;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/o3;->N(Lz1/o3;Lz1/y0$c;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic q(Ljava/util/ArrayList;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/o3;->U(Ljava/util/ArrayList;Lz1/y0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Lcom/android/launcher3/D3$a;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/o3;->c0(Lcom/android/launcher3/D3$a;Lz1/y0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s(Ljava/util/function/Predicate;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/o3;->S(Ljava/util/function/Predicate;Lz1/y0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t(Lz1/o3;I)Lz1/y0$c;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/o3;->K(Lz1/o3;I)Lz1/y0$c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic u([Lcom/android/launcher3/model/data/d;ILjava/util/Map;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lz1/o3;->z([Lcom/android/launcher3/model/data/d;ILjava/util/Map;Lz1/y0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v(Lcom/android/launcher3/model/data/y;)I
    .locals 0

    .line 1
    invoke-static {p0}, Lz1/o3;->I(Lcom/android/launcher3/model/data/y;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic w(Ljava/util/List;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/o3;->i0(Ljava/util/List;Lz1/y0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final z([Lcom/android/launcher3/model/data/d;ILjava/util/Map;Lz1/y0$b;)V
    .locals 1

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p3, p0, p1, p2}, Lz1/y0$b;->i([Lcom/android/launcher3/model/data/d;ILjava/util/Map;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final A(Lz1/y0;)V
    .locals 1

    .line 1
    const-string v0, "dataModel"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/HashMap;

    .line 7
    .line 8
    iget-object p1, p1, Lz1/y0;->c:Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 11
    .line 12
    .line 13
    new-instance p1, Lz1/T2;

    .line 14
    .line 15
    invoke-direct {p1, v0}, Lz1/T2;-><init>(Ljava/util/HashMap;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final C(Lz1/y0$c;)V
    .locals 1

    .line 1
    const-string v0, "item"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lz1/X2;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Lz1/X2;-><init>(Lz1/y0$c;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final E(Lz1/y0;)V
    .locals 3

    .line 1
    const-string v0, "dataModel"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lm2/c;

    .line 7
    .line 8
    iget-object v1, p0, Lz1/o3;->a:Landroid/content/Context;

    .line 9
    .line 10
    invoke-direct {v0, v1}, Lm2/c;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p1, Lz1/y0;->d:Lz1/u5;

    .line 14
    .line 15
    invoke-virtual {p1}, Lz1/u5;->m()Ljava/util/Map;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string v1, "getWidgetsByPackageItemForPicker(...)"

    .line 20
    .line 21
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-static {v0, p1, v1, v2, v1}, Lm2/c;->d(Lm2/c;Ljava/util/Map;Ljava/util/function/Predicate;ILjava/lang/Object;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    new-instance v0, Lz1/a3;

    .line 31
    .line 32
    invoke-direct {v0, p1}, Lz1/a3;-><init>(Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final G(Ljava/util/Collection;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "allUpdates"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    move-object v3, v2

    .line 26
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 27
    .line 28
    iget v3, v3, Lcom/android/launcher3/model/data/y;->id:I

    .line 29
    .line 30
    const/4 v4, -0x1

    .line 31
    if-eq v3, v4, :cond_0

    .line 32
    .line 33
    invoke-interface {v0, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-static {v0}, Li4/m;->I0(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_2

    .line 46
    .line 47
    new-instance v1, Lz1/h3;

    .line 48
    .line 49
    invoke-direct {v1, v0}, Lz1/h3;-><init>(Ljava/util/Set;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v1}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    invoke-interface {p1}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    new-instance v0, Lz1/i3;

    .line 60
    .line 61
    invoke-direct {v0}, Lz1/i3;-><init>()V

    .line 62
    .line 63
    .line 64
    new-instance v1, Lz1/j3;

    .line 65
    .line 66
    invoke-direct {v1, v0}, Lz1/j3;-><init>(Lu4/l;)V

    .line 67
    .line 68
    .line 69
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->mapToInt(Ljava/util/function/ToIntFunction;)Ljava/util/stream/IntStream;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-interface {p1}, Ljava/util/stream/IntStream;->distinct()Ljava/util/stream/IntStream;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    new-instance v0, Lz1/k3;

    .line 78
    .line 79
    invoke-direct {v0, p0}, Lz1/k3;-><init>(Lz1/o3;)V

    .line 80
    .line 81
    .line 82
    invoke-interface {p1, v0}, Ljava/util/stream/IntStream;->mapToObj(Ljava/util/function/IntFunction;)Ljava/util/stream/Stream;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    new-instance v0, Lz1/l3;

    .line 87
    .line 88
    invoke-direct {v0}, Lz1/l3;-><init>()V

    .line 89
    .line 90
    .line 91
    new-instance v1, Lz1/m3;

    .line 92
    .line 93
    invoke-direct {v1, v0}, Lz1/m3;-><init>(Lu4/l;)V

    .line 94
    .line 95
    .line 96
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    new-instance v0, Lz1/n3;

    .line 101
    .line 102
    invoke-direct {v0, p0}, Lz1/n3;-><init>(Lz1/o3;)V

    .line 103
    .line 104
    .line 105
    new-instance p0, Lz1/S2;

    .line 106
    .line 107
    invoke-direct {p0, v0}, Lz1/S2;-><init>(Lu4/l;)V

    .line 108
    .line 109
    .line 110
    invoke-interface {p1, p0}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public final P(Ljava/util/function/Predicate;Ljava/lang/String;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "matcher"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lz1/o3;->Y()Lz1/J3;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0, p1, p2}, Lz1/J3;->D(Ljava/util/function/Predicate;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object p2, Lz1/t1;->f:Lcom/android/launcher3/util/I;

    .line 14
    .line 15
    iget-object v0, p0, Lz1/o3;->a:Landroid/content/Context;

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    check-cast p2, Lz1/t1;

    .line 22
    .line 23
    invoke-virtual {p2}, Lz1/t1;->r()Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_3

    .line 28
    .line 29
    const-string p2, "ModelTaskController"

    .line 30
    .line 31
    const-string v0, "deleteAndBindComponentsRemoved isLoaderRunning"

    .line 32
    .line 33
    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iget-object p2, p0, Lz1/o3;->e:Lcom/android/launcher3/D3;

    .line 37
    .line 38
    invoke-virtual {p2}, Lcom/android/launcher3/D3;->g0()[Lz1/y0$b;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    array-length v0, p2

    .line 43
    const/4 v1, 0x0

    .line 44
    :goto_0
    if-ge v1, v0, :cond_2

    .line 45
    .line 46
    aget-object v2, p2, v1

    .line 47
    .line 48
    instance-of v3, v2, Lcom/android/launcher3/C2;

    .line 49
    .line 50
    if-eqz v3, :cond_0

    .line 51
    .line 52
    move-object v3, v2

    .line 53
    check-cast v3, Lcom/android/launcher3/C2;

    .line 54
    .line 55
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->h2()Lcom/android/launcher3/B4;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-virtual {v4}, Lcom/android/launcher3/B4;->v()Lcom/android/launcher3/util/Y2;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    if-eqz v4, :cond_0

    .line 64
    .line 65
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->h2()Lcom/android/launcher3/B4;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-virtual {v4}, Lcom/android/launcher3/B4;->v()Lcom/android/launcher3/util/Y2;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    if-eqz v4, :cond_0

    .line 74
    .line 75
    invoke-virtual {v4}, Lcom/android/launcher3/util/Y2;->f()Z

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    if-nez v4, :cond_0

    .line 80
    .line 81
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->h2()Lcom/android/launcher3/B4;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-virtual {v3}, Lcom/android/launcher3/B4;->v()Lcom/android/launcher3/util/Y2;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    if-eqz v3, :cond_1

    .line 90
    .line 91
    new-instance v4, Lz1/U2;

    .line 92
    .line 93
    invoke-direct {v4, v2, p1}, Lz1/U2;-><init>(Lz1/y0$b;Ljava/util/function/Predicate;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/Y2;->a(Ljava/lang/Runnable;)V

    .line 97
    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_0
    new-instance v3, Lz1/V2;

    .line 101
    .line 102
    invoke-direct {v3, p1}, Lz1/V2;-><init>(Ljava/util/function/Predicate;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, v3, v2}, Lz1/o3;->b0(Lcom/android/launcher3/D3$a;Lz1/y0$b;)V

    .line 106
    .line 107
    .line 108
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_2
    return-void

    .line 112
    :cond_3
    new-instance p2, Lz1/W2;

    .line 113
    .line 114
    invoke-direct {p2, p1}, Lz1/W2;-><init>(Ljava/util/function/Predicate;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0, p2}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public final T(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lz1/e3;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lz1/e3;-><init>(Ljava/util/ArrayList;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final V()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/o3;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public final W()Ls1/P;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/o3;->b:Ls1/P;

    .line 2
    .line 3
    return-object p0
.end method

.method public final X()Lcom/android/launcher3/D3;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/o3;->e:Lcom/android/launcher3/D3;

    .line 2
    .line 3
    return-object p0
.end method

.method public final Y()Lz1/J3;
    .locals 3

    .line 1
    iget-object p0, p0, Lz1/o3;->e:Lcom/android/launcher3/D3;

    .line 2
    .line 3
    sget-object v0, Lc1/c;->c:Lc1/c;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-virtual {p0, v2, v0, v1}, Lcom/android/launcher3/D3;->o0(ZLc1/c;Lz1/y0$b;)Lz1/J3;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final Z(Lcom/android/launcher3/D3$a;)V
    .locals 6

    .line 1
    const-string v0, "task"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lz1/o3;->e:Lcom/android/launcher3/D3;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->g0()[Lz1/y0$b;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    array-length v1, v0

    .line 13
    const/4 v2, 0x0

    .line 14
    :goto_0
    if-ge v2, v1, :cond_0

    .line 15
    .line 16
    aget-object v3, v0, v2

    .line 17
    .line 18
    iget-object v4, p0, Lz1/o3;->f:Lcom/android/launcher3/util/p1;

    .line 19
    .line 20
    new-instance v5, Lz1/R2;

    .line 21
    .line 22
    invoke-direct {v5, p1, v3}, Lz1/R2;-><init>(Lcom/android/launcher3/D3$a;Lz1/y0$b;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v4, v5}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    add-int/lit8 v2, v2, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method

.method public final b0(Lcom/android/launcher3/D3$a;Lz1/y0$b;)V
    .locals 1

    .line 1
    const-string v0, "task"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lz1/o3;->f:Lcom/android/launcher3/util/p1;

    .line 7
    .line 8
    new-instance v0, Lz1/d3;

    .line 9
    .line 10
    invoke-direct {v0, p1, p2}, Lz1/d3;-><init>(Lcom/android/launcher3/D3$a;Lz1/y0$b;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final d0(Ljava/util/HashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "packageVisibilityMap"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lz1/Z2;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Lz1/Z2;-><init>(Ljava/util/HashMap;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final f0(Z)V
    .locals 1

    .line 1
    new-instance v0, Lz1/g3;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lz1/g3;-><init>(Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final h0(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "packages"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lz1/Y2;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Lz1/Y2;-><init>(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final j0(Ljava/util/List;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lz1/c3;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lz1/c3;-><init>(Ljava/util/List;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final l0(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lz1/f3;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lz1/f3;-><init>(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final x(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    .line 4
    .line 5
    iget-object v1, p0, Lz1/o3;->a:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->M0()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lz1/o3;->e:Lcom/android/launcher3/D3;

    .line 25
    .line 26
    new-instance v1, Lx1/O$b;

    .line 27
    .line 28
    iget-object p0, p0, Lz1/o3;->a:Landroid/content/Context;

    .line 29
    .line 30
    invoke-direct {v1, p1, p0}, Lx1/O$b;-><init>(Ljava/util/ArrayList;Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Lx1/O$b;->b()Ljava/util/ArrayList;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string p1, "get(...)"

    .line 38
    .line 39
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, p0}, Lcom/android/launcher3/D3;->L(Ljava/util/List;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    const-string p0, "ModelTaskController"

    .line 47
    .line 48
    const-string p1, "bindAddedWorkspaceItems do nothing "

    .line 49
    .line 50
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final y()V
    .locals 9

    .line 1
    iget-object v0, p0, Lz1/o3;->d:Lz1/m;

    .line 2
    .line 3
    invoke-virtual {v0}, Lz1/m;->o()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lz1/o3;->d:Lz1/m;

    .line 10
    .line 11
    invoke-virtual {v0}, Lz1/m;->i()[Lcom/android/launcher3/model/data/d;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lz1/o3;->d:Lz1/m;

    .line 16
    .line 17
    invoke-virtual {v1}, Lz1/m;->p()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    array-length v2, v0

    .line 25
    invoke-static {v2}, Li4/F;->a(I)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/16 v3, 0x10

    .line 30
    .line 31
    invoke-static {v2, v3}, LA4/d;->c(II)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    new-instance v3, Ljava/util/LinkedHashMap;

    .line 36
    .line 37
    invoke-direct {v3, v2}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 38
    .line 39
    .line 40
    array-length v2, v0

    .line 41
    const/4 v4, 0x0

    .line 42
    :goto_0
    if-ge v4, v2, :cond_0

    .line 43
    .line 44
    aget-object v5, v0, v4

    .line 45
    .line 46
    new-instance v6, Lcom/android/launcher3/util/L1;

    .line 47
    .line 48
    iget-object v7, v5, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 49
    .line 50
    invoke-static {v7}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v7}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v7

    .line 57
    iget-object v8, v5, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 58
    .line 59
    invoke-direct {v6, v7, v8}, Lcom/android/launcher3/util/L1;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 60
    .line 61
    .line 62
    iget v5, v5, Lcom/android/launcher3/model/data/d;->n:I

    .line 63
    .line 64
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-interface {v3, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    add-int/lit8 v4, v4, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    new-instance v2, Lz1/b3;

    .line 75
    .line 76
    invoke-direct {v2, v0, v1, v3}, Lz1/b3;-><init>([Lcom/android/launcher3/model/data/d;ILjava/util/Map;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, v2}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void
.end method
