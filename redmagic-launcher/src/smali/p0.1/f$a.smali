.class public final Lp0/f$a;
.super Ljava/lang/Object;
.source "WindowInfoTracker.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lp0/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# static fields
.field static final synthetic a:Lp0/f$a;

.field private static final b:Z

.field private static final c:Ljava/lang/String;

.field private static final d:Lh4/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lh4/e<",
            "Lq0/a;",
            ">;"
        }
    .end annotation
.end field

.field private static e:Lp0/g;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lp0/f$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lp0/f$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lp0/f$a;->a:Lp0/f$a;

    .line 7
    .line 8
    const-class v0, Lp0/f;

    .line 9
    .line 10
    invoke-static {v0}, Lkotlin/jvm/internal/D;->b(Ljava/lang/Class;)LB4/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, LB4/c;->d()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Lp0/f$a;->c:Ljava/lang/String;

    .line 19
    .line 20
    sget-object v0, Lp0/f$a$a;->h:Lp0/f$a$a;

    .line 21
    .line 22
    invoke-static {v0}, Lh4/f;->b(Lu4/a;)Lh4/e;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sput-object v0, Lp0/f$a;->d:Lh4/e;

    .line 27
    .line 28
    sget-object v0, Lp0/b;->a:Lp0/b;

    .line 29
    .line 30
    sput-object v0, Lp0/f$a;->e:Lp0/g;

    .line 31
    .line 32
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic a()Z
    .locals 1

    .line 1
    sget-boolean v0, Lp0/f$a;->b:Z

    .line 2
    .line 3
    return v0
.end method

.method public static final synthetic b()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lp0/f$a;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public final c()Lq0/a;
    .locals 0

    .line 1
    sget-object p0, Lp0/f$a;->d:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lq0/a;

    .line 8
    .line 9
    return-object p0
.end method

.method public final d(Landroid/content/Context;)Lp0/f;
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lp0/f$a;->c()Lq0/a;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    sget-object p0, Landroidx/window/layout/adapter/sidecar/b;->c:Landroidx/window/layout/adapter/sidecar/b$a;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroidx/window/layout/adapter/sidecar/b$a;->a(Landroid/content/Context;)Landroidx/window/layout/adapter/sidecar/b;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :cond_0
    new-instance p1, Lp0/i;

    .line 19
    .line 20
    sget-object v0, Lp0/m;->a:Lp0/m;

    .line 21
    .line 22
    invoke-direct {p1, v0, p0}, Lp0/i;-><init>(Lp0/l;Lq0/a;)V

    .line 23
    .line 24
    .line 25
    sget-object p0, Lp0/f$a;->e:Lp0/g;

    .line 26
    .line 27
    invoke-interface {p0, p1}, Lp0/g;->a(Lp0/f;)Lp0/f;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method
