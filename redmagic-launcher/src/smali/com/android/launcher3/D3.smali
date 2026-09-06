.class public final Lcom/android/launcher3/D3;
.super Ljava/lang/Object;
.source "LauncherModel.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/D3$a;,
        Lcom/android/launcher3/D3$b;,
        Lcom/android/launcher3/D3$c;,
        Lcom/android/launcher3/D3$d;
    }
.end annotation


# static fields
.field public static final D:Lcom/android/launcher3/D3$b;

.field public static final E:Lcom/android/launcher3/X;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/X<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private A:LR1/h;

.field private final B:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private C:LR0/k;

.field private final a:Landroid/content/Context;

.field private final b:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lz1/o3;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Ls1/P;

.field private final d:Lcom/android/launcher3/J3;

.field private final e:Lz1/t1;

.field private final f:Lcom/android/launcher3/util/K;

.field private final g:Lz1/m2;

.field private final h:Lz1/m;

.field private final i:Lz1/y0;

.field private final j:Lz1/c2$a;

.field private final k:Lz1/O$a;

.field private final l:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lz1/z5;",
            ">;"
        }
    .end annotation
.end field

.field private final m:Lz1/k2;

.field private final n:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lz1/y0$b;",
            ">;"
        }
    .end annotation
.end field

.field private final o:Ljava/lang/Object;

.field private p:Lz1/c2;

.field private q:Z

.field private r:Z

.field private s:Z

.field private t:Z

.field private u:I

.field private final v:Ljava/lang/Runnable;

.field private w:Lcom/android/launcher3/c1;

.field private x:Z

.field private y:Z

.field private final z:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lx1/x;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lcom/android/launcher3/D3$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/D3$b;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/D3;->D:Lcom/android/launcher3/D3$b;

    .line 8
    .line 9
    sget-object v2, Lcom/android/launcher3/J3;->c:Lcom/android/launcher3/J3$a;

    .line 10
    .line 11
    const/4 v6, 0x4

    .line 12
    const/4 v7, 0x0

    .line 13
    const-string v3, "launcher_fota_flag_string"

    .line 14
    .line 15
    const-string v4, ""

    .line 16
    .line 17
    const/4 v5, 0x0

    .line 18
    invoke-static/range {v2 .. v7}, Lcom/android/launcher3/J3$a;->i(Lcom/android/launcher3/J3$a;Ljava/lang/String;Ljava/lang/Object;Lcom/android/launcher3/r0;ILjava/lang/Object;)Lcom/android/launcher3/X;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Lcom/android/launcher3/D3;->E:Lcom/android/launcher3/X;

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lg4/a;Ls1/P;Lcom/android/launcher3/J3;Lz1/t1;Ljava/lang/String;Lz1/L2;Lcom/android/launcher3/util/K;Lz1/m2;Lz1/m;Lz1/y0;Lz1/c2$a;Lz1/O$a;Lg4/a;Lz1/k2;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lg4/a<",
            "Lz1/o3;",
            ">;",
            "Ls1/P;",
            "Lcom/android/launcher3/J3;",
            "Lz1/t1;",
            "Ljava/lang/String;",
            "Lz1/L2;",
            "Lcom/android/launcher3/util/K;",
            "Lz1/m2;",
            "Lz1/m;",
            "Lz1/y0;",
            "Lz1/c2$a;",
            "Lz1/O$a;",
            "Lg4/a<",
            "Lz1/z5;",
            ">;",
            "Lz1/k2;",
            ")V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    move-object/from16 v8, p9

    move-object/from16 v9, p10

    move-object/from16 v10, p11

    move-object/from16 v11, p12

    move-object/from16 v12, p13

    move-object/from16 v13, p14

    move-object/from16 v14, p15

    const-string v15, "context"

    invoke-static {v1, v15}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v15, "taskControllerProvider"

    invoke-static {v2, v15}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v15, "iconCache"

    invoke-static {v3, v15}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v15, "prefs"

    invoke-static {v4, v15}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v15, "installQueue"

    invoke-static {v5, v15}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v15, "initializer"

    invoke-static {v6, v15}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v15, "lifecycle"

    invoke-static {v7, v15}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v15, "modelDelegate"

    invoke-static {v8, v15}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v15, "mBgAllAppsList"

    invoke-static {v9, v15}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v15, "mBgDataModel"

    invoke-static {v10, v15}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v15, "loaderFactory"

    invoke-static {v11, v15}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v15, "binderFactory"

    invoke-static {v12, v15}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v15, "spaceFinderFactory"

    invoke-static {v13, v15}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v15, "modelDbController"

    invoke-static {v14, v15}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object v1, v0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 3
    iput-object v2, v0, Lcom/android/launcher3/D3;->b:Lg4/a;

    .line 4
    iput-object v3, v0, Lcom/android/launcher3/D3;->c:Ls1/P;

    .line 5
    iput-object v4, v0, Lcom/android/launcher3/D3;->d:Lcom/android/launcher3/J3;

    .line 6
    iput-object v5, v0, Lcom/android/launcher3/D3;->e:Lz1/t1;

    .line 7
    iput-object v7, v0, Lcom/android/launcher3/D3;->f:Lcom/android/launcher3/util/K;

    .line 8
    iput-object v8, v0, Lcom/android/launcher3/D3;->g:Lz1/m2;

    .line 9
    iput-object v9, v0, Lcom/android/launcher3/D3;->h:Lz1/m;

    .line 10
    iput-object v10, v0, Lcom/android/launcher3/D3;->i:Lz1/y0;

    .line 11
    iput-object v11, v0, Lcom/android/launcher3/D3;->j:Lz1/c2$a;

    .line 12
    iput-object v12, v0, Lcom/android/launcher3/D3;->k:Lz1/O$a;

    .line 13
    iput-object v13, v0, Lcom/android/launcher3/D3;->l:Lg4/a;

    .line 14
    iput-object v14, v0, Lcom/android/launcher3/D3;->m:Lz1/k2;

    .line 15
    new-instance v2, Ljava/util/ArrayList;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, v0, Lcom/android/launcher3/D3;->n:Ljava/util/ArrayList;

    .line 16
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, v0, Lcom/android/launcher3/D3;->o:Ljava/lang/Object;

    .line 17
    iput-boolean v3, v0, Lcom/android/launcher3/D3;->r:Z

    const/4 v2, -0x1

    .line 18
    iput v2, v0, Lcom/android/launcher3/D3;->u:I

    .line 19
    new-instance v2, Lcom/android/launcher3/w3;

    invoke-direct {v2, v0}, Lcom/android/launcher3/w3;-><init>(Lcom/android/launcher3/D3;)V

    iput-object v2, v0, Lcom/android/launcher3/D3;->v:Ljava/lang/Runnable;

    .line 20
    new-instance v2, Ljava/util/ArrayList;

    const/16 v4, 0x64

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, v0, Lcom/android/launcher3/D3;->z:Ljava/util/ArrayList;

    .line 21
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v0, Lcom/android/launcher3/D3;->B:Ljava/util/List;

    if-eqz p6, :cond_1

    .line 22
    invoke-interface/range {p6 .. p6}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {v6, v0}, Lz1/L2;->x(Lcom/android/launcher3/D3;)V

    .line 24
    :cond_1
    :goto_0
    new-instance v2, Lcom/android/launcher3/x3;

    invoke-direct {v2, v0}, Lcom/android/launcher3/x3;-><init>(Lcom/android/launcher3/D3;)V

    invoke-virtual {v7, v2}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 25
    invoke-virtual {v8, v0, v9, v10}, Lz1/m2;->d(Lcom/android/launcher3/D3;Lz1/m;Lz1/y0;)V

    .line 26
    new-instance v2, Lcom/android/launcher3/c1;

    invoke-direct {v2, v0}, Lcom/android/launcher3/c1;-><init>(Lcom/android/launcher3/D3;)V

    iput-object v2, v0, Lcom/android/launcher3/D3;->w:Lcom/android/launcher3/c1;

    .line 27
    const-class v2, Landroid/os/UserManager;

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/UserManager;

    .line 28
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    move-result-object v2

    .line 29
    invoke-virtual {v1, v2}, Landroid/os/UserManager;->isUserUnlocked(Landroid/os/UserHandle;)Z

    move-result v1

    .line 30
    iput-boolean v1, v0, Lcom/android/launcher3/D3;->x:Z

    .line 31
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mIsUserUnlocked = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " , "

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Launcher.Model"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    new-instance v1, Lx1/x;

    new-instance v2, Lcom/android/launcher3/y3;

    invoke-direct {v2, v0}, Lcom/android/launcher3/y3;-><init>(Lcom/android/launcher3/D3;)V

    invoke-direct {v1, v2, v3}, Lx1/x;-><init>(Ljava/lang/Runnable;Z)V

    invoke-virtual {v0, v1}, Lcom/android/launcher3/D3;->U0(Lx1/x;)V

    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->c0()LR1/h;

    return-void
.end method

.method public static synthetic A(Lcom/android/launcher3/D3;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/D3;->D(Lcom/android/launcher3/D3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final A0(Lcom/android/launcher3/D3;Landroid/os/UserHandle;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/f3;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher3/f3;-><init>(Lcom/android/launcher3/D3;Landroid/os/UserHandle;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private static final A1(Lcom/android/launcher3/D3;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/D3;->i:Lz1/y0;

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/D3;->s1(Landroid/content/Context;Lz1/y0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic B(Lz1/y0$b;Lcom/android/launcher3/BubbleTextView;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/D3;->T0(Lz1/y0$b;Lcom/android/launcher3/BubbleTextView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final B0(Lcom/android/launcher3/D3;Landroid/os/UserHandle;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, LN1/f;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, v1, p1}, LN1/f;-><init>(Landroid/content/Context;Landroid/os/UserHandle;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, LN1/f;->a(Ljava/lang/String;)LN1/f;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x2

    .line 13
    invoke-virtual {v0, v1}, LN1/f;->d(I)LN1/f$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    new-instance v1, Lz1/D4;

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-direct {v1, p2, v0, p1, v2}, Lz1/D4;-><init>(Ljava/lang/String;Ljava/util/List;Landroid/os/UserHandle;Z)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v1}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method private static final C(Lcom/android/launcher3/D3;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->T()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final D(Lcom/android/launcher3/D3;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lx1/y;->e(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static final synthetic E(Lcom/android/launcher3/D3;)Lz1/c2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/D3;->p:Lz1/c2;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic F(Lcom/android/launcher3/D3;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/D3;->o:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic G(Lcom/android/launcher3/D3;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/D3;->u:I

    .line 2
    .line 3
    return-void
.end method

.method private static final G0(Ljava/util/HashSet;Landroid/os/UserHandle;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 1

    .line 1
    const-string v0, "taskController"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "dataModel"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "<unused var>"

    .line 12
    .line 13
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p4, p3, Lz1/y0;->d:Lz1/u5;

    .line 17
    .line 18
    invoke-virtual {p4, p0, p1}, Lz1/u5;->s(Ljava/util/Set;Landroid/os/UserHandle;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2, p3}, Lz1/o3;->E(Lz1/y0;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static final synthetic H(Lcom/android/launcher3/D3;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/D3;->q:Z

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic I(Lcom/android/launcher3/D3;Lz1/c2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/D3;->p:Lz1/c2;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic J(Lcom/android/launcher3/D3;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/D3;->s:Z

    .line 2
    .line 3
    return-void
.end method

.method private static final K0(Lcom/android/launcher3/D3;Lcom/android/launcher3/util/L1;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/d3;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/launcher3/d3;-><init>(Lcom/android/launcher3/util/L1;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static final L0(Lcom/android/launcher3/util/L1;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 1

    .line 1
    const-string v0, "taskController"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "dataModel"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "<unused var>"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p3, p2, Lz1/y0;->d:Lz1/u5;

    .line 17
    .line 18
    invoke-virtual {p3, p0}, Lz1/u5;->v(Lcom/android/launcher3/util/L1;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, p2}, Lz1/o3;->E(Lz1/y0;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private static final Q0(Ljava/util/function/Predicate;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 1

    .line 1
    const-string v0, "taskController"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "dataModel"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p2, "apps"

    .line 12
    .line 13
    invoke-static {p3, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p2, "verifyApplications--removedWorkspaceItems, not find Activity,delete it"

    .line 17
    .line 18
    invoke-virtual {p1, p0, p2}, Lz1/o3;->P(Ljava/util/function/Predicate;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private static final S(Ljava/util/ArrayList;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 1

    .line 1
    const-string v0, "taskController"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "dataModel"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p2, "apps"

    .line 12
    .line 13
    invoke-static {p3, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p0}, Lz1/o3;->T(Ljava/util/ArrayList;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private static final S0(Lcom/android/launcher3/D3;Lcom/android/launcher3/BubbleTextView;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->g0()[Lz1/y0$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    array-length v0, p0

    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    if-ge v1, v0, :cond_0

    .line 8
    .line 9
    aget-object v2, p0, v1

    .line 10
    .line 11
    sget-object v3, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 12
    .line 13
    new-instance v4, Lcom/android/launcher3/g3;

    .line 14
    .line 15
    invoke-direct {v4, v2, p1}, Lcom/android/launcher3/g3;-><init>(Lz1/y0$b;Lcom/android/launcher3/BubbleTextView;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method private static final T0(Lz1/y0$b;Lcom/android/launcher3/BubbleTextView;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lz1/y0$b;->H(Lcom/android/launcher3/BubbleTextView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final U(Lcom/android/launcher3/D3;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/D3;->g:Lz1/m2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lz1/m2;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private static final X(Lcom/android/launcher3/D3;Lcom/android/launcher3/D3$d;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->s0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/D3;->b:Lg4/a;

    .line 9
    .line 10
    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "get(...)"

    .line 15
    .line 16
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    check-cast v0, Lz1/o3;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/D3;->i:Lz1/y0;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/D3;->h:Lz1/m;

    .line 24
    .line 25
    invoke-interface {p1, v0, v1, p0}, Lcom/android/launcher3/D3$d;->a(Lz1/o3;Lz1/y0;Lz1/m;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private final X0(Landroid/content/Context;)V
    .locals 9

    .line 1
    const-string p0, "get(...)"

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    const-string v1, "Launcher.Model"

    .line 6
    .line 7
    :try_start_0
    sget-object v2, Lcom/android/launcher3/J3;->c:Lcom/android/launcher3/J3$a;

    .line 8
    .line 9
    invoke-virtual {v2, p1}, Lcom/android/launcher3/J3$a;->e(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    sget-object v4, Lcom/android/launcher3/D3;->E:Lcom/android/launcher3/X;

    .line 14
    .line 15
    invoke-virtual {v3, v4}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    check-cast v3, Ljava/lang/String;

    .line 20
    .line 21
    const-string v5, "ro.boot.slot_suffix"

    .line 22
    .line 23
    invoke-static {v5, v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    invoke-static {v5, p0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance v6, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v7, "startFotaActivityWhenUserSetupComplete: old fota flag: "

    .line 36
    .line 37
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v7, ", new: "

    .line 44
    .line 45
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    invoke-static {v1, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    .line 59
    .line 60
    .line 61
    move-result v6

    .line 62
    if-nez v6, :cond_0

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    invoke-static {v3, v5}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-nez v3, :cond_2

    .line 70
    .line 71
    :goto_0
    new-instance v3, Landroid/content/Intent;

    .line 72
    .line 73
    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 74
    .line 75
    .line 76
    const-string v6, "from_module"

    .line 77
    .line 78
    const-string v7, "Launcher"

    .line 79
    .line 80
    invoke-virtual {v3, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 81
    .line 82
    .line 83
    const-string v6, "ZTE_SETUPWIZARD_CUSTOM_CONFIG"

    .line 84
    .line 85
    invoke-static {v6, v0}, Lcom/zte/feature/Feature;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-static {v0, p0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    const-string p0, "setupwizardfota"

    .line 93
    .line 94
    const/4 v6, 0x2

    .line 95
    const/4 v7, 0x0

    .line 96
    const/4 v8, 0x0

    .line 97
    invoke-static {v0, p0, v8, v6, v7}, LD4/g;->y(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    if-eqz p0, :cond_1

    .line 102
    .line 103
    const-string p0, "com.zte.setupwizard/.SetupWizardFotaActivity"

    .line 104
    .line 105
    invoke-static {p0}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {v3, p0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 110
    .line 111
    .line 112
    goto :goto_1

    .line 113
    :catch_0
    move-exception p0

    .line 114
    goto :goto_2

    .line 115
    :cond_1
    const-string p0, "com.zte.userguide/.activity.IntroductionActivity"

    .line 116
    .line 117
    invoke-static {p0}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {v3, p0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 122
    .line 123
    .line 124
    :goto_1
    const/high16 p0, 0x10000000

    .line 125
    .line 126
    invoke-virtual {v3, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v3}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    new-instance v0, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .line 137
    .line 138
    const-string v6, "startFotaActivityWhenUserSetupComplete: start fota activity, cm: "

    .line 139
    .line 140
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    invoke-virtual {p1, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v2, p1}, Lcom/android/launcher3/J3$a;->e(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-virtual {p0, v4, v5}, Lcom/android/launcher3/J3;->s(Lcom/android/launcher3/H1;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :goto_2
    const-string p1, "startFotaActivityWhenUserSetupComplete: start activity fail: "

    .line 165
    .line 166
    invoke-static {v1, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 167
    .line 168
    .line 169
    :cond_2
    return-void
.end method

.method private final Y0(Landroid/content/Context;)V
    .locals 3

    .line 1
    :try_start_0
    const-string v0, "user_setup_complete"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/util/p2;->n:Lcom/android/launcher3/util/I;

    .line 8
    .line 9
    invoke-virtual {v1, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lcom/android/launcher3/util/p2;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {v1, v0, v2}, Lcom/android/launcher3/util/p2;->g(Landroid/net/Uri;I)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-direct {p0, p1}, Lcom/android/launcher3/D3;->X0(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :catch_0
    move-exception p0

    .line 27
    const-string p1, "Launcher.Model"

    .line 28
    .line 29
    const-string v0, "startFotaActivityWhenUserUnlock: "

    .line 30
    .line 31
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/D3;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/D3;->w0(Lcom/android/launcher3/D3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final a1([Lz1/y0$b;)Z
    .locals 11

    .line 1
    const/4 v0, 0x1

    .line 2
    iget-object v1, p0, Lcom/android/launcher3/D3;->e:Lz1/t1;

    .line 3
    .line 4
    const/4 v2, 0x2

    .line 5
    invoke-virtual {v1, v2}, Lz1/t1;->w(I)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/launcher3/D3;->o:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v1

    .line 11
    :try_start_0
    invoke-direct {p0}, Lcom/android/launcher3/D3;->c1()Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    const/4 v5, 0x0

    .line 20
    if-eqz v4, :cond_1

    .line 21
    .line 22
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    if-eqz v4, :cond_1

    .line 31
    .line 32
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-virtual {v4}, Lcom/android/launcher3/q4;->X()Z

    .line 41
    .line 42
    .line 43
    move-result v6

    .line 44
    if-nez v6, :cond_0

    .line 45
    .line 46
    invoke-virtual {v4}, Lcom/android/launcher3/q4;->P()Z

    .line 47
    .line 48
    .line 49
    move-result v6

    .line 50
    if-nez v6, :cond_0

    .line 51
    .line 52
    invoke-virtual {v4}, Lcom/android/launcher3/q4;->O()Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-eqz v4, :cond_1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :catchall_0
    move-exception p0

    .line 60
    goto/16 :goto_a

    .line 61
    .line 62
    :cond_0
    :goto_0
    const-string v4, "Launcher.Model"

    .line 63
    .line 64
    const-string v6, "startLoader: mModelLoaded = false;"

    .line 65
    .line 66
    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    iput-boolean v5, p0, Lcom/android/launcher3/D3;->s:Z

    .line 70
    .line 71
    :cond_1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-virtual {v4}, Lcom/android/launcher3/resource/B;->A()Z

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    if-eqz v4, :cond_2

    .line 80
    .line 81
    iput-boolean v5, p0, Lcom/android/launcher3/D3;->s:Z

    .line 82
    .line 83
    :cond_2
    const-string v4, "Launcher.Model"

    .line 84
    .line 85
    iget-boolean v6, p0, Lcom/android/launcher3/D3;->s:Z

    .line 86
    .line 87
    iget-boolean v7, p0, Lcom/android/launcher3/D3;->q:Z

    .line 88
    .line 89
    new-instance v8, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 92
    .line 93
    .line 94
    const-string v9, "startLoader mModelLoaded: "

    .line 95
    .line 96
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v6, " ,mIsLoaderTaskRunning: "

    .line 103
    .line 104
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v6

    .line 114
    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    iget-boolean v4, p0, Lcom/android/launcher3/D3;->s:Z

    .line 118
    .line 119
    if-eqz v4, :cond_3

    .line 120
    .line 121
    iget-boolean v4, p0, Lcom/android/launcher3/D3;->q:Z

    .line 122
    .line 123
    if-nez v4, :cond_3

    .line 124
    .line 125
    move v4, v0

    .line 126
    goto :goto_1

    .line 127
    :cond_3
    move v4, v5

    .line 128
    :goto_1
    if-nez v3, :cond_5

    .line 129
    .line 130
    if-eqz v4, :cond_5

    .line 131
    .line 132
    array-length v3, p1

    .line 133
    if-nez v3, :cond_4

    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_4
    move v3, v5

    .line 137
    goto :goto_3

    .line 138
    :cond_5
    :goto_2
    move v3, v0

    .line 139
    :goto_3
    if-eqz v3, :cond_6

    .line 140
    .line 141
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->g0()[Lz1/y0$b;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    :cond_6
    array-length v6, p1

    .line 146
    if-nez v6, :cond_7

    .line 147
    .line 148
    move v6, v0

    .line 149
    goto :goto_4

    .line 150
    :cond_7
    move v6, v5

    .line 151
    :goto_4
    if-nez v6, :cond_f

    .line 152
    .line 153
    array-length v6, p1

    .line 154
    move v7, v5

    .line 155
    :goto_5
    if-ge v7, v6, :cond_8

    .line 156
    .line 157
    aget-object v8, p1, v7

    .line 158
    .line 159
    sget-object v9, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 160
    .line 161
    new-instance v10, Lcom/android/launcher3/Y2;

    .line 162
    .line 163
    invoke-direct {v10, v8}, Lcom/android/launcher3/Y2;-><init>(Lz1/y0$b;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v9, v10}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 167
    .line 168
    .line 169
    add-int/2addr v7, v0

    .line 170
    goto :goto_5

    .line 171
    :cond_8
    iget-object v6, p0, Lcom/android/launcher3/D3;->k:Lz1/O$a;

    .line 172
    .line 173
    invoke-interface {v6, p1}, Lz1/O$a;->a([Lz1/y0$b;)Lz1/O;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    if-eqz v4, :cond_e

    .line 178
    .line 179
    const-string v4, "Launcher.Model"

    .line 180
    .line 181
    const-string v6, "startLoader: only bind"

    .line 182
    .line 183
    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    .line 185
    .line 186
    invoke-static {}, Lx1/O;->k1()Z

    .line 187
    .line 188
    .line 189
    move-result v4

    .line 190
    if-eqz v4, :cond_c

    .line 191
    .line 192
    sget-object v4, Lcom/android/launcher3/J3;->c:Lcom/android/launcher3/J3$a;

    .line 193
    .line 194
    iget-object v6, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 195
    .line 196
    invoke-virtual {v4, v6}, Lcom/android/launcher3/J3$a;->g(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 197
    .line 198
    .line 199
    move-result-object v4

    .line 200
    const-string v6, "screen_orientation"

    .line 201
    .line 202
    invoke-interface {v4, v6, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 203
    .line 204
    .line 205
    move-result v4

    .line 206
    sget-object v6, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    .line 207
    .line 208
    iget-object v7, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 209
    .line 210
    invoke-virtual {v6, v7}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 211
    .line 212
    .line 213
    move-result-object v7

    .line 214
    invoke-virtual {v7}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 215
    .line 216
    .line 217
    move-result-object v7

    .line 218
    iget-object v8, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 219
    .line 220
    invoke-virtual {v7, v8}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 221
    .line 222
    .line 223
    move-result-object v7

    .line 224
    iget-boolean v7, v7, Lcom/android/launcher3/h0;->N0:Z

    .line 225
    .line 226
    if-eqz v7, :cond_9

    .line 227
    .line 228
    move v7, v2

    .line 229
    goto :goto_6

    .line 230
    :cond_9
    move v7, v0

    .line 231
    :goto_6
    const-string v8, "Launcher.Model"

    .line 232
    .line 233
    new-instance v9, Ljava/lang/StringBuilder;

    .line 234
    .line 235
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 236
    .line 237
    .line 238
    const-string v10, "bindDirectly: ,oldOrientation = "

    .line 239
    .line 240
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    const-string v10, " ,currentOrientation = "

    .line 247
    .line 248
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v9

    .line 258
    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    .line 260
    .line 261
    if-eq v4, v7, :cond_c

    .line 262
    .line 263
    iget-object v4, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 264
    .line 265
    invoke-virtual {v6, v4}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 266
    .line 267
    .line 268
    move-result-object v4

    .line 269
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 270
    .line 271
    .line 272
    move-result-object v4

    .line 273
    invoke-static {v4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {v4}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 277
    .line 278
    .line 279
    move-result-object v4

    .line 280
    iget-object v8, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 281
    .line 282
    invoke-virtual {v6, v8}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 283
    .line 284
    .line 285
    move-result-object v9

    .line 286
    invoke-virtual {v9}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 287
    .line 288
    .line 289
    move-result-object v9

    .line 290
    if-ne v7, v2, :cond_a

    .line 291
    .line 292
    move v5, v0

    .line 293
    :cond_a
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 294
    .line 295
    .line 296
    move-result-object v2

    .line 297
    invoke-virtual {v4, v8, v9, v2}, Lcom/android/launcher3/b0;->n(Landroid/content/Context;Lcom/android/launcher3/F1;Ljava/lang/Boolean;)V

    .line 298
    .line 299
    .line 300
    iget-object v2, p0, Lcom/android/launcher3/D3;->i:Lz1/y0;

    .line 301
    .line 302
    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 303
    :try_start_1
    new-instance v4, Ljava/util/ArrayList;

    .line 304
    .line 305
    iget-object v5, p0, Lcom/android/launcher3/D3;->i:Lz1/y0;

    .line 306
    .line 307
    iget-object v5, v5, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 308
    .line 309
    invoke-virtual {v5}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 310
    .line 311
    .line 312
    move-result-object v5

    .line 313
    invoke-interface {v5}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 314
    .line 315
    .line 316
    move-result-object v5

    .line 317
    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 318
    .line 319
    .line 320
    iget-object v5, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 321
    .line 322
    invoke-virtual {v6, v5}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 323
    .line 324
    .line 325
    move-result-object v5

    .line 326
    new-instance v8, Ljava/util/ArrayList;

    .line 327
    .line 328
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 329
    .line 330
    .line 331
    invoke-static {v5, v4, v8}, La1/d;->C(Lcom/android/launcher3/P2;Ljava/util/ArrayList;Ljava/util/ArrayList;)Z

    .line 332
    .line 333
    .line 334
    move-result v5

    .line 335
    if-eqz v5, :cond_b

    .line 336
    .line 337
    const-string v5, "Launcher.Model"

    .line 338
    .line 339
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 340
    .line 341
    .line 342
    move-result v8

    .line 343
    new-instance v9, Ljava/lang/StringBuilder;

    .line 344
    .line 345
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 346
    .line 347
    .line 348
    const-string v10, "bindDirectly item size: "

    .line 349
    .line 350
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 351
    .line 352
    .line 353
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 354
    .line 355
    .line 356
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 357
    .line 358
    .line 359
    move-result-object v8

    .line 360
    invoke-static {v5, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 361
    .line 362
    .line 363
    iget-object v5, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 364
    .line 365
    invoke-virtual {v6, v5}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 366
    .line 367
    .line 368
    move-result-object v5

    .line 369
    invoke-static {v4, v5, v7}, La1/d;->B(Ljava/util/ArrayList;Lcom/android/launcher3/P2;I)V

    .line 370
    .line 371
    .line 372
    goto :goto_7

    .line 373
    :catchall_1
    move-exception p0

    .line 374
    goto :goto_8

    .line 375
    :cond_b
    :goto_7
    sget-object v4, Lh4/t;->a:Lh4/t;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 376
    .line 377
    :try_start_2
    monitor-exit v2

    .line 378
    goto :goto_9

    .line 379
    :goto_8
    monitor-exit v2

    .line 380
    throw p0

    .line 381
    :cond_c
    :goto_9
    invoke-virtual {p1, v3, v0}, Lz1/O;->H(ZZ)V

    .line 382
    .line 383
    .line 384
    sget-object v2, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    .line 385
    .line 386
    iget-object v3, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 387
    .line 388
    invoke-virtual {v2, v3}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 389
    .line 390
    .line 391
    move-result-object v3

    .line 392
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 393
    .line 394
    .line 395
    move-result-object v3

    .line 396
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 397
    .line 398
    .line 399
    invoke-virtual {v3}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 400
    .line 401
    .line 402
    move-result-object v3

    .line 403
    invoke-virtual {v3}, Lcom/android/launcher3/b0;->h()Ljava/util/ArrayList;

    .line 404
    .line 405
    .line 406
    move-result-object v3

    .line 407
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 408
    .line 409
    .line 410
    move-result v3

    .line 411
    if-lez v3, :cond_d

    .line 412
    .line 413
    iget-object v3, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 414
    .line 415
    invoke-virtual {v2, v3}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 416
    .line 417
    .line 418
    move-result-object v2

    .line 419
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 420
    .line 421
    .line 422
    move-result-object v2

    .line 423
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 424
    .line 425
    .line 426
    invoke-virtual {v2}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 427
    .line 428
    .line 429
    move-result-object v2

    .line 430
    invoke-virtual {v2, p0}, Lcom/android/launcher3/b0;->c(Lcom/android/launcher3/D3;)V

    .line 431
    .line 432
    .line 433
    :cond_d
    invoke-virtual {p1}, Lz1/O;->A()V

    .line 434
    .line 435
    .line 436
    invoke-virtual {p1}, Lz1/O;->C()V

    .line 437
    .line 438
    .line 439
    invoke-virtual {p1}, Lz1/O;->G()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 440
    .line 441
    .line 442
    monitor-exit v1

    .line 443
    return v0

    .line 444
    :cond_e
    :try_start_3
    const-string v0, "Launcher.Model"

    .line 445
    .line 446
    new-instance v2, Ljava/lang/Throwable;

    .line 447
    .line 448
    invoke-direct {v2}, Ljava/lang/Throwable;-><init>()V

    .line 449
    .line 450
    .line 451
    invoke-static {v2}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 452
    .line 453
    .line 454
    move-result-object v2

    .line 455
    new-instance v3, Ljava/lang/StringBuilder;

    .line 456
    .line 457
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 458
    .line 459
    .line 460
    const-string v4, "startLoader: startLoaderForResults "

    .line 461
    .line 462
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 463
    .line 464
    .line 465
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 466
    .line 467
    .line 468
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 469
    .line 470
    .line 471
    move-result-object v2

    .line 472
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 473
    .line 474
    .line 475
    iget-object v0, p0, Lcom/android/launcher3/D3;->j:Lz1/c2$a;

    .line 476
    .line 477
    new-instance v2, Lz1/L4;

    .line 478
    .line 479
    invoke-direct {v2}, Lz1/L4;-><init>()V

    .line 480
    .line 481
    .line 482
    invoke-interface {v0, p1, v2}, Lz1/c2$a;->a(Lz1/O;Lz1/L4;)Lz1/c2;

    .line 483
    .line 484
    .line 485
    move-result-object p1

    .line 486
    iput-object p1, p0, Lcom/android/launcher3/D3;->p:Lz1/c2;

    .line 487
    .line 488
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 489
    .line 490
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 491
    .line 492
    .line 493
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 494
    .line 495
    .line 496
    new-instance p1, Lcom/android/launcher3/j3;

    .line 497
    .line 498
    invoke-direct {p1, p0}, Lcom/android/launcher3/j3;-><init>(Lcom/android/launcher3/D3;)V

    .line 499
    .line 500
    .line 501
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 502
    .line 503
    .line 504
    :cond_f
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 505
    .line 506
    monitor-exit v1

    .line 507
    return v5

    .line 508
    :goto_a
    monitor-exit v1

    .line 509
    throw p0
.end method

.method public static synthetic b(Lcom/android/launcher3/D3;Lcom/android/launcher3/util/L1;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/D3;->K0(Lcom/android/launcher3/D3;Lcom/android/launcher3/util/L1;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final b1(Lcom/android/launcher3/D3;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/J3;->c:Lcom/android/launcher3/J3$a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/J3$a;->f(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "shortcut_load_completed_after_user_lock_state_changed"

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    new-instance v0, Lz1/I4;

    .line 19
    .line 20
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-direct {v0, v1, v2}, Lz1/I4;-><init>(Landroid/os/UserHandle;Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Lz1/K4;

    .line 31
    .line 32
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-direct {v0, v1, v2}, Lz1/K4;-><init>(Landroid/os/UserHandle;Z)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/D3;Landroid/os/UserHandle;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/D3;->B0(Lcom/android/launcher3/D3;Landroid/os/UserHandle;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final c1()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/D3;->o:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/android/launcher3/D3;->p:Lz1/c2;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    iput-object v2, p0, Lcom/android/launcher3/D3;->p:Lz1/c2;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Lz1/c2;->t0()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    monitor-exit v0

    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    monitor-exit v0

    .line 20
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :goto_0
    monitor-exit v0

    .line 23
    throw p0
.end method

.method public static synthetic d(Lcom/android/launcher3/D3;ZLz1/o3;Lz1/y0;Lz1/m;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/launcher3/D3;->i1(Lcom/android/launcher3/D3;ZLz1/o3;Lz1/y0;Lz1/m;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/D3;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/D3;->A1(Lcom/android/launcher3/D3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lz1/y0$b;Ljava/util/function/Predicate;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/D3;->u1(Lz1/y0$b;Ljava/util/function/Predicate;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final f1(Lcom/android/launcher3/model/data/I;Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/D3;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 1

    .line 1
    const-string v0, "taskController"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "<unused var>"

    .line 7
    .line 8
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p4, p2, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 15
    .line 16
    invoke-virtual {p0, p1, p4}, Lcom/android/launcher3/model/data/I;->i0(Landroid/content/pm/ShortcutInfo;Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    iget-object p2, p2, Lcom/android/launcher3/D3;->c:Ls1/P;

    .line 20
    .line 21
    invoke-virtual {p2, p0, p1}, Ls1/P;->A0(Lcom/android/launcher3/model/data/z;Landroid/content/pm/ShortcutInfo;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p3}, Lz1/o3;->Y()Lz1/J3;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1, p0}, Lz1/J3;->b0(Lcom/android/launcher3/model/data/y;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p0}, Li4/m;->d(Ljava/lang/Object;)Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p3, p0}, Lz1/o3;->G(Ljava/util/Collection;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static synthetic g(Ljava/util/List;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/launcher3/D3;->r1(Ljava/util/List;Lz1/o3;Lz1/y0;Lz1/m;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final g1(Ljava/util/function/Supplier;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 0

    .line 1
    const-string p2, "taskController"

    .line 2
    .line 3
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/android/launcher3/model/data/I;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Lz1/o3;->Y()Lz1/J3;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p2, p0}, Lz1/J3;->b0(Lcom/android/launcher3/model/data/y;)V

    .line 19
    .line 20
    .line 21
    new-instance p2, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, p2}, Lz1/o3;->G(Ljava/util/Collection;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public static synthetic h(Ljava/util/List;ZLz1/o3;Lz1/y0;Lz1/m;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/launcher3/D3;->o1(Ljava/util/List;ZLz1/o3;Lz1/y0;Lz1/m;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/android/launcher3/util/L1;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/launcher3/D3;->L0(Lcom/android/launcher3/util/L1;Lz1/o3;Lz1/y0;Lz1/m;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final i1(Lcom/android/launcher3/D3;ZLz1/o3;Lz1/y0;Lz1/m;)V
    .locals 1

    .line 1
    const-string v0, "taskController"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "dataModel"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p3, "apps"

    .line 12
    .line 13
    invoke-static {p4, p3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 17
    .line 18
    const/4 p3, 0x1

    .line 19
    invoke-static {p0, p3}, Lx1/O;->K2(Landroid/content/Context;Z)Z

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2, p1}, Lz1/o3;->f0(Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic j(Lcom/android/launcher3/D3;Lcom/android/launcher3/D3$d;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/D3;->X(Lcom/android/launcher3/D3;Lcom/android/launcher3/D3$d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Ljava/util/ArrayList;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/launcher3/D3;->S(Ljava/util/ArrayList;Lz1/o3;Lz1/y0;Lz1/m;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Lcom/android/launcher3/model/data/I;Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/D3;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p5}, Lcom/android/launcher3/D3;->f1(Lcom/android/launcher3/model/data/I;Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/D3;Lz1/o3;Lz1/y0;Lz1/m;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final l1(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .line 1
    const-string v0, "obj"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x1

    .line 11
    sub-int/2addr v0, v1

    .line 12
    const/4 v2, 0x0

    .line 13
    move v3, v2

    .line 14
    move v4, v3

    .line 15
    :goto_0
    if-gt v3, v0, :cond_5

    .line 16
    .line 17
    if-nez v4, :cond_0

    .line 18
    .line 19
    move v5, v3

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    move v5, v0

    .line 22
    :goto_1
    invoke-interface {p0, v5}, Ljava/lang/CharSequence;->charAt(I)C

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    const/16 v6, 0x20

    .line 27
    .line 28
    invoke-static {v5, v6}, Lkotlin/jvm/internal/o;->h(II)I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    if-gtz v5, :cond_1

    .line 33
    .line 34
    move v5, v1

    .line 35
    goto :goto_2

    .line 36
    :cond_1
    move v5, v2

    .line 37
    :goto_2
    if-nez v4, :cond_3

    .line 38
    .line 39
    if-nez v5, :cond_2

    .line 40
    .line 41
    move v4, v1

    .line 42
    goto :goto_0

    .line 43
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_3
    if-nez v5, :cond_4

    .line 47
    .line 48
    goto :goto_3

    .line 49
    :cond_4
    add-int/lit8 v0, v0, -0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_5
    :goto_3
    add-int/2addr v0, v1

    .line 53
    invoke-interface {p0, v3, v0}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method

.method public static synthetic m(Ljava/util/function/Predicate;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/launcher3/D3;->Q0(Ljava/util/function/Predicate;Lz1/o3;Lz1/y0;Lz1/m;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final m1(Lu4/l;Ljava/lang/Object;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic n(Lcom/android/launcher3/D3;Landroid/os/UserHandle;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/D3;->A0(Lcom/android/launcher3/D3;Landroid/os/UserHandle;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Lcom/android/launcher3/D3;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/D3;->U(Lcom/android/launcher3/D3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final o1(Ljava/util/List;ZLz1/o3;Lz1/y0;Lz1/m;)V
    .locals 1

    .line 1
    const-string v0, "taskController"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "dataModel"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p3, "apps"

    .line 12
    .line 13
    invoke-static {p4, p3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2, p0, p1}, Lz1/o3;->j0(Ljava/util/List;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic p(Lcom/android/launcher3/D3;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/D3;->C(Lcom/android/launcher3/D3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q(Ljava/util/function/Predicate;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/launcher3/D3;->t1(Ljava/util/function/Predicate;Lz1/o3;Lz1/y0;Lz1/m;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Lcom/android/launcher3/D3;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/D3;->v0(Lcom/android/launcher3/D3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final r1(Ljava/util/List;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 1

    .line 1
    const-string v0, "taskController"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "dataModel"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p2, "apps"

    .line 12
    .line 13
    invoke-static {p3, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p0}, Lz1/o3;->l0(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic s(Lz1/y0$b;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/D3;->v1(Lz1/y0$b;Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final s1(Landroid/content/Context;Lz1/y0;)V
    .locals 13

    .line 1
    iget-object p2, p2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget-object v0, Lz1/r3;->a:Ljava/util/function/Predicate;

    .line 8
    .line 9
    invoke-interface {p2, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-interface {p2}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v2, "updateWidget, appWidgets size: "

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    const-string v1, "Launcher.Model"

    .line 44
    .line 45
    invoke-static {v1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    sget-object p2, Lcom/android/launcher3/util/J1;->d:Lcom/android/launcher3/util/I;

    .line 49
    .line 50
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    check-cast p2, Lcom/android/launcher3/util/J1;

    .line 55
    .line 56
    invoke-virtual {p2}, Lcom/android/launcher3/util/J1;->m()Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    new-instance v2, Lcom/android/launcher3/util/z0;

    .line 61
    .line 62
    invoke-direct {v2}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 63
    .line 64
    .line 65
    new-instance v3, Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 68
    .line 69
    .line 70
    new-instance v4, Lcom/android/launcher3/widget/Y0;

    .line 71
    .line 72
    invoke-direct {v4, p1}, Lcom/android/launcher3/widget/Y0;-><init>(Landroid/content/Context;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const-string v5, "iterator(...)"

    .line 80
    .line 81
    invoke-static {v0, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    const/4 v6, 0x0

    .line 89
    if-eqz v5, :cond_6

    .line 90
    .line 91
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    check-cast v5, Lcom/android/launcher3/model/data/y;

    .line 96
    .line 97
    instance-of v7, v5, Lcom/android/launcher3/model/data/A;

    .line 98
    .line 99
    if-eqz v7, :cond_0

    .line 100
    .line 101
    check-cast v5, Lcom/android/launcher3/model/data/A;

    .line 102
    .line 103
    new-instance v7, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .line 107
    .line 108
    const-string v8, "updateWidget, appWidget: "

    .line 109
    .line 110
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v7

    .line 120
    invoke-static {v1, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    .line 122
    .line 123
    const/4 v7, 0x1

    .line 124
    invoke-virtual {v5, v7}, Lcom/android/launcher3/model/data/A;->x(I)Z

    .line 125
    .line 126
    .line 127
    move-result v8

    .line 128
    if-eqz v8, :cond_1

    .line 129
    .line 130
    invoke-static {p1}, Lcom/android/launcher3/qsb/QsbContainerView;->d(Landroid/content/Context;)Landroid/content/ComponentName;

    .line 131
    .line 132
    .line 133
    move-result-object v8

    .line 134
    if-nez v8, :cond_1

    .line 135
    .line 136
    iget v5, v5, Lcom/android/launcher3/model/data/y;->id:I

    .line 137
    .line 138
    invoke-virtual {v2, v5}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 139
    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_1
    invoke-virtual {v5, v7}, Lcom/android/launcher3/model/data/A;->y(I)Z

    .line 143
    .line 144
    .line 145
    move-result v8

    .line 146
    xor-int/2addr v8, v7

    .line 147
    const/4 v9, 0x2

    .line 148
    invoke-virtual {v5, v9}, Lcom/android/launcher3/model/data/A;->y(I)Z

    .line 149
    .line 150
    .line 151
    move-result v9

    .line 152
    xor-int/lit8 v10, v9, 0x1

    .line 153
    .line 154
    iget-object v11, v5, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 155
    .line 156
    iget-object v12, v5, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 157
    .line 158
    invoke-virtual {v4, v11, v12}, Lcom/android/launcher3/widget/Y0;->d(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/widget/U;

    .line 159
    .line 160
    .line 161
    move-result-object v11

    .line 162
    if-eqz v11, :cond_2

    .line 163
    .line 164
    iget-object v11, v11, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 165
    .line 166
    if-eqz v11, :cond_2

    .line 167
    .line 168
    invoke-virtual {v11}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v11

    .line 172
    if-eqz v11, :cond_2

    .line 173
    .line 174
    move v6, v7

    .line 175
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    .line 176
    .line 177
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 178
    .line 179
    .line 180
    const-string v11, "updateWidget: "

    .line 181
    .line 182
    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    const-string v8, " , "

    .line 189
    .line 190
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v7

    .line 212
    invoke-static {v1, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    .line 214
    .line 215
    if-nez v9, :cond_3

    .line 216
    .line 217
    if-nez v6, :cond_3

    .line 218
    .line 219
    if-nez p2, :cond_3

    .line 220
    .line 221
    iget v5, v5, Lcom/android/launcher3/model/data/y;->id:I

    .line 222
    .line 223
    invoke-virtual {v2, v5}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 224
    .line 225
    .line 226
    goto/16 :goto_0

    .line 227
    .line 228
    :cond_3
    if-nez v6, :cond_4

    .line 229
    .line 230
    if-eqz p2, :cond_0

    .line 231
    .line 232
    :cond_4
    iget v6, v5, Lcom/android/launcher3/model/data/A;->g:I

    .line 233
    .line 234
    const/4 v7, -0x2

    .line 235
    if-ne v6, v7, :cond_5

    .line 236
    .line 237
    iget-object v6, v5, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 238
    .line 239
    new-instance v7, Ljava/lang/StringBuilder;

    .line 240
    .line 241
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 242
    .line 243
    .line 244
    const-string v8, "appWidgetId is -2, appWidgetInfo.providerName:"

    .line 245
    .line 246
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v6

    .line 256
    invoke-static {v1, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    .line 258
    .line 259
    :cond_5
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 260
    .line 261
    .line 262
    goto/16 :goto_0

    .line 263
    .line 264
    :cond_6
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 265
    .line 266
    .line 267
    move-result p1

    .line 268
    invoke-virtual {v2}, Lcom/android/launcher3/util/z0;->size()I

    .line 269
    .line 270
    .line 271
    move-result p2

    .line 272
    new-instance v0, Ljava/lang/StringBuilder;

    .line 273
    .line 274
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 275
    .line 276
    .line 277
    const-string v4, "updateWidget, update size: "

    .line 278
    .line 279
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    const-string p1, ", remove size: "

    .line 286
    .line 287
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object p1

    .line 297
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    .line 299
    .line 300
    invoke-virtual {v2}, Lcom/android/launcher3/util/z0;->isEmpty()Z

    .line 301
    .line 302
    .line 303
    move-result p1

    .line 304
    if-nez p1, :cond_7

    .line 305
    .line 306
    invoke-static {v2}, Lcom/android/launcher3/util/P0;->q(Lcom/android/launcher3/util/z0;)Ljava/util/function/Predicate;

    .line 307
    .line 308
    .line 309
    move-result-object p1

    .line 310
    const-string p2, "ofItemIds(...)"

    .line 311
    .line 312
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    new-instance p2, Lcom/android/launcher3/r3;

    .line 316
    .line 317
    invoke-direct {p2, p1}, Lcom/android/launcher3/r3;-><init>(Ljava/util/function/Predicate;)V

    .line 318
    .line 319
    .line 320
    invoke-virtual {p0, p2}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 321
    .line 322
    .line 323
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->g0()[Lz1/y0$b;

    .line 324
    .line 325
    .line 326
    move-result-object p2

    .line 327
    array-length v0, p2

    .line 328
    move v1, v6

    .line 329
    :goto_1
    if-ge v1, v0, :cond_7

    .line 330
    .line 331
    aget-object v2, p2, v1

    .line 332
    .line 333
    sget-object v4, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 334
    .line 335
    new-instance v5, Lcom/android/launcher3/s3;

    .line 336
    .line 337
    invoke-direct {v5, v2, p1}, Lcom/android/launcher3/s3;-><init>(Lz1/y0$b;Ljava/util/function/Predicate;)V

    .line 338
    .line 339
    .line 340
    invoke-virtual {v4, v5}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 341
    .line 342
    .line 343
    add-int/lit8 v1, v1, 0x1

    .line 344
    .line 345
    goto :goto_1

    .line 346
    :cond_7
    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    .line 347
    .line 348
    .line 349
    move-result p1

    .line 350
    if-nez p1, :cond_8

    .line 351
    .line 352
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->g0()[Lz1/y0$b;

    .line 353
    .line 354
    .line 355
    move-result-object p0

    .line 356
    array-length p1, p0

    .line 357
    :goto_2
    if-ge v6, p1, :cond_8

    .line 358
    .line 359
    aget-object p2, p0, v6

    .line 360
    .line 361
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 362
    .line 363
    new-instance v1, Lcom/android/launcher3/t3;

    .line 364
    .line 365
    invoke-direct {v1, p2, v3}, Lcom/android/launcher3/t3;-><init>(Lz1/y0$b;Ljava/util/ArrayList;)V

    .line 366
    .line 367
    .line 368
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 369
    .line 370
    .line 371
    add-int/lit8 v6, v6, 0x1

    .line 372
    .line 373
    goto :goto_2

    .line 374
    :cond_8
    return-void
.end method

.method public static synthetic t(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/D3;->l1(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final t1(Ljava/util/function/Predicate;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 1

    .line 1
    const-string v0, "taskController"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "dataModel"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p2, "apps"

    .line 12
    .line 13
    invoke-static {p3, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Lz1/o3;->Y()Lz1/J3;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string p2, "updateWidget,was Provider ready,but is not Provider ready"

    .line 21
    .line 22
    invoke-virtual {p1, p0, p2}, Lz1/J3;->D(Ljava/util/function/Predicate;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic u(Lu4/l;Ljava/lang/Object;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/D3;->m1(Lu4/l;Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final u1(Lz1/y0$b;Ljava/util/function/Predicate;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lz1/y0$b;->I(Ljava/util/function/Predicate;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v(Ljava/util/HashSet;Landroid/os/UserHandle;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/launcher3/D3;->G0(Ljava/util/HashSet;Landroid/os/UserHandle;Lz1/o3;Lz1/y0;Lz1/m;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final v0(Lcom/android/launcher3/D3;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/D3;->s:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lx1/x;

    .line 6
    .line 7
    new-instance v1, Lcom/android/launcher3/h3;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Lcom/android/launcher3/h3;-><init>(Lcom/android/launcher3/D3;)V

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-direct {v0, v1, v2}, Lx1/x;-><init>(Ljava/lang/Runnable;Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->U0(Lx1/x;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method private static final v1(Lz1/y0$b;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lz1/y0$b;->a(Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic w(Ljava/util/function/Supplier;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/launcher3/D3;->g1(Ljava/util/function/Supplier;Lz1/o3;Lz1/y0;Lz1/m;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final w0(Lcom/android/launcher3/D3;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/D3;->s:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/D3;->g:Lz1/m2;

    .line 6
    .line 7
    invoke-virtual {p0}, Lz1/m2;->k()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic x(Lcom/android/launcher3/D3;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/D3;->b1(Lcom/android/launcher3/D3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y(Lcom/android/launcher3/D3;Lcom/android/launcher3/BubbleTextView;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/D3;->S0(Lcom/android/launcher3/D3;Lcom/android/launcher3/BubbleTextView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final y0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/D3;->z:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/D3;->z:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "iterator(...)"

    .line 19
    .line 20
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "next(...)"

    .line 34
    .line 35
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    check-cast v1, Lx1/x;

    .line 39
    .line 40
    invoke-virtual {v1}, Lx1/x;->b()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_1

    .line 45
    .line 46
    sget-object v2, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 47
    .line 48
    invoke-virtual {v1}, Lx1/x;->a()Ljava/lang/Runnable;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const-string v3, "getRunnable(...)"

    .line 53
    .line 54
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    invoke-virtual {v1}, Lx1/x;->a()Ljava/lang/Runnable;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/D3;->z:Ljava/util/ArrayList;

    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 72
    .line 73
    .line 74
    :cond_3
    :goto_1
    return-void
.end method

.method private static final y1(Lcom/android/launcher3/D3;)V
    .locals 2

    .line 1
    const-string v0, "Launcher.Model"

    .line 2
    .line 3
    const-string v1, "deleteOldHiddenAppData delete!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/android/launcher3/resource/h1;->S(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/android/launcher3/resource/h1;->u0(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    sget-object v0, Lcom/android/launcher3/J3;->c:Lcom/android/launcher3/J3$a;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Lcom/android/launcher3/J3$a;->f(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v0, "fota_delete_V_hide_apps"

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic z(Lcom/android/launcher3/D3;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/D3;->y1(Lcom/android/launcher3/D3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final B1()V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Lcom/android/launcher3/D3;->v:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/D3;->v:Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final C0(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "appPackages"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "onLimitAppsChanged: apps: "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "Launcher.Model"

    .line 24
    .line 25
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/android/launcher3/D3;->k1(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/android/launcher3/D3;->B:Ljava/util/List;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/android/launcher3/D3;->q1(Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final D0(Ljava/util/HashSet;Landroid/os/UserHandle;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/os/UserHandle;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "updatedPackages"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "user"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lz1/F0;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-direct {v0, v1, p2, p1}, Lz1/F0;-><init>(ILandroid/os/UserHandle;Ljava/util/HashSet;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final E0(Landroid/os/UserHandle;Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "user"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "action"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "android.intent.action.MANAGED_PROFILE_AVAILABLE"

    .line 12
    .line 13
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x7

    .line 18
    const/4 v2, 0x0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-boolean p2, p0, Lcom/android/launcher3/D3;->r:Z

    .line 22
    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->a0()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    new-instance p2, Lz1/h4;

    .line 30
    .line 31
    new-array v0, v2, [Ljava/lang/String;

    .line 32
    .line 33
    invoke-direct {p2, v1, p1, v0}, Lz1/h4;-><init>(ILandroid/os/UserHandle;[Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, p2}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 37
    .line 38
    .line 39
    :goto_0
    iput-boolean v2, p0, Lcom/android/launcher3/D3;->r:Z

    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    const-string v0, "android.intent.action.MANAGED_PROFILE_UNAVAILABLE"

    .line 43
    .line 44
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    iput-boolean v2, p0, Lcom/android/launcher3/D3;->r:Z

    .line 51
    .line 52
    new-instance p2, Lz1/h4;

    .line 53
    .line 54
    new-array v0, v2, [Ljava/lang/String;

    .line 55
    .line 56
    invoke-direct {p2, v1, p1, v0}, Lz1/h4;-><init>(ILandroid/os/UserHandle;[Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p2}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    sget-object v0, LD1/t;->k:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_3

    .line 70
    .line 71
    new-instance p2, Lz1/I4;

    .line 72
    .line 73
    invoke-direct {p2, p1, v2}, Lz1/I4;-><init>(Landroid/os/UserHandle;Z)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, p2}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_3
    sget-object v0, LD1/t;->j:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_4

    .line 87
    .line 88
    new-instance p2, Lz1/I4;

    .line 89
    .line 90
    const/4 v0, 0x1

    .line 91
    invoke-direct {p2, p1, v0}, Lz1/I4;-><init>(Landroid/os/UserHandle;Z)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, p2}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_4
    const-string v0, "android.intent.action.MANAGED_PROFILE_REMOVED"

    .line 99
    .line 100
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_5

    .line 105
    .line 106
    iget-object p1, p0, Lcom/android/launcher3/D3;->d:Lcom/android/launcher3/J3;

    .line 107
    .line 108
    sget-object p2, Lcom/android/launcher3/J3;->g:Lcom/android/launcher3/X;

    .line 109
    .line 110
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p1, p2, v0}, Lcom/android/launcher3/J3;->s(Lcom/android/launcher3/H1;Ljava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->a0()V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_5
    sget-object v0, LD1/t;->h:Ljava/lang/String;

    .line 122
    .line 123
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-nez v0, :cond_9

    .line 128
    .line 129
    sget-object v0, LD1/t;->i:Ljava/lang/String;

    .line 130
    .line 131
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_6

    .line 136
    .line 137
    goto :goto_2

    .line 138
    :cond_6
    const-string v0, "android.intent.action.PROFILE_AVAILABLE"

    .line 139
    .line 140
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-nez v0, :cond_8

    .line 145
    .line 146
    const-string v0, "android.intent.action.PROFILE_UNAVAILABLE"

    .line 147
    .line 148
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result p2

    .line 152
    if-eqz p2, :cond_7

    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_7
    return-void

    .line 156
    :cond_8
    :goto_1
    new-instance p2, Lz1/h4;

    .line 157
    .line 158
    new-array v0, v2, [Ljava/lang/String;

    .line 159
    .line 160
    invoke-direct {p2, v1, p1, v0}, Lz1/h4;-><init>(ILandroid/os/UserHandle;[Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0, p2}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_9
    :goto_2
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->a0()V

    .line 168
    .line 169
    .line 170
    return-void
.end method

.method public final F0(Ljava/util/HashSet;Landroid/os/UserHandle;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/os/UserHandle;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "updatedPackages"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "user"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/android/launcher3/v3;

    .line 12
    .line 13
    invoke-direct {v0, p1, p2}, Lcom/android/launcher3/v3;-><init>(Ljava/util/HashSet;Landroid/os/UserHandle;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final H0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/D3;->g:Lz1/m2;

    .line 4
    .line 5
    new-instance v1, Lcom/android/launcher3/m3;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/android/launcher3/m3;-><init>(Lz1/m2;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final I0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->p0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->Z0()Z

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final J0(Lcom/android/launcher3/util/L1;)V
    .locals 2

    .line 1
    new-instance v0, Lx1/x;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/u3;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/u3;-><init>(Lcom/android/launcher3/D3;Lcom/android/launcher3/util/L1;)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-direct {v0, v1, p1}, Lx1/x;-><init>(Ljava/lang/Runnable;Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->U0(Lx1/x;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final K(Ljava/util/ArrayList;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/util/Pair<",
            "Lcom/android/launcher3/model/data/y;",
            "Ljava/lang/Object;",
            ">;>;Z)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lz1/j;

    .line 2
    .line 3
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/D3;->l:Lg4/a;

    .line 7
    .line 8
    invoke-interface {v1}, Lg4/a;->get()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Lz1/z5;

    .line 13
    .line 14
    invoke-direct {v0, p1, v1}, Lz1/j;-><init>(Ljava/util/List;Lz1/z5;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p2}, Lz1/j;->e(Z)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final L(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroid/util/Pair<",
            "Lcom/android/launcher3/model/data/y;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    const-string v0, "itemList"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->g0()[Lz1/y0$b;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    array-length v1, v0

    .line 11
    const/4 v2, 0x0

    .line 12
    :goto_0
    if-ge v2, v1, :cond_0

    .line 13
    .line 14
    aget-object v3, v0, v2

    .line 15
    .line 16
    invoke-interface {v3}, Lz1/y0$b;->N()V

    .line 17
    .line 18
    .line 19
    add-int/lit8 v2, v2, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance v0, Lz1/j;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/launcher3/D3;->l:Lg4/a;

    .line 25
    .line 26
    invoke-interface {v1}, Lg4/a;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lz1/z5;

    .line 31
    .line 32
    invoke-direct {v0, p1, v1}, Lz1/j;-><init>(Ljava/util/List;Lz1/z5;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final M(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroid/util/Pair<",
            "Lcom/android/launcher3/model/data/y;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lz1/e;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lz1/e;-><init>(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final M0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/D3;->o:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Lcom/android/launcher3/D3;->s:Z

    .line 5
    .line 6
    if-nez v1, :cond_1

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/D3;->c1()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v1, 0x0

    .line 16
    goto :goto_1

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_2

    .line 19
    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 20
    :goto_1
    sget-object v2, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    monitor-exit v0

    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->a0()V

    .line 26
    .line 27
    .line 28
    :cond_2
    return-void

    .line 29
    :goto_2
    monitor-exit v0

    .line 30
    throw p0
.end method

.method public final N(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroid/util/Pair<",
            "Lcom/android/launcher3/model/data/y;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lz1/h;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lz1/h;-><init>(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final N0()V
    .locals 2

    .line 1
    new-instance v0, Lz1/z4;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/D3;->g:Lz1/m2;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lz1/z4;-><init>(Lz1/m2;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final O(Lz1/y0$b;)V
    .locals 1

    .line 1
    const-string v0, "callbacks"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/D3;->n:Ljava/util/ArrayList;

    .line 10
    .line 11
    monitor-enter v0

    .line 12
    :try_start_0
    iget-object p0, p0, Lcom/android/launcher3/D3;->n:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    monitor-exit v0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    monitor-exit v0

    .line 21
    throw p0
.end method

.method public final O0(Lz1/y0$b;)V
    .locals 3

    .line 1
    const-string v0, "callbacks"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/D3;->o:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    iget-object v1, p0, Lcom/android/launcher3/D3;->n:Ljava/util/ArrayList;

    .line 10
    .line 11
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 12
    :try_start_1
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Lcom/android/launcher3/D3;->n:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/android/launcher3/D3;->c1()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->Z0()Z

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    :goto_0
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    .line 37
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 38
    monitor-exit v0

    .line 39
    return-void

    .line 40
    :catchall_1
    move-exception p0

    .line 41
    goto :goto_2

    .line 42
    :goto_1
    :try_start_3
    monitor-exit v1

    .line 43
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 44
    :goto_2
    monitor-exit v0

    .line 45
    throw p0
.end method

.method public final P(Lz1/y0$b;)Z
    .locals 3

    .line 1
    const-string v0, "callbacks"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/D3;->o:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/D3;->O(Lz1/y0$b;)V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    new-array v1, v1, [Lz1/y0$b;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    aput-object p1, v1, v2

    .line 17
    .line 18
    invoke-direct {p0, v1}, Lcom/android/launcher3/D3;->a1([Lz1/y0$b;)Z

    .line 19
    .line 20
    .line 21
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    monitor-exit v0

    .line 23
    return p0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    monitor-exit v0

    .line 26
    throw p0
.end method

.method public final P0(Ljava/util/function/Predicate;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "itemInfoPredicate"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/android/launcher3/e3;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Lcom/android/launcher3/e3;-><init>(Ljava/util/function/Predicate;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final Q(Lz1/c2;)Lcom/android/launcher3/D3$c;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const-string v0, "task"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/android/launcher3/D3$c;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/D3$c;-><init>(Lcom/android/launcher3/D3;Lz1/c2;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public final R(Ljava/util/ArrayList;)V
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
    new-instance v0, Lcom/android/launcher3/p3;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/launcher3/p3;-><init>(Ljava/util/ArrayList;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected final R0(Lcom/android/launcher3/BubbleTextView;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/a3;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/a3;-><init>(Lcom/android/launcher3/D3;Lcom/android/launcher3/BubbleTextView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final T()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/D3;->t:Z

    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 5
    .line 6
    new-instance v1, Lcom/android/launcher3/i3;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/android/launcher3/i3;-><init>(Lcom/android/launcher3/D3;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final U0(Lx1/x;)V
    .locals 1

    .line 1
    const-string v0, "action"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/android/launcher3/D3;->x:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p1}, Lx1/x;->b()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    sget-object p0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 17
    .line 18
    invoke-virtual {p1}, Lx1/x;->a()Ljava/lang/Runnable;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v0, "getRunnable(...)"

    .line 23
    .line 24
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {p1}, Lx1/x;->a()Ljava/lang/Runnable;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/D3;->z:Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final V(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 6

    .line 1
    const-string v0, "writer"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "args"

    .line 7
    .line 8
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    array-length v0, p4

    .line 12
    const/4 v1, 0x0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v0, v1

    .line 18
    :goto_0
    if-nez v0, :cond_2

    .line 19
    .line 20
    aget-object v0, p4, v1

    .line 21
    .line 22
    const-string v1, "--all"

    .line 23
    .line 24
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/D3;->h:Lz1/m;

    .line 31
    .line 32
    iget-object v0, v0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v2, "All apps list: size="

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/android/launcher3/D3;->h:Lz1/m;

    .line 62
    .line 63
    iget-object v0, v0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    const-string v1, "iterator(...)"

    .line 70
    .line 71
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_1

    .line 79
    .line 80
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    check-cast v1, Lcom/android/launcher3/model/data/d;

    .line 85
    .line 86
    iget-object v2, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 87
    .line 88
    iget-object v3, v1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 89
    .line 90
    iget-object v3, v3, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 91
    .line 92
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    new-instance v4, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v5, "   title=\""

    .line 105
    .line 106
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string v2, "\" bitmapIcon="

    .line 113
    .line 114
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string v2, " componentName="

    .line 121
    .line 122
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_1
    invoke-virtual {p3}, Ljava/io/PrintWriter;->println()V

    .line 137
    .line 138
    .line 139
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/D3;->g:Lz1/m2;

    .line 140
    .line 141
    invoke-virtual {v0, p1, p2, p3, p4}, Lz1/m2;->b(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    iget-object p0, p0, Lcom/android/launcher3/D3;->i:Lz1/y0;

    .line 145
    .line 146
    invoke-virtual {p0, p1, p2, p3, p4}, Lz1/y0;->n(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public final V0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/D3;->y:Z

    .line 2
    .line 3
    return-void
.end method

.method public final W(Lcom/android/launcher3/D3$d;)V
    .locals 2

    .line 1
    const-string v0, "task"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->A()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const-string v1, "Launcher.Model"

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const-string p0, "enqueueModelUpdateTask streamer mode changing, return"

    .line 19
    .line 20
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/D3;->t:Z

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    const-string p0, "enqueueModelUpdateTask mModelDestroyed is true"

    .line 29
    .line 30
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 35
    .line 36
    new-instance v1, Lcom/android/launcher3/b3;

    .line 37
    .line 38
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/b3;-><init>(Lcom/android/launcher3/D3;Lcom/android/launcher3/D3$d;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final W0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/D3;->x:Z

    .line 2
    .line 3
    return-void
.end method

.method public final Y(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/D3;->h:Lz1/m;

    .line 2
    .line 3
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Lz1/m;->k(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final Z(Ljava/lang/String;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/d;
    .locals 2

    .line 1
    const-string v0, "pkgName"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "user"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/D3;->h:Lz1/m;

    .line 14
    .line 15
    iget-object p0, p0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v0, "iterator(...)"

    .line 25
    .line 26
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "next(...)"

    .line 40
    .line 41
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    check-cast v0, Lcom/android/launcher3/model/data/d;

    .line 45
    .line 46
    iget-object v1, v0, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 47
    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_0

    .line 62
    .line 63
    iget-object v1, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 64
    .line 65
    invoke-static {p2, v1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_0

    .line 70
    .line 71
    return-object v0

    .line 72
    :cond_1
    const/4 p0, 0x0

    .line 73
    return-object p0
.end method

.method public final Z0()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Lz1/y0$b;

    .line 3
    .line 4
    invoke-direct {p0, v0}, Lcom/android/launcher3/D3;->a1([Lz1/y0$b;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public final a0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/D3;->o:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-direct {p0}, Lcom/android/launcher3/D3;->c1()Z

    .line 5
    .line 6
    .line 7
    const-string v1, "Launcher.Model"

    .line 8
    .line 9
    const-string v2, "forceReload "

    .line 10
    .line 11
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput-boolean v1, p0, Lcom/android/launcher3/D3;->s:Z

    .line 16
    .line 17
    sget-object v1, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    monitor-exit v0

    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->I0()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    monitor-exit v0

    .line 26
    throw p0
.end method

.method public final b0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/D3;->o:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-direct {p0}, Lcom/android/launcher3/D3;->c1()Z

    .line 5
    .line 6
    .line 7
    const-string v1, "Launcher.Model"

    .line 8
    .line 9
    const-string v2, "forceStop!"

    .line 10
    .line 11
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput-boolean v1, p0, Lcom/android/launcher3/D3;->s:Z

    .line 16
    .line 17
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    monitor-exit v0

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    monitor-exit v0

    .line 23
    throw p0
.end method

.method public final c0()LR1/h;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/D3;->A:LR1/h;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/launcher3/F1;

    .line 14
    .line 15
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->B:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    new-instance v0, LR1/h;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {v0, v1}, LR1/h;-><init>(Landroid/content/Context;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/android/launcher3/D3;->A:LR1/h;

    .line 31
    .line 32
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/D3;->A:LR1/h;

    .line 33
    .line 34
    return-object p0
.end method

.method public final d0()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/d;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/D3;->h:Lz1/m;

    .line 7
    .line 8
    iget-object p0, p0, Lz1/m;->a:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public final d1(Lcom/android/launcher3/model/data/I;Landroid/content/pm/ShortcutInfo;)V
    .locals 1

    .line 1
    const-string v0, "si"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "info"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/android/launcher3/B3;

    .line 12
    .line 13
    invoke-direct {v0, p1, p2, p0}, Lcom/android/launcher3/B3;-><init>(Lcom/android/launcher3/model/data/I;Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/D3;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final e0()LR0/k;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lx1/O;->y3(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/D3;->C:LR0/k;

    .line 12
    .line 13
    return-object p0
.end method

.method public final e1(Ljava/util/function/Supplier;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Supplier<",
            "Lcom/android/launcher3/model/data/I;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "itemProvider"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/android/launcher3/Z2;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Lcom/android/launcher3/Z2;-><init>(Ljava/util/function/Supplier;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final f0()Lz1/y0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/D3;->i:Lz1/y0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g0()[Lz1/y0$b;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/D3;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/android/launcher3/D3;->n:Ljava/util/ArrayList;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    new-array v1, v1, [Lz1/y0$b;

    .line 8
    .line 9
    invoke-interface {p0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, [Lz1/y0$b;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    monitor-exit v0

    .line 16
    return-object p0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    monitor-exit v0

    .line 19
    throw p0
.end method

.method public final h0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h1(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/z3;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/z3;-><init>(Lcom/android/launcher3/D3;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final i0()Ls1/P;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/D3;->c:Ls1/P;

    .line 2
    .line 3
    return-object p0
.end method

.method public final j0()Lcom/android/launcher3/c1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/D3;->w:Lcom/android/launcher3/c1;

    .line 2
    .line 3
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final j1(Lcom/android/launcher3/model/data/I;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->g0()[Lz1/y0$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    array-length v0, p0

    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    if-ge v2, v0, :cond_1

    .line 9
    .line 10
    aget-object v3, p0, v2

    .line 11
    .line 12
    instance-of v4, v3, Lcom/android/launcher3/C2;

    .line 13
    .line 14
    if-eqz v4, :cond_0

    .line 15
    .line 16
    check-cast v3, Lcom/android/launcher3/C2;

    .line 17
    .line 18
    invoke-virtual {v3, p1, v1}, Lcom/android/launcher3/C2;->Q3(Lcom/android/launcher3/model/data/I;Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    return-void
.end method

.method public final k0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/D3;->y:Z

    .line 2
    .line 3
    return p0
.end method

.method public final k1(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "appPackages"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/D3;->B:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/D3;->B:Ljava/util/List;

    .line 12
    .line 13
    new-instance v0, LD4/f;

    .line 14
    .line 15
    const-string v1, ";"

    .line 16
    .line 17
    invoke-direct {v0, v1}, LD4/f;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {v0, p1, v1}, LD4/f;->a(Ljava/lang/CharSequence;I)Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-interface {p1, v0}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    :goto_0
    invoke-interface {v0}, Ljava/util/ListIterator;->hasPrevious()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    invoke-interface {v0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Ljava/lang/String;

    .line 50
    .line 51
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_0

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    invoke-interface {v0}, Ljava/util/ListIterator;->nextIndex()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    add-int/lit8 v0, v0, 0x1

    .line 63
    .line 64
    invoke-static {p1, v0}, Li4/m;->z0(Ljava/lang/Iterable;I)Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    goto :goto_1

    .line 69
    :cond_1
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    :goto_1
    new-array v0, v1, [Ljava/lang/String;

    .line 74
    .line 75
    invoke-interface {p1, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-static {p1}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    new-instance v0, Lcom/android/launcher3/n3;

    .line 84
    .line 85
    invoke-direct {v0}, Lcom/android/launcher3/n3;-><init>()V

    .line 86
    .line 87
    .line 88
    new-instance v1, Lcom/android/launcher3/o3;

    .line 89
    .line 90
    invoke-direct {v1, v0}, Lcom/android/launcher3/o3;-><init>(Lu4/l;)V

    .line 91
    .line 92
    .line 93
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-interface {p1}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    const-string v0, "toList(...)"

    .line 102
    .line 103
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final l0()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/D3;->u:I

    .line 2
    .line 3
    return p0
.end method

.method public final m0()Lz1/k2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/D3;->m:Lz1/k2;

    .line 2
    .line 3
    return-object p0
.end method

.method public final n0()Lz1/m2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/D3;->g:Lz1/m2;

    .line 2
    .line 3
    return-object p0
.end method

.method public final n1(Ljava/util/List;Z)V
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
    new-instance v0, Lcom/android/launcher3/C3;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lcom/android/launcher3/C3;-><init>(Ljava/util/List;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final o0(ZLc1/c;Lz1/y0$b;)Lz1/J3;
    .locals 7

    .line 1
    new-instance v0, Lz1/J3;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 4
    .line 5
    iget-object v3, p0, Lcom/android/launcher3/D3;->i:Lz1/y0;

    .line 6
    .line 7
    move-object v2, p0

    .line 8
    move v4, p1

    .line 9
    move-object v5, p2

    .line 10
    move-object v6, p3

    .line 11
    invoke-direct/range {v0 .. v6}, Lz1/J3;-><init>(Landroid/content/Context;Lcom/android/launcher3/D3;Lz1/y0;ZLc1/c;Lz1/y0$b;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public final p0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/D3;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/android/launcher3/D3;->n:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    xor-int/lit8 p0, p0, 0x1

    .line 11
    .line 12
    monitor-exit v0

    .line 13
    return p0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    monitor-exit v0

    .line 16
    throw p0
.end method

.method public final p1()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, LR0/k;->f:LR0/k$a;

    .line 8
    .line 9
    invoke-virtual {v1}, LR0/k$a;->a()Landroid/net/Uri;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "getString(...)"

    .line 22
    .line 23
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Lcom/android/launcher3/resource/B;->x()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_0

    .line 35
    .line 36
    iget-object v1, p0, Lcom/android/launcher3/D3;->C:LR0/k;

    .line 37
    .line 38
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->d0()Ljava/util/ArrayList;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v1, v0, p0}, LR0/k;->x(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    const-string p0, "ModelCallbacks"

    .line 49
    .line 50
    new-instance v1, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    const-string v2, "updateRecommendApps: "

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :catch_0
    move-exception p0

    .line 72
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final q0()V
    .locals 3

    .line 1
    new-instance v0, LR0/k;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 4
    .line 5
    sget-object v2, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 6
    .line 7
    invoke-virtual {v2, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Lcom/android/launcher3/F1;

    .line 12
    .line 13
    iget v2, v2, Lcom/android/launcher3/F1;->H0:I

    .line 14
    .line 15
    invoke-direct {v0, v1, v2}, LR0/k;-><init>(Landroid/content/Context;I)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/android/launcher3/D3;->C:LR0/k;

    .line 19
    .line 20
    return-void
.end method

.method public final q1(Ljava/util/List;)V
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
    new-instance v0, Lcom/android/launcher3/q3;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/launcher3/q3;-><init>(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final r0(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "packageName"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/D3;->B:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final s0()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/D3;->o:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Lcom/android/launcher3/D3;->s:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/launcher3/D3;->p:Lz1/c2;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    iget-boolean p0, p0, Lcom/android/launcher3/D3;->t:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    :goto_0
    monitor-exit v0

    .line 22
    return p0

    .line 23
    :goto_1
    monitor-exit v0

    .line 24
    throw p0
.end method

.method public final t0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/D3;->s:Z

    .line 2
    .line 3
    return p0
.end method

.method public final u0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/D3;->x:Z

    .line 2
    .line 3
    return p0
.end method

.method public final w1()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->g0()[Lz1/y0$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    array-length v0, p0

    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    if-ge v1, v0, :cond_1

    .line 8
    .line 9
    aget-object v2, p0, v1

    .line 10
    .line 11
    instance-of v3, v2, Lcom/android/launcher3/C2;

    .line 12
    .line 13
    if-eqz v3, :cond_0

    .line 14
    .line 15
    check-cast v2, Lcom/android/launcher3/C2;

    .line 16
    .line 17
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->R4()V

    .line 18
    .line 19
    .line 20
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    return-void
.end method

.method public final x0()Lz1/Q2;
    .locals 2

    .line 1
    new-instance v0, Lz1/Q2;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/c3;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/launcher3/c3;-><init>(Lcom/android/launcher3/D3;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lz1/Q2;-><init>(Ljava/util/function/Consumer;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public final x1()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/D3;->x:Z

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "userUnlocked: "

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "Launcher.Model"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-boolean v0, p0, Lcom/android/launcher3/D3;->x:Z

    .line 26
    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->z1()V

    .line 30
    .line 31
    .line 32
    sget-object v0, Lcom/android/launcher3/J3;->c:Lcom/android/launcher3/J3$a;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/android/launcher3/J3$a;->f(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "fota_delete_V_hide_apps"

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    sget-object v0, Lcom/android/launcher3/util/m0;->d:Lcom/android/launcher3/util/p1;

    .line 50
    .line 51
    new-instance v1, Lcom/android/launcher3/l3;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Lcom/android/launcher3/l3;-><init>(Lcom/android/launcher3/D3;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/D3;->n:Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-string v1, "iterator(...)"

    .line 66
    .line 67
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_2

    .line 75
    .line 76
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    const-string v2, "next(...)"

    .line 81
    .line 82
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    check-cast v1, Lz1/y0$b;

    .line 86
    .line 87
    instance-of v2, v1, Lcom/android/launcher3/C2;

    .line 88
    .line 89
    if-eqz v2, :cond_1

    .line 90
    .line 91
    check-cast v1, Lcom/android/launcher3/C2;

    .line 92
    .line 93
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->I4()V

    .line 94
    .line 95
    .line 96
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 97
    .line 98
    invoke-direct {p0, v0}, Lcom/android/launcher3/D3;->Y0(Landroid/content/Context;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final z0(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 4

    .line 1
    const-string v0, "packageName"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "user"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->A()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const-string v1, "Launcher.Model"

    .line 20
    .line 21
    if-nez v0, :cond_6

    .line 22
    .line 23
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->y()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    goto/16 :goto_0

    .line 34
    .line 35
    :cond_0
    sget-boolean v0, Lcom/android/launcher3/W3;->A:Z

    .line 36
    .line 37
    const-string v2, "zte.com.cn.alarmclock"

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-static {v2, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    const-string p0, "onAppIconChanged: unlock anim running return!"

    .line 48
    .line 49
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    instance-of v0, v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 58
    .line 59
    if-eqz v0, :cond_5

    .line 60
    .line 61
    invoke-static {v2, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_5

    .line 66
    .line 67
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const-string v2, "null cannot be cast to non-null type com.android.launcher3.uioverrides.QuickstepLauncher"

    .line 72
    .line 73
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    check-cast v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->r5()Lcom/android/launcher3/q5;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    if-eqz v0, :cond_5

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/android/launcher3/q5;->h0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    if-eqz v2, :cond_2

    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/android/launcher3/q5;->h0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {v2}, Lcom/android/quickstep/util/animation/AnimationRecord;->isRectFSpringAnimRunning()Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-nez v2, :cond_4

    .line 99
    .line 100
    :cond_2
    invoke-virtual {v0}, Lcom/android/launcher3/q5;->g0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    if-eqz v2, :cond_3

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/android/launcher3/q5;->g0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {v2}, Lcom/android/quickstep/util/animation/AnimationRecord;->isRectFSpringAnimRunning()Z

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    if-nez v2, :cond_4

    .line 115
    .line 116
    :cond_3
    invoke-virtual {v0}, Lcom/android/launcher3/q5;->v0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    if-eqz v2, :cond_5

    .line 121
    .line 122
    invoke-virtual {v0}, Lcom/android/launcher3/q5;->v0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/AnimationRecord;->isRectFSpringAnimRunning()Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-eqz v0, :cond_5

    .line 131
    .line 132
    :cond_4
    const-string p0, "onAppIconChanged: open close anim running return!"

    .line 133
    .line 134
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_5
    const-string v0, "onAppIconChanged: start"

    .line 139
    .line 140
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    new-instance v0, Lz1/h4;

    .line 144
    .line 145
    const/4 v2, 0x2

    .line 146
    filled-new-array {p1}, [Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    invoke-direct {v0, v2, p2, v3}, Lz1/h4;-><init>(ILandroid/os/UserHandle;[Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 154
    .line 155
    .line 156
    new-instance v0, Lx1/x;

    .line 157
    .line 158
    new-instance v2, Lcom/android/launcher3/A3;

    .line 159
    .line 160
    invoke-direct {v2, p0, p2, p1}, Lcom/android/launcher3/A3;-><init>(Lcom/android/launcher3/D3;Landroid/os/UserHandle;Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    const/4 p1, 0x0

    .line 164
    invoke-direct {v0, v2, p1}, Lx1/x;-><init>(Ljava/lang/Runnable;Z)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->U0(Lx1/x;)V

    .line 168
    .line 169
    .line 170
    const-string p0, "onAppIconChanged: finished"

    .line 171
    .line 172
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    .line 174
    .line 175
    return-void

    .line 176
    :cond_6
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 177
    .line 178
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 179
    .line 180
    .line 181
    const-string p2, "onAppIconChanged: mode changing return! "

    .line 182
    .line 183
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    .line 195
    .line 196
    return-void
.end method

.method public final z1()V
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/D3;->x:Z

    .line 3
    .line 4
    sget-object v1, Lcom/android/launcher3/J3;->c:Lcom/android/launcher3/J3$a;

    .line 5
    .line 6
    iget-object v2, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 7
    .line 8
    invoke-virtual {v1, v2}, Lcom/android/launcher3/J3$a;->f(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "shortcut_load_completed_after_user_lock_state_changed"

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 24
    .line 25
    .line 26
    const-string v1, "mIsUserUnlocked true"

    .line 27
    .line 28
    const-string v2, "Launcher.Model"

    .line 29
    .line 30
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->g0()[Lz1/y0$b;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    array-length v4, v1

    .line 38
    :goto_0
    if-ge v3, v4, :cond_1

    .line 39
    .line 40
    aget-object v5, v1, v3

    .line 41
    .line 42
    instance-of v6, v5, Lcom/android/launcher3/C2;

    .line 43
    .line 44
    if-eqz v6, :cond_0

    .line 45
    .line 46
    check-cast v5, Lcom/android/launcher3/C2;

    .line 47
    .line 48
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->I1()Lcom/android/launcher3/widget/l0;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    invoke-virtual {v5}, Lcom/android/launcher3/widget/l0;->Z()V

    .line 53
    .line 54
    .line 55
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    invoke-static {}, Lx1/S;->r()Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_2

    .line 63
    .line 64
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-nez v1, :cond_2

    .line 69
    .line 70
    invoke-static {}, Lx1/O;->O0()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_2

    .line 75
    .line 76
    invoke-static {}, Lcom/android/systemui/shared/system/PackageManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/PackageManagerWrapper;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    new-instance v3, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1, v3}, Lcom/android/systemui/shared/system/PackageManagerWrapper;->getHomeActivities(Ljava/util/List;)Landroid/content/ComponentName;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iget-object v3, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 90
    .line 91
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    if-eqz v1, :cond_2

    .line 96
    .line 97
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    if-nez v4, :cond_2

    .line 102
    .line 103
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-static {v3, v4}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    if-nez v3, :cond_2

    .line 112
    .line 113
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .line 117
    .line 118
    const-string v4, "onBroadcastIntent startActivity defaultHomeIntent defaultHomeComponentName:"

    .line 119
    .line 120
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    new-instance v2, Landroid/content/Intent;

    .line 134
    .line 135
    const-string v3, "android.intent.action.MAIN"

    .line 136
    .line 137
    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    const-string v3, "android.intent.category.HOME"

    .line 141
    .line 142
    invoke-virtual {v2, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    const/high16 v3, 0x14000000

    .line 147
    .line 148
    invoke-virtual {v2, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    const-string v3, "setFlags(...)"

    .line 153
    .line 154
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v2, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 158
    .line 159
    .line 160
    iget-object v1, p0, Lcom/android/launcher3/D3;->a:Landroid/content/Context;

    .line 161
    .line 162
    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 163
    .line 164
    .line 165
    goto :goto_1

    .line 166
    :catch_0
    move-exception v1

    .line 167
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 168
    .line 169
    .line 170
    :cond_2
    :goto_1
    sget-object v1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 171
    .line 172
    new-instance v2, Lcom/android/launcher3/k3;

    .line 173
    .line 174
    invoke-direct {v2, p0}, Lcom/android/launcher3/k3;-><init>(Lcom/android/launcher3/D3;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 178
    .line 179
    .line 180
    new-instance v1, Lz1/I4;

    .line 181
    .line 182
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    invoke-direct {v1, v2, v0}, Lz1/I4;-><init>(Landroid/os/UserHandle;Z)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0, v1}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 190
    .line 191
    .line 192
    new-instance v1, Lz1/K4;

    .line 193
    .line 194
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    invoke-direct {v1, v2, v0}, Lz1/K4;-><init>(Landroid/os/UserHandle;Z)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {p0, v1}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 202
    .line 203
    .line 204
    invoke-direct {p0}, Lcom/android/launcher3/D3;->y0()V

    .line 205
    .line 206
    .line 207
    return-void
.end method
