.class public Landroidx/lifecycle/t;
.super Ljava/lang/Object;
.source "ViewModelProvider.android.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/lifecycle/t$a;,
        Landroidx/lifecycle/t$b;,
        Landroidx/lifecycle/t$c;,
        Landroidx/lifecycle/t$d;,
        Landroidx/lifecycle/t$e;
    }
.end annotation


# static fields
.field public static final b:Landroidx/lifecycle/t$b;

.field public static final c:LY/a$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LY/a$b<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final a:LY/d;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroidx/lifecycle/t$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Landroidx/lifecycle/t$b;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Landroidx/lifecycle/t;->b:Landroidx/lifecycle/t$b;

    .line 8
    .line 9
    sget-object v0, LZ/d$a;->a:LZ/d$a;

    .line 10
    .line 11
    sput-object v0, Landroidx/lifecycle/t;->c:LY/a$b;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(LW/o;Landroidx/lifecycle/t$c;)V
    .locals 7

    .line 1
    const-string v0, "store"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "factory"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v6}, Landroidx/lifecycle/t;-><init>(LW/o;Landroidx/lifecycle/t$c;LY/a;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(LW/o;Landroidx/lifecycle/t$c;LY/a;)V
    .locals 1

    const-string v0, "store"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "factory"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "defaultCreationExtras"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    new-instance v0, LY/d;

    invoke-direct {v0, p1, p2, p3}, LY/d;-><init>(LW/o;Landroidx/lifecycle/t$c;LY/a;)V

    invoke-direct {p0, v0}, Landroidx/lifecycle/t;-><init>(LY/d;)V

    return-void
.end method

.method public synthetic constructor <init>(LW/o;Landroidx/lifecycle/t$c;LY/a;ILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    .line 4
    sget-object p3, LY/a$a;->b:LY/a$a;

    .line 5
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Landroidx/lifecycle/t;-><init>(LW/o;Landroidx/lifecycle/t$c;LY/a;)V

    return-void
.end method

.method public constructor <init>(LW/p;Landroidx/lifecycle/t$c;)V
    .locals 2

    const-string v0, "owner"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "factory"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    invoke-interface {p1}, LW/p;->getViewModelStore()LW/o;

    move-result-object v0

    .line 8
    sget-object v1, LZ/d;->a:LZ/d;

    invoke-virtual {v1, p1}, LZ/d;->a(LW/p;)LY/a;

    move-result-object p1

    .line 9
    invoke-direct {p0, v0, p2, p1}, Landroidx/lifecycle/t;-><init>(LW/o;Landroidx/lifecycle/t$c;LY/a;)V

    return-void
.end method

.method private constructor <init>(LY/d;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Landroidx/lifecycle/t;->a:LY/d;

    return-void
.end method


# virtual methods
.method public final a(LB4/c;)LW/n;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "LW/n;",
            ">(",
            "LB4/c<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    const-string v0, "modelClass"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Landroidx/lifecycle/t;->a:LY/d;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    const/4 v1, 0x2

    .line 10
    invoke-static {p0, p1, v0, v1, v0}, LY/d;->b(LY/d;LB4/c;Ljava/lang/String;ILjava/lang/Object;)LW/n;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public b(Ljava/lang/Class;)LW/n;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "LW/n;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    const-string v0, "modelClass"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lt4/a;->c(Ljava/lang/Class;)LB4/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1}, Landroidx/lifecycle/t;->a(LB4/c;)LW/n;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public c(Ljava/lang/String;Ljava/lang/Class;)LW/n;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "LW/n;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    const-string v0, "key"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "modelClass"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Landroidx/lifecycle/t;->a:LY/d;

    .line 12
    .line 13
    invoke-static {p2}, Lt4/a;->c(Ljava/lang/Class;)LB4/c;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p0, p2, p1}, LY/d;->a(LB4/c;Ljava/lang/String;)LW/n;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method
