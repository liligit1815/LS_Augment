.class public abstract LR2/b;
.super Ljava/lang/Object;
.source "ManageWindowsViewContainer.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LR2/b$a;,
        LR2/b$b;
    }
.end annotation


# static fields
.field public static final j:LR2/b$a;


# instance fields
.field private final g:Landroid/content/Context;

.field private final h:I

.field public i:LR2/b$b;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LR2/b$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LR2/b$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LR2/b;->j:LR2/b$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, LR2/b;->g:Landroid/content/Context;

    .line 10
    .line 11
    iput p2, p0, LR2/b;->h:I

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(LR2/b;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0}, LR2/b;->d(LR2/b;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final d(LR2/b;)Lh4/t;
    .locals 0

    .line 1
    invoke-virtual {p0}, LR2/b;->i()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 5
    .line 6
    return-object p0
.end method


# virtual methods
.method public abstract b(LR2/b$b;)V
.end method

.method public final c()V
    .locals 2

    .line 1
    invoke-virtual {p0}, LR2/b;->h()LR2/b$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, LR2/a;

    .line 6
    .line 7
    invoke-direct {v1, p0}, LR2/a;-><init>(LR2/b;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, LR2/b$b;->e(Lu4/a;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final e()V
    .locals 0

    .line 1
    invoke-virtual {p0}, LR2/b;->h()LR2/b$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, LR2/b$b;->f()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final f(Ljava/util/List;Lu4/l;Lu4/a;)LR2/b$b;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lh4/l<",
            "Ljava/lang/Integer;",
            "Landroid/graphics/Bitmap;",
            ">;>;",
            "Lu4/l<",
            "-",
            "Ljava/lang/Integer;",
            "Lh4/t;",
            ">;",
            "Lu4/a<",
            "Lh4/t;",
            ">;)",
            "LR2/b$b;"
        }
    .end annotation

    .line 1
    const-string v0, "snapshotList"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "onIconClickListener"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "onOutsideClickListener"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, LR2/b$b;

    .line 17
    .line 18
    iget-object v1, p0, LR2/b;->g:Landroid/content/Context;

    .line 19
    .line 20
    iget v2, p0, LR2/b;->h:I

    .line 21
    .line 22
    invoke-direct {v0, v1, v2}, LR2/b$b;-><init>(Landroid/content/Context;I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p3}, LR2/b$b;->r(Lu4/a;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p2}, LR2/b$b;->q(Lu4/l;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p1}, LR2/b$b;->j(Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, LR2/b;->j(LR2/b$b;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, LR2/b;->h()LR2/b$b;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0, p1}, LR2/b;->b(LR2/b$b;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, LR2/b;->h()LR2/b$b;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public final g()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, LR2/b;->g:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h()LR2/b$b;
    .locals 0

    .line 1
    iget-object p0, p0, LR2/b;->i:LR2/b$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "menuView"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public abstract i()V
.end method

.method public final j(LR2/b$b;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, LR2/b;->i:LR2/b$b;

    .line 7
    .line 8
    return-void
.end method
