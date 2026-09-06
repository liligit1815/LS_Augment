.class public final Li2/c;
.super Ljava/lang/Object;
.source "DispatcherProvider.kt"

# interfaces
.implements Li2/b;


# static fields
.field public static final a:Li2/c;

.field private static final b:LF4/E;

.field private static final c:LF4/E;

.field private static final d:LF4/E;

.field private static final e:LF4/E;

.field private static final f:LF4/E;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Li2/c;

    .line 2
    .line 3
    invoke-direct {v0}, Li2/c;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Li2/c;->a:Li2/c;

    .line 7
    .line 8
    sget-object v0, Li2/a;->a:Li2/a;

    .line 9
    .line 10
    invoke-virtual {v0}, Li2/a;->a()LF4/E;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Li2/c;->b:LF4/E;

    .line 15
    .line 16
    invoke-static {}, LF4/Z;->a()LF4/E;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    sput-object v1, Li2/c;->c:LF4/E;

    .line 21
    .line 22
    sput-object v0, Li2/c;->d:LF4/E;

    .line 23
    .line 24
    invoke-static {}, LF4/Z;->c()LF4/E0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, LF4/E0;->f0()LF4/E0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sput-object v0, Li2/c;->e:LF4/E;

    .line 33
    .line 34
    invoke-static {}, LF4/Z;->d()LF4/E;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sput-object v0, Li2/c;->f:LF4/E;

    .line 39
    .line 40
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


# virtual methods
.method public a()LF4/E;
    .locals 0

    .line 1
    sget-object p0, Li2/c;->f:LF4/E;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()LF4/E;
    .locals 0

    .line 1
    sget-object p0, Li2/c;->e:LF4/E;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBackground()LF4/E;
    .locals 0

    .line 1
    sget-object p0, Li2/c;->d:LF4/E;

    .line 2
    .line 3
    return-object p0
.end method
